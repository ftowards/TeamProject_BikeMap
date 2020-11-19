<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<style>
	#container{width : 1200px;height : 70vh; margin:0 auto;}
	#container>div{float:left;}
	#info{width:350px; height : 100%; }
	#info>div{float:left;}
		#naviIcon{width : 48px; height : 100%; background-color : white;
					border-left : 1px solid #00B0B0; border-right : 1px solid #00B0B0;}
		#naviIcon img{width : 40px; maring : 4px auto;}
		#infoPannel{width : 300px; height : 100%;}
	#map{width : 800px; height : 100%; background-color: lightblue;}
	#infoPannel>input[type=radio]{display:none;}
	.tab{display:none;}
	
	#tab1:checked~div:nth-of-type(1){display:block;}
	#tab2:checked~div:nth-of-type(2){display:block;}
	#tab3:checked~div:nth-of-type(3){display:block;}
	#tab4:checked~div:nth-of-type(4){display:block;}
	
	#pannel1{height: 100%; overflow : auto; }
	#searchPannel{position:sticky; top :0; background-color: #00B0B0; color : white;
				  z-index : 500;}
	#placeList{}
	#searchWord{width : 95%; height : 30px;border-radius : 5px; margin : 0 auto; border : 2pxl solid black;}
	
	<!-- 검색한 리스트 스타일 -->
	#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
	#menu_wrap .option{text-align: center;}
	#menu_wrap .option p {margin:10px 0;}  
	#menu_wrap .option button {margin-left:5px;}
	#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
	#placesList .item span {display: block;margin-top:4px;}
	#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
	#placesList .item .info{padding:10px 0 10px 55px;}
	#placesList .info .gray {color:#8a8a8a;}
	#placesList .info .jibun {padding-left:26px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
	#placesList .info .tel {color:#009900;}
	#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
	#placesList .item .marker_1 {background-position: 0 -10px;}
	#placesList .item .marker_2 {background-position: 0 -56px;}
	#placesList .item .marker_3 {background-position: 0 -102px}
	#placesList .item .marker_4 {background-position: 0 -148px;}
	#placesList .item .marker_5 {background-position: 0 -194px;}
	#placesList .item .marker_6 {background-position: 0 -240px;}
	#placesList .item .marker_7 {background-position: 0 -286px;}
	#placesList .item .marker_8 {background-position: 0 -332px;}
	#placesList .item .marker_9 {background-position: 0 -378px;}
	#placesList .item .marker_10 {background-position: 0 -423px;}
	#placesList .item .marker_11 {background-position: 0 -470px;}
	#placesList .item .marker_12 {background-position: 0 -516px;}
	#placesList .item .marker_13 {background-position: 0 -562px;}
	#placesList .item .marker_14 {background-position: 0 -608px;}
	#placesList .item .marker_15 {background-position: 0 -654px;}
	#pagination {margin:10px auto;text-align: center;}
	#pagination a {display:inline-block;margin-right:10px;}
	#pagination .on {font-weight: bold; cursor: default;color:#777;}
	
	<!-- 카테고리 검색 탭 스타일 -->
	#category{widht : 100%;}
	#category>li{width : 100%; height: 30px;line-height : 30px; overflow:auto;}
	#category>li:nth-of-type(4){height : 60px;}
	.subCategory{background-color: gray}
	
	.button{float : left; width : 20%; border : white 2px solid; border-radius: 8px;
			text-decoration: none; text-align : center; font-size : 10px; padding : 4px;
			margin : 0 10px; color : white; background-color: #00B0B0;}
	.button:hover{color: #00B0B0; background-color: white}
	
	<!-- 저장리스트 스타일 -->
	#pannel3{width : 100%; overflow: auto; padding: 0; margin:0; background-color:red;}
	#pannel3>div{width : 100%; height : 40px; line-height : 40px; background-color: #00B0B0; color : white;
				border-bottom : 1px solid white;}

</style>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=48c22e89a35cac9e08cf90a3b17fdaf2&libraries=services,clusterer,drawing"></script>
<div id="container">
	<div id="info">
		<!-- 탭 아이콘 패널 -->
		<div id="naviIcon">
			<ul>
				<li><label for="tab1"><img src="<%=request.getContextPath() %>/img/img_course/searchGray.png"/></label></li>
				<li><label for="tab2"><img src="<%=request.getContextPath() %>/img/img_course/mapGray.png" /></label></li>
				<li><label for="tab3"><img src="<%=request.getContextPath() %>/img/img_course/buildingGray.png"/></label></li>
				<li><label for="tab4"><img src="<%=request.getContextPath() %>/img/img_course/saveGray.png"/></label></li>	
			</ul>
		</div>
		<!-- 지도 검색 조작 패널 -->
		<div id="infoPannel">
			<input type="radio" name="tab" class="tabIcon" id="tab1" checked/>
			<input type="radio" name="tab" class="tabIcon" id="tab2"/>
			<input type="radio" name="tab" class="tabIcon" id="tab3"/>
			<input type="radio" name="tab" class="tabIcon" id="tab4"/>
			
			<!-- 검색 패널 -->
			<div class="tab" id="pannel1">
				<div id="searchPannel">
					<input type="text" name="searchWord" id="searchWord" placeholder="검색어를 입력하세요."/><br/>
					<input type="checkbox" id="chkBicycle" onclick="setOverlayMapTypeId()" /> 자전거도로 정보 보기
					<hr>
					<div style="height:25px;line-height:25px;"onclick="showCategory();"><h5>카테고리 검색</h5></div>
					<hr/>
					<!-- 
					category 분류
					음식점 fd6 음식점 / ce7 카페
					관광지 ct1 문화시설 / at4 관광명소  
					숙박   ad5 숙박
					편의시설	cs2 편의점 / pk6 주차장 /sw8 지하철역 / bk9 은행 / hp8 병원 / pm9 약국
				 	-->
					<ul id="category" style="display:none;">
						<li>
							<button value="FD6" class="button" onclick="searchPlaceCategory(value);">음식점</button>
							<button value="CE7" class="button" onclick="searchPlaceCategory(value);">카페</button>
						</li>
						<li>
							<button value="CT1" class="button" onclick="searchPlaceCategory(value);">문화시설</button>
							<button value="AT4" class="button" onclick="searchPlaceCategory(value);">관광명소</button>
						</li>
						<li>
							<button value="AD5" class="button" onclick="searchPlaceCategory(value);">숙박</button>
						</li>
						<li>
							<button value="CS2" class="button" onclick="searchPlaceCategory(value);">편의점</button>
							<button value="PM9" class="button" onclick="searchPlaceCategory(value);">약국</button>
							<button value="HP8" class="button" onclick="searchPlaceCategory(value);">병원</button>
							<button value="PK6" class="button" onclick="searchPlaceCategory(value);">주차장</button>
							<button value="SW8" class="button" onclick="searchPlaceCategory(value);">지하철</button>
							<button value="BK9" class="button" onclick="searchPlaceCategory(value);">은행</button>
						</li>
						<hr>
					</ul>
				</div>
		        <ul id="placesList"></ul>
		        <div id="pagination"></div>
			</div>
			
			<!-- 길찾기 -->
			<div class="tab">
				<ul>
					<li id="startPoint"><input type="text"/></li>
					<li id="arrivePoint"><input type="text"/></li>
				</ul>
				
				<button class="">경로검색</button>
			</div>
			
			<!-- 저장한 장소 목록 -->
			<div class="tab" id="pannel3">
				<div onclick="showPlaceList(title);" title="foodList">찜한 음식점</div>
				<ul id="foodList" style="display:none;"></ul>				
				<div onclick="showPlaceList(title);" title="sightsList">찜한 관광지</div>
				<ul id="sightsList" style="display:none;"></ul>
				<div onclick="showPlaceList(title);" title="accomodationList">찜한 숙박시설</div>
				<ul id="accomodationList" style="display:none;"></ul>
				<div onclick="showPlaceList(title);" title="convenientList">찜한 편의시설</div>
				<ul id="convenientList" style="display:none;"></ul>
			</div>
			
			<!-- 저장 탭-->
			<div class="tab">
				<c:if test="${logId == null }">
						<h5>로그인 후 이용 가능합니다.</h5>
				</c:if>
				<c:if test="${logId!=null }">
				<form>
					<input type="text" name="title" id="title" placeholder="코스 이름을 입력하세요"/>
						<select name="catename" id="catename">
							<c:forEach var="list" items="${category }">
								<option value="${list.nocoursecate }" title="${list.catename }">${list.catename}</option>
							</c:forEach>
							<c:if test="${fn:length(category) < 5}">
								<option value="addCategory">카테고리 추가</option>
							</c:if>
						</select>
					<input type="radio" name="closed" value="F" checked/><span>공개</span>
					<input type="radio" name="closed" value="T"/><span>비공개</span>
					<input type="submit" value="저장"/>
				</form>
				</c:if>
			</div>
		</div>
	</div>
	<div id="map">
	
	</div>
</div>
<script>
	var markers = [];
	var container = document.getElementById("map");
	var options = {
			center : new kakao.maps.LatLng(37.5510907243016, 126.937364458741),
			level : 3,
			draggable : 'true',
			
	};
	
	// 지도 추가
	var map = new kakao.maps.Map(container, options);
	var infowindow = new kakao.maps.InfoWindow({zIndex:1, removable : true});
	
	// 지도 컨트롤러 추가
	var mapTypeControl = new kakao.maps.MapTypeControl();
	var zoomControl = new kakao.maps.ZoomControl();
	
	map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
	map.addControl(zoomControl, kakao.maps.ControlPosition.Right);
	
	// 검색을 위한 장소 객체 생성
	var ps = new kakao.maps.services.Places();
	
	// 검색 버튼 클릭 시 키워드 검색 실시
	$("#searchWord").on("keydown", function(){
		if(event.keyCode == 13){
			var keyword = $("#searchWord").val();
			if(keyword == ""){
				alert("검색어를 입력하세요.");
				return false;
			}
			ps.keywordSearch(keyword, placeSearchCB, {size: 10});
		}
	});
	
	// 장소 검색 결과값 처리
	function placeSearchCB(data, status, pagination){
		if(status === kakao.maps.services.Status.OK){
					
			// 리스트 표시
			displayPlaces(data);
			// 페이지 번호 표시
			displayPagination(pagination);
			
		}else if(status === kakao.maps.services.Status.ZERO_RESULT){
			alert("검색 결과가 존재하지 않습니다.");
			return ;
		}else if(satus === kakao.maps.services.Statuas.ERROR){
			alert("검색 결과 중 오류가 발생했습니다.");
			return;
		}
	};
	
	function displayPlaces(places){
		var listEl = document.getElementById("placesList");
		var menuEl = document.getElementById("searchPannel");
		var fragment = document.createDocumentFragment();
		var bounds = new kakao.maps.LatLngBounds();
		var listStr = '';
		
		// 기존 검색 결과 제거
		removeAllChildNods(listEl);
		
		// 기존에 표시된 마커 제거
		removeMarker();
		
		for(var i = 0; i<places.length ; i++){
			
			// 마커 생성 표시
			var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x);
			var marker = addMarker(placePosition, i);
			var itemEl = getListItem(i, places[i]); 
			
			// 지도 위치 수정을 위한 좌표 취합
			bounds.extend(new kakao.maps.LatLng(places[i].y, places[i].x));
			
			(function(marker, places){
				kakao.maps.event.addListener(marker, 'click', function(){
					displayInfowindow(marker, places);
				});
				
				itemEl.onmouseover = function(){
					displayInfowindow(marker, places);
				};
				
			})(marker, places[i]);
			
			fragment.appendChild(itemEl);
		}
		
		listEl.appendChild(fragment);
		menuEl.scrollTop = 0;
		map.setBounds(bounds);
	}
	
	function getListItem(index, places){
		
		var el = document.createElement('li');
		var itemStr = '<span class="markerbg marker_'+(index+1)+'"></span>'+
					  '<div class="info">' + '<h5>'+places.place_name + '</h5>';
					  
		if(places.road_address_name){
			itemStr += '<span>'+places.road_address_name + '</span>'+
						'<span class="jibun gray">' + places.address_name + '</span>';
		}else{
			itemStr += '<span>'+places.address_name + '</span>';
		}
		
		itemStr +='<span class="tel">'+places.phone + '</span></div>';
		
		el.innerHTML = itemStr;
		el.className = 'item';
		
		return el;
	}
	
	// 마커 생성 후 지도에 표시
	
	function addMarker(position, idx, title){
	    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png'; // 마커 이미지 url, 스프라이트 이미지를 씁니다
		var imageSize = new kakao.maps.Size(36,37);
		var imgOptions = {
				spriteSize : new kakao.maps.Size(36,691),
				spriteOrigin : new kakao.maps.Point(0,(idx*46)+10),
				offset : new kakao.maps.Point(13,37)
		},
		markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions ),
		marker = new kakao.maps.Marker({
			position : position,
			image : markerImage
		});
		
		marker.setMap(map);
		markers.push(marker);
		
		return marker;
	}
	
	// 기존에 표시한 마커 제거
	function removeMarker(){
		for(var i = 0; i<markers.length; i++){
			markers[i].setMap(null);
		}
		markers =[];
	}
	
	// 페이지 번호 표시
	function displayPagination(pagination){
		var paginationEl = document.getElementById("pagination");
		var fragment = document.createDocumentFragment();
		var i;
		
		// 기존 페이지 번호 삭제
		while(paginationEl.hasChildNodes()){
			paginationEl.removeChild(paginationEl.lastChild);
		}
		
		for (i=1;i<=pagination.last;i++){
			var el = document.createElement('a');
			el.href="#";
			el.innerHTML = i;
			
			if(i===pagination.current){
				el.className ='on';
			}else{
				el.onclick = (function(i){
					return function(){
						pagination.gotoPage(i);
					}
				})(i);
			}
			fragment.appendChild(el);
		}
		paginationEl.appendChild(fragment);
	}
	
	
	// 인포 윈도우 작업
	// 중요!!!@!#@!#@!#@!#@!#@!
	function displayInfowindow(marker, places){
		
		// 플레이스 객체 스트링으로 전환
		var place = JSON.stringify(places);
		
		var group = places.category_group_code;
		var content = '<div style="padding:5px; font-size:12px;">';
		
		// 인포 윈도우 이름에 링크 설정
		if(places.place_url){
			content += '<a href= "'+places.place_url+'" target="_blank">' + places.place_name + '</a><hr/><ul>';	
		}else{
			content += places.place_name + '<hr/><ul>';
		}
		
		content += "<button onclick='setRoutePoint(value, title)' title='startPoint' value='"+place+"'>출발지 저장</button>";
		content += "<li onclick='console.log(11)'>경유지 지정</li>";
		content += "<button onclick='setRoutePoint(value, title)' title='arrivePoint' value='"+place+"'>도착지 저장</button>";
		
		// 카테고리 추가 버튼 생성
		if(group == 'FD6' || group =='CE7'){
			content += "<hr><button onclick='setPlaceList(value, title)' title='foodList' value='"+place+"'>음식점 저장</button>";
		}else if(group == 'CT1' || group =='AT4'){
			content += "<hr><button onclick='setPlaceList(value, title)' title='sightsList' value='"+place+"'>관광지 저장</button>";
		}else if(group == 'AD5'){
			content += "<hr><button onclick='setPlaceList(value, title)' title='accomodationList' value='"+place+"'>숙박시설 저장</button>";
		}else if(group == 'CS2' || group == 'PK6' ||group == 'SW8' ||group == 'BK9' ||group == 'HP8' ||group == 'PM9'){
			content += "<hr><button onclick='setPlaceList(value, title)' title='convenientList' value='"+place+"'>편의시설 저장</button>";
		}
		content += '</ul></div>';
		
		infowindow.setContent(content);
        infowindow.open(map, marker);
	}
	
	// 결과 검색 목록에 리스트 삭제
	function removeAllChildNods(el){
		while(el.hasChildNodes()){
			el.removeChild(el.lastChild);
		}
	}
		
	// 자전거 도로 표시 온오프 처리
	function setOverlayMapTypeId(){
		var chkBicycle = document.getElementById("chkBicycle");
		var mapType = kakao.maps.MapTypeId.BICYCLE;
		
		if(chkBicycle.checked){
			console.log('checked');
			map.addOverlayMapTypeId(mapType);
		}else{
			console.log('Unchecked');
			map.removeOverlayMapTypeId(mapType);
		}
	};
	
	// 카테고리 검색 클릭 시 카테고리 분류 표시
	var categoryOpen = 1;
	function showCategory(){
		if(categoryOpen == 1){
			$("#category").css("display", "block");
			categoryOpen++;
		} else {
			$("#category").css("display","none");
			categoryOpen--;
		}
	}
	
	// 장소 검색
	function searchPlaceCategory(value){
		var bounds = new kakao.maps.LatLngBounds(map.getBounds().getSouthWest(), map.getBounds().getNorthEast());
		
		ps.categorySearch(value, placeSearchCB,{
			location : map.getCenter(),
			bounds : bounds,
			size : 10
		});
	}	
	
	// 찜한 리스트 오픈
	function showPlaceList(type){
		var chk = $("#"+type).css("display");		
		if(chk == 'block'){
			$("#"+type).css("display", "none");
		}else{
			$("#"+type).css("display", "block");
		}
	}	
	
	
	// 출발지 지정
	function setRoutePoint(value, type){
		// value = 장소 정보(string 타입으로 변환한 것)
		// type = 출발지 startPoint / 경유지 viaPoint / 도착지 arrivePoint
		var json = JSON.parse(value);
		console.log(value);
		console.log(json.address_name);
		var tag = "";
		
		if(type == 'startPoint' || type == 'arrivePoint'){
			tag += "<input type='hidden' name='"+type+"' value='"+value+"'/>";
			$("#"+type).children("input").val(json.place_name);
			$("#"+type).append();
			
			console.log("["+json.x+","+json.y+"]");
		}
	}
	
	
	
	// 장소 리스트 설정
	function setPlaceList(value, type){
		// value = 장소 정보(string 타입으로 변환한 것)
		// type = 장소 리스트 종류 (음식 / 관광지 / 숙박시설 / 편의시설)
		
		var json = JSON.parse(value);
		var cnt = $("#"+type).children("li").length;
		var newList ="";
		var overlap = 0;
		
		// 현재 등록된 리스트 숫자 확인 : 5개 이상이면 오류 메세지 출력 후 더 이상 추가가 안 됨.
		if(cnt < 5){
			
			// 이미 등록된 장소 일 경우 추가로 등록이 되지 않음
			$("#"+type).children("li").each(function(){
				var id = $(this).attr("title");
				if(id == json.id){
					alert("이미 등록된 장소입니다.");
					overlap++;
					return false;
				}
			});
			
			// 리스트에 여유가 있고, 먼저 등록이 되지 않았을 경우 새로운 리스트 작성
			if(overlap == 0){
				newList += "<li title='"+json.id+"'><a href='"+json.place_url+"' target='_blank'><input type='text' value='"+json.place_name+"'/></a>";
				newList += "<input type='hidden' value='"+value+"'/><button onclick='$(this).parent().remove();'>-</button></li>";
			}else{
				return false;
			}
		} else{
			alert("장소는 코스당 종류 별로 최대 5개 등록이 가능합니다.");
			return false;
		}
		$("#"+type).append(newList);
	}
	
	
	// 저장하기 
	
	// 카테고리 추가
	$("#catename").on('change',function(){
		if($(this).val() == 'addCategory'){
			var catename = prompt("새 카테고리 이름을 입력하세요.", "새 코스");
			var overlap = 0;
			
			// 카테고리 추가 시 중복 확인
			$("#catename").children("option").each(function(){
				var names = $(this).attr("title");
				console.log(names);
				if(names == catename){
					alert("이미 등록된 이름입니다.");
					overlap++;
					return false;
				}
			});
			
			// 중복이 없다면 비동기식으로 새로운 카테고리 추가
			if(overlap ==0){
				var url = "<%=request.getContextPath()%>/insertCategory";
				var data = "catename="+catename;

				$.ajax({
					url : url,
					data : data,
					success : function(result){
						if(result == 1){
							alert("새로운 카테고리가 추가되었습니다.");
							selectCategory();
						}else{
							alert("카테고리 추가 에러");
						}
					}, error : function(){
						console.log("카테고리 새로 추가 에러");
					}
				});
			}			
		}else{
			return false;
		}
	});
	
	// 카테고리 새로 설정하기
	function selectCategory(){
		var url = "<%=request.getContextPath()%>/selectCategory";
		var tag = "";
		
		$.ajax({
			url : url,
			success : function(result){
				var cnt = 0;
				// 카테고리 리스트 추가
				$.each(result, function(index, value){
					tag += "<option value='"+value.nocoursecate+"' title='"+ value.catename+"'>"+value.catename+"</option>";
					cnt++;
				});
				
				// 카테고리 5개 미만일 시 추가하는 옵션 추가
				if(cnt<5){
					tag+= "<option value='addCategory'>카테고리 추가</option>";
				}
				
				$("#catename").html(tag);
			},error : function(){
				alert("카테고리 호출 에러");
			}
		});
	}
</script>