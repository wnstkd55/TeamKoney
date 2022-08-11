<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src='http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js'></script>
<link href='/resources/css/menu3.css' rel="stylesheet" type='text/css' media='screen'>
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">

	<title>KoneyGram</title>
</head>
<style>
.navigation{
    position: fixed;
    inset: 20px;
    background: #5a5a5a;
    color: #fff;
    backdrop-filter: blur(10px);
    width: 80px;
    border-left: 10px solid rgba(168, 168, 168, 0.753);
    border-radius: 50px;
    overflow: hidden;
    box-shadow: 15px 15px 25px rgba(149, 144, 144, 0.05);
    transition: 0.5s;
}

.navigation.active{
    width:300px;
    border-radius: 20px;
}

.toggle{
    position: absolute;
    bottom:15px;
    right: 15px;
    width: 50px;
    height: 50px;
    background: rgba(250, 250, 250, 0.841);
    border-radius:50%;
    box-shadow: 5px 5px 10px rgba(0, 0, 0, 0.15);
    cursor: pointer;
    display: flex;
    justify-content: center;
    align-items: center;
}

.toggle::before{
    content: '';
    position: absolute;
    width: 26px;
    height: 3px;
    border-radius: 3px;
    background: #78c2ad;
    transform: translateY(-5px);
    transition: 1s;
}

.toggle::after{
    content: '';
    position: absolute;
    width: 26px;
    height: 3px;
    border-radius: 3px;
    background: #78c2ad;
    transform: translateY(5px);
    transition: 1s;
}

.navigation.active .toggle::before{
    transform:translateY(0) rotate(-405deg);
}
.navigation.active .toggle::after{
    transform:translatey(0) rotate(225deg);
}
.navigation ul{
    position: absolute;
    top: 0;
    left: 0;
    width:100%;
}

.navigation ul li{
    position: relative;
    list-style: none;
    width: 100%;
    border-top-left-radius: 30px;
    border-bottom-left-radius: 30px;
    /* background: #fff; */
}

.navigation ul li:hover{
    background: rgb(255, 255, 255);
}

.navigation ul li:nth-child(1){
    top: 20px;
    margin-bottom:40px;
    background: none;
}

.navigation ul li:not(:first-child):hover::before{
    content: '';
    position: absolute;
    top: -20px;
    right: 0;
    width: 20px;
    height: 20px;
    background: transparent;
    border-bottom-right-radius: 20px;
    box-shadow: 7.5px 7.5px 0 7.5px rgb(255, 255, 255);
}

.navigation ul li:not(:first-child):hover::after{
    content: '';
    position: absolute;
    bottom: -20px;
    right: 0;
    width: 20px;
    height: 20px;
    background: transparent;
    border-top-right-radius: 20px;
    box-shadow: 7.5px -7.5px 0 7.5px rgb(255, 255, 255);
}

.navigation ul li a{
    position: relative;
    display: block;
    width: 100%;
    display: flex;
    text-decoration: none;
    color: rgb(255, 255, 255);
}

.navigation ul li:hover:not(:first-child) a{
    color: #78c2ad;
}

.navigation ul li a .icon{
    position:relative;
    display: block;
    min-width: 60px;
    height: 60px;
    line-height: 70px;
    text-align: center;
}

.navigation ul li a .icon ion-icon{
    font-size:1.75em;
}

.navigation ul li a .title{
    position: relative;
    display: block;
    padding: 0 10px;
    height: 60px;
    line-height: 60px;
    text-align: start;
    white-space: nowrap;
}

.navigation ul li .userinfo{
    display: none;
    height: 180px;
}

.navigation.active ul li .userinfo{
    margin-right: 10px;
    display: block;
    background: rgba(255, 255, 255, 0.295);
    transition: 0.5s;
    /* border-top-left-radius: 20px;
    border-bottom-left-radius: 20px; */
    border-radius: 20px;
}

.navigation.active ul li .userinfo img{
    width: 100px;
    height: 100px;
    
}

</style>
<body>
	 <div class="navigation" style="z-index:50;">
        <ul style="padding-left: 0px;">
            <li class = "list">
                <b></b>
                <b></b>
                <a href="/">
                    <span class="icon"></span>
                    <span class="title"><img src="/resources/images/contents/koney_logo500.png" style="width:200px; height: 100px;"></span>
                </a>
                <br/>
                <br/>
                <c:if test="${user!= null}">
                    <div class = "userinfo">
                        <img src="/resources/upload/${user.stored_file_name}" alt="userimage">
                        <span>${user.userName}님 환영합니다!</span>
                        <br/>
                        <span>${user.userIntro }</span>
                        <br/>
				      	<c:if test="${user.userId == 'admin' }">
				   			<a href="/user/adminlist"><button type="button" class="btn btn-outline-secondary btn-sm" style="margin-left: 10%;">회원관리</button></a>
				    	</c:if>
				    	<c:if test="${user.userId !='admin' }">
				   			<a href="/user/mypage"><button type="button" class="btn btn-outline-secondary btn-sm" style="margin-left: 10%;">마이페이지</button></a>
				    	</c:if>
                    </div>
               </c:if>
               <c:if test="${user== null}">
               	<div class = "userinfo" style="height: 50px;">
	            	<span>&nbsp &nbsp 로그인을 해주세요! </span>
                </div>
               </c:if>
            </li>
            <li class = "list">
                <b></b>
                <b></b>
                <a href="/tours/tour">
                    <span class="icon"><ion-icon name="calendar-clear-outline"></ion-icon></span>
                    <span class="title">Scheduler</span>
                </a>
            </li>
            <li class = "list">
                <b></b>
                <b></b>
                <a href="/myroute/mrlist">
                    <span class="icon"><ion-icon name="chatbubbles-outline"></ion-icon></span>
                    <span class="title">Story</span>
                </a>
            </li>
            <li class = "list">
                <b></b>
                <b></b>
                <a href="/festival/listf">
                    <span class="icon"><ion-icon name="star-outline"></ion-icon></span>
                    <span class="title">Festival</span>
                </a>
            </li>
            <li class = "list">
                <b></b>
                <b></b>
                <a href="/board/list">
                    <span class="icon"><ion-icon name="megaphone-outline"></ion-icon></span>
                    <span class="title">Requirements</span>
                </a>
            </li>
            <li class = "list">
                <b></b>
                <b></b>
               <c:if test="${user == null}">
                <a href="/user/login">
                    <span class="icon"><ion-icon name="log-in-outline"></ion-icon></span>
                    <span class="title">Login</span>
                </a>
                </c:if>
                    <c:if test="${user != null}">
                <a href="/user/logout">
                    <span class="icon"><ion-icon name="log-out-outline"></ion-icon></span>
                    <span class="title">Logout</span>
                </a>
                </c:if>
            </li>
            
            
        </ul>
        <div class="toggle"></div>
       </div>

       <script>
            let navigation = document.querySelector('.navigation');
            let toggle = document.querySelector('.toggle');

            toggle.onclick=function(){
                navigation.classList.toggle('active')
            }
       </script>
</body>
</html>