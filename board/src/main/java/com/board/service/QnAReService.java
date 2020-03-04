package com.board.service;

import java.util.List;

import com.board.domain.BoardVO;
import com.board.domain.QnAReVO;
import com.board.domain.ReplyVO;


public interface QnAReService {

	public List<QnAReVO> qnareList(int bno) throws Exception;

	public void qnareWrite(QnAReVO vo) throws Exception;

	public void qnareDelete(QnAReVO vo) throws Exception;

}
