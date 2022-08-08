<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var='root' value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script	src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://apis.openapi.sk.com/tmap/jsv2?version=1&appKey=l7xx0027c9071859472394ee1ff449ed1fdf"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link rel = "stylesheet" href="/resources/css/style_mrlist2.css">
<title>KoneyGram</title>
    <script>
 	$(document).ready(function(){
		getreplylist();
		initTmap();
	});
	
	function getreplylist(){
		
		var replyurl = "${pageContext.request.contextPath }/mrview/mrrlist/";
		var mr_bno = ${read.mr_id};
		var mr_no = ${reply.mr_no};
		
		
		$.ajax({
			url : replyurl+mr_bno,
			type : 'POST',
			dataType : 'json',
			success : function(result){
				var comments = "";
			if(result.length <1){
				comments = "등록된 댓글이 없습니다.";
			}else{
				$(result).each(function(){
					comments +='<div id="mr_no'+this.mr_no+'">';
					comments +='<strong>'+'작성자 : ' + this.mr_writer+'</strong>&nbsp;&nbsp;&nbsp;&nbsp;';
					comments +='작성 날짜 : '+this.mr_regdate+'</br>';
					comments +='<p>';
					comments +='댓글 내용 : &nbsp;&nbsp;&nbsp;'+this.mr_content;
					comments +='</p>';
					comments +='<br/>';
					comments +='<button type="button" class="btn btn-outline-success" onclick="updateviewBtn('+this.mr_no+',\''+this.mr_regdate+'\', \''+this.mr_content+'\', \''+this.mr_writer+'\')">';
					comments +='댓글수정</button>';
					comments +='<button type="button" class="btn btn-outline-success" onclick="mrdelete('+this.mr_no+')">';
					comments +='댓글 삭제';
					comments +='</button>';
					comments +='</div>';
					comments +='<br/>';
				});
			};
				$("#mrlist").html(comments);
			}
		});
	};
	
	function mrdelete(mr_no){
		var deleteurl='${pageContext.request.contextPath }/mrview/mrdelete/';
		
		$.ajax({
			url:deleteurl+mr_no,
			type : 'POST',
			dataType : 'json',
			success : function(result){
				getreplylist();
			}
			, error: function(error){
				console.log(error);
			}
		});
	}
	
	function updateviewBtn(mr_no, mr_regdate, mr_content, mr_writer){
		console.log("들어옵니까?");
		
		var commentsview = "";
		
		commentsview +='<div id="mr_no'+mr_no+'">';
		commentsview +='<strong>';
		commentsview +='작성자 : ' + mr_writer;
		commentsview +='</strong>&nbsp;&nbsp;&nbsp;&nbsp;';
		commentsview +='작성 날짜 : '+mr_regdate
		commentsview +='</br><p>';
		commentsview +='댓글 내용 : &nbsp;&nbsp;&nbsp;';
		commentsview +='<textarea class="form-control" id="reply_edit_content">';
		commentsview += mr_content;
		commentsview +='</textarea>';
		commentsview +='</p>';
		commentsview +='<br/>';
		commentsview +='<button type="button" class="btn btn-outline-success"';
		commentsview +='onclick="updateBtn('+mr_no+',\''+mr_writer+'\')">댓글작성</button>';
		commentsview +='<button type="button" class="btn btn-outline-success" onclick="getreplylist()">';
		commentsview +='취소';
		commentsview +='</button>';
		commentsview +='</div>';
		commentsview +='<br/>';
		
		$('#mr_no'+mr_no).replaceWith(commentsview);
		$('#mr_no'+mr_no+'#mr_content').focus();
	};
	
	function updateBtn(mr_no, mr_writer){
		
		var updateurl='${pageContext.request.contextPath }/mrview/mrupdate/';
		var mr_content = $("#reply_edit_content").val();
		
		$.ajax({
			url : updateurl+mr_no+'/'+mr_content,
			type : 'POST',
			dataType: 'json',
			success: function(result){
				getreplylist();
			}
			, error : function(error){
				console.log(error);
			}
		});
	};
	
	function getFormatDate(data){
		var year = date.getFullYear();
		var month = (1+date.getMonth());
		month = month >= 10 ? month : '0' + day;
		var day = date.getDate();
		day = day >= 10 ? day : '0' + day;
		return year + '-' + month + '-' + day;
	};
	
	$(function(){
		
		$('#replywriteBtn').click(function(){
			console.log("들어오는거 확인구문");
			var mr_content = $('#mr_content').val();
			mr_writer = "${user.userId}";
			mr_bno = ${read.mr_id};
			
			var writeurl = "${pageContext.request.contextPath }/mrview/mrwrite/";
			
			$.ajax({
				url : writeurl+mr_bno+'/'+mr_writer+'/'+mr_content,
				type : 'POST',
				dataType: 'json',
				success : function(result){
					getreplylist();
					$('#mr_content').val('');
					$('#mr_writer').val('');
				}
				, error: function(error){
					console.log(error);
				}
			})
		});
		
		$(".alistBtn").click(function(){
			var listurl ="list?page=${cri.page}"+
					"&perPageNum = ${cri.perPageNum}"+
					"&searchType=${cri.searchType}"+
					"&keywordp=${cri.keyword}";
					location.href=listurl;
		});
	});
	
	
