package com.board.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.board.dao.QnADAO;
import com.board.domain.QnAVO;

@Service
public class QnAServiceImpl implements QnAService {

	@Inject 
	private QnADAO dao;

	@Override
	public void createQnA(QnAVO vo) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("createQnA Ser St ");
		dao.createQnA(vo);
		System.out.println("createQnA Ser End ");
		
	}

	@Override
	public List adminqna(QnAVO vo) throws Exception {
		// TODO Auto-generated method stub
		
		System.out.println("adminqna Ser St ");
		return dao.adminqna(vo);
	}

	@Override
	public QnAVO viewqna(int bno) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("viewqna Ser St ");
		return dao.viewqna(bno);
	}

}
