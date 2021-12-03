package com.abc.myapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.abc.myapp.dao.IMypageRepository;
import com.abc.myapp.model.CheckAnswerVO;
import com.abc.myapp.model.ProblemsVO;

@Service
public class MypageService implements IMypageService {

	@Autowired
	IMypageRepository mypageRepository;

	@Override
	public List<ProblemsVO> getAllProblemInfo() {
		return mypageRepository.getAllProblemInfo();
	}

	@Override
	public List<ProblemsVO> getProblemInfo(int subjectId, int studentId) {
		return mypageRepository.getProblemInfo(subjectId, studentId);
	}

	@Override
	public void deleteProblem(int problemId) {
		mypageRepository.deleteProblem(problemId);
	}

	//수정 추가
	@Override
	public void updateProblem(ProblemsVO problem) {
		mypageRepository.updateProblem(problem);
	}

	@Override
	public List<ProblemsVO> getUpdateProblem(int problemId) {
		return mypageRepository.getUpdateProblem(problemId);
	}

	//학생답과 문제답 정보 테이블 불러오기
	@Override
	public List<CheckAnswerVO> CompareAnswerInfo(int subjectId, int studentId) {
		return mypageRepository.CompareAnswerInfo(subjectId, studentId);
	}

	//문제답과 학생답 비교 메소드
	@Override
	public int CheckAnswerResult(List<CheckAnswerVO> checkAnswer) {
		int correctCnt = 0;
		int totalCnt = 0;
		if (checkAnswer != null) {
			for(CheckAnswerVO answer : checkAnswer) {
				if(answer.getProblemAnswer().equals(answer.getStudentAnswer())) {
					answer.setCheckResult("O");
					correctCnt = correctCnt + 1;
				}else {
					answer.setCheckResult("X");
				}
				totalCnt = totalCnt+1; 
			}
		}
		return correctCnt;

	}


}
