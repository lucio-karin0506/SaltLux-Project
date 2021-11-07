package com.abc.myapp.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.abc.myapp.dao.IFileRepository;
import com.abc.myapp.model.ImageFileVO;

@Service
public class FileService implements IFileService {

	@Autowired
	IFileRepository uploadFileRepository;
	
	@Override
	public void uploadFile(ImageFileVO file) {
		file.setFile_id(uploadFileRepository.getMaxFileId()+1);
		uploadFileRepository.uploadFile(file);

	}

	@Override
	public ImageFileVO getFile(int studentId) {
		return uploadFileRepository.getFile(studentId);
	}
	
	@Override
	public void updateStudentImg(ImageFileVO file) {
		file.setFile_id(uploadFileRepository.getMaxFileId()+1);
		uploadFileRepository.updateStudentImg(file);
	}

}
