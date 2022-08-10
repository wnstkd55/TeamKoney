<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
	<head>
		<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	 	<title>축제 리스트</title>
		<link type="text/css" rel="stylesheet" href = "/resources/css/festivallist_map.css">
		<link type="text/css" rel="stylesheet" href = "/resources/css/style_festival.css">
	 	<style type="text/css">
			li {list-style: none; float: left; padding: 6px;}
		table a{
			text-decoration: none;
		}
		</style>
	</head>
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
			    <select name="searchType" id="searchType" onchange = "dateChange()">
			      <option value="n"<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
			      <option value="name"<c:out value="${scri.searchType eq 'name' ? 'selected' : ''}"/>>축제 이름</option>
			      <option value="sdate" <c:out value="${scri.searchType eq 'sdate' ? 'selected' : ''}"/>>시작일</option>
			    </select>
			    <div class="input-group mb-3">
	    			<input type="text" class="form-control searchBox" name="keyword" id="keywordInput" value="${scri.keyword}"/>
			    	<button id="searchBtn" type="button" class="btn btn-outline-success">검색</button>
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
			          self.location = "listfByAdmin" + '${pageMaker.makeQuery(1)}' + "&f_admin=" + '${list[0].f_admin }'+"&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
			        });
			      });   
			    </script>
			</div>
					
			<section id="container">
				<form role="form" method="get">
					<table class="table table-hover" style="text-decoration:none;">
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
						<ul class="pagination" style="margin-left:50px;">
						    <c:if test="${pageMaker.prev}">
						    	<li class="page-item"><a class="page-link" href="listfByAdmin${pageMaker.makeSearch(pageMaker.startPage - 1)}&f_admin=${list[0].f_admin }}"><<</a></li>
						    </c:if> 
						    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
						    	<li class="page-item active"><a class="page-link"href="listfByAdmin${pageMaker.makeSearch(idx)}&f_admin=${list[0].f_admin }">${idx}</a></li>
						    </c:forEach>
						    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
						    	<li class="page-item"><a class="page-link" href="listfByAdmin${pageMaker.makeSearch(pageMaker.endPage + 1)}&f_admin=${list[0].f_admin }">>></a></li>
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