package com.board.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.board.domain.MembersVO;

@Repository
public class MembersDAOImpl implements MembersDAO {

	@Inject
	private SqlSession sql;

	private static String namespace = "com.board.mappers.members";

	@Override
	public void createId(MembersVO vo) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("Dao Start");
		System.out.println(vo.toString());
		sql.insert(namespace + ".createId", vo);
		System.out.println("Dao End");
	}

	@Override
	public MembersVO login(MembersVO vo) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("DAO Login Start");
		/* System.out.println("DAO IN VO = "+vo); */
		/* return sql.selectOne(namespace + ".login", vo); */
		return sql.selectOne(namespace + ".loginBcrypt", vo);

	}

	@Override
	public void modify(MembersVO vo) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("DAO Member modify ST");
		sql.update(namespace + ".modify",vo);
		System.out.println("DAO Member modify End");
	}

	@Override
	public void delete(MembersVO vo) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("DAO Member delete ST");
		sql.delete(namespace + ".delete",vo);
		System.out.println("DAO Member delete End");
		
	}

	@Override
	public MembersVO idCheck(String userId) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("DAO idCheck Call");
		System.out.println(userId);
		return sql.selectOne(namespace + ".idCheck",userId);
	}

	@Override
	public MembersVO findUser(MembersVO vo) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("DAO findUser ST");
		System.out.println("userID = "+vo.getUserId()+" userName = "+vo.getUserName());
		return sql.selectOne(namespace + ".findUser",vo);
	}

	@Override
	public void findPass(MembersVO vo) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("DAO Member findPass ST");
		System.out.println(vo);
		sql.update(namespace + ".findPass",vo);
		System.out.println("DAO Member findPass End");
		
	}

	@Override
	public MembersVO emailCheck(String email) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("DAO emailCheck Call");
		System.out.println(email);
		return sql.selectOne(namespace + ".emailCheck",email);
	}

	@Override
	public MembersVO findId(MembersVO vo) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("DAO findId ST");
		System.out.println("useremail = "+vo.getEmail()+" userName = "+vo.getUserName());
		return sql.selectOne(namespace + ".findId",vo);
	}

	@Override
	public MembersVO ckimg(MembersVO vo) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("dao ck img");
		return sql.selectOne(namespace + ".ckimg",vo);
	}


}
