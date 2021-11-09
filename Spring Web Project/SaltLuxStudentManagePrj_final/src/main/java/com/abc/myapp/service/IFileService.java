package com.abc.myapp.service;



import com.abc.myapp.model.ImageFileVO;

public interface IFileService {
	void uploadFile(ImageFileVO file);
	ImageFileVO getFile(int studentId);
	void updateStudentImg(ImageFileVO file);
}
