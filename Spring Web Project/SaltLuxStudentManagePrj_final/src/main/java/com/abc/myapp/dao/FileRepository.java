package com.abc.myapp.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.abc.myapp.model.ImageFileVO;

@Repository
public class FileRepository implements IFileRepository {

	@Autowired
	JdbcTemplate jdbcTemplate;

	@Override
	public int getMaxFileId() {
		String sql = "SELECT NVL(MAX(file_id),0) FROM student_img";
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}

	@Override
	public void uploadFile(ImageFileVO file) {
		String sql = "insert into student_img (student_id, file_id, " + "file_name, file_size, file_content_type, "
				+ "file_upload_date, file_data) " + "values (?, ?, ?, ?, ?, SYSDATE, ?)";
		jdbcTemplate.update(sql, file.getStudent_id(), file.getFile_id(), file.getFile_name(), file.getFile_size(),
				file.getFile_content_type(), file.getFile_data());
	}

	@Override
	public ImageFileVO getFile(int studentId) {
		String sql = "select * from student_img where student_id=?";

		try {
			return jdbcTemplate.queryForObject(sql, new RowMapper<ImageFileVO>() {
				@Override
				public ImageFileVO mapRow(ResultSet rs, int count) throws SQLException {
					ImageFileVO file = new ImageFileVO();
					file.setStudent_id(rs.getInt("student_id"));
					file.setFile_id(rs.getInt("file_id"));
					file.setFile_name(rs.getString("file_name"));
					file.setFile_size(rs.getLong("file_size"));
					file.setFile_content_type(rs.getString("file_content_type"));
					file.setFile_data(rs.getBytes("file_data"));
					return file;
				}
			}, studentId);
		} catch (EmptyResultDataAccessException e) {
			return null;
		}
	}

	@Override
	public void updateStudentImg(ImageFileVO file) {
		String sql = "update student_img "
				+ "set file_id = ?, file_name=?, "
				+ "file_size=?, file_content_type=?, file_upload_date=SYSDATE, "
				+ "file_data=? "
				+ "where student_id=?";
		jdbcTemplate.update(sql, file.getFile_id(), file.getFile_name(),
				file.getFile_size(), file.getFile_content_type(), file.getFile_data(), file.getStudent_id());
	}

}
