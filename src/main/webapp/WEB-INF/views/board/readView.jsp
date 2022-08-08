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
			var formObj = $("form[name='readForm']");
			
			// 수정 
			$(".update_btn").on("click", function(){
				formObj.attr("action", "/board/updateView");
				formObj.attr("method", "get");
				formObj.submit();				
			})
			
			// 삭제
			$(".delete_btn").on("click", function(){
				
				var deleteYN = confirm("삭제하시겠습니까?");
				if(deleteYN == true){
					
				formObj.attr("action", "/board/delete");
				formObj.attr("method", "post");
				formObj.submit();
					
				}
			})
			

			// 목록
			$(".list_btn").on("click", function(){
			
				location.href = "/board/list?page=${scri.page}"
							  +"&perPageNum=${scri.perPageNum}"
							  +"&searchType=${scri.searchType}&keyword=${scri.keyword}";
			})
			
			//댓글
			$(".replyWriteBtn").on("click", function(){
				  var formObj = $("form[name='replyForm']");
				  formObj.attr("action", "/board/replyWrite");
				  formObj.submit();
			});
			
			//댓글 수정 View
			$(".replyUpdateBtn").on("click", function(){
				location.href = "/board/replyUpdateView?bno=${read.bno}"
								+ "&page=${scri.page}"
								+ "&perPageNum=${scri.perPageNum}"
								+ "&searchType=${scri.searchType}"
								+ "&keyword=${scri.keyword}"
								+ "&rno="+$(this).attr("data-rno");
			});
					
			//댓글 삭제 View
			$(".replyDeleteBtn").on("click", function(){
				location.href = "/board/replyDeleteView?bno=${read.bno}"
					+ "&page=${scri.page}"
					+ "&perPageNum=${scri.perPageNum}"
					+ "&searchType=${scri.searchType}"
					+ "&keyword=${scri.keyword}"
					+ "&rno="+$(this).attr("data-rno");
			});
			
		})
	</script>
	
	<body style="margin-left:350px;">
		<%@ include file="../menu/menu1.jsp" %>
		
		<div class="container" style="width:1000px;">
			<div class="koney_place">
				<img alt="koney_placeimg" src="/resources/images/contents/koney_place.jpg" style="width:100%;">
			</div>
			<br/>
			<ol class="breadcrumb">
			  <li class="breadcrumb-item"><a href="/board/list">List</a></li>
			  <li class="breadcrumb-item active">View</li>
			</ol>
			<section id="container">
				<form name="readForm" role="form" method="post">
				  <input type="hidden" id="bno" name="bno" value="${read.bno}" >
				  <input type="hidden" id="page" name="page" value="${scri.page}" > 
				  <input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}" > 
				  <input type="hidden" id="searchType" name="searchType" value="${scri.searchType}" > 
				  <input type="hidden" id="keyword" name="keyword" value="${scri.keyword}" > 
				</form>
				<table class="table">
					<colgroup>
						<col width="15%"/>
						<col width="35%"/>
						<col width="15%"/>
						<col width="35%"/>
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">글 번호</th>
							<td>${read.bno}</td>
							<th scope="row">조회수</th>
							<td>${read.hit}</td>
						</tr>
						<tr>
							<th scope="row">작성자</th>
							<td>${read.writer}</td>
							<th scope="row">작성일</th>
							<td><fmt:formatDate value="${read.regdate}" pattern="yyyy-MM-dd" /></td>
						</tr>
						<tr>
							<th scope="row">제목</th>
							<td colspan="3">${read.title}</td>
						</tr>
						<tr>
							<td colspan="4" class="view_text" style="margin-left:20px; margin-right:20px; height: 300px; background:#f6f6f6;">
								<c:out value="${read.content}" />
							</td>
						</tr>
					</tbody>
				</table>
				
				<%-- <table>
					<tbody>
						<tr>
							<td>
								<label for="title">제목</label><input type="text" id="title" name="title" value="${read.title}" readonly="readonly" />
							</td>
						</tr>	
						<tr>
							<td>
								<label for="content">내용</label><textarea id="content" name="content" readonly="readonly"><c:out value="${read.content}" /></textarea>
							</td>
						</tr>
						<tr>
							<td>
								<label for="writer">작성자</label><input type="text" id="writer" name="writer" value="${read.writer}"  readonly="readonly"/>
							</td>
						</tr>
						<tr>
							<td>
								<label for="regdate">작성날짜</label>
								<fmt:formatDate value="${read.regdate}" pattern="yyyy-MM-dd" />					
							</td>
						</tr>		
					</tbody>			
				</table> --%>
				
				
				<c:if test="${(user.userId eq read.userId || user.userId eq 'admin') && user.userId != null}">
					<div class="btn-group btn-group-sm" role="group" style="float:right;">
						<button type="submit" class="list_btn btn btn-outline-primary">목록</button>	
						<button type="submit" class="update_btn btn btn-outline-info">수정</button>
						<button type="submit" class="delete_btn btn btn-outline-danger">삭제</button>
					</div>
				</c:if>
				<br/>
				<br/>
				<hr/>
				<!-- 댓글 -->
				<div id="reply">
					<ol class="replyList">
					    <c:forEach items="${replyList}" var="replyList">
					    	<li>
						        <p>
						        작성자 : ${replyList.writer}<br />
						        작성 날짜 :  <fmt:formatDate value="${replyList.regdate}" pattern="yyyy-MM-dd" />
						        </p>
						
						        <p>${replyList.content}</p>
						        <c:if test="${user.userId eq 'admin'}">
							        <div class="btn-group btn-group-sm" role="group">
										<button type="button" class="replyUpdateBtn btn btn-outline-info" data-rno="${replyList.rno}">수정</button>
										<button type="button" class="replyDeleteBtn btn btn-outline-danger" data-rno="${replyList.rno}">삭제</button>
									</div>
								</c:if>
					    	</li>
					    </c:forEach>   
					</ol>
				</div>
				<form name="replyForm" method="post">
					<input type="hidden" id="bno" name="bno" value="${read.bno}" />
					<input type="hidden" id="page" name="page" value="${scri.page}"> 
					<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
					<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
					<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
					
					<c:if test="${user.userId eq 'admin'}">
						<div>
						    <label for="writer">댓글 작성자</label><input type="text" id="writer" name="writer" />
						    <br/>
						    <label for="content">댓글 내용</label><input type="text" id="content" name="content" />
						    <button type="button" class="replyWriteBtn btn btn-outline-primary">작성</button>
						</div>
					</c:if>
				</form>
			</section>
			<hr />
		</div>
	</body>
</html>