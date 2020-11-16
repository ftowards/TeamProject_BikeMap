<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	.container *{margin : 0 auto; text-align : center; }
	.container>*{margin : 15px auto;}
	#box{height : 150px; background-color : #eee;
		 border-top : 3px solid #ccc; border-bottom : 3px solid #ccc;
		 margin : 15px 0 ;}
	#box div:first-child{border-bottom : 2px solid #ddd; height : 100px;}
	#box p{height : 50px; line-height : 50px;}
	.button{border : #00B0B0 2px solid; background-color : white ; border-radius: 8px;
			text-decoration: none; text-align : center; font-size : 16px; padding : 12px 24px;
			margin : 0 10px; color: #00B0B0}
	.button:hover{color : white; background-color: #00B0B0}
</style>
<script>
	function registDel(){
		if(!$("#caution").prop("checked")){
			alert("안내사항을 확인해주세요.");
			return false;
		}
		location.href="/home/registDelChk";
	};
</script>
<<<<<<< Updated upstream
<div class="container">
	<b>회원탈퇴</b>
	<hr/>
	<div id="box">
=======
<div class="registerMainDiv">
	<div class="contentBox" style='height:180px; margin-top:50px; padding-top:40px;'>
>>>>>>> Stashed changes
		<div>
		<h3>회원탈퇴 신청 전에 반드시 확인해주세요.</h3>
		</div>
		<p>탈퇴 후에는 모든 회원 정보가 삭제되오니 신중하게 결정해 주시기 바랍니다.</p>
	</div>
	<ul>
		<li>- 탈퇴 후에는 <span>아이디와 데이터 복구가 불가능합니다.</span></li>
		<li>- 내 정보 및 서비스 이용 기록이 모두 삭제되며, 삭제된 데이터는 복구되지 않습니다.</li>
		<li>- 게시판에 등록된 게시물은 자동 삭제 처리가 되지 않습니다.</li>
		<li>- 삭제를 원하시는 게시물이 있다면 <span>반드시 탈퇴 전에 삭제 하시기 바랍니다.</span></li> 
	</ul>
	
	<input type="checkbox" id="caution"/><label for="caution">안내사항을 모두 확인하였으며, 이에 동의합니다.</label>
	<hr/>
<<<<<<< Updated upstream
	<div>
		<input type="button" value="탈퇴" class="button" onclick="registDel()"/>
=======
	<div id="btnBox">
		<input type="button" value="탈퇴신청" class="red_Btn" style="width:100px"onclick="registDel()"/>
		<input type="button" value="홈으로" class="gray_Btn" style="width:100px" onclick="location.href='<%=request.getContextPath()%>'"/>
>>>>>>> Stashed changes
	</div>
</div> 