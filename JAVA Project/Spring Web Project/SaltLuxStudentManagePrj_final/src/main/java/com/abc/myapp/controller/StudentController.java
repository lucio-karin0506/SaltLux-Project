package com.abc.myapp.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.DataFormatter;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.abc.myapp.model.ProblemsVO;
import com.abc.myapp.model.StudentAnswerVO;
import com.abc.myapp.service.IProblemService;

@Controller
@RequestMapping("/student/*")
public class StudentController {
	@Autowired
	IProblemService problemsService;

	// 학생 로그인 후 loginHome 페이지에서 문제 풀기 페이지 이동
	@RequestMapping(value = "/testSolve", method = RequestMethod.GET)
	public String selectProblems() {
		return "student/selectproblems";
	}

	// 학생 로그인 후 loginHome 페이지에서 문제 출제 페이지 이동
	@RequestMapping(value = "/testMake", method = RequestMethod.GET)
	public String main() { // 1
		return "student/problemfileupload";
	}

	// selectproblems.jsp에서 받아온 문제 유형 값 받아와 teststart.jsp로 이동
	@RequestMapping(value = "/selectproblems", method = RequestMethod.POST)
	public String moveToTestStart(String subjectId, String problemCnt, HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		int studentId = Integer.parseInt(session.getAttribute("studentId").toString());
		
		List<ProblemsVO> problemList = problemsService.getProblemList(Integer.parseInt(subjectId), Integer.parseInt(problemCnt), studentId);
		model.addAttribute("subjectId", subjectId);
		model.addAttribute("problemList", problemList);
		return "/student/teststart";
	}

	// teststart.jsp 페이지에서 문제 푼 후 checkanswer.jsp 페이지로 이동
	   @RequestMapping(value = "/problems", method = RequestMethod.POST)
	   public String insertStudentAnswer(HttpServletRequest request, String problemId, String subjectId, String answer1,
	         String answer2, String answer3, String answer4, String answer5, String answer6, String answer7,
	         String answer8, String answer9, String answer10, String answer11, String answer12, String answer13,
	         String answer14, String answer15, String answer16, String answer17, String answer18, String answer19,
	         String answer20, Model model) {
	      
	      //시험문제를 풀고 있는 학생의 세션값을 아이디로 받아오기
	      HttpSession session = request.getSession();
	      int studentId = Integer.parseInt(session.getAttribute("studentId").toString());
	      
	      
	      String[] problemIds = problemId.split(",");
	      String[] subjectIds = subjectId.split(",");
	      String[] studentAnswers = { answer1, answer2, answer3, answer4, answer5, answer6, answer7, answer8, answer9,
	            answer10, answer11, answer12, answer13, answer14, answer15, answer16, answer17, answer18, answer19,
	            answer20 };
	      
	      //학생 입력 답을 db에 저장
	      ArrayList<StudentAnswerVO> studentAnswerList = new ArrayList<StudentAnswerVO>();
	      for (int i = 0; i < problemIds.length; i++) {
	         StudentAnswerVO studentAnswer = new StudentAnswerVO();
	         studentAnswer.setStudentId(studentId);
	         studentAnswer.setProblemId(Integer.parseInt(problemIds[i]));
	         studentAnswer.setStudentAnswer(studentAnswers[i]);
	         studentAnswer.setSubjectId(Integer.parseInt(subjectIds[i]));
	         problemsService.insertStudentAnswer(studentAnswer);
	         studentAnswerList.add(studentAnswer);
	      }
	      
	      return "loginHome";
	   }

	// problemfileupload.jsp 에서 문제 출제 후 problemlist.jsp 로 이동
	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public String readExcel(@RequestParam("file") MultipartFile file, int subjectId, HttpServletRequest request,
			Model model) throws IOException {
		ArrayList<ProblemsVO> problemList = new ArrayList<ProblemsVO>();

		// session 값에 있는 studentId 정보 받아온 변수
		HttpSession session = request.getSession();
		int studentId = Integer.parseInt(session.getAttribute("studentId").toString());

		String extension = FilenameUtils.getExtension(file.getOriginalFilename()); // 3
		try {
			if (!extension.equals("xlsx") && !extension.equals("xls")) {
				throw new IOException("엑셀파일만 업로드 해주세요.");
			}

			Workbook workbook = null;

			if (extension.equals("xlsx")) {
				workbook = new XSSFWorkbook(file.getInputStream());
			} else if (extension.equals("xls")) {
				workbook = new HSSFWorkbook(file.getInputStream());
			}

			Sheet worksheet = workbook.getSheetAt(0);

			for (int i = 4; i < worksheet.getPhysicalNumberOfRows(); i++) {

				ProblemsVO problems = new ProblemsVO();
				DataFormatter formatter = new DataFormatter();

				Row row = worksheet.getRow(i);
				if ("".equals(formatter.formatCellValue(row.getCell(1)))) {// 예외처리
					break;
				} else {
					problems.setSubjectId(subjectId);
					problems.setStudentId(studentId);
					problems.setProblemContent(formatter.formatCellValue(row.getCell(1)));
					problems.setProblemCase(formatter.formatCellValue(row.getCell(2)));
					problems.setProblemAnswer(formatter.formatCellValue(row.getCell(3)));
					problems.setProblemCommentary(formatter.formatCellValue(row.getCell(4)));
					problemsService.uploadProblem(problems);
				}
				problemList.add(problems);
			}
			model.addAttribute("problemList", problemList);

		} catch (Exception e) { // 파일오류 예외처리
			String message = "에러";
			model.addAttribute("message", message);
			e.printStackTrace();
		}

		return "student/problemlist";
	}

}
