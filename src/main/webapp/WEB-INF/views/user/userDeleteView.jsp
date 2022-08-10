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
				
				$.ajax({
					url : "/user/passChk",
					type : "POST",
					dataType : "json",
					data : $("#delForm").serializeArray(),
					success: function(data){
						
						if(data==0){
							alert("패스워드가 틀렸습니다.");
							return;
						}else{
							if(confirm("회원탈퇴하시겠습니까?")){
								$("#delForm").submit();
							}
							
						}
					}
				})
			});
			
				
			
		})
	</script>
	<body style="margin-left:350px;">
	<%@ include file="../menu/menu1.jsp" %>
		<div class="container" style="width: 824px; margin-top: 100px;">
			<div class="card mb-3" style="height: 502px; width: 502px;">
			  <h3 class="card-header">회원 탈퇴</h3>
			  <div class="card-body">
			  	<img alt="deleteuser" src="/resources/images/contents/delete-user.png" style="width:400px; height:300px;">
			  </div>
			  <div class="card-body">
			    <h5 class="card-title">${user.userId }님의 회원삭제</h5>
			  </div>
			  <div class="card-body">
			   <form action="/user/userDelete" method="post" id="delForm">
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
					<input class="form-control" type="text" id="userName" name="userName" value="${user.userName}" readonly="readonly"/>
				</div>
				</form>
			  </div>
			  <div class="card-footer text-muted">
			  	<div class="form-group has-feedback">
				<button class="btn btn-success" type="button" id="submit">회원탈퇴</button>
				<button class="cencle btn btn-danger" type="button">취소</button>
			</div>
			  </div>
			</div>
			<div>
				<c:if test="${msg == false}">
					비밀번호가 맞지 않습니다.
				</c:if>
			</div>
		</div>
		
	</body>
	
</html>