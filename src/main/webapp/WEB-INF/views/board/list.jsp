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
	<!-- 네브바 -->
	<c:import url="/WEB-INF/views/include/nav.jsp"></c:import>

	<main class="main">
		<!-- 카테고리 -->
		<c:import url="/WEB-INF/views/include/category.jsp"></c:import>
		<div class="boardList">
			<h2>💛${category}</h2>
			<table class="board">
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>날짜</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
					<%
					int i = 1;
					%>
					<c:forEach items="${list}" var="board">
						<tr>
							<td><%=i++%></td>
							<td><a
								href="${root}/board/view?info_idx=${info_idx}&board_idx=${board.board_idx}&page=${page}">${board.title}</a></td>
							<td>${board.regDate}</td>
							<td>${board.viewCnt}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="pagecontainer">
			<ul class="pagination">
				<!-- 이전 페이지  -->
				<c:choose>
					<c:when test="${pageBean.prevPage <= 0 }">
						<li class="page-link"><a href="#" >이전</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-link"><a
							href="${root}/board/list?info_idx=${info_idx}&page=${pageBean.prevPage}">이전</a></li>
					</c:otherwise>
				</c:choose>
				<!-- 중간 페이지 번호들 -->
				<c:forEach var="idx" begin="${pageBean.min}" end="${pageBean.max}">
					<c:choose>
						<c:when test="${idx == pageBean.currentPage}">
							<li class="page_link"style="width: 20px;background: #D8D9DA;text-align: center;"><a style="font-weight: bold"
								href="${root}/board/list?info_idx=${info_idx}&page=${idx}">${idx} </a></li>
						</c:when>
						<c:otherwise>
							<li class="page-link" style="width: 20px;"><a 
								href="${root}/board/list?info_idx=${info_idx}&page=${idx}">${idx}</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<!-- 다음 페이지 -->
				<c:choose>
					<c:when test="${pageBean.min >= pageBean.pageCnt}">
						<li class="page-link"><a href="#">다음</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-link"><a
							href="${root}/board/list?info_idx=${info_idx}&page=${pageBean.nextPage}">다음</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</main>

	<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>

</body>
</html>