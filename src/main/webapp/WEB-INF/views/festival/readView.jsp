<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
		<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
		<link href="/resources/css/style_festival2.css" rel="stylesheet">
	 	<title>게시판</title>
	</head>
	
	<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='readForm']");

			// 목록
			$(".list_btn").on("click", function(){
			
				location.href = "/festival/listf?page=${scri.page}"
							  +"&perPageNum=${scri.perPageNum}"
							  +"&searchType=${scri.searchType}&keyword=${scri.keyword}";
			})
			
		})
	</script>
	
	<body>
	<%@ include file="../menu/menu1.jsp" %>
		
			<div class="container" style="margin-left:350px;margin-right: 0px;width: 1124px;">
			<div class="left_content" style="margin-top:30px; margin-right:10px;">
			<ol class="breadcrumb">
			  <li class="breadcrumb-item list_btn"><a href="#">list</a></li>
			  <li class="breadcrumb-item active">festival</li>
			</ol>
				<h4>${read.f_name}</h4>
				<span style="font-size: 12px;">${read.f_home}</span>
				<form name="readForm" role="form" method="post">
				  <input type="hidden" id="bno" name="bno" value="${read.f_code}" >
				  <input type="hidden" id="page" name="page" value="${scri.page}" > 
				  <input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}" > 
				  <input type="hidden" id="searchType" name="searchType" value="${scri.searchType}" > 
				  <input type="hidden" id="keyword" name="keyword" value="${scri.keyword}" > 
				</form>
			<hr />
			<div class="accordion" id="accordionExample">
			  <div class="accordion-item">
			    <h2 class="accordion-header" id="headingOne">
			      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
			       <span>축제 정보 보기</span>
			      </button>
			    </h2>
			    <div id="collapseOne" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#accordionExample" style="">
			      <div class="accordion-body">
					<label for="f_startdate">축제시작일: &nbsp</label><c:out value="${read.f_startdate}" /> <br/>
					<label for="f_enddate">축제종료일: &nbsp</label><c:out value="${read.f_enddate}" /> <br/>
					<label for="f_mainc">주관기관: &nbsp</label><c:out value="${read.f_mainc}" /> <br/>
					<label for="f_tel">전화번호: &nbsp</label><c:out value="${read.f_tel}" /> <br/>
					<label for="f_content">축제정보: &nbsp</label><c:out value="${read.f_content}" /> <br/>
			      </div>
			    </div>
			  </div>
			  </div>
			</div>
			<div class="right_content" style="margin-top:30px; margin-left:10px;">
			 <jsp:include page="festivalMap.jsp"></jsp:include>
			 </div>
			</div>
		
	</body>
</html>