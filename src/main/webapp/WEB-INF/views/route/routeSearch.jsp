<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/home/css/route.css" type="text/css"/>
<div id="mainDiv">
	<div id="optionBar" style='float:left;'>
		<select name="departurue" style='padding-left:10px;'>
		    <option value="">&nbsp;&nbsp;출발지를 선택하세요</option>
		    <option value="서울">&ensp;서울</option>
   		    <option value="부산">&ensp;부산</option>
		    <option value="대구">&ensp;대구</option>
		    <option value="인천">&ensp;인천</option>
		    <option value="광주">&ensp;광주</option>
		    <option value="대전">&ensp;대전</option>
		    <option value="울산">&ensp;울산</option>
		    <option value="세종">&ensp;세종</option>
		    <option value="경기">&ensp;경기</option>
		    <option value="강원">&ensp;강원</option>
		    <option value="충북">&ensp;충북</option>
		    <option value="충남">&ensp;충남</option>
		    <option value="전북">&ensp;전북</option>
		    <option value="전남">&ensp;전남</option>
		    <option value="경북">&ensp;경북</option>
		    <option value="경남">&ensp;경남</option>
		    <option value="제주">&ensp;제주</option>
		</select>
		<select name="arrive" style='padding-left:10px;'>
		    <option value="">&nbsp;&nbsp;도착지를 선택하세요</option>
		    <option value="서울">&ensp;서울</option>
   		    <option value="부산">&ensp;부산</option>
		    <option value="대구">&ensp;대구</option>
		    <option value="인천">&ensp;인천</option>
		    <option value="광주">&ensp;광주</option>
		    <option value="대전">&ensp;대전</option>
		    <option value="울산">&ensp;울산</option>
		    <option value="세종">&ensp;세종</option>
		    <option value="경기">&ensp;경기</option>
		    <option value="강원">&ensp;강원</option>
		    <option value="충북">&ensp;충북</option>
		    <option value="충남">&ensp;충남</option>
		    <option value="전북">&ensp;전북</option>
		    <option value="전남">&ensp;전남</option>
		    <option value="경북">&ensp;경북</option>
		    <option value="경남">&ensp;경남</option>
		    <option value="제주">&ensp;제주</option>
		</select>
		<input type="text" name="schBar" id="schBar" style='padding-left:10px; color:#7F7F7F; font-size:1em; font-weight:bolder;'/>
		<input type="submit" class="mint_Btn" value="검 색" style='width:70px; height:40px'/>
		<div id="km">km</div>
	</div>
	<div id="hitDiv">
		<b>관리자 추천코스</b>
		<div id="hitCourse">
				<img class="hitIcon" src="<%=request.getContextPath() %>/img/img_main/hit_icon.gif"/>
				<a href="<%=request.getContextPath()%>/routeSearchView"><img class="thumbnail" src="<%=request.getContextPath() %>/img/img_main/empire.png"/></a>
				<img class="hitIcon" src="<%=request.getContextPath() %>/img/img_main/hit_icon.gif"/>
				<a href="<%=request.getContextPath()%>/routeSearchView"><img class="thumbnail" src="<%=request.getContextPath() %>/img/img_main/empire.png"/></a>
				<img class="hitIcon" src="<%=request.getContextPath() %>/img/img_main/hit_icon.gif"/>
				<a href="<%=request.getContextPath()%>/routeSearchView"><img class="thumbnail" src="<%=request.getContextPath() %>/img/img_main/empire.png"/></a>
				<img class="hitIcon" src="<%=request.getContextPath() %>/img/img_main/hit_icon.gif"/>
				<a href="<%=request.getContextPath()%>/routeSearchView"><img class="thumbnail" src="<%=request.getContextPath() %>/img/img_main/empire.png"/></a>
				<img class="hitIcon" src="<%=request.getContextPath() %>/img/img_main/hit_icon.gif"/>
				<a href="<%=request.getContextPath()%>/routeSearchView"><img class="thumbnail" src="<%=request.getContextPath() %>/img/img_main/empire.png"/></a>
		</div>
	</div>
	<div id="routeSearch">
		<div id="title">코스검색</div>
		<div id="subTxt">평점순<span id="lBar">&ensp;|&ensp;</span><span style='color:#AEAAAA;'>최신순</span></div>
		<div id="paging">1&emsp;<span style='color:#00B0B0; font-weight:600;'>2</span>&emsp;3&emsp;4&emsp;5</div>
	</div><br/>
	<div id="content">
		<div class="contentDiv">
			<a href="<%=request.getContextPath()%>/routeSearchView"><img class="thumbnail2" src="<%=request.getContextPath() %>/img/img_main/empire.png"/></a>
			<div><img class="star" src="<%=request.getContextPath() %>/img/img_main/star.png"/></div>
		</div>
		<div class="contentDiv">
			<a href="<%=request.getContextPath()%>/routeSearchView""><img class="thumbnail2" src="<%=request.getContextPath() %>/img/img_main/empire.png"/></a>
			<div><img class="star" src="<%=request.getContextPath() %>/img/img_main/star.png"/></div>
		</div>
		<div class="contentDiv">
			<a href="<%=request.getContextPath()%>/routeSearchView""><img class="thumbnail2" src="<%=request.getContextPath() %>/img/img_main/empire.png"/></a>
			<div><img class="star" src="<%=request.getContextPath() %>/img/img_main/star.png"/></div><br/>
		</div>
		<div class="contentDiv">
			<a href="<%=request.getContextPath()%>/routeSearchView""><img class="thumbnail2" src="<%=request.getContextPath() %>/img/img_main/empire.png"/></a>
			<div><img class="star" src="<%=request.getContextPath() %>/img/img_main/star.png"/></div>
		</div>
		<div class="contentDiv">
			<a href="<%=request.getContextPath()%>/routeSearchView""><img class="thumbnail2" src="<%=request.getContextPath() %>/img/img_main/empire.png"/></a>
			<div><img class="star" src="<%=request.getContextPath() %>/img/img_main/star.png"/></div>
		</div>
		<div class="contentDiv">
			<img class="thumbnail2" src="<%=request.getContextPath() %>/img/img_main/empire.png"/>
			<div><img class="star" src="<%=request.getContextPath() %>/img/img_main/star.png"/></div>
		</div>
	</div>
</div>