<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link rel = "stylesheet" href="/resources/css/style_mrlist.css">
<link rel="stylesheet"  href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css"/>
<script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>
<title>KoneyGram</title>
</head>
<style>
	.thumbnail img:hover{
		border: solid black 2px;
		transition: 0.25s;
	}
	
.slide-container{
  max-width: 800px;
  width: 100%;
  margin-top: 300px;
  bottom: 300px;
  background-color: rgba(255, 255, 255, 0.401);
  padding:40px 0;
}

.slide-content{
  margin: 0 40px;
}

.card{
  border-radius: 25px;
  background: #fff;
}

.image-content,
.card-content{
  display: flex;
  flex-direction: column;   /*flex의 방향 정하기*/
  align-items: center;    /* 가운데 정렬 */
  padding: 10px 14px;
}

.image-content{
  position: relative;
  row-gap: 5px;
  padding:25px 0;
}

.overlay{
  position: absolute;
  left: 0;
  top: 0;
  height: 100%;
  width: 100%;
  background-color: #ffcbcd;
  border-radius: 25px 25px 0 25px;
}


.overlay::before,
.overlay::after{
  content: '';
  position: absolute;
  right: 0;
  bottom: -40px;
  height: 40px;
  width: 40px;
  background-color: #ffcbcd;
}

.overlay::after{
  border-radius: 0 25px 0 0;
  background-color: #fff;
}

.card-image{
  position: relative;
  height: 150px;
  width: 150px;
}

.card-image .card-img{
  height: 100%;
  width: 100%;
  object-fit: cover;
  border-radius: 50%;
  border: 4px solid #fff;
}

.name{
  font-size: 18px;
  font-weight: 500;   /*글자 진하기정도*/
  color: #333;    /* 검정색 계열의 좋은색깔2*/
}

.description{
  font-size: 14px;
  color: rgb(90, 49, 8);
  text-align: center;
}

.button{
  border: none;
  font-size: 16px;
  color: #fff;
  cursor: pointer;
  padding: 8px 16px;
  background-color: #b595f0;
  border-radius: 10px;
  margin: 14px;
  transition: all 0.3s ease;
}

