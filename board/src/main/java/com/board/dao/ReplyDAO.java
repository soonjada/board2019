package com.board.dao;

import java.util.List;

import com.board.domain.ReplyVO;

public interface ReplyDAO {

	public List<ReplyVO> replyList(int bno) throws Exception;

	public void replyWrite(ReplyVO vo) throws Exception;

	public void replyDelete(ReplyVO vo) throws Exception;



	/* public ReplyVO replyList(int bno) throws Exception; */ 
	
}
