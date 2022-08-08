<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
	 	<title>KoneyGram</title>
	 	<style type="text/css">
			li {list-style: none; float: left; padding: 6px;}
		</style>
		<link rel="stylesheet" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css">
		<script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
	</head>
	
	<script type = "text/javascript">
	$(document).ready(function(){
		var formObj = $("form[name='listUser']");
		
		$(".delete_btn").on("click", function(){
			var deleteYN = confirm("삭제하시겠습니까?");
			if(deleteYN == true){
				
			formObj.attr("action", "/user/userDrop?userId=${adminlist[0].userId}");
			formObj.attr("method", "get");
			formObj.submit();
				
			}
		})
	})
	</script>
	<body style="margin-left:350px;">
	<%@ include file="../menu/menu1.jsp" %>
		<div class="container">
			<header>
				<h1> admin화면</h1>
			</header>
			<hr />
			 
			<section id="container">
				<form role="form"  method = "get">
					<table id="example" class="display" style="width:100%">
						<thead>
				            <tr>
				                <th>아이디</th>
				                <th>이름</th>
				                <th>나이</th>
				                <th>이메일</th>
				                <th> 삭제 </th>
				            </tr>
				        </thead>
				        <tbody>
					        	<c:forEach items="${adminlist}" var = "adminlist">
						           	<tr>
										<td><c:out value="${adminlist.userId}" /></td>
										<td><c:out value="${adminlist.userName}" /></td>
										<td><c:out value="${adminlist.userAge}" /></td>
										<td><c:out value="${adminlist.userEmail}" /></td>
										<form name = "listUser">
											<input type = "hidden" name = "userId" value = "${adminlist.userId}"/>
											<td><button class = "delete_btn btn btn-danger" type = "submit" > 회원삭제</button></td>
										</form>
									</tr>
								</c:forEach>
						</tbody>
					</table>
				</form>
			</section>
			<hr />
		</div>
		
		<script>
		$(document).ready(function () {
		    $('#example').DataTable();
		});
		</script>
	</body>
</html>
	
