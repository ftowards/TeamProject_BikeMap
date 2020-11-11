package com.bikemap.home.regist;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class RegistController {
	
	public SqlSession sqlSession ;
	
	public SqlSession getSqlSession() {
		return sqlSession;
	}
	
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	// 회원 가입 폼으로 이동
	@RequestMapping("/registerForm")
	public String registerForm() {
		return "/regist/registerForm";
	}
	
	// 회원가입 확인
	// 회원 정보 DB 입력 후 결과값을 폼 페이지로 반환
	@RequestMapping(value="/registerFormOk", method=RequestMethod.POST)
	@ResponseBody
	public int registerFormOk(RegistVO vo) {
		RegistDaoImp dao = sqlSession.getMapper(RegistDaoImp.class);
		return dao.insertUser(vo);
	}
	
	// 회원 가입 완료 시 이동하는 주소
	@RequestMapping("/registWelcome")
	public String registWelcome() {
		return "/regist/registWelcome";
	}
	
	// 로그인 페이지로 이동하는 주소
	@RequestMapping("/login")
	public String login() {
		return "/regist/login";
	}
	
	// 로그인 체크
	@RequestMapping("/loginOk")
	@ResponseBody
	public int loginOk(RegistVO vo, HttpSession session) {
		RegistDaoImp dao = sqlSession.getMapper(RegistDaoImp.class);
		RegistVO resultVO = dao.login(vo);
		
		int result = 0;
		try {
			if(resultVO.getUsername() != null) {
				session.setAttribute("logStatus", "Y");
				session.setAttribute("logId", resultVO.getUserid());
				session.setAttribute("logName", resultVO.getUsername());
				result = 1;
			}
		}catch(Exception e) {
			e.getMessage();
		}
		return result;
	}
	
	// 로그아웃
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "/home";
	}
	
	// 회원 정보 수정
	@RequestMapping("/registEdit")
	public String registEdit() {
		return "/regist/registEdit";
	}
	
	// 회원 정보 수정을 위한 비밀번호 확인
	@RequestMapping("/registEditPwdChk")
	@ResponseBody
	public int registEditPwdChk(RegistVO vo, HttpSession session) {
		int result = 0;
		RegistDaoImp dao = sqlSession.getMapper(RegistDaoImp.class);
		RegistVO resultVO = dao.login(vo);
		
		try {
			if(resultVO.getUsername() != null) {
				session.setAttribute("pwdChk", "Y");
				result = 1;
			}
		}catch(Exception e) {
			e.getMessage();
		}
		return result;
	}
	
	// 회원 정보 수정 폼으로 이동
	@RequestMapping("/registEditForm")
	public ModelAndView registEditForm(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		if( session.getAttribute("pwdChk") == null) {
			mav.setViewName("redirect:/registEdit");
			return mav;
		}
		
		System.out.println(session.getAttribute("pwdChk"));		
		
		RegistDaoImp dao = sqlSession.getMapper(RegistDaoImp.class);
		RegistVO vo = dao.selectUser((String)session.getAttribute("logId"));
		
		mav.addObject("user", vo);
		mav.setViewName("/regist/registEditForm");
		
		return mav;
	}
}