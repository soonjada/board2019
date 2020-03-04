package com.board.dao;

import com.board.domain.MembersVO;

public interface MembersDAO {
	
	public void createId(MembersVO vo) throws Exception;
	
	public MembersVO login(MembersVO vo) throws Exception;
	
	public void modify(MembersVO vo) throws Exception;
	
	public void delete(MembersVO vo) throws Exception;
	
	public MembersVO idCheck(String userId) throws Exception;
	
	public MembersVO findUser(MembersVO vo) throws Exception;
	
	public void findPass(MembersVO vo) throws Exception;

	public MembersVO emailCheck(String email) throws Exception;

	public MembersVO findId(MembersVO vo) throws Exception;
	
	public MembersVO ckimg(MembersVO vo) throws Exception;

}
