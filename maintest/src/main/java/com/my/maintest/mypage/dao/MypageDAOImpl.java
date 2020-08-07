package com.my.maintest.mypage.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.my.maintest.member.vo.MemberVO;

@Repository
public class MypageDAOImpl implements MypageDAO {

	@Inject
	private SqlSession sqlSession;

	@Override
	public int modify(MemberVO memberVO) {
		// TODO Auto-generated method stub
		return sqlSession.update("mappers.MypageDAO-mapper.modify", memberVO);
	}

	@Override
	public int changePW(MemberVO memberVO) {

		return sqlSession.update("mappers.MypageDAO-mapper.changePW", memberVO);
	}

	@Override
	public int withdraw(String id) {

		return sqlSession.delete("mappers.MypageDAO-mapper.withdraw", id);
	}

}