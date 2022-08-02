<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
<link rel='stylesheet' href='resources/css/menu2.css'>
	<title>KoneyGram</title>
</head>
<body>
	 <div class="navigation">
    <ul>
        <li class = "list active">
            <b></b>
            <b></b>
            <a href="#">
                <span class="icon"><ion-icon name="home-outline"></ion-icon></span>
                <span class="title">Main Home</span>
            </a>
        </li>
        <li class = "list">
            <b></b>
            <b></b>
            <a href="#">
                <span class="icon"><ion-icon name="calendar-clear-outline"></ion-icon></span>
                <span class="title">Scheduler</span>
            </a>
        </li>
        <li class = "list">
            <b></b>
            <b></b>
            <a href="#">
                <span class="icon"><ion-icon name="chatbubbles-outline"></ion-icon></span>
                <span class="title">Story</span>
            </a>
        </li>
        <li class = "list">
            <b></b>
            <b></b>
            <a href="#">
                <span class="icon"><ion-icon name="star-outline"></ion-icon></span>
                <span class="title">Festival</span>
            </a>
        </li>
        <li class = "list">
            <b></b>
            <b></b>
            <a href="#">
                <span class="icon"><ion-icon name="megaphone-outline"></ion-icon></span>
                <span class="title">Requirements</span>
            </a>
        </li>
        <li class = "list">
            <b></b>
            <b></b>
            <a href="#">
                <span class="icon"><ion-icon name="person-outline"></ion-icon></span>
                <span class="title">Login</span>
            </a>
        </li>
        <br/> <br/> <br/>
        <li class = "list">
            <div class = userinfo>
                <img src="/images/boy.png" alt="userimage">
                <span>홍길동입니다</span>
                <br/>
                <span>소개글</span>
                <br/>
                <button> 정보 수정</button><button>나의 일정 보러가기</button>
            </div>
        </li>
    </ul>
   </div>

   <div class="toggle">
        <ion-icon name="menu-outline" class="open"></ion-icon>
        <ion-icon name="close-outline" class="close"></ion-icon>
    </div>
    
   <script>
    //toggle버튼 바꾸기
    let menuToggle = document.querySelector('.toggle');
    let navigation = document.querySelector('.navigation')
    menuToggle.onclick = function(){
        menuToggle.classList.toggle('active');
        navigation.classList.toggle('active');
    }

    

    // 메뉴이동 스크립트
    let list = document.querySelectorAll('.list');
    for(let i = 0; i<list.length; i++){
        list[i].onclick = function(){
            let j = 0;
            while(j<list.length){
                list[j++].className='list';
            }
            list[i].className = 'list active';
        }
    }

   </script>
</body>
</html>