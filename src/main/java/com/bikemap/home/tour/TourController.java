package com.bikemap.home.tour;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TourController {
	
	public SqlSession sqlSession ;
	
	public SqlSession getSqlSession() {
		return sqlSession;
	}
	
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	@RequestMapping("/tourList")
	public String tourList() {
		return "tour/tourList";
	}
	// 글쓰기 폼 이동
	@RequestMapping("/tourWriteForm")
	public String tourBoardWrite() {
		return "tour/tourWriteForm";
	}
	// 글쓰기 등록
	@RequestMapping(value="/tourWriteFormOk", method=RequestMethod.POST, produces="application/text;charset=UTF-8")
	@ResponseBody
	public ModelAndView tourWriteFormOk(TourVO vo ,HttpServletRequest req, HttpSession ses) {
		vo.setIp(req.getRemoteAddr());
		vo.setUserid((String)ses.getAttribute("logId"));
		
		TourDaoImp dao = sqlSession.getMapper(TourDaoImp.class);
		int result = dao.tourInsert(vo);
		
		ModelAndView mav = new ModelAndView();
		if(result>0) {
			mav.setViewName("redirect/tourList");
		}else {
			mav.setViewName("tour/tourWriteForm");
			
		}
		
		return null;
	}
}
