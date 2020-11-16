<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/home/css/register.css" type="text/css"/>
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
 <script src="//code.jquery.com/jquery-1.12.4.js"></script>
 <script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script>
	$(function(){	
		$("#domainSelect").on({'change' : function(){
			$("#email2").val($("#domainSelect").val());
		}});
				
		// 입력사항 체크
		$("#registerForm").submit(function(){
			
			if($("#userpwd").val() != null || $("#userpwdChk").val() != null){
				if($("#userpwd").val() != $("#userpwdChk").val()){
					alert("비밀번호가 일치하지 않습니다.");
					return false;
				}
			}
			
			if($("#email1").val()=="" || $("#email2").val=="" ){
				alert("이메일을 입력하세요.");
				return false;
			}
			
			var url = "/home/registerEditFormOk"
			var data = "userid=${user.userid}&email1="+$("#email1").val()+"&email2="+$("#email2").val();
			if($("#userpwd").val()!=""){
				data += "&userpwd="+$("#userpwd").val();
			}else{
				data += "&userpwd=${user.userpwd}";
			}
		
			$.ajax({
				type : 'POST',
				url : url,
				data : data,
				success : function(result){
					if(result > 0){
						alert("회원 정보 수정 완료")
					} else{
						alert("회원 정보 수정에 실패하였습니다.");
					}
				},error: function(){
					console.log("회원 정보 수정 오류");
				}
			});
			return false;
		});
	});
	
</script>
<div class="registerMainDiv">
	<form id="registerForm" method="post" action="<%=request.getContextPath()%>/registerFormOk">
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
				<li><input type="text" name="userid" id="userid" maxlength="12" size="12" value="${user.userid }" disabled/>
				<li><input type="password" name="userpwd" id="userpwd" maxlength="12" size="20"/>
				<li><input type="password" name="userpwdChk" id="userpwdChk" maxlength="12" size="20"/></li>
				<li><input type="text" name="username" id="username" maxlength="5" size="20" value="${user.username }" disabled/>
				<li><input type="text" name="email1" id="email1" size="6" value="${user.email1 }"/>@<input type="text" id="email2" name="email2" size="6" value="${user.email2 }"/>
					<select id="domainSelect">
						<option value="" selected>직접 입력</option>
						<option value="naver.com">naver.com</option>
						<option value="google.com">google.com</option>
						<option value="daum.net">daum.net</option>
						<option value="hotmali.com">hotmail.com</option>
					</select></li>
				<li><input type="radio" name="gender" id="gender" value="1" disabled <c:if test="${user.gender == 1}">checked</c:if>/>남 자
					<input type="radio" name="gender" id="gender" value="2" disabled <c:if test="${user.gender == 2}">checked</c:if>/>여 자</li>
				<li><input type="text" name="birth" id="datepicker" maxlength="10" value="${user.birth }" disabled/>			
			</ul>
		</div>
		<hr/>
		<div id="buttons">
			<input type="submit" class = "button" value="수정"/>
			<input type="button" class = "button" value="회원 탈퇴" onclick="location.href='/home/registDel'"/>
		</div>
	</form>
</div> 