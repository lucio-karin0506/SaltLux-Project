package com.abc.myapp.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.abc.myapp.dao.IStudentRepository;
import com.abc.myapp.model.StudentVO;

@Service
public class StudentService implements IStudentService {
	
	@Autowired
	IStudentRepository studentRepository;
	
	@Override
	public Map<String, Object> checkUser(String id, String password) {
		return studentRepository.checkUser(id, password);
	}

	@Override
	public List<StudentVO> getStudentList() {
		return studentRepository.getStudentList();
	}
	
	@Override
	public void insertStudent(StudentVO std) {
		studentRepository.insertStudent(std);
	}

	@Override
	public void updateStudent(StudentVO std) {
		studentRepository.updateStudent(std);
	}

	@Override
	public void deleteStudent(String emailId) {
		studentRepository.deleteStudent(emailId);
	}

	@Override
	public List<Map<String, Object>> getAllStudentId() {
		return studentRepository.getAllStudentId();
	}

	@Override
	public StudentVO getStdInfo(int studentId) {
		return studentRepository.getStdInfo(studentId);
	}

}
