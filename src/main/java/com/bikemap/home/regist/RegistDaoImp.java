package com.bikemap.home.regist;

public interface RegistDaoImp {

	// 회원 가입
	public int insertUser(RegistVO vo);

	// 로그인
	public RegistVO login(RegistVO vo);

	// 회원 정보 선택
	public RegistVO selectUser(String userid);

}