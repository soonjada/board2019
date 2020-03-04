package com.board.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.board.dao.QnAReDAO;
import com.board.dao.ReplyDAO;
import com.board.domain.QnAReVO;
import com.board.domain.ReplyVO;

@Service
public class QnAReServiceImpl implements QnAReService {


	@Autowired
	private QnAReDAO dao;

	@Override
	public List<QnAReVO> qnareList(int bno) throws Exception {
		// TODO Auto-generated method stub
		/* System.out.println("Service ST"); */
		return dao.qnareList(bno);
	}

	@Override
	public void qnareWrite(QnAReVO vo) throws Exception {
		// TODO Auto-generated method stub
		 System.out.println("Service replywrite"); 
		 System.out.println(vo);
		dao.qnareWrite(vo);
	}

	@Override
	public void qnareDelete(QnAReVO vo) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("reP Servie  Delete St");
		dao.qnareDelete(vo);
		
	}

	
}
