package com.abc.myapp.service;

import java.util.List;
import java.util.Map;


import com.abc.myapp.model.StudentVO;

public interface IStudentService {
	
	Map<String, Object> checkUser(String id, String password);
	
	List<StudentVO> getStudentList();
	StudentVO getStdInfo(int studentId);
	void updateStudent(StudentVO std);
	void insertStudent(StudentVO std);
	
	void deleteStudent(String emailId);
	
	List<Map<String, Object>> getAllStudentId();
	

}
