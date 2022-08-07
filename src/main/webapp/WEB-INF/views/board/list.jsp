<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>

	<head>
	<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
	 	<title>게시판</title>
	</head>
	
	<style>
		table a{
			text-decoration: none;
		}
	</style>
	
	<body style="margin-left:350px;">
		<div id="root">
			<%@ include file="../menu/menu1.jsp" %>
			
			<section id="container" style="margin-top:100px;">
				<div>
					<%@include file="nav.jsp" %>
				</div>
				<form role="form" method="get">
					<table class="table table-hover" style="width: 1000px;">
						<tr class="table-primary"><th>번호</th><th>제목</th><th>작성자</th><th>등록일</th><th>조회수</th><th>답변상태</th></tr>
						
						<c:forEach items="${list}" var = "list">
							<tr>
								<td><c:out value="${list.bno}" /></td>
								<td>
									<a href="/board/readView?bno=${list.bno}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}"><c:out value="${list.title}" /></a>
								</td>
								<td><c:out value="${list.writer}" /></td>
								<td><fmt:formatDate value="${list.regdate}" pattern="yyyy-MM-dd"/></td>
								<td><c:out value="${list.hit}" /></td>
								<td><c:out value="${list.answer}" /></td>
							</tr>
						</c:forEach>
						
					</table>
					
					<div class="search">
					    <select name="searchType">
					      <option value="n"<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
					      <option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
					      <option value="c"<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
					      <option value="w"<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
					      <option value="tc"<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
					    </select>
					
					    <input type="text" name="keyword" id="keywordInput" value="${scri.keyword}"/>
					
					    <button id="searchBtn" type="button">검색</button>
					    <script>
					      $(function(){
					        $('#searchBtn').click(function() {
					          self.location = "list" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
					        });
					      });   
					    </script>
					</div>
					
					<div>
						<ul class="pagination" style="margin-left:50px;">
						    <c:if test="${pageMaker.prev}">
						    	<li class="page-item"><a class="page-link" href="list${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
						    </c:if> 
						
						    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
						    	<li class="page-item active"><a class="page-link" href="list${pageMaker.makeSearch(idx)}">${idx}</a></li>
						    </c:forEach>
						
						    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
						    	<li class="page-item"><a class="page-link" href="list${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
						    </c:if> 
						</ul>
					</div>
					
				</form>
			</section>
			<hr />
		</div>
	</body>
</html>