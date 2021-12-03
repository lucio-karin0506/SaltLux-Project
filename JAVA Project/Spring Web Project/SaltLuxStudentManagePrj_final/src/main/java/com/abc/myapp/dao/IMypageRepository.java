package com.abc.myapp.dao;


import java.util.List;

import com.abc.myapp.model.CheckAnswerVO;
import com.abc.myapp.model.ProblemsVO;

public interface IMypageRepository {
	List<ProblemsVO> getProblemInfo(int subjectId, int studentId);
	List<ProblemsVO> getAllProblemInfo();
	void deleteProblem(int problemId);
	//수정
	void updateProblem(ProblemsVO problem);
	// 선택한 문제 띄워주기
	List<ProblemsVO> getUpdateProblem(int problemId);
	//정답 확인 조인 테이블 받아오기
	List<CheckAnswerVO> CompareAnswerInfo(int subjectId, int studentId);
}
