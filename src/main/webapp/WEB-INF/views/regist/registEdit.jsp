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
<<<<<<< Updated upstream
<div class="container">
	<div id="box">
		<div>
		<h3>비밀번호 재확인</h3>
		<p>${logName } 님의 회원정보를 안전하게 보호하기 위하여<br/>
		비밀번호를 한번 더 입력해주세요.</p>
=======
<div class="registerMainDiv">
	<div class="contentBox2">
		<div style='height:215px'>
			<img id="LockImg" src="<%=request.getContextPath()%>/img/img_register/lock.png"/>
			<p id="contentTxt1">비밀번호 재확인</p>
			<p id="contentTxt2"><b class="mintTxt">${logName}홍길동</b>님의 회원정보를 안전하게 보호하기 위해<br/>비밀번호를 한번 더 입력해주세요.</p>
>>>>>>> Stashed changes
		</div>
		<form id="pwdChk">
			<input type="hidden" name="userid" value="${logId }"/>
			비밀번호 <input type="password" name="userpwd" id="userpwd"/><br/>
			<input type="submit" value="확인" class="button"/>
		</form>
	</div>
</div> 