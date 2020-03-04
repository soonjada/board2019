package com.board.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.board.domain.FileManagerVO;
import com.board.domain.MembersVO;
import com.board.domain.QnAVO;
import com.board.domain.ReplyVO;


@Repository
public class ManagementDAOImpl implements ManagementDAO {
	
	@Inject
	private SqlSession sql;

	private static String namespace = "com.board.mappers.management";

	@Override
	public List listmember() throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList(namespace + ".listmember");
	}

	@Override
	public MembersVO viewmember(String userId) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace + ".viewmember",userId);
	}

	@Override
	public void level(MembersVO vo) throws Exception {
		// TODO Auto-generated method stub
		
		System.out.println("DAO LEVEL ST vo = "+vo);
		
		sql.update(namespace + ".level",vo);
	}

	@Override
	public List boardmember(String writerId) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList(namespace + ".boardmember",writerId);
	}

	@Override
	public List qnalist() throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList(namespace + ".qnalist");
	}

	@Override
	public QnAVO viewqna(int bno) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("viewqna Ser St ");
		return sql.selectOne(namespace + ".viewqna", bno);
	}

	@Override
	public void viewqnaMG(QnAVO vo) throws Exception {
		// TODO Auto-generated method stub
		
		sql.update(namespace + ".ckqna",vo);
		
	}

	@Override
	public void fileWrite(FileManagerVO vo) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("file write dao "+vo);
		sql.insert(namespace + ".fileWrite",vo);
		
	}

	@Override
	public FileManagerVO fileName(String saveFileName) throws Exception {
		// TODO Auto-generated method stub
		
		return sql.selectOne(namespace + ".fileName",saveFileName);
		
	}

	@Override
	public List filelist() throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList(namespace + ".filelist");
	}

	@Override
	public FileManagerVO fileview(int no) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace+".fileview",no);
	}

	@Override
	public void filedelete(String saveFileName) throws Exception {
		// TODO Auto-generated method stub
		sql.delete(namespace + ".filedelete",saveFileName);
	}

	@Override
	public void replymodify(ReplyVO vo) throws Exception {
		// TODO Auto-generated method stub
		sql.update(namespace + ".replymodify",vo);
		
	}

	@Override
	public ReplyVO replymodifyview(int rno) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("dao rno = "+rno);
		return sql.selectOne(namespace + ".replymodifyview",rno);
	}
	

}
