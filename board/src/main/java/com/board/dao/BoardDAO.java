package com.board.dao;

import java.util.List;

import com.board.domain.BoardVO;
import com.board.domain.Criteria;
import com.board.domain.SearchCriteria;

public interface BoardDAO {

	// 게시물 목록
	public List list() throws Exception;

	// 게시물 작성
	public void write(BoardVO vo) throws Exception;

	// 게시물 조회
	public BoardVO view(int bno) throws Exception;

	// 게시물 수정
	public void modify(BoardVO vo) throws Exception;

	// 게시물 삭제
	public void delete(BoardVO vo) throws Exception;

	public List listPage(Criteria cri) throws Exception;

	public int listCount() throws Exception;

	public List listSearch(SearchCriteria scri) throws Exception;

	public int countSearch(SearchCriteria scri) throws Exception;
	
	/* 11.20 ver2 새로고침 조회수 증가 방지 시작부분  */
	 public void viewCnt(int bno) throws Exception; 
	/* 11.20 ver2 새로고침 조회수 증가 방지 끝  */

}
