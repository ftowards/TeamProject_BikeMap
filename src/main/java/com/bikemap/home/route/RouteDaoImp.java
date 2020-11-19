package com.bikemap.home.route;

import java.util.List;

public interface RouteDaoImp {
	
	// 코스 카테고리 읽어오기
	public List<RouteCateVO> selectCategory(String userid);

	// 회원 가입 시 기본 카테고리 추가
	public int insertBasicCategory(String userid);
	
	// 코스 카테고리 추가
	public int insertCategory(RouteCateVO vo);
	
	// 코스 카테고리 삭제
	public int delCategory(int nocoursecate);
}
