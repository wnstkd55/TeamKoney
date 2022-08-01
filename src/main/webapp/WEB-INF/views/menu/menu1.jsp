<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src='http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js'></script>
<link href='//code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css' rel='stylesheet' type='text/css'>
<link href='/resources/css/style.css' rel="stylesheet" type="text/css">
<link rel='stylesheet' href='http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/themes/smoothness/jquery-ui.css'>
<script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>
	<title>KoneyGram</title>
</head>
<body>
	 <header>
	  <div class="container">
	    <span id="home"><span class="ion-camera"></span></span>
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
  <div class="logo"><a href="#"><span class="ion-camera"></span></a></div>
  <span id="close-menu"><span class="ion-close-round"></span></span>
  <div class="container">
    <div class="box">
      <ul>
        <li><a href="#">나의 일정 만들기</a></li>
        <li><a href="#">지역 축제 게시판</a></li>
        <li><a href="#">KoneyStory</a></li>
        <li><a href="#">관광지 추가 요청게시판 </a></li>
      </ul>
      <ul>
        <li><a class="ion-social-facebook" href="#" target="_blank"></a></li>
        <li><a class="ion-social-twitter" href="#" target="_blank"></a></li>
        <li><a class="ion-social-instagram" href="#" target="_blank"></a></li>
      </ul>
      <div class="sign-up">
        <a href="/user/login">Login <span class="ion-arrow-right-c"></span>				</a>
      </div>
    </div>
  </div>
</menu>
<script  src="/resources/js/index.js"></script>
</body>
</html>