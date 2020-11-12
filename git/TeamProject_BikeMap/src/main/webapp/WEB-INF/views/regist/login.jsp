<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	.container *{margin : 0 auto;  }
	.container>*{margin : 15px auto;}
	#loginForm{height : 120px; background-color : #eee;}
	.button{border : #00B0B0 2px solid; border-radius: 8px;
			text-decoration: none; text-align : center; font-size : 16px; padding : 12px 24px;
			margin : 0 10px; color : white; background-color: #00B0B0 }
	.button:hover{color : #00B0B0; background-color: white}
	
	#loginForm>div{float:left; height : 120px; line-height : 120px;}
	#input{width : 70%; margin:0;}
	form li{float:left; width : 60%; padding-left : 10%; line-height : 60px;}
	form li:nth-of-type(2n+1){width : 20%; }
	
	#button{width : 20%; height : 120px;}
</style>
<script>
	$(function(){
		$("#loginForm").submit(function(){
			if($("#userid").val()==""){
				alert("아이디를 입력하세요.");
				return false;
			}
			if($("#userpwd").val()==""){
				alert("비밀번호를 입력하세요.");
				return false;
			}
			
			var url = "/home/loginOk";
			var data = $("#loginForm").serialize();
			$.ajax({
				url : url,
				data : data,
				success : function(result){
					if(result > 0){
						location.href="/home";
					}else{
						alert("로그인 실패하였습니다.\n로그인 정보를 확인해주세요.");
					}
				},error : function(){
					console.log("로그인 에러");
				}
			});
			
			return false;
		});
	});
</script>
<div class="container">
	<div >
		<h3>바이크맵에 오신 것을 환영합니다.</h3>
		로그인을 하시면 사이트의 모든 서비스를 이용하실 수 있습니다.
		아직 회원이 아니시라면 회원 가입을 진행해주세요.
	</div>
	<form  id="loginForm">
		<div id="input">
			<ul>
				<li>ID</li>
				<li><input type="text" name="userid" id="userid"/></li>
				<li>PASSWORD</li>
				<li><input type="password" name="userpwd" id="userpwd"/></li>
			</ul>
		</div>
		<div id="button"><input type="submit" class="button" value="로그인"/></div>
	</form>
	<ul>
		<li>- 아이디 및 비밀번호는 영문 대소문자를 구별하오니 입력 시 주의하시기 바랍니다.</li>
		<li>- 비밀번호는 주기적으로 변경, 관리하시기 바라며 타인에게 노출되지 않도록 주의하시기 바랍니다.</li>
		<li>- 비회원일 경우, 일부 서비스가 제한됩니다.</li>
	</ul>

	<ul>
		<li>아이디, 비밀번호를 잊어버리셨나요?
			<input type="button" value="아이디/비밀번호 찾기" onclick="location.href='/home/findInfo'"/></li>
		<li>|</li>
		<li>아직 회원이 아니신가요?
			<input type="button" value="회원가입" onclick="location.href='/home/registerForm'"/></li>
	</ul>
</div> 