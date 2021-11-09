package com.abc.myapp.controller;

import java.nio.charset.Charset;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.abc.myapp.model.ImageFileVO;
import com.abc.myapp.model.StudentVO;
import com.abc.myapp.service.IFileService;
import com.abc.myapp.service.IStudentService;

@Controller
@RequestMapping("/admin/*")
public class AdminController {

	@Autowired
	IStudentService studentService;

	@Autowired
	IFileService fileService;

	// 학생정보조회 리스트 페이지 studentList.jsp로 이동
	@RequestMapping(value = "/studentList", method = RequestMethod.GET)
	public void getAllStds(Model model) {
		List<StudentVO> studentList = studentService.getStudentList();
		model.addAttribute("studentList", studentList);
	}

	// 학생정보입력 페이지 studentInsert.jsp로 이동
	@RequestMapping(value = "/studentInsert", method = RequestMethod.GET)
	public String getStudentInsertPage() {
		return "admin/studentInsert";
	}

	// 학생정보입력 후 학생정보조회 리스트 페이지 studentList.jsp로 이동
	@RequestMapping(value = "/studentInsert", method = RequestMethod.POST)
	public String getAfterInsertPage(@RequestParam int studentId, @RequestParam String studentName,
			@RequestParam String emailId, @RequestParam String password, @RequestParam MultipartFile file) {

		try {
			if (file != null && !file.isEmpty()) {
				// 기본 정보 입력
				StudentVO student = new StudentVO();
				student.setStudentId(studentId);
				student.setStudentName(studentName);
				student.setEmailId(emailId);
				student.setPassword(password);
				student.setStudentImage(file.getBytes());
				studentService.insertStudent(student);

				// 이미지 정보 입력
				ImageFileVO fileVO = new ImageFileVO();
				fileVO.setStudent_id(studentId);
				fileVO.setFile_name(file.getOriginalFilename());
				fileVO.setFile_size(file.getSize());
				fileVO.setFile_content_type(file.getContentType());
				fileVO.setFile_data(file.getBytes());
				fileService.uploadFile(fileVO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/admin/studentList";
	}

	// 학생 조회 리스트 페이지에서 student_id 클릭 시 학생 상세 정보 페이지 studentView.jsp로 이동
	@RequestMapping(value = "/{studentId}", method = RequestMethod.GET)
	public String getStdInfo(@PathVariable int studentId, Model model) {
		StudentVO std = studentService.getStdInfo(studentId);
		ImageFileVO fileInfo = fileService.getFile(studentId);

		model.addAttribute("student", std);
		model.addAttribute("fileInfo", fileInfo);
		return "admin/studentView";
	}

	// 학생정보 수정
	@RequestMapping(value = "/studentUpdate/{studentId}", method = RequestMethod.GET)
	public String updateStudent(@PathVariable int studentId, Model model) {
		System.out.println(studentId);
		model.addAttribute("student", studentService.getStdInfo(studentId));
		model.addAttribute("studentList", studentService.getAllStudentId());
		return "admin/studentUpdate";
	}

	@RequestMapping(value = "/studentUpdate", method = RequestMethod.POST)
	public String updateStudent(@RequestParam int studentId, @RequestParam String studentName, 
			@RequestParam String emailId, @RequestParam String password, 
			@RequestParam MultipartFile studentImage) {
		try {
			if(studentImage != null && !studentImage.isEmpty()) {
				// 기본 정보 수정
				StudentVO student = new StudentVO();
				student.setStudentId(studentId);
				student.setStudentName(studentName);
				student.setEmailId(emailId);
				student.setPassword(password);
				student.setStudentImage(studentImage.getBytes()); 
				studentService.updateStudent(student);
				
				// 이미지 정보 수정
				ImageFileVO fileVO = new ImageFileVO();
				fileVO.setStudent_id(studentId);
				fileVO.setFile_name(studentImage.getOriginalFilename());
				fileVO.setFile_size(studentImage.getSize());
				fileVO.setFile_content_type(studentImage.getContentType());
				fileVO.setFile_data(studentImage.getBytes());
				fileService.updateStudentImg(fileVO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/admin/" + studentId;
	}

	// 학생정보 삭제
	@RequestMapping(value = "/studentDelete/{studentId}", method = RequestMethod.GET)
	public String deleteStudent(@PathVariable int studentId, Model model) {
		model.addAttribute("student", studentService.getStdInfo(studentId));
		return "admin/studentDelete";
	}

	@RequestMapping(value = "/studentDelete", method = RequestMethod.POST)
	public String deleteStudent(@RequestParam String emailId) {
		studentService.deleteStudent(emailId);
		return "redirect:/admin/studentList";
	}

	@RequestMapping("/getImage/{studentId}")
	public ResponseEntity<byte[]> getImageFile(@PathVariable int studentId) {
		ImageFileVO file = fileService.getFile(studentId);
		final HttpHeaders headers = new HttpHeaders();
		if (file != null) {
			String[] mtypes = file.getFile_content_type().split("/");
			headers.setContentType(new MediaType(mtypes[0], mtypes[1]));
			headers.setContentLength(file.getFile_size());
			headers.setContentDispositionFormData("attachment", file.getFile_name(), Charset.forName("UTF-8"));
			return new ResponseEntity<byte[]>(file.getFile_data(), headers, HttpStatus.OK);
		} else {
			return new ResponseEntity<byte[]>(HttpStatus.NOT_FOUND);
		}
	}
}