</script>
</head>
<body style="margin-left:350px;">

<%@ include file="../menu/menu1.jsp" %>
<div class="contents" style="display:flex; margin-top:20px;">
	<div class="left_contents" style="width: 30%;">
	<div class="container">
		<ol class="breadcrumb">
		  <li class="breadcrumb-item"><a href="/myroute/mrlist">list</a></li>
		  <li class="breadcrumb-item active">Story</li>
		</ol>
		<span>${read.userId } 의</span>
		<h4>${read.title }</h4>
			<%-- <span>글 내용 ${read.contents }</span> --%>
			<span><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-eye" viewBox="0 0 16 16">
			  <path d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8zM1.173 8a13.133 13.133 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5c2.12 0 3.879 1.168 5.168 2.457A13.133 13.133 0 0 1 14.828 8c-.058.087-.122.183-.195.288-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5c-2.12 0-3.879-1.168-5.168-2.457A13.134 13.134 0 0 1 1.172 8z"/>
			  <path d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5zM4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0z"/>
			</svg>${read.hit }</span>
			<span>
			<c:choose>
		    <c:when test="${likeCheck eq '0' or empty likeCheck}"> <!-- likecheck가0이면 빈하트-->
		        <a id="heart"><img id="click_h" src='<c:url value="/resources/images/blank_heart.png"/>' style="cursor:pointer; width: 20px;"></a>
		    </c:when>
		    <c:otherwise> <!-- likecheck가1이면 빨간 하트-->
		        <a id="heart"><img id="click_h" src='<c:url value="/resources/images/full_heart.png"/>' style="cursor:pointer; width: 20px;"></a>
		    </c:otherwise>
			</c:choose>
			${read.like_count}</span>
		<div class="card border-primary mb-3" style="max-width: 20rem;">
		  <div class="card-header"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-journal-text" viewBox="0 0 16 16">
			  <path d="M5 10.5a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 0 1h-2a.5.5 0 0 1-.5-.5zm0-2a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5zm0-2a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5zm0-2a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5z"/>
			  <path d="M3 0h10a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2v-1h1v1a1 1 0 0 0 1 1h10a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H3a1 1 0 0 0-1 1v1H1V2a2 2 0 0 1 2-2z"/>
			  <path d="M1 5v-.5a.5.5 0 0 1 1 0V5h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1zm0 3v-.5a.5.5 0 0 1 1 0V8h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1zm0 3v-.5a.5.5 0 0 1 1 0v.5h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1z"/>
		  </svg></div>
		  <div class="card-body">
		    <p class="card-text">${read.contents }</p>
		  </div>
		</div>
		<div class="accordion" id="accordionExample">
		  <div class="accordion-item">
		    <h2 class="accordion-header" id="headingOne">
		      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
		        첫번째 여행지 : ${read.t_name1 } 
		      </button>
		    </h2>
		    <div id="collapseOne" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#accordionExample" style="">
		      <div class="accordion-body">
		      	<img alt="간단여행사진" src="/resources/images/tour_pic/${read.t_name1 }.jpg" width=100, height=100 onclick="moveMap(${read.t_nx1}, ${read.t_ny1})">
		      	<br/>
		      	${read.t_intro1 }
		      </div>
		    </div>
		  </div>
		  <div class="accordion-item">
		    <h2 class="accordion-header" id="headingTwo">
		      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
		        두번째 여행지 : ${read.t_name2 }
		      </button>
		    </h2>
		    <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample" style="">
		      <div class="accordion-body">
		      	<img alt="간단여행사진" src="/resources/images/tour_pic/${read.t_name2 }.jpg" width=100, height=100 onclick="moveMap(${read.t_nx2}, ${read.t_ny2})">
		      	<br/>
		      	${read.t_intro2 }
		      </div>
		    </div>
		  </div>
		  <div class="accordion-item">
		    <h2 class="accordion-header" id="headingThree">
		      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
		        세번째 여행지 : ${read.t_name3 }
		      </button>
		    </h2>
		    <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample" style="">
		      <div class="accordion-body">
		      	<img alt="간단여행사진" src="/resources/images/tour_pic/${read.t_name3 }.jpg" width=100, height=100 onclick="moveMap(${read.t_nx3}, ${read.t_ny3})">
		      	<br/>
		      	${read.t_intro3 }
		      </div>
		    </div>
		  </div>
		</div>
	</div>
	</div>
	<div class="right_contents">
		<div id="map_div">
        </div>
    </div>
