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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
	<!-- 네브바 -->
	<c:import url="/WEB-INF/views/include/nav.jsp"></c:import>

	<main class="main">
		<!-- 카테고리 -->
		<c:import url="/WEB-INF/views/include/category.jsp"></c:import>
		<div class="boardView">
			<h4>카테고리 : ${content.category_name}</h4>
			<h2>제목 : ${content.title}</h2>
			<hr />
			<h4>작성일자 : ${content.regDate}</h4>
			<hr />
			<div class="content">
				<p>내용</p>
				<p>${content.content}</p>
			</div>
		</div>
		<div class="viewBtn">
			<div>
				<a href="${root}/board/list?info_idx=${info_idx}&page=${page}">목록</a>
			</div>
			<c:if test="${sessionUser.user_idx == content.user_idx}">
				<div>
					<a
						href="${root}/board/modify?info_idx=${info_idx}&board_idx=${board_idx}&page=${page}">수정</a>
				</div>
				<div>
					<a
						href="${root}/board/delete?info_idx=${info_idx}&board_idx=${board_idx}">삭제</a>
				</div>
			</c:if>
		</div>

		<!-- 댓글 리스트 -->
		<div class="reply_title">
			<p>댓글 목록</p>
		</div>
		<c:forEach items="${replyList}" var="replyList">
			<div class="reply_list">
				<div>
					<p>😎닉네임 : ${replyList.name}</p>
					<p>${replyList.content}</p>
					<p>작성일자 : ${replyList.regDate}</p>
					<c:if test="${sessionUser.user_idx == replyList.user_idx}">
						<p>
							<a
								href="${root}/board/view?info_idx=${info_idx}&board_idx=${board_idx}&reply_idx=${replyList.reply_idx}&modify=true">수정</a>/
							<a
								href="${root}/reply/delete?info_idx=${info_idx}&board_idx=${board_idx}&reply_idx=${replyList.reply_idx}">삭제</a>
						</p>
					</c:if>
				</div>
			</div>
		</c:forEach>

		<hr />
		<!-- 댓글 작성 폼 : 수정 버튼 누르면 true -->
		<c:if test="${modify==true}">
			<div class="reply">
				<div>
					<form action="${root}/reply/modify_pro" method="post">
						<input type="hidden" name="info_idx" value="${info_idx}">
						<input type="hidden" name="board_idx" value="${board_idx}">
						<input type="hidden" name="reply_idx" value="${reply_idx}">
						<p>
							<label>😎닉네임: ${sessionUser.name}</label> <input type="hidden"
								name="user_idx" value="${sessionUser.user_idx}" />
						</p>
						<textarea name="content" id="" cols="120" rows="4">${searchReply.content}</textarea>
						<button type="submit">댓글 수정</button>
					</form>
				</div>
			</div>
		</c:if>
		<c:if test="${modify==false}">
			<div class="reply">
				<div>
					<form action="${root}/reply/write_pro" method="post">
						<input type="hidden" name="info_idx" value="${info_idx}">
						<input type="hidden" name="board_idx" value="${board_idx}">
						<p>
							<label>😎닉네임: ${sessionUser.name}</label> <input type="hidden"
								name="user_idx" value="${sessionUser.user_idx}" />
						</p>
						<textarea name="content" id="" cols="120" rows="4"></textarea>
						<button type="submit">댓글 작성</button>
					</form>
				</div>
			</div>
		</c:if>
		<!-- 댓글 리스트 -->
	</main>


	<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>

</body>
</html>