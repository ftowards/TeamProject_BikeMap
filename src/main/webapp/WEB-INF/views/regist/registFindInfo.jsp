<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/home/css/registerForm.css" type="text/css"/>
<script>
	$(function(){
		$("#findIdForm").submit(function(){
			if($("#findIdForm>input[type=text]").val() =="" ){
				alert("회원 정보를 입력하세요.");
				return false;
			}
			
			var url="/home/registFindId";
			var data = $("#findIdForm").serialize();
			$.ajax({
				type : 'POST',
				url : url,
				data : data,
				success : function(result){
					console.log(result);
					alert(result);
				},error : function(){
					console.log("아이디 찾기 에러");
				}
			});
			return false;
		});
		
		$("#findPwdForm").submit(function(){
			var url = "/home/registFindPwd";
			var data = $("#findPwdForm").serialize();
			$.ajax({
				type : 'POST',
				url : url,
				data : data,
				success : function(result){
					if(result>0){
						alert("등록된 메일로 임시 비밀번호가 발송되었습니다.\n이메일 확인 후 로그인을 진행해주세요.");						
					}else{
						alert("입력한 정보와 일치하는 회원 정보가 없습니다.");
					}
				},error : function(){
					console.log("비밀번호 찾기 에러");
				}
			});
			return false;
		});
	});
</script>

<div class="registerMainDiv" style='text-align:center'>
	<h1 style='margin-top:70px'>아이디 비밀번호 찾기</h1>
	<hr id="hr2"/>
	<p id="t1">아이디 비밀번호를 잊어버리셨나요?<br/>
	가입 시 등록한 이메일을 입력하시면 개인번호 찾기가 가능합니다.</p>
	
	<div id="cntbox">
		<b id="findId"><span class="l">|</span> 아이디 찾기</b>
		<form id="findIdForm">
			<input type="text" name="username" placeholder="  이름을 입력해주세요."/><br/>
			<input type="text" name="email" placeholder="  가입 시 등록한 이메일을 입력해주세요."/>
			<input type="submit" class="button" value= " 아이디 찾기"/>
		</form>
		
		<b id="findPwd"><span class="l">|</span> 비밀번호 찾기</b>
		<form id="findPwdForm">
			<input type="text" name="username" placeholder="  이름을 입력해주세요."/><br/>
			<input type="text" name="userid" placeholder="  아이디를 입력해주세요."/><br/>
			<input type="text" name="email" placeholder="  가입 시 등록한 이메일을 입력해주세요."/>
			<input type="submit" class="button" value= "비밀번호 찾기"/>
		</form>
		<input type="button" class="button" value="login" onclick="location.href='/home/login'"/>
	</div>
</div>