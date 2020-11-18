<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/home/css/register.css" type="text/css"/>
<div class="registerMainDiv">
	<div class="contentBox_white">
		<img id="chk2Img" src="<%=request.getContextPath()%>/img/img_register/check2.png"/>
		<p id="contentLbl4">회원탈퇴가 <span class="blueTxt">완료되었습니다.</span></p>
		<div class="contentBox" style='height:140px; margin-top:50px; padding-top:30px;'>
			<b style='font-size:14px'>그동안 바이크맵 서비스를 이용해주셔서 감사합니다.<br/>
			<span class="lightgrayTxt">보다 나은 서비스로 다시 찾아뵙겠습니다.</span></b><br/><br/>
			<input type="button" value="홈으로" class="gray_Btn" style="width:100px;" onclick="location.href='<%=request.getContextPath()%>'"/>
		</div>
	</div>
</div> 