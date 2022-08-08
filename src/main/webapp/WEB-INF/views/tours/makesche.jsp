<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.text.ParseException"%>
<%@page import="java.lang.reflect.Array"%>
<%@ page import = "kr.co.city.City" %>
<%@ page import = "kr.co.city.CityDAO" %>
<%@ page import = "kr.co.tour.TourDAO" %>
<%@ page import = "kr.co.tour.Tour" %>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<script	src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="/resources/css/tourCSS/style_auto2.css">
 <script src="https://apis.openapi.sk.com/tmap/jsv2?version=1&appKey=l7xx0027c9071859472394ee1ff449ed1fdf"></script>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>KoneyGram</title>
<style>
body{
	background:#fff;
}
</style>
</head>
<body onload="initTmap()" style="margin-top: 20px; margin-left:350px;">
	<%
		String cityname = request.getParameter("c_name");
		String ny = null;
		ny = request.getParameter("c_ny");
		String nx = null;
		nx = request.getParameter("c_nx");
		
		double m_ny = Double.parseDouble(ny);
		double m_nx = Double.parseDouble(nx);
	%>
<%@ include file="../menu/menu1.jsp" %>
  <div class="container" style="width: 1024px;">
  	<div class= "title">
        <h1><%=cityname %>지역에서 선택해 주세요!</h1>
        <p>관광지를 보여드립니다!</p>
    </div>
    <ol class="breadcrumb">
	  <li class="breadcrumb-item"><a href="/tours/tour">1. 도시 선택</a></li>
	  <li class="breadcrumb-item active">2. 일정 짜기</li>
	</ol>
		<div class="contents" style="background:rgba(231, 229, 229, 0.573);">
			<div class = "left_items" style="width:100%;">
			<c:if test="${user != null}">
				<span>
					<h5>${user.userId}님의 일정 만들기</h5>
					<div class="buttongroup" style="float:right;">
						<button class="btn btn-outline-danger" data-bs-toggle="tooltip" data-bs-placement="bottom" title="마커 초기화" onclick="removeMarker();">
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash3-fill" viewBox="0 0 16 16">
							  <path d="M11 1.5v1h3.5a.5.5 0 0 1 0 1h-.538l-.853 10.66A2 2 0 0 1 11.115 16h-6.23a2 2 0 0 1-1.994-1.84L2.038 3.5H1.5a.5.5 0 0 1 0-1H5v-1A1.5 1.5 0 0 1 6.5 0h3A1.5 1.5 0 0 1 11 1.5Zm-5 0v1h4v-1a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5ZM4.5 5.029l.5 8.5a.5.5 0 1 0 .998-.06l-.5-8.5a.5.5 0 1 0-.998.06Zm6.53-.528a.5.5 0 0 0-.528.47l-.5 8.5a.5.5 0 0 0 .998.058l.5-8.5a.5.5 0 0 0-.47-.528ZM8 4.5a.5.5 0 0 0-.5.5v8.5a.5.5 0 0 0 1 0V5a.5.5 0 0 0-.5-.5Z"/>
							</svg>
						</button>
						<button class="btn btn-outline-success" data-bs-toggle="tooltip" data-bs-placement="bottom" title="경로 보기" onclick="addpass();">
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-binoculars-fill" viewBox="0 0 16 16">
							  <path d="M4.5 1A1.5 1.5 0 0 0 3 2.5V3h4v-.5A1.5 1.5 0 0 0 5.5 1h-1zM7 4v1h2V4h4v.882a.5.5 0 0 0 .276.447l.895.447A1.5 1.5 0 0 1 15 7.118V13H9v-1.5a.5.5 0 0 1 .146-.354l.854-.853V9.5a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5v.793l.854.853A.5.5 0 0 1 7 11.5V13H1V7.118a1.5 1.5 0 0 1 .83-1.342l.894-.447A.5.5 0 0 0 3 4.882V4h4zM1 14v.5A1.5 1.5 0 0 0 2.5 16h3A1.5 1.5 0 0 0 7 14.5V14H1zm8 0v.5a1.5 1.5 0 0 0 1.5 1.5h3a1.5 1.5 0 0 0 1.5-1.5V14H9zm4-11H9v-.5A1.5 1.5 0 0 1 10.5 1h1A1.5 1.5 0 0 1 13 2.5V3z"/>
							</svg>
						</button>
					</div>
				</span>
			</c:if>
				<div class ="make_sche">
				<form name = "routeForm" action = "/tours/saveTour" method="post">
						<input type="text" name="title" placeholder="일정의 제목을 입력해주세요" >
						<input type="hidden" name = "userId" id="userId" value=${user.userId }>
						<br>
						<br>
						<h5>출발지 입력하기</h5>
						<input type = "text" id="dp_name" name="dp_name" placeholder="출발지 입력을 위해 클릭해주세요" onclick="searchAddressd('S');">
						<input type = "hidden" id="dp_ny" name="dp_ny">
						<input type = "hidden" id="dp_nx" name="dp_nx">
						<!-- <button id = "dpointcheck" onclick="geoLocation('S')">현재내위치 찍기</button> -->
						<div class = "tour1">
						<h5>관광지 입력하기</h5>
							<input type = "text" id="t_name1" name = "t_name1" placeholder="관광지를 입력하세요">
							<a href="tourlist.jsp?c_name=<%=cityname %>&tag=1" 
								onclick="window.open(this.href, '_blank', 'width=850, height=600'); return false;">
								관광리스트 보러가기
							</a>
							<input type = "hidden" id="t_ny1" name="t_ny1" >
							<input type = "hidden" id="t_nx1" name="t_nx1" >
							<input type = "hidden" id="t_intro1" name="t_intro1" >
			        	<div>
				        	<span class="wayPlus_bt_01" onclick="plusWay_02()">
				               <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="black" class="bi bi-bookmark-plus" viewBox="0 0 16 16">
								  <path d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.777.416L8 13.101l-5.223 2.815A.5.5 0 0 1 2 15.5V2zm2-1a1 1 0 0 0-1 1v12.566l4.723-2.482a.5.5 0 0 1 .554 0L13 14.566V2a1 1 0 0 0-1-1H4z"/>
								  <path d="M8 4a.5.5 0 0 1 .5.5V6H10a.5.5 0 0 1 0 1H8.5v1.5a.5.5 0 0 1-1 0V7H6a.5.5 0 0 1 0-1h1.5V4.5A.5.5 0 0 1 8 4z"/>
								</svg>
				            </span>
			            </div>
						</div>
						<div class = "tour2">
							<h5>관광지 입력하기</h5>
							<input type = "text" id="t_name2" name = "t_name2" placeholder="관광지를 입력하세요">
							<a href="tourlist.jsp?c_name=<%=cityname %>&tag=2" 
								onclick="window.open(this.href, '_blank', 'width=850, height=600'); return false;">
								관광리스트 보러가기
							</a>
							<input type = "hidden" id="t_ny2" name="t_ny2" >
							<input type = "hidden" id="t_nx2" name="t_nx2" >
							<input type = "hidden" id="t_intro2" name="t_intro2" >
							<div>
				               <span class="wayPlus_bt_02" onclick="plusWay_03()"><svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="black" class="bi bi-bookmark-plus" viewBox="0 0 16 16">
								  <path d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.777.416L8 13.101l-5.223 2.815A.5.5 0 0 1 2 15.5V2zm2-1a1 1 0 0 0-1 1v12.566l4.723-2.482a.5.5 0 0 1 .554 0L13 14.566V2a1 1 0 0 0-1-1H4z"/>
								  <path d="M8 4a.5.5 0 0 1 .5.5V6H10a.5.5 0 0 1 0 1H8.5v1.5a.5.5 0 0 1-1 0V7H6a.5.5 0 0 1 0-1h1.5V4.5A.5.5 0 0 1 8 4z"/>
								</svg></span>
				               <span type="button" class="wayRemove_bt_02" onclick="removeWay_02()">
				               <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="black" class="bi bi-bookmark-dash" viewBox="0 0 16 16">
								  <path fill-rule="evenodd" d="M5.5 6.5A.5.5 0 0 1 6 6h4a.5.5 0 0 1 0 1H6a.5.5 0 0 1-.5-.5z"/>
								  <path d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.777.416L8 13.101l-5.223 2.815A.5.5 0 0 1 2 15.5V2zm2-1a1 1 0 0 0-1 1v12.566l4.723-2.482a.5.5 0 0 1 .554 0L13 14.566V2a1 1 0 0 0-1-1H4z"/>
								</svg>
				               </span>
				            </div>
						</div>
						<div class = "tour3">
							<h5>관광지 입력하기</h5>
								<input type = "text" id="t_name3" name = "t_name3" placeholder="관광지를 입력하세요">
								<a href="tourlist.jsp?c_name=<%=cityname %>&tag=3" 
									onclick="window.open(this.href, '_blank', 'width=850, height=600'); return false;">
									관광리스트 보러가기
								</a>
								<input type = "hidden" id="t_ny3" name="t_ny3" >
								<input type = "hidden" id="t_nx3" name="t_nx3" >
								<input type = "hidden" id="t_intro3" name="t_intro3" >
							<div>
				               <span type="button" class="wayRemove_03" onclick="removeWay_03()">
				               <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="black" class="bi bi-bookmark-dash" viewBox="0 0 16 16">
								  <path fill-rule="evenodd" d="M5.5 6.5A.5.5 0 0 1 6 6h4a.5.5 0 0 1 0 1H6a.5.5 0 0 1-.5-.5z"/>
								  <path d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.777.416L8 13.101l-5.223 2.815A.5.5 0 0 1 2 15.5V2zm2-1a1 1 0 0 0-1 1v12.566l4.723-2.482a.5.5 0 0 1 .554 0L13 14.566V2a1 1 0 0 0-1-1H4z"/>
								</svg>
				               </span>
				            </div>
						</div>
						<h5>도착지 입력하기</h5>
						<input type = "text" id="ep_name" name="ep_name"  placeholder="도착지를 입력을 위해 클릭해주세요" onclick="searchAddresse('E');">
						<input type = "hidden" id="ep_ny" name="ep_ny" >
						<input type = "hidden" id="ep_nx" name="ep_nx" >
						<br>
						<br>
						<br>
						<br>
						<textarea name="contents" placeholder="메모를 입력해주세요" style="width:100%; height: 100px"></textarea>
						<c:if test="${user != null}">
						<button class = "btn btn-outline-secondary" data-bs-toggle="tooltip" data-bs-placement="bottom" title="일정 저장하기" type = "submit">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-save-fill" viewBox="0 0 16 16">
						  <path d="M8.5 1.5A1.5 1.5 0 0 1 10 0h4a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2h6c-.314.418-.5.937-.5 1.5v7.793L4.854 6.646a.5.5 0 1 0-.708.708l3.5 3.5a.5.5 0 0 0 .708 0l3.5-3.5a.5.5 0 0 0-.708-.708L8.5 9.293V1.5z"/>
						</svg>
						</button>
						</c:if>
						</form>
					</div>
			</div>
			<div class = "map">
				<div id = "map_div"></div>
			</div>
		</div>
	</div>
 	<script type="text/javascript">
 	
	 	$(document).ready(function(){
			var formObj = $("form[name='routeForm']");
			$(".save_btn").on("click", function(){
				formObj.attr("action","/tours/saveTour");
				formObj.attr("method", "post");
				formObj.submit();
			})
			
		})
 	
 		let m_ny = <%=ny%>;
		let m_nx = <%=nx%>;
		
		var start_markerList = [];
		var pass_markerList = [];
		var end_markerList = [];
		
		var pointArray = [];
		
		
		var tourlist=[];
		var passList="";
		
		var st_x;
		var st_y;
		var en_x;
		var en_y;
		
	 	var map;
		/*지도 실행하기(시작)*/
		function initTmap(){
			map = new Tmapv2.Map("map_div",{
				center:	 new Tmapv2.LatLng(m_ny, m_nx),
				width : "550px",
				height : "750px",
				zoom: 10
			});
		};
		/*지도 실행하기(끝)*/
		
		var new_polyLine = [];
		var new_Click_polyLine = [];
		
		function drawData(data){
			// 지도위에 선은 다 지우기
			routeData = data;
			var resultStr = "";
			var distance = 0;
			var idx = 1;
			var newData = [];
			var equalData = [];
			var pointId1 = "-1234567";
			var ar_line = [];
			
			for (var i = 0; i < data.features.length; i++) {
				var feature = data.features[i];
				//배열에 경로 좌표 저잘
				if(feature.geometry.type == "LineString"){
					ar_line = [];
					for (var j = 0; j < feature.geometry.coordinates.length; j++) {
						var startPt = new Tmapv2.LatLng(feature.geometry.coordinates[j][1],feature.geometry.coordinates[j][0]);
						ar_line.push(startPt);
						pointArray.push(feature.geometry.coordinates[j]);
					}
					var polyline = new Tmapv2.Polyline({
				        path: ar_line,
				        strokeColor: "#ff0000", 
				        strokeWeight: 6,
				        map: map
				    });
					new_polyLine.push(polyline);
				}
				var pointId2 = feature.properties.viaPointId;
				if (pointId1 != pointId2) {
					equalData = [];
					equalData.push(feature);
					newData.push(equalData);
					pointId1 = pointId2;
				}
				else {
					equalData.push(feature);
				}
			}
			geoData = newData;
			var markerCnt = 1;
			for (var i = 0; i < newData.length; i++) {
				var mData = newData[i];
				var type = mData[0].geometry.type;
				var pointType = mData[0].properties.pointType;
				var pointTypeCheck = false; // 경유지 일때만 true
				if (mData[0].properties.pointType == "S") {
					var img = 'http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_s.png';
					var lon = mData[0].geometry.coordinates[0];
					var lat = mData[0].geometry.coordinates[1];
				}
				else if (mData[0].properties.pointType == "E") {
					var img = 'http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_e.png';
					var lon = mData[0].geometry.coordinates[0];
					var lat = mData[0].geometry.coordinates[1];
				}
				else {
					markerCnt=i;
					var lon = mData[0].geometry.coordinates[0];
					var lat = mData[0].geometry.coordinates[1];
				}	
			}
		}
		
		/*나의 위치찍기(시작)*/
		/* function geoLocation(location) {
		    navigator.geolocation.getCurrentPosition(function(position){
		        // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
		        lat = position.coords.latitude; // 위도
		        lon = position.coords.longitude; // 경도

		        console.log(lat);
		        console.log(lon);
		        
		        if(location == "S"){
		        	removeMarker_s();
		        	addMarker_s('S', lon, lat,1);
		        	map.setCenter(new Tmapv2.LatLng(lat,lon));
		        	st_x = lon;
		        	st_y = lat;
		        	
		        }
		        else if(location == "E"){
		        	removeMarker_e();
		        	addMarker_e("E",lon,lat,2);
		        	map.setCenter(new Tmapv2.LatLng(lat,lon));
		        	en_x = lon;
		        	en_y = lat;
		        }
		    });
		}; */
		/*나의 위치찍기(끝)*/
		
		/*주소 팝업창에서 마크찍기(시작)*/
		function popAddress(status,lon,lat){
			if(status == "S"){
				removeMarker_s();
	        	addMarker_s('S', lon, lat,1);
	        	map.setCenter(new Tmapv2.LatLng(lat,lon));
	        	st_x = lon;
	        	st_y = lat;
	        	console.log(st_x);
	        	console.log(st_y);
	        }
	        else if(status == "E"){
	        	removeMarker_e();
	        	addMarker_e('E',lon,lat,2);
	        	map.setCenter(new Tmapv2.LatLng(lat,lon));
	        	en_x = lon;
	        	en_y = lat;
	        	console.log(en_x);
	        	console.log(en_y);
	        }else{
	        	alert("오류가 발생했습니다.")
	        }
		}
		
		/*주소 팝업창에서 마크찍기(끝)*/
		
		/*관광지 마커 찍기 시작*/
		function TourMarker1(lon, lat){
			console.log(lon);
			console.log(lat);
			addMarker_p('P', lon, lat, 3);
			map.setCenter(new Tmapv2.LatLng(lat,lon));
			
			var tour = lon+","+lat;
			tourlist.push(tour);
			
			console.log(tourlist);
			
		};
		/*관광지 마커 찍기 끝*/
		
				/*관광지 마커 찍기 시작*/
		function TourMarker2(lon, lat){
			console.log(lon);
			console.log(lat);
			addMarker_p('P', lon, lat, 4);
			map.setCenter(new Tmapv2.LatLng(lat,lon));
			
			var tour = lon+","+lat;
			tourlist.push(tour);
			
			console.log(tourlist);
			
		};
		/*관광지 마커 찍기 끝*/
		function addpass(){
			for(var i=0; i<tourlist.length; i++){
	            if(i>0){
	                passList +="_";
	            }
	            passList += tourlist[i]
	        };
	        console.log(passList);
	        route();
		}
		
		
		/*마커 찍기(시작)*/
		function addMarker_s(status, lon, lat, tag) {
			//출도착경유구분
			//이미지 파일 변경.
			
			var marker_s = new Tmapv2.Marker({
				position: new Tmapv2.LatLng(lat,lon),
				icon: 'http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_s.png',
				map: map
			});
			
			start_markerList[tag] = marker_s;
		}
		
		function addMarker_p(status, lon, lat, tag) {
				//출도착경유구분
				//이미지 파일 변경.
				
				var marker_p = new Tmapv2.Marker({
					position: new Tmapv2.LatLng(lat,lon),
					icon: 'http://tmapapi.sktelecom.com/upload/tmap/marker/pin_b_m_p.png',
					map: map
				});
				pass_markerList[tag] = marker_p;
		}
		
		function addMarker_e(status, lon, lat, tag) {
					//출도착경유구분
				
					var marker_e = new Tmapv2.Marker({
						position: new Tmapv2.LatLng(lat,lon),
						icon: 'http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_e.png',
						map: map
			});
	
			end_markerList[tag] = marker_e;
		}
		
		// 4. 경로탐색 API 사용요청
		function route(){
			var startX = st_x;
			var startY = st_y;
			var endX = en_x;
			var endY = en_y;
			var prtcl;
			var headers = {};
			headers["appKey"]="l7xx0027c9071859472394ee1ff449ed1fdf";
			$.ajax({
					method:"POST", 
					headers : headers, 
					url:"https://apis.openapi.sk.com/tmap/routes?version=1&format=json",//
					async:false,
					data:{ 
						startX : startX,
						startY : startY,
						endX : endX,
						endY : endY,
						passList : passList,
						reqCoordType : "WGS84GEO",
						resCoordType : "WGS84GEO",
						angle : "172",
						searchOption : "0",
						trafficInfo : "Y"
					},
					success:function(response){
					prtcl = response;
					
					// 5. 경로탐색 결과 Line 그리기 
					var trafficColors = {
						extractStyles:true,
						/* 실제 교통정보가 표출되면 아래와 같은 Color로 Line이 생성됩니다. */
						trafficDefaultColor:"#636f63", //Default
						trafficType1Color:"#19b95f", //원할
						trafficType2Color:"#f15426", //지체
						trafficType3Color:"#ff970e"  //정체		
					};    			
					var style_red = {
						fillColor:"#FF0000",
						fillOpacity:0.2,
						strokeColor: "#FF0000",
						strokeWidth: 3,
						strokeDashstyle: "solid",
						pointRadius: 2,
						title: "this is a red line"
					};
					drawData(prtcl);
				
					// 6. 경로탐색 결과 반경만큼 지도 레벨 조정
					var newData = geoData[0];
					PTbounds = new Tmapv2.LatLngBounds();
							for (var i = 0; i < newData.length; i++) {
								var mData = newData[i];
								var type = mData.geometry.type;
								var pointType = mData.properties.pointType;
								if(type == "Point"){
									var linePt = new Tmapv2.LatLng(mData.geometry.coordinates[1],mData.geometry.coordinates[0]);
									console.log(linePt);
									PTbounds.extend(linePt);
								}
								else{
									var startPt,endPt;
									for (var j = 0; j < mData.geometry.coordinates.length; j++) {
										var linePt = new Tmapv2.LatLng(mData.geometry.coordinates[j][1],mData.geometry.coordinates[j][0]);
										PTbounds.extend(linePt);
									}
							}
						}
						map.fitBounds(PTbounds);
				
					},
					error:function(request,status,error){
					console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});

		};
		
		
		
		/*주소 찾기 팝업창*/
		/*시작점 주소찾기*/
		function searchAddressd(status){
			var pop1 = window.open("searchaddress_d.jsp","pop1","width=800,height=670, scrollbars=yes, resizable=yes");
			
		}
		/*도착점 주소찾기*/
		function searchAddresse(status){
			var pop2 = window.open("searchaddress_e.jsp","pop2","width=800,height=670, scrollbars=yes, resizable=yes");

			}
		
		function removeMarker_s(){
			if(start_markerList.length>0){
				for(var i in start_markerList){
					start_markerList[i].setMap(null);
				}
				
				start_markerList = [];
			}
		}
		
		function removeMarker_p(){
			if(pass_markerList.length>0){
				for(var i in pass_markerList){
					pass_markerList[i].setMap(null);
				}
				pass_markerList=[];
			
			}
		}
		
		function removeMarker_e(){
			if(end_markerList.length>0){
				for(var i in end_markerList){
					end_markerList[i].setMap(null);
				}
				end_markerList=[];
			}
		}
		
		function markerInfo(){
			for(var i=0; i<start_markerList.legth; i++){
				console.log(start_markerList[i]);
			}
		}
		
		function removeMarker(){
			/* 			
				for(var i in start_markerList){
					start_markerList[i].setMap(null);
				}
				document.getElementById('dp_name').value = null;
				document.getElementById('dp_ny').value = null;
				document.getElementById('dp_nx').value = null;
				
			
			
			
				for(var i in pass_markerList){
					pass_markerList[i].setMap(null);
				
				pass_markerList=[];
				document.getElementById('t_name1').value = null;
				document.getElementById('t_ny1').value = null;
				document.getElementById('t_nx1').value = null;
				document.getElementById('t_name2').value = null;
				document.getElementById('t_ny2').value = null;
				document.getElementById('t_nx2').value = null;
				document.getElementById('t_name3').value = null;
				document.getElementById('t_ny3').value = null;
				document.getElementById('t_nx3').value = null;
			}
			
			
				for(var i in end_markerList){
					end_markerList[i].setMap(null);
				}
				end_markerList=[];
				document.getElementById('dp_name').value = null;
				document.getElementById('dp_ny').value = null;
				document.getElementById('dp_nx').value = null; */
			
			location.reload(true);	
		}
		
	function plusWay_02() {
			document.querySelector(".tour2").style.display = 'block';
		}
		function plusWay_03() {
			document.querySelector(".tour3").style.display = 'block';
		}
		function removeWay_02() {
			document.querySelector(".tour2").style.display = 'none';
			document.getElementById('t_name2').value=null;
			document.getElementById('t_ny2').value=null;
			document.getElementById('t_nx2').value=null;
		}
		function removeWay_03() {
			document.querySelector(".tour3").style.display = 'none';
			document.getElementById('t_name3').value=null;
			document.getElementById('t_ny3').value=null;
			document.getElementById('t_nx3').value=null;
			
			} 
					
		
	</script>

</body>
</html>
