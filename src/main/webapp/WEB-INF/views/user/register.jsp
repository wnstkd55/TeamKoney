<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<link rel='stylesheet' type='text/css' href="/resources/css/bootstrap.min.css">
 		<link rel='stylesheet' type='text/css' media='screen' href='/resources/css/loginform.css'>
 		<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
		<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
		<title>회원가입</title>
	</head>
	<script type="text/javascript">
		$(document).ready(function(){
			// 취소
			$(".cencle").on("click", function(){
				
				location.href = "/user/login";
						    
			})
		
			$("#submit").on("click", function(){
				if($("#userId").val()==""){
					alert("아이디를 입력해주세요.");
					$("#userId").focus();
					return false;
				}
				if($("#userPwd").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#userPwd").focus();
					return false;
				}
				if($("#userName").val()==""){
					alert("성명을 입력해주세요.");
					$("#userName").focus();
					return false;
				}
				if($("#userAge").val()==""){
					alert("나이를 입력해주세요.");
					$("#userAge").focus();
					return false;
				}
				if($("#userEmail").val()==""){
					alert("이메일을 입력해주세요.");
					$("#userEmail").focus();
					return false;
				}
				if($("#userIntro").val()==""){
					alert("자기소개를 입력해주세요.");
					$("#userIntro").focus();
					return false;
				}
			});
		})
		function fn_idChk(){
			$.ajax({
				url : "/user/idChk",
				type : "post",
				dataType : "json",
				data : {"userId" : $("#userId").val()},
				success : function(data){
					if(data == 1){
						alert("중복된 아이디입니다.");
					}else if(data == 0){
						$("#idChk").attr("value", "Y");
						alert("사용가능한 아이디입니다.");
					}
				}
			})
		}
	</script>
	<body>
		<section>
        <div class="imgbox">
            <img src="/resources/images/back5.jpg">
        </div>
        <div class="contentbox">
            <div class="formbox form-group" data-aos="flip-right">
                <h2>register</h2>
                <form name='loginForm' action="/user/register" method="post" enctype="multipart/form-data">
                        <label class="control-label" for="userId">아이디</label>
                        <button class="btn btn-info btn-sm" type="button" id="idChk" onclick="fn_idChk();" value="N">중복확인</button>
						<input class="form-control form-control-sm" type="text" id="userId" name="userId" />
                        <br/>
                        <label class="control-label" for="userPwd">패스워드</label>
						<input class="form-control form-control-sm" type="password" id="userPwd" name="userPwd" />
						
                        <label class="control-label" for="userName">성명</label>
					<input class="form-control form-control-sm" type="text" id="userName" name="userName" />
					
                        <label class="control-label" for="userAge">나이</label>
					<input class="form-control form-control-sm" type="text" id="userAge" name="userAge" />
					
                        <label class="control-label" for="userEmail">이메일</label>
					<input class="form-control form-control-sm" type="text" id="userEmail" name="userEmail" />
					
                        <label class="control-label" for="userIntro">자기소개</label>
					<input class="form-control form-control-sm" type="text" id="userIntro" name="userIntro" />
					
                        <label class="control-label" for="pFile">프로필 사진</label>
					<input class="form-control form-control-sm" type="file" id="pFile" name="pFile" />
					
					<br/>
					<br/>
                    <div class="inputbox">
                        <button class="btn btn-outline-info" type="submit" id="submit">회원가입</button>
						<button class="cencle btn btn-outline-secondary" type="button">취소</button>
                    </div>
                </form>
            </div>
        </div>
    </section>
	<script>
    	AOS.init();
    </script>		
	</body>
</html>