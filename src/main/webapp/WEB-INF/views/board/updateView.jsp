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
			var formObj = $("form[name='updateForm']");
			
			// 취소 버튼
				$(".cancel_btn").on("click", function(){
					event.preventDefault();
					location.href = "/board/readView?bno=${update.bno}"
						   + "&page=${scri.page}"
						   + "&perPageNum=${scri.perPageNum}"
						   + "&searchType=${scri.searchType}"
						   + "&keyword=${scri.keyword}";
				})
			
			//수정 버튼
			$(".update_btn").on("click", function(){
				if(fn_valiChk()){
					return false;
				}
				formObj.attr("action", "/board/update");
				formObj.attr("method", "post");
				formObj.submit();
			})
		})
			
		function fn_valiChk(){
			var updateForm = $("form[name='updateForm'] .chk").length;
			for(var i = 0; i<updateForm; i++){
				if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
					alert($(".chk").eq(i).attr("title"));
					return true;
				}
			}
		}
		
	</script>
	<body style="margin-left:350px;">
	<%@ include file="../menu/menu1.jsp" %>
		<div class="container" style="width:1000px;">
				<h3>게시글 수정 페이지</h3>
				<ol class="breadcrumb">
				  <li class="breadcrumb-item"><a href="/board/list">List</a></li>
				  <li class="breadcrumb-item active">Update View</li>
				</ol>
				<form name="updateForm" role="form" method="post" action="/board/update">
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
							<td>${update.bno}</td>
						</tr>
						<tr>
							<th scope="row">작성자</th>
							<td>${update.writer}</td>
							<th scope="row">작성일</th>
							<td><fmt:formatDate value="${update.regdate}" pattern="yyyy-MM-dd"/></td>
						</tr>
						<tr>
							<th scope="row">제목</th>
							<td colspan="3"><input type="text" id="title" name="title" value="${update.title}" class="chk" title="제목을 입력하세요."/></td>
						</tr>
						<tr>
							<td colspan="4" class="view_text" style="margin-left:20px; margin-right:20px; height: 300px; background:#f6f6f6;">
								<textarea id="content" name="content" class="chk" title="내용을 입력하세요." style="height:300px; resize: vertical; width:1000px;">
									<c:out value="${update.content}" />
								</textarea>
							</td>
						</tr>
					</tbody>
				</table>
				<hr />
					<div>
						<button type="submit" class="update_btn btn btn-outline-info">저장</button>
						<button type="submit" class="cancel_btn btn btn-outline-danger">취소</button>
					</div>
				</form>
		</div>
	</body>
</html>