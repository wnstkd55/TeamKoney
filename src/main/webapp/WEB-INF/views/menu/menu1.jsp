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
<body>
	 <div class="navigation" style="z-index:50;">
        <ul style="padding-left: 0px;">
            <li class = "list">
                <b></b>
                <b></b>
                <a href="/">
                    <span class="icon"></span>
                    <span class="title"><img src="/resources/images/contents/logo150a.png" style="width:200px; height: 100px;"></span>
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
				   			<a href="/user/adminlist"><button type="button" class="btn btn-outline-secondary">회원관리</button></a>
				    	</c:if>
				    	<c:if test="${user.userId !='admin' }">
				   			<a href="/user/mypage"><button type="button" class="btn btn-outline-secondary">마이페이지</button></a>
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