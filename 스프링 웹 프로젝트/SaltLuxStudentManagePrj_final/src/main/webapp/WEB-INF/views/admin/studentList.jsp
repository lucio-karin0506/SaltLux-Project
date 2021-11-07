<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student list</title>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@400&display=swap')
	;

* {
	font-family: 'IBM Plex Sans KR', sans-serif;
}

table.table>thead>tr>th {
	border-bottom: 1px solid black;
}
</style>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>

</head>
<nav class="navbar navbar-expand-lg navbar-light white" style="padding-right: var(--bs-gutter-x,.75rem); padding-left: var(--bs-gutter-x,.75rem);">
	<div class="container-fluid" style="padding: 0px; margin:0px;">
		<a href="/loginHome"><img src='<c:url value="/images/saltlux.png"/>' width ="100"></a>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        </ul>
        <form class="d-flex flex-row justify-content-end">
	        <div style="padding-top:8px;">
              <h7 style="padding-right:10px;">${id}님, 환영합니다.</h7>
           </div>
           <div>
              <a class="btn btn-primary text-white" role="button" style="background-color:#5fbef8; border-color:#5fbef8;" href='<c:url value="/logout"/>'>로그아웃</a>
           </div>
		        </form>
		</div>
	</div>
</nav>
<body style="text-align: center;" width="100">



	<div class="row text-center m-4">
		<h1>수강생 목록</h1>
		<p>
		<p>
		<p>
		<div style="width: 40%; float: none; margin: 0 auto">
			<div class="align-items:center">
				<table class="table table-hover table-responsive " border="1">
					<tr class="table-light">
						<th>번호</th>
						<th>이름</th>
						<th>아이디</th>
						<th>비밀번호</th>
					</tr>
					<c:forEach var="student" items="${studentList}">
						<c:if test="${student.emailId != 'admin'}">
							<tr class="table-light">
								<td><a href="${student.studentId}">${student.studentId}</a></td>
								<td>${student.studentName}</td>
								<td>${student.emailId}</td>
								<td>${student.password}</td>
							</tr>
						</c:if>
					</c:forEach>
				</table>
			</div>
		</div>
		<p>
			<a class="btn btn-primary text-black" role="button"
				style="background-color: #5fbef8; border-color: #5fbef8;"
				href='<c:url value="/admin/studentInsert"/>'>신규 학생 정보 입력</a>
		</p>
	</div>
</body>
</html>