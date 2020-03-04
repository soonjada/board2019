package com.board.service;

import org.springframework.web.multipart.MultipartFile;


import com.board.domain.FileManagerVO;

public interface FileUploadService {

	String restore(MultipartFile file) throws Exception;
	
	String restore2(MultipartFile file, FileManagerVO vo) throws Exception;

}
