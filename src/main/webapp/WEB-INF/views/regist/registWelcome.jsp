<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/home/css/registerForm.css" type="text/css"/>

<div class="registerMainDiv2">
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