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
	<!-- 네브바 -->
	<c:import url="/WEB-INF/views/include/nav.jsp"></c:import>

	<main class="main">
		<!-- 카테고리 -->
		<c:import url="/WEB-INF/views/include/category.jsp"></c:import>


		<div class="boardView">
			<form:form action="${root}/board/write_pro"
				modelAttribute="writeBean" method="post">
				<form:hidden path="board_idx" />
				<form:select path="info_idx">
					<option value="1">DAILY</option>
					<option value="2">BOOK</option>
					<option value="3">FOOD</option>
					<option value="4">TRAVLE</option>
					<option value="5">BEAUTY</option>
				</form:select>
				<h2>
					제목 :
					<form:input path="title" class="writeTitle" />
					<form:errors path="title" style="color:red" />
				</h2>
				<hr />
				<p>내용</p>
				<form:errors path="content" style="color:red" />
				<form:textarea path="content" cols="120" rows="40"></form:textarea>
				<input type="submit" value="완료" class="writeBtn" />
			</form:form>
		</div>
	</main>



	<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>

</body>
</html>