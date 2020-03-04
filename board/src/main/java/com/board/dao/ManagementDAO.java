package com.board.dao;

import java.util.List;

import com.board.domain.FileManagerVO;
import com.board.domain.MembersVO;
import com.board.domain.QnAVO;
import com.board.domain.ReplyVO;


public interface ManagementDAO {
	
	public List listmember() throws Exception;
	
	public MembersVO viewmember(String userId) throws Exception;
	
	public void level(MembersVO vo) throws Exception;
	
	public List boardmember(String writerId) throws Exception;
	
	public List qnalist() throws Exception;
	
	public QnAVO viewqna(int bno) throws Exception;
	
	public void viewqnaMG(QnAVO vo) throws Exception;
	
	public void fileWrite(FileManagerVO vo) throws Exception;
	
	public FileManagerVO fileName(String saveFileName) throws Exception;
	
	public List filelist() throws Exception;
	
	public FileManagerVO fileview(int no) throws Exception;
	
	public void filedelete (String saveFileName) throws Exception; 
	
	public void replymodify(ReplyVO vo) throws Exception;
	
	public ReplyVO replymodifyview(int rno) throws Exception;

}
