<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
 <script src="//code.jquery.com/jquery-1.12.4.js"></script>
 <script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style>
	.container{overflow:hidden;}
	#label{width : 26%; margin-right : 4%}
	#label li{text-align : right; font-size : 1.3em; font-weight: bold;}
	#input{width : 70%;}
	form>div{float:left;}
	form li{height : 50px; line-height : 50px;}
	
</style>
<script>
	$(function(){
		$("#datepicker").datepicker({
			changeYear : true,
			changeMonth : true,
			constraintInput : true,
			dateFormat : "yyyy-mm-dd",
			dayNames : ["일","월","화","수","목","금","토"],
		});
		
	});
	
</script>
<div class="container">
	<form>
		<div id = "label">
			<ul>
				<li>아이디</li>
				<li>비밀번호</li>
				<li>비밀번호 확인</li>
				<li>이  름</li>
				<li>이메일</li>
				<li>성  별</li>
				<li>생년월일</li>
			</ul>
		</div>
		<div id="input">
			<ul>
				<li><input type="text" name="id" maxlength="8"/><input type="button" value="중복검사"/></li>
				<li><input type="password" name="userpwd" maxlength="12"/>
				<li><input type="password" name="userpwd" maxlength="12"/>
				<li><input type="text" name="username" maxlength="5"/>
				<li><input type="text" name="email1"/>@<input type="text" name="eamil2"/>
					<select>
						<option selected>직접 입력</option>
						<option>naver.com</option>
						<option>google.com</option>
						<option>daum.net</option>
						<option>hotmail.com</option>
					</select></li>
				<li><input type="radio" name="gender" value="1"/>남 자
					<input type="radio" name="gender" value="2" checked/>여 자</li>
				<li><input type="text" name="birth" id="datepicker"/></li>			
			</ul>
		</div>
		<div>
			<input type="submit" value="회원가입"/>
			<input type="reset" value="다시쓰기"/>
		</div>
	</form>
</div>