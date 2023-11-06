<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="root" value="${pageContext.request.contextPath}" />

<!-- 네브바 시작 -->
<nav class="navbar">
	<!-- 로고 -->
	<div class="navbar_logo">
		<i class="fa-duotone fa-cat"></i> <a href="${root}/">MyBlog</a>
	</div>

	<!-- 아이콘 -->
	<ul class="navbar_icons">
		<c:choose>
			<c:when test="${sessionUser.userLogin ==true }">
				<li><a href="${root}/board/write">글쓰기</a></li>
				<li><a href="${root}/user/modify">회원정보수정</a></li>
				<li><a href="${root}/user/logout">로그아웃</a></li>
			</c:when>
			<c:otherwise>

				<li><a href="${root}/user/login">로그인</a></li>
				<li><a href="${root}/user/join">회원가입</a></li>
			</c:otherwise>
		</c:choose>
	</ul>
	<!-- 토글 버튼 -->
	<a href="#" class="navbar_toggleBtn"> <i class="fa-solid fa-bars"></i>
	</a>
</nav>
<!-- 네브바 종료 -->
