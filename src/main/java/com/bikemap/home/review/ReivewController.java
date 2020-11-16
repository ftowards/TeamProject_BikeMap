package com.bikemap.home.review;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class ReivewController {

	public SqlSession sqlSession;
	
	public SqlSession getSqlSessin() {
		return sqlSession;
		
	}
	
	
	//후기 게시판 목록
	@RequestMapping("/reviewMain")
	public String ReviewView() {
		return "review/reviewView";
	}
	
	
	//후기 게시판 보기
	@RequestMapping("/reviewList")
	public String ReviewList() {
		return "review/reviewList";
	}
	
	
	
	
	
}
