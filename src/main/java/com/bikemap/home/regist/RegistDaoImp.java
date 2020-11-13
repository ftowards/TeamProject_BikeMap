package com.bikemap.home.regist;

public interface RegistDaoImp {

	// 회원 가입
	public int insertUser(RegistVO vo);

	// 로그인
	public RegistVO login(RegistVO vo);

	// 회원 정보 선택
	public RegistVO selectUser(String userid);
	
	// 회원 정보 수정
	public int updateUser(RegistVO vo);
	
	// 회원 정보 삭제
	public int delUser(RegistVO vo);
	
	// 회원 아이디 찾기
	public RegistVO registFindId(RegistVO vo);
	
	// 회원 비밀번호 찾기 - 일치하는 정보가 있는 지 확인
	public RegistVO registFindPwd(RegistVO vo);

}