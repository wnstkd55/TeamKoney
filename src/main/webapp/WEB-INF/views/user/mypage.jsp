<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>

<html>
<head>
		<!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<!-- 부가적인 테마 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 
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

		<p>${user.userId}님 환영 합니다.</p>
		<p>${user.userIntro}</p>
		<button id="userUpdateBtn" type="button">회원정보수정</button>
		<button id="userDeleteBtn" type="button">회원탈퇴</button>

</body>
</html>