<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- 후기보기메인 -->
<div class="container2">
	<div>
		<ul id="bxslider2">
			<li><a href="#"><img src="<%=request.getContextPath() %>/img/img-ReviewMain/review_main.png"/></a></li>
		</ul>
	</div>
<!-- 후기중간메인 -->
	<div class="reviewBody" style="text-align: center;">	
		<div class = "serch" style="margin-bottom:10px;">
			<select name="searchKeyword" id="searchKeyword">
				<option value="1">키워드</option>
				<option value="2">글제목</option>
				<option value="3">코스이름</option>
				<option value="4">작성자</option>				
			</select>
			
			<input type="text" name="keyword" value=""> <input type="button" name="searchBtn" value="검색">
		</div>
		<div style="text-align: left;">
			<span id="title">도시검색</span><br><br>
		</div>
		
		<div class= "content1" style="text-align:center;clear:both;">
			<a href="#"><img src="<%=request.getContextPath() %>/img/img_main/banner1.jpg" style="width:200px; height:200px;"/></a>			
			<a href="#"><img src="<%=request.getContextPath() %>/img/img-ReviewMain/busan1.jpg" style="width:400px; height:200px;"/></a>
		</div>
		<div class= "content1" style="text-align:center;">				
			<a href="#"><img src="<%=request.getContextPath() %>/img/img_main/banner3.jpg"style="width:200px; height:200px;"/></a>
			<a href="#"><img src="<%=request.getContextPath() %>/img/img_main/banner4.jpg"style="width:200px; height:200px;"/></a>
			<a href="#"><img src="<%=request.getContextPath() %>/img/img_main/banner5.jpg"style="width:200px; height:200px;"/></a>
		</div>
		
		
		<div style="text-align: left;">
			<span id="title">후기</span><br><br>
			<div class="subtitle"><span id="recommand">추천순</span> | <span id="new">최신순</span></div>
		</div>
		
		
		<div class ="boardlist">
			<div class="reviewContents" >
				
					<a href="#">
						<img class="badge1" src="<%=request.getContextPath() %>/img/img_icon/alarm_icon.png"/>
					</a> 
					<a href="#">
						<img class="badge2" src="<%=request.getContextPath() %>/img/img_icon/alarmNew_icon.png"/>
					</a> 
					
				<div class ="left">
					<img src="<%=request.getContextPath() %>/img/img_main/banner5.jpg"style="width:100px; height:100px;"/>
				</div>
				<div class="right">
					<ul >타이틀</ul>
					<div>
						<p class="review-content">
							내용내용내용내용내용내용내용내용내용내용내용내용내용
							내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용
							내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용
							내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용
							내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용
						</p>
					</div>
				</div>
 			</div>
		</div>
	</div>
</div>
