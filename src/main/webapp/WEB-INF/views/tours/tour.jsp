<%@page import="java.lang.reflect.Array"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "kr.co.city.City" %>
<%@ page import = "kr.co.city.CityDAO" %>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script	src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="/resources/css/tourCSS/style_auto.css">
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cpwebassets.codepen.io/assets/editor/iframe/iframeRefreshCSS-4793b73c6332f7f14a9b6bba5d5e62748e9d1bd0b5c52d7af6376f3d1c625d7e.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<%@ include file="../menu/menu1.jsp" %>
<main style="margin-top: 20px;margin-left: 350px; padding-left:100px; margin-right:100px;padding-left: 0px;">
  <div class="album py-5 bg-light">
    <div class="container" style="width:1000px;">
		<div class="banner" style="margin-bottom:20px;">
			<img alt="koney_scheduler" src="/resources/images/contents/koney_scheduler.jpg" style="width:100%;">
		</div>
		<ol class="breadcrumb">
	  		<li class="breadcrumb-item active">1. 도시 선택</li>
		</ol>
      <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
      	<%
			CityDAO citydao = new CityDAO();
			ArrayList<City> citylist = citydao.getClist();
			
			for(int i=0; i<citylist.size(); i++){
		%>
        <div class="col">
          <div class="card shadow-sm" style="z-index:1;">
          <div class="image">
          	<a href="makesche?c_ny=<%=citylist.get(i).getC_ny()%>&c_nx=<%=citylist.get(i).getC_nx()%>&c_name=<%=citylist.get(i).getC_name()%>">
            <img class="bd-placeholder-img card-img-top" width="100%" height="225" src="/resources/images/city_pic/<%=citylist.get(i).getC_pic() %>" alt="도시사진">
            </a>
          </div>
            <div class="card-body">
              <p class="card-text"><%=citylist.get(i).getC_name() %></p>
            </div>
          </div>
        </div>
        <%
			}
        %>
       </div>
      </div>
  </div>
</main>
<footer class="text-muted py-5">
  <div class="container">
    <p class="float-end mb-1">
      <a href="#">Back to top</a>
    </p>
    <p class="mb-1">Album example is &copy; Bootstrap, but please download and customize it for yourself!</p>
    <p class="mb-0">New to Bootstrap? <a href="/">Visit the homepage</a> or read our <a href="/docs/5.1/getting-started/introduction/">getting started guide</a>.</p>
  </div>
</footer>


  </body>
</html>
