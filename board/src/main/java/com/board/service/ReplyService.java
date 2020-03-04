package com.board.service;

import java.util.List;

import com.board.domain.BoardVO;
import com.board.domain.ReplyVO;


public interface ReplyService {

	

	public List<ReplyVO> replyList(int bno) throws Exception;

	public void replywrite(ReplyVO vo) throws Exception;

	public void replyDelete(ReplyVO vo) throws Exception;

	
	
	/* public ReplyVO replyList(int bno) throws Exception; */

}
