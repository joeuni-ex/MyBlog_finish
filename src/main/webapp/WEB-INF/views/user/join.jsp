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
<!-- 제이쿼리,ajax CDN -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
</head>
</head>
<body>
	<!--네브바-->
	<c:import url="/WEB-INF/views/include/nav.jsp"></c:import>
	<!--네브바 종료-->
	<!-- 회원가입 -->
	<main class="main">
		<div class="join">
			<h2>회원가입</h2>
			<form:form action="${root}/user/join_pro" modelAttribute="joinUser"
				method="post">
				<div class="form-group">
					<form:label path="name">이름</form:label>
					<form:input path="name" />
					<form:errors path="name" style="color:red" />
				</div>
				<div class="form-group">
					<form:label path="user_id">아이디</form:label>
					<form:input path="user_id" />
					<form:errors path="user_id" style="color:red" />
					<div class="form-group-append">
						<button type="button" onclick="checkId()">아이디
							중복확인</button>
					</div>
				</div>
				<div class="form-group" id="idCheck">
					<form:hidden path="userIdChecked" />
					<form:errors path="userIdChecked" />
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
					<input type="submit" value="회원가입" id="joinBtn" />
				</div>
			</form:form>
		</div>
	</main>

	<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>
	
	<!-- 자바 스크립트  -->
	<script type="text/javascript">
	function checkId(){
		
		const user_id = $("#user_id").val()//제이쿼리로 입력된 유저 아이디를 저장
		
		if(user_id.length == 0){
			alert('아이디를 입력해주세요')
			return
		}
		// 제이쿼리의 ajax문법 
		$.ajax({
			url : '${root}/user/check/' + user_id,
			type : 'get',
			dataType : 'text',
			success : function(result){
				if(result.trim() == 'true'){
					alert('사용할 수 있는 아이디입니다')
					$("#userIdChecked").val('true');//아이디 중복 체크 완료 
					$("#idCheck span").text('');//에러 초기화
				} else {
					alert('사용할 수 없는 아이디 입니다')
					$("#userIdChecked").val('false');//아이디 중복 체크 완료 
				}
			}
		})
	}
	function resetUserIdExist(){
		$("#checkId").val('false')
	}
    </script>

</body>
</html>