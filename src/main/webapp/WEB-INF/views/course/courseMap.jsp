<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
		<div id="naviIcon">
			<ul>
				<li><label for="tab1"><img src="<%=request.getContextPath() %>/img/img_course/searchGray.png"/></label></li>
				<li><label for="tab2"><img src="<%=request.getContextPath() %>/img/img_course/mapGray.png" /></label></li>
				<li><label for="tab3"><img src="<%=request.getContextPath() %>/img/img_course/buildingGray.png"/></label></li>
				<li><label for="tab4"><img src="<%=request.getContextPath() %>/img/img_course/saveGray.png"/></label></li>	
			</ul>
		</div>
		<div id="infoPannel">
			<input type="radio" name="tab" class="tabIcon" id="tab1" checked/>
			<input type="radio" name="tab" class="tabIcon" id="tab2"/>
			<input type="radio" name="tab" class="tabIcon" id="tab3"/>
			<input type="radio" name="tab" class="tabIcon" id="tab4"/>
			<div class="tab" id="pannel1">
				<div id="searchPannel">
					<input type="text" name="searchWord" id="searchWord" placeholder="검색어를 입력하세요."/><br/>
					<input type="checkbox" id="chkBicycle" onclick="setOverlayMapTypeId()" /> 자전거도로 정보 보기
					<hr>
					<div style="height:25px;line-height:25px;"onclick="showCategory();"><h5>카테고리 검색</h5></div>
					<hr/>
									<!-- 
					category 분류
					음식점
						fd6 음식점 / ce7 카페
					
					관광지
						ct1 문화시설 / at4 관광명소  
					
					숙박
						ad5 숙박
					
					편의시설
						cs2 편의점 / pk6 주차장
						sw8 지하철역 / bk9 은행 / hp8 병원 / pm9 약국
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
						<hr/>
					</ul>
				</div>
		        
		        <ul id="placesList"></ul>
		        <div id="pagination"></div>
			</div>
			<div class="tab">
				길찾기
			</div>
			<div class="tab" id="pannel3">
				<div onclick="showFoodList();">찜한 음식점</div>
				<ul id="foodList" style="display:none;">
					<li>dsafadas</li>
					<li>dsafadas</li>
					<li>dsafadas</li>
					<li>dsafadas</li>
				</ul>				
				<div onclick="showSightsList();">찜한 관광지</div>
				<ul id="sightsList" style="display:none;">
					<li>dsafadas</li>
					<li>dsafadas</li>
					<li>dsafadas</li>
					<li>dsafadas</li>
				</ul>
				<div onclick="showAccomList();">찜한 숙박시설</div>
				<ul id="accomodationList" style="display:none;">
					<li>dsafadas</li>
					<li>dsafadas</li>
					<li>dsafadas</li>
					<li>dsafadas</li>
				</ul>
				<div onclick="showConveList();">찜한 편의시설</div>
				<ul id="convenientList" style="display:none;">
					<li>dsafadas</li>
					<li>dsafadas</li>
					<li>dsafadas</li>
					<li>dsafadas</li>
				</ul>
			</div>
			<div class="tab">
				저장하기
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
			center : new kakao.maps.LatLng(33.450701, 126.570667),
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
	
	function displayInfowindow(marker, places){
		
		console.log(places);
		var group = places.category_group_code;
		var content = '<div style="padding:5px; font-size:12px;">';
		if(places.place_url){
			content += '<a href= "'+places.place_url+'" target="_blank">' + places.place_name + '</a><hr/><ul>';	
		}else{
			content += places.place_name + '<hr/><ul>';
		}
		
		content += "<li value='"+"dfdafadf"+"' onclick='setStart(value);'>출발지 지정</li>";
		content += "<li onclick='console.log(11)'>경유지 지정</li>";
		content += "<li onclick='console.log(222)'>도착지 지정</li><hr/>";
		
		// 카테고리 추가 버튼 생성
		if(group == 'FD6' || group =='CE7'){
			content += '<li>음식점 저장</li>';
		}else if(group == 'CT1' || group =='AT4'){
			content += '<li>관광지 저장</li>';
		}else if(group == 'AD5'){
			content += '<li>숙박시설 저장</li>'
		}else if(group == 'CS2' || group == 'PK6' ||group == 'SW8' ||group == 'BK9' ||group == 'HP8' ||group == 'PM9'){
			content += '<li>편의시설 저장</li>'
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
	
	
	// 찜한 리스트 오픈 / 음식점
	var foodListOpen = 1;
	function showFoodList(){
		if(foodListOpen == 1){
			$("#foodList").css("display", "block");
			foodListOpen++;
		} else {
			$("#foodList").css("display","none");
			foodListOpen--;
		}
	}	
	
	// 찜한 리스트 오픈 / 관광지
	var sightsListOpen = 1;
	function showSightsList(){
		if(sightsListOpen == 1){
			$("#sightsList").css("display", "block");
			sightsListOpen++;
		} else {
			$("#sightsList").css("display","none");
			sightsListOpen--;
		}
	}
	
	// 찜한 리스트 오픈 / 숙박시설
	var accomListOpen = 1;
	function showAccomList(){
		if(accomListOpen == 1){
			$("#accomodationList").css("display", "block");
			accomListOpen++;
		} else {
			$("#accomodationList").css("display","none");
			accomListOpen--;
		}
	}
	
	// 찜한 리스트 오픈 / 편의시설
	var conveListOpen = 1;
	function showConveList(){
		if(conveListOpen == 1){
			$("#convenientList").css("display", "block");
			conveListOpen++;
		} else {
			$("#convenientList").css("display","none");
			conveListOpen--;
		}
	}
	
	// 출발지 지정
	function setStart(value){
		console.log(value);
	}
	
</script>