package com.abc.myapp.service;

import java.util.List;

import com.abc.myapp.model.ProblemsVO;
import com.abc.myapp.model.StudentAnswerVO;

public interface IProblemService {
	void uploadProblem(ProblemsVO problems);
	List<ProblemsVO> getProblemList(int subjectId,int problemCnt, int studentId); //, String studentId);
	void insertStudentAnswer(StudentAnswerVO answers);
	
}
