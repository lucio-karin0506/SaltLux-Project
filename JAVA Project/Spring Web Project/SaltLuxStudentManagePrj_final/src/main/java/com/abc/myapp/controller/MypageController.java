package com.abc.myapp.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.abc.myapp.model.CheckAnswerVO;
import com.abc.myapp.model.ProblemsVO;
import com.abc.myapp.service.IMypageService;

@Controller
@RequestMapping("/mypage/*")
public class MypageController {
	@Autowired
	IMypageService mypageService;

	// 학생 로그인 후 loginhome.jsp에서 마이페이지 버튼 클릭 시 mypageinfo.jsp로 이동
	@RequestMapping(value="/info", method=RequestMethod.GET)
	public String showMyPageMain() {
		return "mypage/mypageinfo";
	}

	@RequestMapping(value="/main", method=RequestMethod.GET)
	public String getMypageMain() {
		return "mypage/mypagemain";
	}

	// mypageinfo.jsp에서 학생 비밀번호 확인 후 mypagemain.jsp로 이동
	@RequestMapping(value="/main", method=RequestMethod.POST)
	public ModelAndView checkPassword(@RequestParam String password, HttpServletRequest request,
			ModelAndView mav) {
		HttpSession session = request.getSession();
		String sPassword = (String) session.getAttribute("password");

		if (password.equals(sPassword)) {
			// 비밀번호 맞으면
			mav.addObject("msg", "로그인을 성공했습니다! 환영합니다!");
			mav.setViewName("mypage/mypagemain");
		} else {
			// 비밀번호 틀리면
			mav.addObject("msg", "올바른 비밀번호를 입력했는지 확인하세요.");
			mav.setViewName("mypage/mypageinfo");
		}
		return mav;
	}

	//mypagemain.jsp에서 카테고리 선택 후 버튼 클릭 시 myproblemslist.jsp로 이동
	@RequestMapping(value="/list", method=RequestMethod.POST)
	public String getProblemList(@RequestParam String subjectId, HttpServletRequest request, Model model) {
		int subjectIdNum = Integer.parseInt(subjectId);

		HttpSession session = request.getSession();
		int studentId = Integer.parseInt(session.getAttribute("studentId").toString());

		List<ProblemsVO> problemInfo = mypageService.getProblemInfo(subjectIdNum, studentId);
		model.addAttribute("problemList", problemInfo);

		return "mypage/myproblemslist";
	}

	@RequestMapping("/delete/{problemId}")
	public String deleteProblem(@PathVariable int problemId) {
		mypageService.deleteProblem(problemId);
		return "redirect:/mypage/myproblemslist";
	}

	@RequestMapping(value="/myproblemslist", method=RequestMethod.GET)
	public String getMyProblemList(Model model) {
		List<ProblemsVO> problemInfo = mypageService.getAllProblemInfo();
		model.addAttribute("problemList", problemInfo);
		return "/mypage/myproblemslist";
	}

	// 수정 버튼 눌렀을 때 수정 페이지로 이동
	@RequestMapping(value="/myproblemsupdate/{problemId}", method=RequestMethod.GET)
	public String getproblemView(@PathVariable int problemId, Model model) {
		List<ProblemsVO> problem = mypageService.getUpdateProblem(problemId);
		model.addAttribute("updateproblem", problem);
		return "mypage/myproblemsupdate";
	}

	//저장된 객체값을 리스트로 보여주기
	@RequestMapping(value="/updateSuccessproblem/{problemId}", method=RequestMethod.GET)
	public String getUpdateProblem(@PathVariable int problemId, Model model) {
		model.addAttribute("updateproblem", mypageService.getUpdateProblem(problemId));
		return "mypage/updateSuccessproblem";	
	}

	//수정 페이지에서 제출 완료 후 받아온 객체 값을 저장
	@RequestMapping(value="/updateproblem", method=RequestMethod.POST)
	public String updateProblem(ProblemsVO problem) {
		mypageService.updateProblem(problem);
		return "redirect:/mypage/updateSuccessproblem/" + problem.getProblemId();
	}

	//mypagemain.jsp에서 성취율 버튼 클릭시 myachievement.jsp로 이동
	@RequestMapping(value="/achievment", method=RequestMethod.GET)
	public String CompareAnswerInfo(HttpServletRequest request, Model model) {

		HttpSession session = request.getSession();
		int studentId = Integer.parseInt(session.getAttribute("studentId").toString());

		List<CheckAnswerVO> checkJavaInfo = mypageService.CompareAnswerInfo(1, studentId);
		List<CheckAnswerVO> checkSqldInfo = mypageService.CompareAnswerInfo(2, studentId);
		List<CheckAnswerVO> checkAdspInfo = mypageService.CompareAnswerInfo(3, studentId);

		//학생답과 문제답 비교해서 채점결과 부여 + 맞은 개수 지정
		int javaCorrCnt = mypageService.CheckAnswerResult(checkJavaInfo);
		int sqldCorrCnt  = mypageService.CheckAnswerResult(checkSqldInfo);
		int adspCorrCnt  = mypageService.CheckAnswerResult(checkAdspInfo);


		//문제	
		model.addAttribute("checkJavaInfo", checkJavaInfo);
		model.addAttribute("checkSqldInfo", checkSqldInfo);
		model.addAttribute("checkAdspInfo", checkAdspInfo);

		model.addAttribute("javaCorrCnt", javaCorrCnt);
		model.addAttribute("sqldCorrCnt", sqldCorrCnt);
		model.addAttribute("adspCorrCnt", adspCorrCnt);
		
		
		return "mypage/myachievement";
	}


}
