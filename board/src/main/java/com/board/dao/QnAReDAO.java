package com.board.dao;

import java.util.List;

import com.board.domain.QnAReVO;


public interface QnAReDAO {

	public List<QnAReVO> qnareList(int bno) throws Exception;

	public void qnareWrite(QnAReVO vo) throws Exception;

	public void qnareDelete(QnAReVO vo) throws Exception;

	
}
