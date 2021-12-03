package com.abc.myapp.dao;

import java.util.List;

import com.abc.myapp.model.ProblemsVO;
import com.abc.myapp.model.StudentAnswerVO;

public interface IProblemsRepository {
	void uploadProblem(ProblemsVO problems);
	List<ProblemsVO> getProblemList(int subjectId, int problemCnt, int studentId);
	void insertStudentAnswer(StudentAnswerVO answers);

}
