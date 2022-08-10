
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>
		
	 	<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
	 	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	 	
	 	<title>게시판</title>
	</head>
	<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='writeForm']");
			$(".write_btn").on("click", function(){
				if(fn_valiChk()){
					return false;
				}
				formObj.attr("action", "/board/write");
				formObj.attr("method", "post");
				formObj.submit();
			});
		})
		function fn_valiChk(){
			var regForm = $("form[name='writeForm'] .chk").length;
			for(var i = 0; i<regForm; i++){
				if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
					alert($(".chk").eq(i).attr("title"));
					return true;
				}
			}
		}
	</script>
	<body style="margin-top:20px; margin-left:350px;">
	<%@ include file="../menu/menu1.jsp" %>
		<div class="container" style="width:1000px; background: rgba(255, 255, 255, 0.288);backdrop-filter: blur(10px); border-radius: 15px;">
				<div class="koney_place">
					<img alt="koney_placeimg" src="/resources/images/contents/koney_place.jpg" style="width:100%;">
				</div>		
			 <br/>
			<ol class="breadcrumb">
			  <li class="breadcrumb-item"><a href="/board/list">List</a></li>
			  <li class="breadcrumb-item active">Write</li>
			</ol>
				<form name="writeForm" method="post" action="/board/write">
					<input type="hidden" name = "userId" value="${user.userId}"/>
					<table class="table">
					<colgroup>
						<col width="15%"/>
						<col width="35%"/>
						<col width="15%"/>
						<col width="35%"/>
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">작성자</th>
							<td><input type="hidden" id="writer" name="writer" class="chk" title="작성자를 입력하세요." value="${user.userName}" />${user.userName }</td>
						</tr>
						<tr>
							<th scope="row">제목</th>
							<td colspan="3"><input type="text" id="title" name="title" class="chk" title="제목을 입력하세요."/></td>
						</tr>
						<tr>
							<td colspan="4" class="view_text" style="margin-left:20px; margin-right:20px; height: 300px; background:#f6f6f6;">
								<textarea id="content" name="content" class="chk" title="내용을 입력하세요." style="height:300px; resize: vertical; width:1000px;"></textarea>
							</td>
						</tr>
					</tbody>
				</table>
					<div style="float:right;">
						<button type="submit" class="write_btn btn btn-outline-info">작성</button>
					</div>
				</form>
				<br/>
		</div>
	</body>
</html>