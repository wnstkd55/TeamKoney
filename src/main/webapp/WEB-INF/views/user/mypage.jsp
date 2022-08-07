<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>

<html>
<head>
	
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
 	<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
 	<link rel='stylesheet' type='text/css' media='screen' href='/resources/css/mypage.css'>
</head>
<script type="text/javascript">
	$(document).ready(function(){
		$("#userUpdateBtn").on("click", function(){
			location.href="userUpdateView";
		})
		$("#userDeleteBtn").on("click", function(){
			location.href="userDeleteView";
		})
	})
</script>
<body>
<div class = "menu">
<%@ include file="../menu/menu1.jsp" %>
</div>
	<div class="card">
        <div class="imgbx">
            <img src="/resources/upload/${user.stored_file_name}" alt="userimage">
        </div>
        <div class="content">
            <div class="details">
                <h2>${user.userId}<br><span>${user.userIntro}</span></h2>
                <div class="data">
                    <h3>342<br><span>게시된 일정수</span></h3>
                    <h3>285<br><span>받은 좋아요수</span></h3>
            </div>
            <div class="actionBtn">
                <button id="userUpdateBtn" type="button">회원정보수정</button>
                <button id="userDeleteBtn" type="button">회원탈퇴</button>
            </div>
        	</div>
    	</div>
    </div>

</body>
</html>