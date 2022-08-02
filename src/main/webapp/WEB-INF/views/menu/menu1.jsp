<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src='http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js'></script>
<link href='//code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css' rel='stylesheet' type='text/css'>
<link href='/resources/css/style.css' rel="stylesheet" type="text/css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>
	<title>KoneyGram</title>
</head>
<body>
	 <header>
	  <div class="container">
	    <span id="home"><a href="/"><span class="ion-camera"></span></span></a>
	    <div class="box">
	      <ul>
	        <li><a href="/tours/tour">나의 일정 만들기</a></li>
	        <li><a href="/festival/listf">지역 축제 게시판</a></li>
	        <li><a href="/myroute/mrlist">KoneyStory</a></li>
	        <li><a href="/board/list">관광지 추가 요청게시판 </a></li>
	      </ul>
	    </div>
	    <span id="menu"><span class="ion-navicon-round"></span></span>
	  </div>
	</header>
<menu>
  <div class="logo"><a href="/"><span class="ion-camera"></span></a></div>
  <span id="close-menu"><span class="ion-close-round"></span></span>
  <div class="container">
    <div class = userinfo>
    	<c:if test="${user != null}">
    		<span>${user.userId}님 환영합니다!</span><br/><br/>
    		<img alt="userPhoto" src="/resources/images/userphoto/boy.png" style="width:200px; height:200px;"><br/><br/>
    		<span>${user.userIntro }</span><br/><br/>
    	</c:if>
    </div>
    <div class="box">
      
      <c:if test="${user != null}">
      		<ul>
	      	<c:if test="${user.userId == 'admin' }">
	   			<li><a href="/user/adminlist">회원관리 <span class="ion-arrow-right-c"></span></a></li>
	    	</c:if>
	    	<c:if test="${user.userId !='admin' }">
	   			<li><a href="/user/mypage">마이페이지 <span class="ion-arrow-right-c"></span></a></li>
	    	</c:if>
	    	</ul>
    	</c:if>
      
      <ul style="font-size: 20px;">
        <li><a href="/tours/tour">나의 일정 만들기</a></li>
        <li><a href="/festival/listf">지역 축제 게시판</a></li>
        <li><a href="/myroute/mrlist">KoneyStory</a></li>
        <li><a href="/board/list">관광지 추가 요청게시판 </a></li>
      </ul>
      <ul style="font-size: 20px;">
        <li><a class="ion-social-facebook" href="#" target="_blank"></a></li>
        <li><a class="ion-social-twitter" href="#" target="_blank"></a></li>
        <li><a class="ion-social-instagram" href="#" target="_blank"></a></li>
      </ul>
      <div class="sign-up">
      	<c:if test="${user == null}">
        	<a href="/user/login">Login <span class="ion-arrow-right-c"></span></a>
        </c:if>
        <c:if test="${user != null}">
        	<a href="/user/logout">Logout <span class="ion-arrow-right-c"></span></a>
        </c:if>
      </div>
    </div>
  </div>
</menu>
<script  src="/resources/js/index.js"></script>
</body>
</html>