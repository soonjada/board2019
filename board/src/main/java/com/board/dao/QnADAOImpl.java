package com.board.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.board.domain.QnAVO;

@Repository
public class QnADAOImpl implements QnADAO {
	
	@Inject
	private SqlSession sql;

	private static String namespace = "com.board.mappers.qna";
	

	@Override
	public void createQnA(QnAVO vo) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("createQnA St");
		System.out.println(vo.toString());
		sql.insert(namespace + ".createqna", vo);
		System.out.println("createQnA End");

	}

	@Override
	public List adminqna(QnAVO vo) throws Exception {
		// TODO Auto-generated method stub
		System.out.println(vo);
		System.out.println("adminqna DAO ST");
		return sql.selectList(namespace + ".adminqna", vo);
	}

	@Override
	public QnAVO viewqna(int bno) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("viewqna Ser St ");
		return sql.selectOne(namespace + ".viewqna", bno);
	}

}
