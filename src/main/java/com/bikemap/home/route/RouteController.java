package com.bikemap.home.route;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RouteController {
	
	public SqlSession sqlSession ;
	
	public SqlSession getSqlSession() {
		return sqlSession;
	}
	
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	//코스검색
	@RequestMapping("/routeSearch")
	public String routeSearch() {
		return "route/routeSearch";
	}
	
	//코스검색(글보기)
	@RequestMapping("/routeSearchView")
	public String routeSearchView() {
		return "route/routeSearchView";
	}
}