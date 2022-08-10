<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	 	<title>KoneyGram</title>
	</head>
	<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='updateForm']");
			
			$(".cancel_btn").on("click", function(){
				location.href = "/board/readView?bno=${replyUpdate.bno}"
					   + "&page=${scri.page}"
					   + "&perPageNum=${scri.perPageNum}"
					   + "&searchType=${scri.searchType}"
					   + "&keyword=${scri.keyword}";
			})
			
		})
		
	</script>
<body style="margin-left:350px;">
		<%@ include file="../menu/menu1.jsp" %>
			<div class="container" style="margin-top:50px; margin-left: 250px;">
				<div class="card border-primary mb-3" style="max-width: 20rem;">
				  <div class="card-header">관리자 댓글 수정</div>
				  <div class="card-body">
				  	<img alt="admin" src="/resources/images/contents/admin.png" style="width:100%">
				  </div>
				  <div class="card-body">
					<form name="updateForm" role="form" method="post" action="/board/replyUpdate">
						<input type="hidden" name="bno" value="${replyUpdate.bno}" readonly="readonly"/>
						<input type="hidden" id="rno" name="rno" value="${replyUpdate.rno}" />
						<input type="hidden" id="page" name="page" value="${scri.page}"> 
						<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
						<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
						<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
						<div class="form-group">
						  <div class="form-floating mb-3">
						    <input type="text" class="form-control" id="content" name="content" value="${replyUpdate.content}"/>
						    <label for="floatingInput">댓글 내용</label>
						  </div>
						 </div>
						<div>
							<button type="submit" class="update_btn btn btn-outline-primary">저장</button>
							<button type="button" class="cancel_btn btn btn-outline-danger">취소</button>
						</div>
					</form>
				</div>
			</div>
			</div>
	</body>
</html>