package com.bikemap.home.course;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CourseController {

	public SqlSession sqlSession;

	public SqlSession getSqlSession() {
		return sqlSession;
	}

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	// 코스 만들기 이동
	// 코스 만들기 열 때 내 코스 카테고리 목록 가져가기
	@RequestMapping("/courseMap")
	public ModelAndView courseMap(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		CourseCateDaoImp cateDAO = sqlSession.getMapper(CourseCateDaoImp.class);
		String userid  = (String)session.getAttribute("logId");
		
		List<CourseCateVO> categoryList = cateDAO.selectCategory(userid);
		
		mav.addObject("category", categoryList);
		mav.setViewName("course/courseMap");
		return mav;
	}
	
	// 코스 만들기에서 코스 카테고리 추가
	@RequestMapping("/insertCategory")
	@ResponseBody
	public int insertCategory(HttpSession session, CourseCateVO vo) {
		CourseCateDaoImp cateDAO = sqlSession.getMapper(CourseCateDaoImp.class);
		
		vo.setUserid((String)session.getAttribute("logId"));
		return cateDAO.insertCategory(vo);
	}
	
	// 카테고리 리스트 새로 불러오기
	@RequestMapping(value= "/selectCategory")
	@ResponseBody
	public List<CourseCateVO> selectCategory(HttpSession session){
		CourseCateDaoImp cateDAO = sqlSession.getMapper(CourseCateDaoImp.class);
		String userid  = (String)session.getAttribute("logId");
		
		return cateDAO.selectCategory(userid);
	}
}
