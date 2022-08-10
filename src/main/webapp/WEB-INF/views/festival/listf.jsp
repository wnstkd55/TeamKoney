<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
	<head>
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	 	<title>축제 리스트</title>
		<link type="text/css" rel="stylesheet" href = "/resources/css/festivallist_map.css">
		<link type="text/css" rel="stylesheet" href = "/resources/css/style_festival.css">
	</head>
	<style>
		table a{
			text-decoration: none;
		}
	</style>
	<body>
	
		<%@ include file="../menu/menu1.jsp" %>
	<div class="content">
	<div class = "mapimg">
		<jsp:include page="kmap.jsp"></jsp:include>
	</div>
		<div id="root" style="font-size:11px; margin-top:20px; height: 800px;">
			<div class="koney_festival">
				<img alt="koney_festival" src="/resources/images/contents/koney_festival.jpg" style="width:100%; margin-bottom: 20px;">
			</div>
			<div class="search form-group">
			    <select class="form-select" name="searchType" id="searchType" onchange = "dateChange()" style="width: 150px;">
			      <option value="n"<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
			      <option value="admin"<c:out value="${scri.searchType eq 'admin' ? 'selected' : ''}"/>>지역</option>
			      <option value="name"<c:out value="${scri.searchType eq 'name' ? 'selected' : ''}"/>>축제 이름</option>
			      <option value="sdate" <c:out value="${scri.searchType eq 'sdate' ? 'selected' : ''}"/>>축제일</option>
			    </select>
			    <div class="input-group mb-3">
			      <input type="text" class="form-control searchBox" name="keyword" id="keywordInput" value="${scri.keyword}">
			      <button class="btn btn-outline-success" type="button" id="searchBtn">검색</button>
			    </div>
			    <!-- 날짜 타입 변환 -->
			    <script type ="text/javascript">
			        function dateChange() {
			        	var inputBox = document.getElementById('keywordInput');
			        	this.value == 'sdate' ? inputBox.type = 'date' : inputBox.type = 'text';
			        	
			        }
			        	document.getElementById('searchType').addEventListener('change', dateChange);
				</script> 
			    <script>
			      $(function(){
			        $('#searchBtn').click(function() {
			          self.location = "listf" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
			        });
			      });   
			    </script>
			</div>
			<section id="container">
				<form role="form" method="get">
					<table class="table table-hover">
						<tr class="table-primary"><th>축제 이름</th><th>장소</th><th>시작일</th><th>종료일</th></tr>
						
					<c:if test="${keyword == null}">
						<c:forEach items="${list}" var = "list">
							<tr>
								<td>
									<a href="/festival/readView?f_code=${list.f_code}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}"><c:out value="${list.f_name}" /></a>
								</td>
								<td><c:out value="${list.f_place}" /></td>
								<td><c:out value="${list.f_startdate}" /></td>
								<td><c:out value="${list.f_enddate }"/></td>
							</tr>
						</c:forEach>
					</c:if>
						
					</table>
					
					<div>
						<ul class="pagination"  style="font-size:12px;">
						    <c:if test="${pageMaker.prev}">
						    	<li class="page-item"><a class="page-link" href="listf${pageMaker.makeSearch(pageMaker.startPage - 1)}"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-left-short" viewBox="0 0 16 16">
								  <path fill-rule="evenodd" d="M12 8a.5.5 0 0 1-.5.5H5.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L5.707 7.5H11.5a.5.5 0 0 1 .5.5z"/>
								</svg></a></li>
						    </c:if> 
						
						    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
						    	<li class="page-item active"><a class="page-link" href="listf${pageMaker.makeSearch(idx)}">${idx}</a></li>
						    </c:forEach>
						
						    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
						    	<li class="page-item"><a class="page-link" href="listf${pageMaker.makeSearch(pageMaker.endPage + 1)}"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-right-short" viewBox="0 0 16 16">
								  <path fill-rule="evenodd" d="M4 8a.5.5 0 0 1 .5-.5h5.793L8.146 5.354a.5.5 0 1 1 .708-.708l3 3a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708-.708L10.293 8.5H4.5A.5.5 0 0 1 4 8z"/>
								</svg></a></li>
						    </c:if> 
						</ul>
					</div>
				</form>
			</section>
			<hr/>
		</div>
	</div>
	</body>
</html>