.button:hover{
  transition: 0.5s;
  background-color: #9468e7;
}
</style>
<body style="margin-left:350px;">
		<%@ include file="../menu/menu1.jsp" %>
	<div class="container" style="width: 1124px;">
	<div class="koney_story">
					<img alt="koney_placeimg" src="/resources/images/contents/koney_story.jpg" style="width:100%;">
	</div>
	<div class= "userlist">
	<div class="slide-container swiper" style="top: 0px;margin-top: 0px;bottom: 0px;">
        <div class="slide-content">
            <div class="card-wrapper swiper-wrapper">
            <c:forEach items="${userlist}" var="u">
                <div class="card swiper-slide">
                    <div class="image-content">
                        <span class="overlay"></span>
                        <div class="card-image">
                        	<img src="/resources/upload/${u.stored_file_name}" alt="userimage" class="card-img">
                        </div>
                    </div>
                    <div class="card-content">
                        <h2 class="name">${u.userName }</h2>
                        <p class="description"> ${u.userIntro }</p>	
                        <button class="button" onclick="location.href='/myroute/mplist?userId=${u.userId }';">일정 보러가기</button>
                    </div>
                </div>
              </c:forEach>
            </div>
        </div>
			<div class="swiper-button-next"></div>
			<div class="swiper-button-prev"></div>
			<div class="swiper-pagination"></div>
		</div>
	</div>
	<div class="album py-5 bg-light">
	      <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
	      <c:forEach items="${list}" var="m">
	        <div class="col">
	          <div class="card shadow-sm">
		          	<div class="thumbnail">
		            	<img class="bd-placeholder-img card-img-top" width="100%" height="225" src="/resources/images/thumnail/koney_thumbnail.jpg" role="img" onclick="location.href='/myroute/mrview?mr_id=${m.mr_id}';" style="cursor:pointer;"/>
		            </div>	
	            <div class="card-body">
	              <p class="card-text">${m.title }</p>
	              <p class="card-text">${m.userId }</p>
	              <div class="d-flex justify-content-between align-items-center">
	                <div class = "likes">
		                <small class="text-muted"><svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="red" class="bi bi-chat-heart" viewBox="0 0 16 16">
						  <path fill-rule="evenodd" d="M2.965 12.695a1 1 0 0 0-.287-.801C1.618 10.83 1 9.468 1 8c0-3.192 3.004-6 7-6s7 2.808 7 6c0 3.193-3.004 6-7 6a8.06 8.06 0 0 1-2.088-.272 1 1 0 0 0-.711.074c-.387.196-1.24.57-2.634.893a10.97 10.97 0 0 0 .398-2Zm-.8 3.108.02-.004c1.83-.363 2.948-.842 3.468-1.105A9.06 9.06 0 0 0 8 15c4.418 0 8-3.134 8-7s-3.582-7-8-7-8 3.134-8 7c0 1.76.743 3.37 1.97 4.6a10.437 10.437 0 0 1-.524 2.318l-.003.011a10.722 10.722 0 0 1-.244.637c-.079.186.074.394.273.362a21.673 21.673 0 0 0 .693-.125ZM8 5.993c1.664-1.711 5.825 1.283 0 5.132-5.825-3.85-1.664-6.843 0-5.132Z"/>
						</svg> ${m.like_count }</small>
					</div>
					<div class = "reply">
		                <small class="text-muted"><svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="gray" class="bi bi-chat-dots" viewBox="0 0 16 16">
						  <path d="M5 8a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm3 1a1 1 0 1 0 0-2 1 1 0 0 0 0 2z"/>
						  <path d="m2.165 15.803.02-.004c1.83-.363 2.948-.842 3.468-1.105A9.06 9.06 0 0 0 8 15c4.418 0 8-3.134 8-7s-3.582-7-8-7-8 3.134-8 7c0 1.76.743 3.37 1.97 4.6a10.437 10.437 0 0 1-.524 2.318l-.003.011a10.722 10.722 0 0 1-.244.637c-.079.186.074.394.273.362a21.673 21.673 0 0 0 .693-.125zm.8-3.108a1 1 0 0 0-.287-.801C1.618 10.83 1 9.468 1 8c0-3.192 3.004-6 7-6s7 2.808 7 6c0 3.193-3.004 6-7 6a8.06 8.06 0 0 1-2.088-.272 1 1 0 0 0-.711.074c-.387.196-1.24.57-2.634.893a10.97 10.97 0 0 0 .398-2z"/>
						</svg> ${m.reply_count }</small>
					</div>
					<div class = "views">
		                <small class="text-muted"><svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-eye" viewBox="0 0 16 16">
						  <path d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8zM1.173 8a13.133 13.133 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5c2.12 0 3.879 1.168 5.168 2.457A13.133 13.133 0 0 1 14.828 8c-.058.087-.122.183-.195.288-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5c-2.12 0-3.879-1.168-5.168-2.457A13.134 13.134 0 0 1 1.172 8z"/>
						  <path d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5zM4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0z"/>
						</svg> ${m.hit }</small>
					</div>
	              </div>
	            </div>
	          </div>
	        </div>
	        </c:forEach>
	      </div>
	    </div>
	</div>
	<script>
var swiper = new Swiper(".slide-content", {
	  slidesPerView: 3,
	  spaceBetween: 30,
	  slidesPerGroup: 3,
	  loop: true,
	  loopFillGroupWithBlank: true,
	  pagination: {
	    el: ".swiper-pagination",
	    clickable: true,
	  },
	  navigation: {
	    nextEl: ".swiper-button-next",
	    prevEl: ".swiper-button-prev",
	  },
	});
</script>
</body>
</html>