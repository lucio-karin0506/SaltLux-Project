package com.abc.myapp.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.abc.myapp.model.ProblemsVO;
import com.abc.myapp.model.StudentAnswerVO;

@Repository
public class ProblemsRepository implements IProblemsRepository {

	@Autowired
	JdbcTemplate jdbcTemplate;

	// problem 매퍼
	private class ProblemsMapper implements RowMapper<ProblemsVO> {
		@Override
		public ProblemsVO mapRow(ResultSet rs, int rowNum) throws SQLException {
			ProblemsVO problem = new ProblemsVO();
			problem.setSubjectId(rs.getInt("subject_id"));
			problem.setStudentId(rs.getInt("student_id"));
			problem.setProblemId(rs.getInt("problem_id"));
			problem.setProblemContent(rs.getString("problem_content"));
			problem.setProblemCase(rs.getString("problem_case"));
			problem.setProblemAnswer(rs.getString("problem_answer"));
			problem.setProblemCommentary(rs.getString("problem_commentary"));
			return problem;
		}
	}

	@Override
	public void uploadProblem(ProblemsVO problems) {
		String sql = "insert into problems "
				+ " (subject_id,student_id,problem_id,problem_content, problem_case, problem_answer, problem_commentary) "
				+ " values(?,?,problem_seq.NEXTVAL, ?, ?, ?, ?)";
		jdbcTemplate.update(sql, problems.getSubjectId(), problems.getStudentId(), problems.getProblemContent(),
				problems.getProblemCase(), problems.getProblemAnswer(), problems.getProblemCommentary());
	}

	// db에서 문제 불러오기
	@Override
	public List<ProblemsVO> getProblemList(int subjectId, int problemCnt, int studentId) {
		String sql = "select * " + " from(select subject_id, student_id, "
				+ " problem_id, problem_content, nvl(problem_case,' ') problem_case, "
				+ " problem_answer, problem_commentary from problems " + "where subject_id=? " + " and student_id<>?  "
				+ " and problem_id in  " + " (select problem_id " + "  from problems  " + "  where subject_id=? "
				+ " minus select problem_id " + "  from student_answer_list where subject_id=?) "
				+ " order by dbms_random.value) " + " where rownum<=? "; // 나중에 studentId지정 - 로그인 사용자가 낸 문제가 아닌 문제
		return jdbcTemplate.query(sql, new ProblemsMapper(), subjectId, studentId, subjectId, subjectId, problemCnt); // 나중에
																														// studentId지정
	}

	// 학생 답안 저장
	@Override
	public void insertStudentAnswer(StudentAnswerVO answers) {
		String sql = "insert into student_answer_list " + " (student_id, problem_id, student_answer, subject_id) "
				+ " values(?, ?, ?, ?)";
		jdbcTemplate.update(sql, answers.getStudentId(), answers.getProblemId(), answers.getStudentAnswer(),
				answers.getSubjectId());
	}

}
