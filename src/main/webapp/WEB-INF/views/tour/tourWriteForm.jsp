<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/home/css/tourWriteFormStyle.css" type="text/css"/>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
 <script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
 <script src="//cdn.ckeditor.com/4.15.1/standard/ckeditor.js"></script>
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
			var t = $(this).val();
			
			
			console.log(t);
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
		$("#departure,#arrive").datepicker({
			changeYear :true,
			changeMonth: true,
			constrainInput:true,
			dateFormat:"yy/mm/dd",
			dayNames:['일요일','월요일','화요일','수요일','목요일','금요일','토요일'],
			dayNamesMin:['일','월','화','수','목','금','토'],
			monthNamesShort:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			monthNames:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			yearRange:"2019:2020"
		
		});
		CKEDITOR.replace('content',{
			height:400
		});
		
	});
</script>
<div id="mainDiv">
<form method="post" action="<%=request.getContextPath()%>/tourWriteFormOk">
	<div id="tourWriteFormTitleDiv"><label id="tourWriteFormTitleLbl"><b>동행찾기 게시판 글쓰기</b></label><br/><hr/></div>
	
	<div id="CourseSearchDiv">
		<div><input type="text" name="courseSearchBox" placeholder="코스검색(코스번호/키워드)"/></div>
		<div><input type="button" name="courseSearchBtn" value="검&nbsp;&nbsp;색"/></div>
	</div>
	
	<div id="courseResultDiv">코스사진~~~~~</div>
	
	<div id="conditionDiv">
		<div class="conditionDivTop">
			<div class="labelClass"><label>일&nbsp;정</label></div>
			<div><input type="text" name="departure" placeholder="출발날짜" id="departure" maxlength="10" autocomplete="off"></div>
			<div><label  id="label1">~</label></div>
			<div><input type="text" name="arrive"	placeholder="도착날짜" id="arrive" maxlength="10" autocomplete="off"></div>
		</div>
	
		<div class="conditionDivTop">
			<div><label class="labelClass">장&nbsp;소</label></div>
			<div>  
				<select name="place" id="place">
		          <option value="">&nbsp;집합장소</option>
		          <option value="서울" >서울</option>
		          <option value="부산">부산</option>
		          <option value="대구">대구</option>
		          <option value="인천">인천</option>
		          <option value="광주">광주</option>
		          <option value="대전">대전</option>
		          <option value="울산">울산</option>
		          <option value="세종">세종</option>
		          <option value="경기">경기</option>
		          <option value="강원">강원</option>
		          <option value="충북">충북</option>
		          <option value="충남">충남</option>
		          <option value="전북">전북</option>
		          <option value="전남">전남</option>
		          <option value="경북">경북</option>
		          <option value="경남">경남</option>
		          <option value="제주">제주</option>
		      </select>
			</div>
		</div>
	
		<div class="conditionDivTop">
			<div><label  class="labelClass">이동거리</label></div>
			<div><input type="text" name="speed" placeholder="ex)10km" class="conditionBox"></div>
		</div>	
		
		<div class="conditionDivTop">
			<div><label  class="labelClass">예상비용</label></div>
			<div><input type="text" name="budget" placeholder="ex)80,000" class="conditionBox"></div>
		</div>	
		<span>&nbsp;</span>
		<div class="conditionDivTop">
			<div><label  class="labelClass">작성자</label></div>
			<div><label id="useridBox">userid</label></div>
			<div><label  class="labelClass">인&nbsp;원</label></div>
				
					<select name="room" id="room" style="text-align-last:center">
					<c:forEach var="i" begin="2" end="10" step="1">
						<option value="${i }">${i }</option>
					</c:forEach>
					</select>
		</div>
		<div class="conditionDivTop">
			<div><label class="labelClass">성&nbsp;별</label></div>
			<div><label id="whole" for="they">전&nbsp;체</label></div>
			<div><label id="genderBoy" for="boy">남</label></div>
			<div><label id="genderGirl" for="girl">여</label></div>
			
			<div><input type="radio" name="reggender" id="they" value="3"></div>
			<div><input type="radio" name="reggender" id="boy" value="1"></div>
			<div><input type="radio" name="reggender" id="girl" value="2"></div>
	</div>
	
		<div class="conditionDivTop">
			<div><label class="labelClass">나&nbsp;이</label></div>
			<div><label id="whole2" for="they2">전&nbsp;체</label></div>
			<div><label id="ten" for="tenRadio">10대</label></div>
		</div>
		<div class="conditionDivBottom">
			<div><label id="twenty" for="twentyRadio">20대</label></div>
			<div><label id="thirty" for="thirtyRadio">30대</label></div>
			<div><label id="forty" for="fortyRadio">40대</label></div>
		</div>
		<div class="conditionDivBottom">
			<div><label id="fiftyOver" for="fiftyOverRadio" style="width:100px">50대 이상</label></div>
		</div>
		
		<div><input type="radio" name="regage" id="they2" value="6"></div>
		<div><input type="radio" name="regage" id="tenRadio" value="1"></div>
		<div><input type="radio" name="regage" id="twentyRadio" value="2"></div>
		<div><input type="radio" name="regage" id="thirtyRadio" value="3"></div>
		<div><input type="radio" name="regage" id="fortyRadio" value="4"></div>
		<div><input type="radio" name="regage" id="fiftyOverRadio" value="5"></div>
	
	</div>
		<div id="writeForm">
				
				<ul>
					<li><input type="text" name="title" id="title" placeholder="제목을 입력해주세요."/></li>
					<li><textarea name="content" id="content"></textarea>
					<div id="writebuttonDiv">
						<input type="submit" value="등&nbsp;&nbsp;록"/>
						<input type="reset" value="다시쓰기"/>
					</div>
				
				</ul>
			
		</div>
	</div>
	</form>
</div>