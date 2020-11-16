<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	.container *{margin : 0 auto; text-align : center; }
	.container>*{margin : 15px auto;}
	#box{height : 400px; background-color : #eee;
		 border-top : 3px solid #ccc; border-bottom : 3px solid #ccc;
		 margin : 15px 0 ;}
	#box div:first-child{border-bottom : 2px solid #ddd; height : 300px;}
	#box p{height : 96px; line-height : 48px;}
	.button{border : #00B0B0 2px solid; background-color : white ; border-radius: 8px;
			text-decoration: none; text-align : center; font-size : 16px; padding : 12px 24px;
			margin : 0 10px; color: #00B0B0}
	.button:hover{color : white; background-color: #00B0B0}
</style>
<div class="container">
	<h1>환영합니다!</h1>
	<div id="box">
		<div>
		<h3>회원가입이 완료되었습니다.</h3>
		</div>
		<p>입력하신 이메일로 인증 메일이 발송되었습니다.<br/>
		이메일 인증 이후 서비스 이용이 가능합니다.</p>
	</div>
	<div>
		<input type="button" value="메인으로 이동하기" class="button" onclick="location.href='/home'"/>
		<input type="button" value="로그인하기" class="button" onclick="location.href='/home/login'"/>
	</div>
</div> 