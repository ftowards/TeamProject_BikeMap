package com.bikemap.home.course;

import java.util.List;

public interface CourseCateDaoImp {
	
	// 코스 카테고리 읽어오기
	public List<CourseCateVO> selectCategory(String userid);

	// 회원 가입 시 기본 카테고리 추가
	public int insertBasic(String userid);
	
	// 코스 카테고리 추가
	public int insertCategory(CourseCateVO vo);
	
	// 코스 카테고리 삭제
	public int delCategory(int nocoursecate);
}
