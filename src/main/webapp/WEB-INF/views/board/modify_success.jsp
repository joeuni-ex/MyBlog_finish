<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="root" value="${pageContext.request.contextPath}" />

<script>
	alert('수정이 완료되었습니다')
	location.href = "${root}/board/list?info_idx=${info_idx}&page=${page}"
</script>
