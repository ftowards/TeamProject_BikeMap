<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	#background{margin : 0; padding : 0; height : 70vh;}
	#background>div{float:left;}
	#info{width:350px; height : 100%; background-color : orange;}
	#info>div{float:left;}
		#naviIcon{width : 50px; height : 100%; background-color : white;}
		#naviIcon img{width : 100%;}
		#infoPannel{width : 300px; height : 100%; background-color : green;}
	#map{width : 900px; height : 100%; background-color: lightblue;}
	#infoPannel>input[type=radio]{display:none;}
	.tab{display:none;}
	
	#tab1:checked~div:nth-of-type(1){display:block;}
	#tab2:checked~div:nth-of-type(2){display:block;}
	#tab3:checked~div:nth-of-type(3){display:block;}
	#tab4:checked~div:nth-of-type(4){display:block;}
	

</style>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=48c22e89a35cac9e08cf90a3b17fdaf2&libraries=services,clusterer,drawing"></script>
<div id="background">
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
			<div class="tab" id="searchPannel">
				<input type="text" name="searchWord" id="searchWord"/><input type="button" value = "검색" id="searchBtn"/>
				<input type="checkbox" id="chkBicycle" onclick="setOverlayMapTypeId()" /> 자전거도로 정보 보기
				
		        <hr>
		        <ul id="placesList"></ul>
		        <div id="pagination"></div>
			</div>
			<div class="tab">
				길찾기
			</div>
			<div class="tab">
				장소 저장
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
	var container = document.getElementById("map");
	var options = {
			center : new kakao.maps.LatLng(33.450701, 126.570667),
			level : 3
	};
	
	// 지도 추가
	var map = new kakao.maps.Map(container, options);
	var infowindow = new kakao.maps.InfoWindow({zIndex:1});
	
	// 지도 컨트롤러 추가
	var mapTypeControl = new kakao.maps.MapTypeControl();
	var zoomControl = new kakao.maps.ZoomControl();
	
	map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
	map.addControl(zoomControl, kakao.maps.ControlPosition.Right);
	
	// 검색을 위한 장소 객체 생성
	var ps = new kakao.maps.services.Places();
	
	// 검색 버튼 클릭 시 키워드 검색 실시
	$("#searchBtn").on("click", function(){
		var keyword = $("#searchWord").val();
		ps.keywordSearch(keyword, placeSearchCB);
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
			bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
			
			(function(marker, title){
				kakao.maps.event.addListener(marker, 'mouseover', function(){
					displayInfowindow(marker, title);
				});
				
				kakao.maps.event.addListener(marker, 'mouseout', function(){
					infowindow.close();
				});
				
				itemEl.onmouseover = function(){
					displayInfowindow(marker, title);
				};
				
				itemEl.onmouseout = function(){
					infowindow.close();
				};
			})(marker, places[i].place_name);
			
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
	
	
	function displayMarker(place) {
	    
	    // 마커를 생성하고 지도에 표시합니다
	    var marker = new kakao.maps.Marker({
	        map: map,
	        position: new kakao.maps.LatLng(place.y, place.x) 
	    });

	    // 마커에 클릭이벤트를 등록합니다
	    kakao.maps.event.addListener(marker, 'click', function() {
	        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
	        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
	        infowindow.open(map, marker);
	    });
	}

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
</script>