</div>
<div class="reply_box">
    <div class="container">
	  <div class="col-md-6" style="width: 780px;">
	  <hr/>
	  <!-- 	<label for="reply_writer"> 작성자 : </label>
	  	<input type="text" class="form_control" id="mr_writer" name="mr_writer"><br/> -->
	  	<label for="reply_content"> 댓글 내용: </label>
	  	<textarea class="form-control" id="mr_content" name="mr_content"></textarea>
	  	<c:if test="${user != null}">
		  	<button type="button" class = "btn btn-outline-success" id="replywriteBtn">댓글 작성</button>
		</c:if>
	  </div>
		<br/>
		<div class="container">
			<div id="mrlist"></div>
		</div>
	</div>
</div>        
 <script>
 	var m_ny = ${read.dp_ny}
 	var m_nx = ${read.dp_nx}
 	
 	var map;
 	
	function initTmap(){
		map = new Tmapv2.Map("map_div",{
			center:	 new Tmapv2.LatLng(m_ny, m_nx),
			width : "400px",
			height : "615px",
			zoom: 10
		});
	
	
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
	
	// 2. 시작, 도착 심볼찍기

	var markerList = [];
	var pointArray = [];
	
	var start_nx = ${read.dp_nx}
	var start_ny = ${read.dp_ny}
	var end_nx = ${read.ep_nx}
	var end_ny = ${read.ep_ny}
	
		// 시작
		addMarker("llStart",start_nx,start_ny,1);
		// 도착 
		addMarker("llEnd",end_nx,end_ny,2);
		function addMarker(status, lon, lat, tag) {
		//출도착경유구분
		//이미지 파일 변경.
		var markerLayer;
		switch (status) {
			case "llStart":
				imgURL = 'http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_s.png';
				break;
			case "llPass":
				imgURL = 'http://tmapapi.sktelecom.com/upload/tmap/marker/pin_b_m_p.png';
				break;
			case "llEnd":
				imgURL = 'http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_e.png';
				break;
			default:
		};
		var marker = new Tmapv2.Marker({
			position: new Tmapv2.LatLng(lat,lon),
			icon: imgURL,
			map: map
		});
		// 마커 드래그 설정
		marker.tag = tag;
		marker.addListener("dragend", function (evt) {
		markerListenerEvent(evt);
	    });
	    marker.addListener("drag", function (evt) {    	
	    	markerObject = markerList[tag];
	    });
	    markerList[tag] = marker;
		return marker;
	};
	
	var t_nx1 = ${read.t_nx1};
	var t_ny1 = ${read.t_ny1};
	var t_nx2 = ${read.t_nx2};
	var t_ny2 = ${read.t_ny2};
	var t_nx3 = ${read.t_nx3};
	var t_ny3 = ${read.t_ny3};
	
	
	// 3. 경유지 심볼 찍기
	addMarker("llPass",t_nx1,t_ny1,3);
	addMarker("llPass",t_nx2,t_ny2,4);
	addMarker("llPass",t_nx3,t_ny3,5);
	
	a = ${read.t_nx1}+","+${read.t_ny1}+"_"+${read.t_nx2}+","+${read.t_ny2}+"_"+${read.t_nx3}+","+${read.t_ny3};
	
	// 4. 경로탐색 API 사용요청
	var startX = ${read.dp_nx};
	var startY = ${read.dp_ny};
	var endX = ${read.ep_nx};
	var endY = ${read.ep_ny};
	var passList = a;
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
	
	function moveMap(x,y){
		map.setCenter(new Tmapv2.LatLng(y,x));
		map.setZoom(13);
	}
 </script>
 <script>
 let Tour_no = ${read.mr_id};
 let u_id= "${user.userId}"; 
 $(document).ready(function (){
    $("#heart").on("click",function (){
        $.ajax({
           type : 'POST',
            url : '${pageContext.request.contextPath }/myroute/mrview/click',
            headers: {"content-type": "application/json"},
            data: JSON.stringify({mr_id: Tour_no, userId:u_id }),
            success : function (result){
                if(result==1){
                    $("#click_h").attr("src","<c:url value="/resources/images/blank_heart.png"/>")
                }else{
                    $("#click_h").attr("src","<c:url value="/resources/images/full_heart.png"/>")
                }
            },
            error : function (){
                alert("로그인후 이용해주세요!");
                location.href="/user/login";
            }
        });
    });
 });
 </script>
     
</body>
</html>