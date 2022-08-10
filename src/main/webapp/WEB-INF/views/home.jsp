<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>

<html>
<head>
	<script src="/resources/js/mainpage/jquery.1.8.2.min.js"></script>
    <script src="/resources/js/mainpage/jquery.onebyone.min.js"></script>              
	<script src="/resources/js/mainpage/jquery.touchwipe.min.js"></script> 
	<title>KoneyGram</title>
	<link href="/resources/css/mainpage/jquery.onebyone.css" rel="stylesheet" type="text/css">
    <link href="/resources/css/mainpage/koneymain.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="/resources/css/mainpage/animate.css">     
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>

<script type="text/javascript">
	$(document).ready(function(){
		$("#loginBtn").on("click", function(){
			window.open('/user/login', 'pop01', 'top=10, left=10, width=500, height=600, status=no, menubar=no, toolbar=no, resizable=no');
		})
		$("#logoutBtn").on("click", function(){
			location.href="user/logout";
		})
		$("#registerBtn").on("click", function(){
			location.href="user/register";
		})
		$("#mypageBtn").on("click", function(){
			location.href="user/mypage";
		})
		$("#userInfoBtn").on("click", function(){
			location.href="user/adminlist";
		})
	})
	   
	 $(document).ready(function() { 
		
        $('#banner').oneByOne({
			className: 'oneByOne1',	         
			pauseByHover: false,     
			easeType: 'fadeIn',
			delay: 300,  
			slideShow: true,
		});  
		
		
	 });
	
</script>

<style type="text/css" media="screen">
		#wrapper{              
			width: 100%;     
			-webkit-user-select: none;	  			
		}
       
		#ep1{
			position:absolute;
			left: 36px;
			top: 50px; 
	
		}

    
		.otherExample{ 
			position: absolute;
			left: 36px;
			top: 520px;
		}
		.otherExample a{ 
			display: block;
			float: left;
			margin-right: 16px;
			color: #0066FF;
		}    
 		.otherExample a:hover{ 
			color: #B22222;
			text-decoration: underline;
		}     		
	</style>

<body>
<%@ include file="menu/menu1.jsp" %>

		<div class="oneByOne1" style="overflow: hidden;"><div id="banner" style="left: -2880px;"> 

<!-- animate.css  // nimate 0 ~ 7 애니메이션 속도 // 
애니메이션 효과 : lightSpeedIn, shake, flash, bounce, tada, swing, wobble, pulse, flip, flipInX, flipOutX, flipInY, flipOutY,  ... 
https://animate.style/  -->

			<!-- 1    -->

		<div class="oneByOne_item" style="display: none; left: 0px; background-color: #ffcbcd;" >     
			<span class="text1 animate0" style="display: none;">여행이야기!  <br>코니그램과 함께 나눠요!</span>			
			<span class="text2 animate1" style="display: none;">KoneyGram</span>
			<!-- 배경 -->
			<img src="/resources/images/mainpage/pinkbar.png" class="img1b animate1" data-animate="fadeIn" style="display: none;">
			<img src="/resources/images/mainpage/pinkbar.png" class="img2b animate1" data-animate="fadeIn" style="display: none;">
			<img src="/resources/images/mainpage/pinkbar.png" class="img3b animate1" data-animate="fadeIn" style="display: none;">
			<span class="text2 animate1" style="display: none;"><a href="/myroute/mrlist">보러가기</a></span>
			<!-- 이미지 -->
			<img src="/resources/images/mainpage/photo2.png" class="img2 animate2" data-animate="fadeInRightBig" style="display: none;">
			<img src="/resources/images/mainpage/photo1.png" class="img1 animate2" data-animate="fadeInUpBig" style="display: none;">
		</div>



		<!--  2   -->


		<div class="oneByOne_item" style="display: none; left: 1920px; background-color: #ffce67;">
			<!-- 배경 -->
			<img src="/resources/images/mainpage/ring1.png" class="img21b animate1" data-animate="fadeIn" style="display: none;">
			<img src="/resources/images/mainpage/ring1.png" class="img22b animate1" data-animate="fadeIn" style="display: none;">
			<img src="/resources/images/mainpage/ring3.png" class="img23b animate1" data-animate="fadeIn" style="display: none;">
			<!-- 이미지 -->
			<img src="/resources/images/mainpage/caren.png" class="img21 animate0" data-animate="fadeInRight" style="display: none;">
			<img src="/resources/images/mainpage/tra.png" class="img22 animate1" data-animate="fadeIn" style="display: none;">
			<img src="/resources/images/mainpage/memo1.png" class="img23 animate1" data-animate="fadeIn" style="display: none;">
			<img src="/resources/images/mainpage/memo2.png" class="img24 animate1" data-animate="fadeIn" style="display: none;">
			<img src="/resources/images/mainpage/memo3.png" class="img25 animate1" data-animate="fadeIn" style="display: none;">
			<img src="/resources/images/mainpage/cahr.png" class="img26 animate3" data-animate="fadeIn" style="display: none;">

			<span class="text1 animate0" style="display: none;">여행일정은~</span>			
			<span class="text2 animate1" style="display: none;">KoneyGram</span>
			<span class="text2 animate1" style="display: none;"><a href="/tours/tour">일정만들기</a></span>
								
		</div>

		<div class="oneByOne_item" style="display: none; left: 960px; background-color: #c6d5fe;">          

			<!-- 배경 -->
			<img src="/resources/images/mainpage/map.png" class="img30b animate1" data-animate="fadeIn" style="display: none;">
			<img src="/resources/images/mainpage/cl3.png" class="img31b animate1" data-animate="fadeInLeft" style="display: none;">
			<img src="/resources/images/mainpage/cl2.png" class="img32b animate1" data-animate="fadeInRight" style="display: none;">
			<img src="/resources/images/mainpage/cl1.png" class="img33b animate1" data-animate="fadeInRight" style="display: none;">

			<span class="text1 animate0" style="display: none;">축제정보를 <br>알려줘!</span>			
			<span class="text2 animate1" style="display: none;">KoneyGram</span>
			<span class="text2 animate1" style="display: none;"><a href="/festival/listf">보러가기</a></span>
			<!-- 이미지 -->
			<img src="/resources/images/mainpage/spot9.png" class="img39 animate1" data-animate="fadeIn" style="display: none;">
			<img src="/resources/images/mainpage/spot8.png" class="img38 animate1" data-animate="fadeIn" style="display: none;">
			<img src="/resources/images/mainpage/spot7.png" class="img37 animate2" data-animate="fadeIn" style="display: none;">
			<img src="/resources/images/mainpage/spot6.png" class="img36 animate2" data-animate="fadeIn" style="display: none;">
			<img src="/resources/images/mainpage/spot5.png" class="img35 animate3" data-animate="fadeIn" style="display: none;">
			<img src="/resources/images/mainpage/spot4.png" class="img34 animate3" data-animate="fadeIn" style="display: none;">
			<img src="/resources/images/mainpage/spot3.png" class="img33 animate4" data-animate="fadeIn" style="display: none;">
			<img src="/resources/images/mainpage/spot2.png" class="img32 animate4" data-animate="fadeIn" style="display: none;">
			<img src="/resources/images/mainpage/spot1.png" class="img31 animate4" data-animate="fadeIn" style="display: none;">
			

										
		</div>

</body>
</html>