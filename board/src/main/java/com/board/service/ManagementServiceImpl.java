package com.board.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;


import com.board.dao.ManagementDAO;
import com.board.domain.FileManagerVO;
import com.board.domain.MembersVO;
import com.board.domain.QnAVO;
import com.board.domain.ReplyVO;

@Service
public class ManagementServiceImpl implements ManagementService {
	
	@Inject
	private ManagementDAO dao;
	

	@Override
	public List listmember() throws Exception {
		// TODO Auto-generated method stub
		return dao.listmember();
	}


	@Override
	public MembersVO viewmember(String userId) throws Exception {
		// TODO Auto-generated method stub
		System.out.println(userId);
		return dao.viewmember(userId);
	}


	@Override
	public void level(MembersVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.level(vo);
		
	}


	@Override
	public List boardmember(String writerId) throws Exception {
		// TODO Auto-generated method stub
		return dao.boardmember(writerId);
	}


	@Override
	public List qnalist() throws Exception {
		// TODO Auto-generated method stub
		return dao.qnalist();
	}
	
	@Override
	public QnAVO viewqna(int bno) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("viewqna Ser St ");
		return dao.viewqna(bno);
	}


	@Override
	public void viewqnaMG(QnAVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.viewqnaMG(vo);
		
	}


	@Override
	public FileManagerVO fileName(String saveFileName) throws Exception {
		// TODO Auto-generated method stub
		
		return dao.fileName(saveFileName);
		
	}


	@Override
	public List filelist() throws Exception {
		// TODO Auto-generated method stub
		return dao.filelist();
	}


	@Override
	public FileManagerVO fileview(int no) throws Exception {
		// TODO Auto-generated method stub
		return dao.fileview(no);
	}


	@Override
	public void filedelete(String saveFileName) throws Exception {
		// TODO Auto-generated method stub
		dao.filedelete(saveFileName);
	}


	@Override
	public void replymodify(ReplyVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.replymodify(vo);
	}


	@Override
	public ReplyVO replymodifyview(int rno) throws Exception {
		// TODO Auto-generated method stub
		return dao.replymodifyview(rno);
	}

}
