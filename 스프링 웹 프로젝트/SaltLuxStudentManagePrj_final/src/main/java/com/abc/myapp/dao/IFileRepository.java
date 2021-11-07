package com.abc.myapp.dao;


import com.abc.myapp.model.ImageFileVO;

public interface IFileRepository {
	int getMaxFileId();
	void uploadFile(ImageFileVO file);
	ImageFileVO getFile(int studentId);
	void updateStudentImg(ImageFileVO file);
}
