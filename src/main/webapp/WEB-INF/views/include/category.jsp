<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<div>
	<!-- 카테고리 메뉴 -->
	<ul class="navbar_menu">
		<c:forEach var="category" items="${categoryList}">

			<li><a href="${root}/board/list?info_idx=${category.info_idx}">${category.category_name}</a></li>
		</c:forEach>
	</ul>
</div>