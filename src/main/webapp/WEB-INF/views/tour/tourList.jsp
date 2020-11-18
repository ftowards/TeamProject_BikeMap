<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/home/css/tourListStyle.css" type="text/css"/>
<script>
	$(function(){
		var whole = $("#whole");
		var genderBoy = $("#genderBoy");
		var genderGirl = $("#genderGirl");
		var whole2 = $("#whole2");
		var ten = $("#ten");
		var twenty = $("#twenty");
		var thirty = $("#thirty");
		var forty = $("#forty");
		var fiftyOver = $("#fiftyOver");
		
		$("#they").click(function(){
			whole.css('color','white').css('background-color','rgb(0,176,176)');
		});
		$("#genderBoy").click(function(){
			genderBoy.css('color','white').css('background-color','rgb(0,176,176)');
		});
		$("#genderGirl").click(function(){
			genderGirl.css('color','white').css('background-color','rgb(0,176,176)');
		});
		$("#they2").click(function(){
			whole2.css('color','white').css('background-color','rgb(0,176,176)');
		});
		$("#tenRadio").click(function(){
			ten.css('color','white').css('background-color','rgb(0,176,176)');
		});
		$("#twentyRadio").click(function(){
			twenty.css('color','white').css('background-color','rgb(0,176,176)');
		});
		$("#thirtyRadio").click(function(){
			thirty.css('color','white').css('background-color','rgb(0,176,176)');
		});
		$("#fortyRadio").click(function(){
			forty.css('color','white').css('background-color','rgb(0,176,176)');
		});
		$("#fiftyOverRadio").click(function(){
			fiftyOver.css('color','white').css('background-color','rgb(0,176,176)');
		});
	});
</script>
<div id="mainDiv">
	
	<div id="dateDiv">
		<div class="labelClass"><label>일&nbsp;정</label></div>
		<div><input type="text" name="startDate" placeholder="출발날짜" id="startDate" maxlength="10"></div>
		<div><label  id="label1">~</label></div>
		<div><input type="text" name="endDate"	placeholder="도착날짜" id="endDate" maxlength="10"></div>
	</div>
	
	<div id="placeDiv">
		<div><label class="labelClass">장&nbsp;소</label></div>
		<div><input type="text" name="startPlace" placeholder="출발장소" id="startPlace"></div>
		<div id="placeAndDistanceDiv">
			<div><label id="distanceLbl">이동거리</label></div>
			<div><input type="text" name="startPlace" placeholder="ex)10km" id="distance"></div>
		</div>	
	</div>
	
	<div id="genderDiv">
		<div><label class="labelClass">성&nbsp;별</label></div>
		<div><label id="whole" for="they">전&nbsp;체</label></div>
		<div><label id="genderBoy" for="boy">남</label></div>
		<div><label id="genderGirl" for="girl">여</label></div>
		
		<div><input type="radio" name="they" id="they"></div>
		<div><input type="radio" name="boy" id="boy"></div>
		<div><input type="radio" name="girl" id="girl"></div>
	</div>
	
	<div id="ageDiv">
		<div><label class="labelClass">나&nbsp;이</label></div>
		<div><label id="whole2" for="they2">전&nbsp;체</label></div>
		<div><label id="ten" for="tenRadio">10대</label></div>
		<div><label id="twenty" for="twentyRadio">20대</label></div>
		<div><label id="thirty" for="thirtyRadio">30대</label></div>
		<div><label id="forty" for="fortyRadio">40대</label></div>
		<div><label id="fiftyOver" for="fiftyOverRadio" style="width:100px">50대 이상</label></div>
		
		<div><input type="radio" name="they2" id="they2"></div>
		<div><input type="radio" name="tenRadio" id="tenRadio"></div>
		<div><input type="radio" name="twentyRadio" id="twentyRadio"></div>
		<div><input type="radio" name="thirtyRadio" id="thirtyRadio"></div>
		<div><input type="radio" name="fortyRadio" id="fortyRadio"></div>
		<div><input type="radio" name="fiftyOverRadio" id="fiftyOverRadio"></div>
		
	</div>
	
	<div id="searchAndReset">
		<div><input type="button" name="search" value="검&nbsp;색" id="search"></div>
		<div><input type="reset" name="reset" value="초기화" id="reset"></div>
	</div>
	<hr/>
	<div id="tourSearchTitleDiv"><label id="tourSearchTitleLbl"><b>동행찾기</b></label></div>
	<div  id="paging">
		<ul>
			<li>1</li>
			<li>2</li>
			<li>3</li>
			<li>4</li>
			<li>5</li>
		</ul>
	</div>
	<!--  ===========================db작업 / 코스짜기 받아서 수정할 부분 -->
	<div id="tourBoardListDivTop">
		<div><img src="<%=request.getContextPath()%>/img/img_tour/map.png"/></div>
		<div class="blackWrapDiv">
			<p style="font-size:15px;">서울-부산</p>
			<p style="font-size:12px;">2020/11/17~2020/11/18</p>
			<hr/style="width:150px;">
			<p style="font-size:36px;"><b>1Day</b></p>
		</div>
		<div><img src="<%=request.getContextPath()%>/img/img_tour/map.png"/></div>
		<div><img src="<%=request.getContextPath()%>/img/img_tour/map.png"/></div>
		<div><img src="<%=request.getContextPath()%>/img/img_tour/map.png"/></div>
	</div>
	
	<div id="tourBoardListDivBottom">
		<div><img src="<%=request.getContextPath()%>/img/img_tour/map.png"/></div>
		<div><img src="<%=request.getContextPath()%>/img/img_tour/map.png"/></div>
		<div><img src="<%=request.getContextPath()%>/img/img_tour/map.png"/></div>
		<div><img src="<%=request.getContextPath()%>/img/img_tour/map.png"/></div>
		<div id="tourWriteDiv"><input type="button" name="tourWriteBoard" value="글쓰기" onclick="location.href='<%=request.getContextPath()%>/tourWriteForm'"></div>
	</div>
</div>