<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>

<html>
<head>
	<title>Home</title>
	
	<link href='/resources/css/contents.css' rel="stylesheet" type="text/css">
</head>
<a href="/board/list">게시판</a><br />
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
	<div id ="nav">
		<%@ include file="menu/menu1.jsp" %>
	</div>
	<form name='homeForm'>
		<c:if test="${user == null}">
			<div>
				<button id="loginBtn" type="button">로그인</button>
				<button id="registerBtn" type="button">회원가입</button>
			</div>
		</c:if>
		<c:if test="${user != null and user.userId != 'admin'}">
			<div>
				<p>${user.userId}님 환영 합니다.</p>
				<button id="mypageBtn" type="button">마이페이지</button>
				<button id="logoutBtn" type="button">로그아웃</button>
			</div>
		</c:if>
		<c:if test="${user.userId == 'admin' }">
			<div>
				<p>관리자님 환영 합니다.</p>
				<button id="userInfoBtn" type="button">회원관리</button>
				<button id="logoutBtn" type="button">로그아웃</button>
			</div>
		</c:if>
		<c:if test="${msg == false}">
			<script> loginfalse(); </script>
		</c:if>
	</form>
</body>
</html>