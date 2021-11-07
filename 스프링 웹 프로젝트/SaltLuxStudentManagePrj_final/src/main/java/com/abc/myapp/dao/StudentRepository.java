package com.abc.myapp.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.abc.myapp.model.StudentVO;

@Repository
public class StudentRepository implements IStudentRepository {

	@Autowired
	JdbcTemplate jdbcTemplate;

	private class StudentMapper implements RowMapper<StudentVO> {

		@Override
		public StudentVO mapRow(ResultSet rs, int rowNum) throws SQLException {
			StudentVO std = new StudentVO();
			std.setStudentName(rs.getString("student_name"));
			std.setStudentId(rs.getInt("student_id"));
			std.setEmailId(rs.getString("email_id"));
			std.setPassword(rs.getString("password"));
			std.setStudentImage(rs.getBytes("student_image"));
			return std;
		}

	}

	// 사용자 아이디, 패스워드 체크
	@Override
	public Map<String, Object> checkUser(String id, String password) {
		String sql = "select student_id, email_id, password from students where email_id=? and password=?";

		try {
			return jdbcTemplate.queryForMap(sql, id, password);
		} catch (EmptyResultDataAccessException e) {
			return null;
		}
	}

	// 사용자 정보 조회
	@Override
	public List<StudentVO> getStudentList() {
		String sql = "select * from students order by student_id";
		return jdbcTemplate.query(sql, new StudentMapper());
	}

	// 학생 정보 입력
	@Override
	public void insertStudent(StudentVO std) {
		String sql = "insert into students " + "(student_name, student_id, email_id, password, student_image)"
				+ " values( ?, ?, ?, ?, ?)";
		jdbcTemplate.update(sql, std.getStudentName(), std.getStudentId(), std.getEmailId(), std.getPassword(),
				std.getStudentImage());
	}

	@Override
	public void updateStudent(StudentVO std) {
		String sql = "update students " + "set student_name=?, email_id=?, " + "password=?, student_image=? "
				+ "where student_id=?";
		jdbcTemplate.update(sql, std.getStudentName(), std.getEmailId(), std.getPassword(), std.getStudentImage(),
				std.getStudentId());
	}

	@Override
	public void deleteStudent(String emailId) {
		String sql = "delete from students where email_id=?";
		jdbcTemplate.update(sql, emailId);
	}

	@Override
	public List<Map<String, Object>> getAllStudentId() {
		String sql = "select student_id as studentId, " + " student_name as studentName " + " from students";
		return jdbcTemplate.queryForList(sql);
	}

	@Override
	public StudentVO getStdInfo(int studentId) {
		String sql = "select student_id, student_name, email_id, password, student_image from students where student_id=?";
		return jdbcTemplate.queryForObject(sql, new StudentMapper(), studentId);
	}

} // end class