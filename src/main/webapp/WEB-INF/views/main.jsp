<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
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

	<main class="main">
		<!-- 카테고리 -->
		<c:import url="/WEB-INF/views/include/category.jsp"></c:import>
		<!-- 카테고리 종료 -->
		<div class="main_content1">
			<div class="pic">
				<img src="images/menu1.jpg" />
			</div>
			<div class="pic">
				<img src="images/menu2.jpg" />
			</div>
			<div class="pic">
				<img src="images/menu3.jpg" />
			</div>
			<div class="pic">
				<img src="images/menu4.jpg" />
			</div>
			<div class="pic">
				<img src="images/menu5.jpg" />
			</div>
		</div>
		<div class="main_content2">
			<h3>⭐최근글</h3>
			<table class="board">
				<thead>
					<tr>
						<th>제목</th>
						<th id="regDate_th">작성일자</th>
					</tr>
				</thead>

				<tbody>
					<c:forEach items="${list}" var="list">
						<tr>
							<td><a href="${root}/board/view?info_idx=${list.info_idx}&board_idx=${list.board_idx}&page=${page}">${list.title}</a></td>
							<td id="regDate_td">${list.regDate}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<hr />
			<h3>🔥인기글</h3>
			<table class="board">
				<thead>
					<tr>
						<th>제목</th>
						<th id="regDate_th">작성일자</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${poList}" var="poList">
						<tr>
							<td><a href="${root}/board/view?info_idx=${poList.info_idx}&board_idx=${poList.board_idx}&page=${page}">${poList.title}</a></td>
							<td id="regDate_td">${poList.regDate}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<hr />
		</div>
	</main>

	<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>

</body>
</html>