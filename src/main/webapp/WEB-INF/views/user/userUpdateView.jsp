<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
	 	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	 	<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
		<title>KoneyGram</title>
	</head>
	<script type="text/javascript">
		$(document).ready(function(){
			// 취소
			$(".cencle").on("click", function(){
				
				location.href = "/";
						    
			})
		
			$("#submit").on("click", function(){
				if($("#userPwd").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#userPwd").focus();
					return false;
				}
				if($("#userName").val()==""){
					alert("성명을 입력해주세요.");
					$("#userName").focus();
					return false;
				}
				if($("#userAge").val()==""){
					alert("나이를 입력해주세요.");
					$("#userAge").focus();
					return false;
				}
				if($("#userEmail").val()==""){
					alert("이메일을 입력해주세요.");
					$("#userEmail").focus();
					return false;
				}
				if($("#userIntro").val()==""){
					alert("자기소개를 입력해주세요.");
					$("#userIntro").focus();
					return false;
				}
				
			});
			
				
			
		})
	</script>
	<body style="margin-left:350px;">
	<%@ include file="../menu/menu1.jsp" %>
		<div class="container" style="margin-top:50px;">
		<div class="card border-primary mb-3" style="max-width: 20rem;">
		  <div class="card-header">회원정보수정</div>
		  <div class="card-body">
		    <h4 class="card-title">${user.userId}의 회원정보</h4>
		    <p class="card-text">
		    	<form action="/user/userUpdate" method="post" enctype="multipart/form-data">
		    		<div class="form-group has-feedback">
						<label class="control-label" for="userId">아이디</label>
						<input class="form-control" type="text" id="userId" name="userId" value="${user.userId}" readonly="readonly"/>
					</div>
					<div class="form-group has-feedback">
						<label class="control-label" for="userPwd">패스워드</label>
						<input class="form-control" type="password" id="userPwd" name="userPwd" />
					</div>
					<div class="form-group has-feedback">
						<label class="control-label" for="userName">성명</label>
						<input class="form-control" type="text" id="userName" name="userName" value="${user.userName}"/>
					</div>
					<div class="form-group has-feedback">
						<label class="control-label" for="userAge">나이</label>
						<input class="form-control" type="text" id="userAge" name="userAge" value="${user.userAge}"/>
					</div>
					<div class="form-group has-feedback">
						<label class="control-label" for="userEmail">이메일</label>
						<input class="form-control" type="text" id="userEmail" name="userEmail" value="${user.userEmail}"/>
					</div>
					<div class="form-group has-feedback">
						<label class="control-label" for="userIntro">자기소개</label>
						<input class="form-control" type="text" id="userIntro" name="userIntro" value="${user.userIntro}"/>
					</div>
					<div class="form-group has-feedback">
						<label class="control-label" for="pFile">프로필 사진</label>
						<input class="form-control" type="file" id="pFile" name="pFile" value="${user.stored_file_name}"/>
					</div>
					<div class="form-group has-feedback">
						<button class="btn btn-success" type="submit" id="submit">회원정보수정</button>
						<button class="cencle btn btn-danger" type="button">취소</button>
					</div>
				</form>
		    </p>
		  </div>
		</div>
		</div>
	</body>
</html>