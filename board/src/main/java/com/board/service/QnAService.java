package com.board.service;

import java.util.List;

import com.board.domain.QnAVO;

public interface QnAService {
	
	public void createQnA(QnAVO vo) throws Exception;
	
	public List adminqna(QnAVO vo) throws Exception;  //사용자 보기 리스트
	
	public QnAVO viewqna(int bno) throws Exception;
}
