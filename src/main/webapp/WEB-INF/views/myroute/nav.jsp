
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style type="text/css">
	li {list-style: none; display:inline; padding: 6px;}
</style>
<ul>
	<li><a href="/tours/tour">여행일정짜기</a></li>
	<li><a href="/board/list">여행지 요청게시판</a></li>
	<li>
		<c:if test="${user != null}"><a href="/user/logout">로그아웃</a></c:if>
		<c:if test="${user == null}"><a href="/">로그인</a></c:if>
	</li>
	<li>
		<c:if test="${user != null}">
			<p>${user.userId}님 안녕하세요.</p>
		</c:if>
	</li>
</ul>
