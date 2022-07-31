<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var='root' value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script	src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<title>Insert title here</title>
    <script>
 	$(document).ready(function(){
		getreplylist();
	});
	
	function getreplylist(){
		
		var replyurl = "${pageContext.request.contextPath }/mrview/mrrlist/";
		var mr_bno = ${read.mr_id};
		var mr_no = ${reply.mr_no};
		
		$.ajax({
			url : replyurl+mr_bno,
			type : 'POST',
			dataType : 'json',
			success : function(result){
				var comments = "";
			if(result.length <1){
				comments = "등록된 댓글이 없습니다.";
			}else{
				$(result).each(function(){
					comments +='<div id="mr_no'+this.mr_no+'">';
					comments +='<strong>'+'작성자 : ' + this.mr_writer+'</strong>&nbsp;&nbsp;&nbsp;&nbsp;';
					comments +='작성 날짜 : '+this.mr_regdate+'</br>';
					comments +='<p>';
					comments +='댓글 내용 : &nbsp;&nbsp;&nbsp;'+this.mr_content;
					comments +='</p>';
					comments +='<br/>';
					comments +='<button type="button" class="btn btn-outline-success" onclick="updateviewBtn('+this.mr_no+',\''+this.mr_regdate+'\', \''+this.mr_content+'\', \''+this.mr_writer+'\')">';
					comments +='댓글수정</button>';
					comments +='<button type="button" class="btn btn-outline-success" onclick="mrdelete('+this.mr_no+')">';
					comments +='댓글 삭제';
					comments +='</button>';
					comments +='</div>';
					comments +='<br/>';
				});
			};
				$("#mrlist").html(comments);
			}
		});
	};
	
	function mrdelete(mr_no){
		var deleteurl='${pageContext.request.contextPath }/mrview/mrdelete/';
		
		$.ajax({
			url:deleteurl+mr_no,
			type : 'POST',
			dataType : 'json',
			success : function(result){
				getreplylist();
			}
			, error: function(error){
				console.log(error);
			}
		});
	}
	
	function updateviewBtn(mr_no, mr_regdate, mr_content, mr_writer){
		console.log("들어옵니까?");
		
		var commentsview = "";
		
		commentsview +='<div id="mr_no'+mr_no+'">';
		commentsview +='<strong>';
		commentsview +='작성자 : ' + mr_writer;
		commentsview +='</strong>&nbsp;&nbsp;&nbsp;&nbsp;';
		commentsview +='작성 날짜 : '+mr_regdate
		commentsview +='</br><p>';
		commentsview +='댓글 내용 : &nbsp;&nbsp;&nbsp;';
		commentsview +='<textarea class="form-control" id="reply_edit_content">';
		commentsview += mr_content;
		commentsview +='</textarea>';
		commentsview +='</p>';
		commentsview +='<br/>';
		commentsview +='<button type="button" class="btn btn-outline-success"';
		commentsview +='onclick="updateBtn('+mr_no+',\''+mr_writer+'\')">댓글작성</button>';
		commentsview +='<button type="button" class="btn btn-outline-success" onclick="getreplylist()">';
		commentsview +='취소';
		commentsview +='</button>';
		commentsview +='</div>';
		commentsview +='<br/>';
		
		$('#mr_no'+mr_no).replaceWith(commentsview);
		$('#mr_no'+mr_no+'#mr_content').focus();
	};
	
	function updateBtn(mr_no, mr_writer){
		
		var updateurl='${pageContext.request.contextPath }/mrview/mrupdate/';
		var mr_content = $("#reply_edit_content").val();
		
		$.ajax({
			url : updateurl+mr_no+'/'+mr_content,
			type : 'POST',
			dataType: 'json',
			success: function(result){
				getreplylist();
			}
			, error : function(error){
				console.log(error);
			}
		});
	};
	
	function getFormatDate(data){
		var year = date.getFullYear();
		var month = (1+date.getMonth());
		month = month >= 10 ? month : '0' + day;
		var day = date.getDate();
		day = day >= 10 ? day : '0' + day;
		return year + '-' + month + '-' + day;
	};
	
	$(function(){
		
		$('#replywriteBtn').click(function(){
			console.log("들어오는거 확인구문");
			var mr_content = $('#mr_content').val();
			mr_writer = $('#mr_writer').val();
			mr_bno = ${read.mr_id};
			
			var writeurl = "${pageContext.request.contextPath }/mrview/mrwrite/";
			
			$.ajax({
				url : writeurl+mr_bno+'/'+mr_writer+'/'+mr_content,
				type : 'POST',
				dataType: 'json',
				success : function(result){
					getreplylist();
					$('#mr_content').val('');
					$('#mr_writer').val('');
				}
				, error: function(error){
					console.log(error);
				}
			})
		});
		
		$(".alistBtn").click(function(){
			var listurl ="list?page=${cri.page}"+
					"&perPageNum = ${cri.perPageNum}"+
					"&searchType=${cri.searchType}"+
					"&keywordp=${cri.keyword}";
					location.href=listurl;
		});
	});
	
	
</script>
</head>
<body >
<div class="container">
	<h3>${read.userId }</h3>
	<h1>${read.title }</h1>
	<table border = "1">
		<tr>
			<th>출발지 이름</th>
			<th>글 내용</th>
			<th>조회수</th>
		</tr>
		
			<tr>
				<td>${read.dp_name }</td>
				<td>${read.contents }</td>
				<td>${read.hit }</td>
			</tr>
	</table>
	 <div id="map_div">
        </div>
        
    <div class="container">
	  <div class="col-md-6">
	  	<label for="reply_writer"> 작성자 : </label>
	  	<input type="text" class="form_control" id="mr_writer" name="mr_writer"><br/>
	  	<label for="reply_content"> 댓글 내용: </label>
	  	<textarea class="form-control" id="mr_content" name="mr_content"></textarea>
	  	<button type="button" class = "btn btn-outline-success" id="replywriteBtn">댓글 작성</button>
	  </div>
		<br/>
		<hr/>	  
	
		<div class="container">
			<div id="mrlist"></div>
		</div>
	</div>
</div>        
 
     
</body>
</html>