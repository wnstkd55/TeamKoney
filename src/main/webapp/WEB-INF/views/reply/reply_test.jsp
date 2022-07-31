<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
	<div class="col-lg-12">
    <div class="card">
        <div class="card-header with-border">
            <h3 class="card-title">댓글 작성</h3>
        </div>
        <div class="card-body">
            <div class="row">
            <div class="form-group col-sm-8">
            <input class="form-control input-sm" id="newReplyText"
            type="text" placeholder="댓글 입력...">
            </div>
            <div class="form-group col-sm-2">
            <input class="form-control input-sm" id="newReplyWriter" type="text" placeholder="작성자">
			</div>
			<div class="form-group col-sm-2">
			<button type="button" class="btn btn-primary btn-sm btn-block replyAddBtn">
			<i class="fa fa-save"></i> 저장
			</button>
		</div>
		</div>	
        </div>
        <div class="card-footer">
            <ul id="replies">

            </ul>
        </div>
        <div class="card-footer">
		<nav aria-label="Contacts Page Navigation">
                <ul class="pagination pagination-sm no-margin justify-content-center m-0">

                </ul>
            </nav>
        </div>
    </div>
  </div>

  <div class="modal fade" id="modifyModal" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">댓글 수정창</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label for="no">댓글 번호</label>
                    <input class="form-control" id="no" name="no" readonly>
                </div>
                <div class="form-group">
                    <label for="content">댓글 내용</label>
                    <input class="form-control" id="content" name="content" placeholder="댓글 내용을 입력해주세요">
                </div>
                <div class="form-group">
                    <label for="writer">댓글 작성자</label>
                    <input class="form-control" id="writer" name="writer" readonly>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default pull-left" data-dismiss="modal">닫기</button>
                <button type="button" class="btn btn-success modalModBtn">수정</button>
                <button type="button" class="btn btn-danger modalDelBtn">삭제</button>
            </div>
        </div>
    </div>
  </div>
  <script>
//5번째 게시글
  var bno = 5;

  // 댓글 목록 호출
  getReplies();

  // 댓글 목록 출력 함수
  function getReplies() {

      $.getJSON("${path}/mrreply/all/" + bno, function (data) {

          console.log(data);

          var str = "";

          $(data).each(function () {
              str += "<li data-no='" + this.no + "' class='replyLi'>"
                  +   "<p class='content'>" + this.content + "</p>"
                  +   "<p class='writer'>" + this.writer + "</p>"
                  +   "<button type='button' class='btn btn-xs btn-success' data-toggle='modal' data-target='#modifyModal'>댓글 수정</button>"
                  + "</li>"
                  + "<hr/>";

          });

          $("#replies").html(str);

      });
  }
  $(".replyAddBtn").on("click",function() {

	    // 화면으로부터 입력 받은 변수값의 처리
	    var content = $("#newReplyText");
	    var writer = $("#newReplyWriter");

	    var contentVal = content.val();
	    var writerrVal = writer.val();

	    // AJAX 통신 : POST
	    $.ajax({
	        type : "post",
	        url : "${path}/mrreply",
	        headers : {
	            "Content-type" : "application/json",
	            "X-HTTP-Method-Override" : "POST"
	        },
	        dataType : "text",
	        data : JSON.stringify({
	            no : no,
	            content : contentVal,
	            writer : writerrVal
	        }),
	        success : function (result) {
	            // 성공적인 댓글 등록 처리 알림
	            if (result == "regSuccess") {
	                alert("댓글 등록 완료!");
	            }
	            getReplies(); // 댓글 목록 출력 함수 호출
	            content.val(""); // 댓글 내용 초기화
	            writer.val(""); // 댓글 작성자 초기화
	        }
	    });
	});
  </script>
</body>
</html>