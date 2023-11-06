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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
	<!--네브바-->
	<c:import url="/WEB-INF/views/include/nav.jsp"></c:import>
	<!--네브바 종료-->

	<!-- 회원정보수정 -->
	<main class="main">
		<div class="join">
			<h2>회원정보수정</h2>
			<form:form action="${root}/user/modify_pro"
				modelAttribute="modifyUser" method="post">
				<form:hidden path="user_idx"/>
				<div class="form-group">
					<form:label path="name">이름</form:label>
					<form:input path="name" readonly="true" />
				</div>
				<div class="form-group">
					<form:label path="user_id">아이디</form:label>
					<form:input path="user_id" readonly="true" />
				</div>
				<div class="form-group" id="idCheck">
					<form:hidden path="userIdChecked" />
				</div>
				<div class="form-group">
					<form:label path="user_pw">비밀번호</form:label>
					<form:input path="user_pw" type="password" />
					<form:errors path="user_pw" style="color:red" />
				</div>
				<div class="form-group">
					<form:label path="user_pw2">비밀번호 확인</form:label>
					<form:input path="user_pw2" type="password" />
					<form:errors path="user_pw2" style="color:red" />
					<p style="color: red">${msg}</p>
				</div>
				<div class="form-group">
					<form:button type="submit" id="joinBtn">정보수정</form:button>
				</div>
			</form:form>
		</div>
	</main>
	<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>

	<script>
		$("#idCheck #userIdChecked").val('true');//아이디 중복 체크 완료
	</script>
</body>
</html>