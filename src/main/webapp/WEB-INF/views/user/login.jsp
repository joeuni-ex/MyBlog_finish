<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${root}/css/style.css" />
</head>
<body>
	<!--네브바-->
	<c:import url="/WEB-INF/views/include/nav.jsp"></c:import>
	<!--네브바 종료-->

	<!-- 로그인 -->
	<main class="main">
		<div class="login">
			<h2>로그인</h2>
			<form:form action="${root}/user/login_pro" modelAttribute="loginUser" method="post">
				<form:label path="user_id">아이디</form:label> 
				<form:input path="user_id" /><br />
				<form:errors path="user_id" style="color:red" /><br/><br/>

				<form:label path="user_pw">비밀번호</form:label>
				<form:input path="user_pw" type="password"/><br />
				<form:errors path="user_pw" style="color:red" /> 
				<input type="submit" value="로그인"/>
			</form:form>
		</div>
	</main>


	<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>

</body>
</html>