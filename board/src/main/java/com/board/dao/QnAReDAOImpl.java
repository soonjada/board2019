package com.board.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.board.domain.QnAReVO;


@Repository
public class QnAReDAOImpl implements QnAReDAO {

	@Autowired
	private SqlSession sql;

	private static String namespace = "com.board.mappers.qna_re";

	@Override
	public List<QnAReVO> qnareList(int bno) throws Exception {
		// TODO Auto-generated method stub

		/*
		 * System.out.println("DAO Start"); System.out.println(bno);
		 */
		return sql.selectList(namespace + ".qnareList", bno);
		
		/*
		 * System.out.println("DAO Fin"); return sql.selectOne(namespace + ".view",
		 * bno);
		 */

	}

	@Override
	public void qnareWrite(QnAReVO vo) throws Exception {
		// TODO Auto-generated method stub
		
		  System.out.println("DAO Start"); System.out.println("replywrite Start");
		  System.out.println(vo);
		 
		sql.insert(namespace + ".qnareWrite",vo);
	}

	@Override
	public void qnareDelete(QnAReVO vo) throws Exception {
		// TODO Auto-generated method stub
		
		System.out.println("DAO Start  replyDelete");
		
		sql.delete(namespace + ".qnareDelete",vo);
		
	}

	

}
