package com.board.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.board.dao.ReplyDAO;
import com.board.domain.ReplyVO;

@Service
public class ReplyServiceImpl implements ReplyService {

	/*
	 * @Inject private ReplyDAO dao;
	 */

	@Autowired
	private ReplyDAO dao;

	@Override
	public List<ReplyVO> replyList(int bno) throws Exception {
		// TODO Auto-generated method stub
		/* System.out.println("Service ST"); */
		return dao.replyList(bno);
	}

	@Override
	public void replywrite(ReplyVO vo) throws Exception {
		// TODO Auto-generated method stub
		 System.out.println("Service replywrite"); 
		 System.out.println(vo);
		dao.replyWrite(vo);
	}

	@Override
	public void replyDelete(ReplyVO vo) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("reP Servie  Delete St");
		dao.replyDelete(vo);
		
	}

	


	
}
