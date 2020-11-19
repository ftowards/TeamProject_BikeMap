package com.bikemap.home.regist;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bikemap.home.course.CourseCateDaoImp;
import com.bikemap.home.mailng.MailHandler;

@Controller
public class RegistController {
	
	public SqlSession sqlSession ;
	
	@Autowired
	private JavaMailSender mailSender;
	
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
	
	// 아이디 중복 체크
	@RequestMapping("/idDoubleChk")
	@ResponseBody
	public int idDoubleChk(@RequestParam("userid") String userid) {
		RegistDaoImp dao = sqlSession.getMapper(RegistDaoImp.class);
		return dao.idDoubleChk(userid);
	}
	
	// 아이디 중복 체크
	@RequestMapping("/emailDoubleChk")
	@ResponseBody
	public int emailDoubleChk(@RequestParam("email") String email) {
		RegistDaoImp dao = sqlSession.getMapper(RegistDaoImp.class);
		return dao.emailDoubleChk(email);
	}
		
	// 회원가입 확인
	// 회원 정보 DB 입력 후 결과값을 폼 페이지로 반환
	@RequestMapping(value="/registerFormOk", method=RequestMethod.POST)
	@ResponseBody
	public int registerFormOk(RegistVO vo) {
		RegistDaoImp dao = sqlSession.getMapper(RegistDaoImp.class);
		CourseCateDaoImp cateDao = sqlSession.getMapper(CourseCateDaoImp.class);
		int result = 0;
		
		// vo에 인증 코드 세팅
		vo.setCode(new TempKey().qetKey());
		
		try {
		// 회원 가입
		result =dao.insertUser(vo);
		
		// 회원 가입 오류 없을 시 기본 카테고리 생성
		cateDao.insertBasic(vo.getUserid());
		
			// 회원 가입에 오류가 없을 시 인증 메일 발송
			if(result == 1) {
				MailHandler sendMail = new MailHandler(mailSender);
			        sendMail.setSubject("[바이크맵] 회원 인증 메일입니다.");
			        
			        sendMail.setText(
			        		new StringBuffer().append("<h1>메일인증</h1>").
			        		append("<a href='http://localhost:9090/home/registAuthorize?email=").
			        		append(vo.getEmail()).append("&code=").append(vo.getCode()).
			        		append("' target='_blank'>이메일 인증 확인</a>").toString());
			        sendMail.setFrom("project.bikemap@gmail.com", "바이크맵");
			        
			        sendMail.setTo(vo.getEmail());
		        sendMail.send();
			}
		}catch(Exception e) {
			e.getStackTrace();
		}
		return result;
	}
	
	// 인증 절차
	@RequestMapping("/registAuthorize")
	public ModelAndView registAuthorize(RegistVO vo) {
		ModelAndView mav = new ModelAndView();		
		RegistDaoImp dao = sqlSession.getMapper(RegistDaoImp.class);
		
		vo = dao.checkAuth(vo);

		if(vo.getActive().equals("Y")) {
			mav.addObject("msg", "이미 인증이 완료된 아이디입니다.");
		}else {
			if(dao.authorizeUser(vo)==1) {
				mav.addObject("msg", vo.getUsername()+"님 인증이 완료되었습니다. 로그인 후 이용해주십시오.");
			}else {
				mav.addObject("msg", "인증에 실패했습니다. 다시 시도해주십시오.");
			}
		}

		mav.setViewName("regist/authorResult");	
		return mav;
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
	@RequestMapping("/registPwdChk")
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
		
		RegistDaoImp dao = sqlSession.getMapper(RegistDaoImp.class);
		RegistVO vo = dao.selectUser((String)session.getAttribute("logId"));
		
		mav.addObject("user", vo);
		mav.setViewName("/regist/registEditForm");
		
		return mav;
	}
	
	// 회원 정보 수정 처리
	@RequestMapping("/registerEditFormOk")
	@ResponseBody
	public int registEditFormOk(RegistVO vo) {		
		RegistDaoImp dao = sqlSession.getMapper(RegistDaoImp.class);
		return dao.updateUser(vo);
	}
	
	// 회원 탈퇴 신청 페이지 이동
	@RequestMapping("/registDel")
	public String registDelUser() {
		return "regist/registDel";
	}
	
	// 회원 탈퇴 비밀번호 확인
	@RequestMapping("/registDelChk")
	public String registDelChk() {
		return "regist/registDelChk";
	}
	
	// 회원 탈퇴 시 비밀번호 확인 및 아이디 삭제
	@RequestMapping("/registDelPwdChk")
	@ResponseBody
	public int registDelPwdChk(RegistVO vo, HttpSession session) {
		int result = 0;
		RegistDaoImp dao = sqlSession.getMapper(RegistDaoImp.class);
		RegistVO resultVO = dao.login(vo);
		
		try {
			if(resultVO.getUsername() != null) {
				result = dao.delUser(vo);
			}
		}catch(Exception e) {
			e.getMessage();
		}
		return result;
	}
	
	// 회원 탈퇴 성공 메세지
	@RequestMapping("/registDelMessage")
	public String registDelMessage() {
		return "regist/registDelMessage";
	}
	
	// 회원정보 찾기
	@RequestMapping("/registFindInfo")
	public String registFirdInfo() {
		return "regist/registFindInfo";
	}
	
	// 회원 아이디 찾기
	@RequestMapping(value = "/registFindId", method=RequestMethod.POST, produces="application/text;charset=UTF-8")
	@ResponseBody
	public String registFindId(RegistVO vo) {
		RegistDaoImp dao = sqlSession.getMapper(RegistDaoImp.class);

		RegistVO resultVO = dao.registFindId(vo);
		String result = "입력한 정보와 일치하는 회원 정보가 없습니다." ;
		
		try {
			if(resultVO.getUserid() != null) { 
				String userid = resultVO.getUserid();
				result = userid.substring(0,3);
				for (int i = 0 ; i < userid.length()-3 ; i++) {
					result = result +"*";
				}
			}
		}catch(Exception e) {
			e.getMessage();
		}
		return result;
	}
	
	// 회원 비밀번호 찾기
	@RequestMapping(value="/registFindPwd", method=RequestMethod.POST)
	@ResponseBody
	public int registFindPwd(RegistVO vo) {
		RegistDaoImp dao = sqlSession.getMapper(RegistDaoImp.class);
		int result = 0;
		
		// 입력한 회원정보로 일치하는 회원 내역이 있는 지 확인
		try {
			RegistVO resultVO = dao.registFindPwd(vo);			
			if(resultVO.getEmail() != null) {
				result = 1;
			}
		}catch(Exception e) {
			e.getMessage();
		}
		
		if(result > 0) {
			// 임시 비밀번호 발송하는 메서드 필요
			// 임시 비밀번호로 db 업데이트
		}
		return result;
	}
}