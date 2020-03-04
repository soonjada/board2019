package com.board.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.board.domain.BoardVO;
import com.board.domain.Criteria;
import com.board.domain.SearchCriteria;

@Repository
public class BoardDAOImpl implements BoardDAO {

	@Inject
	private SqlSession sql;

	private static String namespace = "com.board.mappers.board";

	// 게시물 목록
	@Override
	public List list() throws Exception {

		return sql.selectList(namespace + ".list");
	}

	// 게시물 작성
	@Override
	public void write(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		sql.insert(namespace + ".write", vo);

	}

	@Override
	public BoardVO view(int bno) throws Exception {
		// TODO Auto-generated method stub
		/* sql.update(namespace + ".viewcnt", bno); */
		return sql.selectOne(namespace + ".view", bno);
	}

	@Override
	public void modify(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		sql.update(namespace + ".modify", vo);
	}

	@Override
	public void delete(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		sql.delete(namespace + ".delete", vo);
	}

	@Override
	public List listPage(Criteria cri) throws Exception {
		// TODO Auto-generated method stub

		return sql.selectList(namespace + ".listPage", cri);
	}

	@Override
	public int listCount() throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace + ".listCount");
	}

	@Override
	public List listSearch(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub		
		return sql.selectList(namespace + ".listSearch", scri);
	}

	@Override
	public int countSearch(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace + ".countSearch", scri);
	}
	
	
	/* 11.20 ver2 새로고침 조회수 증가 방지 시작부분  */
	
	  @Override 
	  public void viewCnt(int bno) throws Exception { 
		  // TODO Auto-generated method stub
	  
	  sql.update(namespace + ".viewcnt", bno); }
	 
	/* 11.20 ver2 새로고침 조회수 증가 방지 끝  */

}