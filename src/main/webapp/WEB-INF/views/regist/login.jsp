<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/home/css/login.css" type="text/css"/>
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
<div class="registerMainDiv">
	<div id="bikeDiv">
		<div id="bikeDiv1">
			<img src="<%=request.getContextPath() %>/img/img_login/bike.png"/>
		</div>
		<div id="bikeDiv2">
			<h2>바이크맵에 오신 것을 환영합니다.</h2><br/>
			<p class="contentText">로그인을 하시면 사이트의 모든 서비스를 이용하실 수 있습니다.<br/>아직 회원이 아니시라면 회원가입을 진행해주세요.</p>
		</div>
	</div>
	<form id="loginForm">
	<div id="loginDiv2">
		<div id="useridDiv" >ID&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
		<input type="text" name="userid" style='width:270px; height:25px;'/></div>
			<div id="loginBtnDiv">
		<input type="submit" class="mint_Btn" value="로그인"/>
	</div>
		<div id="userPwddDiv">PASSWORD&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="password" name="userpwd" id="userpwd" style='width:270px; height:25px;'/></div>
	</div>	
	</form>
	<p class="contentText">
			- 아이디 및 비밀번호는 영문 대소문자를 구별하오니 입력 시 주의하시기 바랍니다.<br/>
			- 비밀번호는 주기적으로 변경, 관리하시기 바라며 타인에게 노출되지 않도록 주의하시기 바랍니다.<br/>
			- 비회원일 경우, 일부 서비스가 제한됩니다.
		</p>
	<div id="find_Info">
		아이디, 비밀번호를 잊어버리셨나요?&nbsp;
		<input type="button" value="아이디/비밀번호 찾기" onclick="location.href='/home/registFindInfo'" class="white_Btn"/>
		<span id="text1">|</span>
			<span id="text2">아직 회원이 아니신가요?&nbsp;
				<input type="button" value="회원가입" onclick="location.href='/home/registerForm'" class="white_Btn"/>
			</span>
		</div>
</div> 