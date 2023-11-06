<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="root" value="${pageContext.request.contextPath}" />

<script>
 alert('댓글이 삭제되었습니다.')
 location.href='${root}/board/list?info_idx=${info_idx}' //기본페이지로 이동
</script>
