package com.board.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.board.domain.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO {

	@Autowired
	private SqlSession sql;

	private static String namespace = "com.board.mappers.reply";

	@Override
	public List<ReplyVO> replyList(int bno) throws Exception {
		// TODO Auto-generated method stub

		/*
		 * System.out.println("DAO Start"); System.out.println(bno);
		 */
		return sql.selectList(namespace + ".replyList", bno);
		
		/*
		 * System.out.println("DAO Fin"); return sql.selectOne(namespace + ".view",
		 * bno);
		 */

	}

	@Override
	public void replyWrite(ReplyVO vo) throws Exception {
		// TODO Auto-generated method stub
		
		  System.out.println("DAO Start"); System.out.println("replywrite Start");
		  System.out.println(vo);
		 
		sql.insert(namespace + ".replyWrite",vo);
	}

	@Override
	public void replyDelete(ReplyVO vo) throws Exception {
		// TODO Auto-generated method stub
		
		System.out.println("DAO Start  replyDelete");
		
		sql.delete(namespace + ".replyDelete",vo);
		
	}

	

}
