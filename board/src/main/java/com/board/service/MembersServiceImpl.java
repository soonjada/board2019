package com.board.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.board.dao.MembersDAO;
import com.board.domain.MembersVO;

@Service
public class MembersServiceImpl implements MembersService {

	@Inject
	private MembersDAO dao;

	@Override
	public void createId(MembersVO vo) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("Service Start");
		dao.createId(vo);
		System.out.println("Service End");
	}

	@Override
	public MembersVO login(MembersVO vo) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("Service Login Start");
				
		/* System.out.println("Service Login VO = "+vo); */
		
		return dao.login(vo);
		
	}

	@Override
	public void modify(MembersVO vo) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("Service modify St");
		dao.modify(vo);
		System.out.println("Service modify End");
		
	}

	@Override
	public void delete(MembersVO vo) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("Service delete St");
		dao.delete(vo);
		System.out.println("Service delete End");
	}

	@Override
	public MembersVO idCheck(String userId) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("Service idCheck St");
		System.out.println("Get userId = "+userId);
		return dao.idCheck(userId);
	}

	@Override
	public MembersVO findUser(MembersVO vo) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("Service findUser ST");
		System.out.println("userID = "+vo.getUserId()+" userName = "+vo.getUserName());
		return dao.findUser(vo);
	}

	@Override
	public void findPass(MembersVO vo) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("Service findPass St");
		dao.findPass(vo);
		System.out.println("Service findPass End");
		
	}

	@Override
	public MembersVO emailCheck(String email) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("Service emailCheck St");
		System.out.println("Get email = "+email);
		return dao.emailCheck(email);
	}

	@Override
	public MembersVO findId(MembersVO vo) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("Service findId ST");
		System.out.println("userEmail = "+vo.getEmail()+" userName = "+vo.getUserName());
		return dao.findId(vo);
	}

	@Override
	public MembersVO ckimg(MembersVO vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.ckimg(vo);
	}

}
