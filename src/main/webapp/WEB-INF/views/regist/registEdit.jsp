<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/home/css/register.css" type="text/css"/>
<script>
	$(function(){
		$("#pwdChk").submit(function(){
			if($("#userpwd").val()==""){
				alert("비밀번호를 입력하세요.");
				return false;
			}
			
			var url = "/home/registPwdChk";
			var data = $("#pwdChk").serialize();
			
			console.log(data);
			$.ajax({
				url : url,
				data : data,
				success : function(result){
					if(result >0 ){
						location.href="/home/registEditForm";
					}else{
						alert("비밀번호가 틀립니다.");
					}
				},error : function(){
					console.log("비밀번호 확인 오류");
				}
			});
			return false;
		});
	});
</script>
<div class="registerMainDiv">
	<div class="contentBox2">
		<div style='height:215px'>
			<img id="LockImg" src="<%=request.getContextPath()%>/img/img_register/lock.png"/>
			<p id="contentTxt1">비밀번호 재확인</p>
			<p id="contentTxt2"><b class="mintTxt">${logName}홍길동</b>님의 회원정보를 안전하게 보호하기 위해<br/>비밀번호를 한번 더 입력해주세요.</p>
		</div>
		<form id="pwdChk">
			<input type="hidden" name="userid" value="${logId}"/>
			<b class="grayTxt">> 비밀번호</b>&ensp;<input type="password" name="userpwd" id="userpwd" style='height:25px; width:200px; margin-top:20px;'/><br/>
			<input type="submit" value="확 인" class="gray_Btn" style='width:100px; margin-top:30px; margin-left:30px'/>
		</form>
	</div>
</div> 