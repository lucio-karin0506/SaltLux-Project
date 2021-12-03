package com.abc.myapp.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.abc.myapp.model.CheckAnswerVO;
import com.abc.myapp.model.ProblemsVO;

@Repository
public class MypageRepository implements IMypageRepository {

	@Autowired
	JdbcTemplate jdbcTemplate;

	//dB에서 문제 받아와서 객체에 저장
	private class MyProblemsMapper implements RowMapper<ProblemsVO> {
		@Override
		public ProblemsVO mapRow(ResultSet rs, int rowNum) throws SQLException {
			ProblemsVO problems = new ProblemsVO();
			problems.setSubjectId(rs.getInt("subject_id"));
			problems.setStudentId(rs.getInt("student_id"));
			problems.setProblemId(rs.getInt("problem_id"));
			problems.setProblemContent(rs.getString("problem_content"));
			problems.setProblemCase(rs.getString("problem_case"));
			problems.setProblemAnswer(rs.getString("problem_answer"));
			problems.setProblemCommentary(rs.getString("problem_commentary"));
			return problems;
		}
	}

	//조인 테이블 매퍼
	private class MyAnswerMapper implements RowMapper<CheckAnswerVO> {

		@Override
		public CheckAnswerVO mapRow(ResultSet rs, int rowNum) throws SQLException {
			CheckAnswerVO checkAnswer = new CheckAnswerVO();
			checkAnswer.setCheckResult(null);
			checkAnswer.setProblemId(rs.getInt("problem_id"));
			checkAnswer.setStudentAnswer(rs.getString("student_answer"));
			checkAnswer.setProblemAnswer(rs.getString("problem_answer"));
			checkAnswer.setProblemContent(rs.getString("problem_content"));
			checkAnswer.setProblemCase(rs.getString("problem_case"));
			checkAnswer.setProblemCommentary(rs.getString("problem_commentary"));
			return checkAnswer;
		}

	}


	@Override
	public List<ProblemsVO> getAllProblemInfo() {
		String sql = "select * from problems";
		return jdbcTemplate.query(sql, new MyProblemsMapper());
	}

	@Override
	public List<ProblemsVO> getProblemInfo(int subjectId, int studentId) {
		String sql = " select * "
				+ " from problems "
				+ " where subject_id=? and student_id=?";
		return jdbcTemplate.query(sql, new MyProblemsMapper(), subjectId, studentId);
	}

	@Override
	public void deleteProblem(int problemId) {
		String sql = "delete from problems where problem_id=?";
		jdbcTemplate.update(sql, problemId);
	}

	@Override
	public void updateProblem(ProblemsVO problem) {
		String sql = "update problems " 
				+ " set problem_content=?, problem_case=?, " 
				+ " problem_answer=?, problem_commentary=? "
				+ " where problem_id=?";
		jdbcTemplate.update(sql, 
				problem.getProblemContent(), 
				problem.getProblemCase(), 
				problem.getProblemAnswer(), 
				problem.getProblemCommentary(), 
				problem.getProblemId()
				);	
	}

	@Override
	public List<ProblemsVO> getUpdateProblem(int problemId) {
		String sql = "select * from problems where problem_id=?";
		return jdbcTemplate.query(sql, new MyProblemsMapper(), problemId);
	}

	//학생답 문제답 join한 테이블
	@Override
	public List<CheckAnswerVO> CompareAnswerInfo(int subjectId, int studentId) {
		String sql = " select distinct a.problem_id as problem_id, a.student_answer  as student_answer, "
				+ "  p.problem_answer as problem_answer, p.problem_content as problem_content,   "
				+ "  p.problem_case as problem_case, p.problem_commentary as problem_commentary   "
				+ "  from problems p join student_answer_list a  "
				+ "  on p.problem_id=a.problem_id   "
				+ "  where p.subject_id=? and a.student_id=? ";
		return jdbcTemplate.query(sql, new MyAnswerMapper(), subjectId, studentId);
	}

}
