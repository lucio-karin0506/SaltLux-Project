package com.abc.myapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.abc.myapp.dao.IProblemsRepository;
import com.abc.myapp.model.ProblemsVO;
import com.abc.myapp.model.StudentAnswerVO;

@Service
public class ProblemService implements IProblemService {
	
	@Autowired
	IProblemsRepository problemsRepository;

	@Override
	public void uploadProblem(ProblemsVO problems) {
		problemsRepository.uploadProblem(problems);
	}

	@Override
	public List<ProblemsVO> getProblemList(int subjectId, int problemCnt, int studentId) {
		return problemsRepository.getProblemList(subjectId,problemCnt, studentId); //, studentId);
	}

	@Override
	public void insertStudentAnswer(StudentAnswerVO answers) {
		problemsRepository.insertStudentAnswer(answers);
	}

}
