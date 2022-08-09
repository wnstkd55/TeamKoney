<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>

<html>
<head>
	
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
 	<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
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
<body style="margin-left:350px;">
<div class = "menu">
<%@ include file="../menu/menu1.jsp" %>
</div>
	<%-- <div class="card">
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
    </div> --%>
	<div class="container" style="width:1000px; text-align:center;">
		<div class="card mb-3" style="width:600px; height: 800px;">
		  <h3 class="card-header">MyPage</h3>
		    <h5 class="card-title">${user.userId} 님 환영합니다!</h5>
		  <img class="d-block user-select-none"  role="img" style="font-size:1.125rem;text-anchor:middle; width:300px; height:300px; margin-left: 150px;margin-right: 0px;" src="/resources/upload/${user.stored_file_name}" alt="userimage"/>
		  <div class="card-body">
		  	<div class="accordion" id="accordionExample">
			    <div class="accordion-item">
			    <h2 class="accordion-header" id="headingTwo">
			      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
			        정보보기
			      </button>
			    </h2>
			    <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
			      <div class="accordion-body">
			        <strong>자기소개</strong>
			        <br/>
			        ${user.userIntro}
			         <br/>
			         <a href="userUpdateView" class="card-link">나의 정보 수정</a>
		    		 <a href="userDeleteView" class="card-link">회원탈퇴하기</a>
			      </div>
			    </div>
			  </div>
		  </div>
		  </div>
		</div>
	</div>
</body>
</html>