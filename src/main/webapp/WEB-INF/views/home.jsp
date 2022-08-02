<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>

<html>
<head>
	<title>KoneyGram</title>
	<script	src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<script type="text/javascript">
	$(document).ready(function(){
		$("#loginBtn").on("click", function(){
			location.href="user/login";
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
	function loginfalse(){
		alert("로그인 실패");			
		window.history.back();		/* 뒤로가기*/
	}	
</script>
<body>
<%@ include file="menu/menu1.jsp" %>
	
</body>
</html>