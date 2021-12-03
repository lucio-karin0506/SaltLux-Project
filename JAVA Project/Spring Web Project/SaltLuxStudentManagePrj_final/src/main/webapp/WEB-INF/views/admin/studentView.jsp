<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 정보 조회</title>
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

<body style="text-align: center;" width="100">
	<nav class="navbar navbar-expand-lg navbar-light white"
		style="padding-right: var(- -bs-gutter-x, .75rem); padding-left: var(- -bs-gutter-x, .75rem);">
		<div class="container-fluid" style="padding: 0px; margin: 0px;">
			<a href="/loginHome"><img src='<c:url value="/images/saltlux.png"/>'
				width="100"></a>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				</ul>
				<form class="d-flex flex-row justify-content-end">
					<div style="padding-top: 8px;">
						<h7 style="padding-right:10px;">${id}님, 환영합니다.</h7>
					</div>
					<div>
						<a class="btn btn-primary text-white" role="button"
							style="background-color: #5fbef8; border-color: #5fbef8;"
							href='<c:url value="/logout"/>'>로그아웃</a>
					</div>
				</form>
			</div>
		</div>
	</nav>
	<h1>학생 정보 상세 조회</h1>
	<br>
	<div style="width: 40%; float: none; margin: 0 auto">
		<div class="align-items:center">
			<table class="table table-hover w-auto" border="1">
				<tr class="table-light">
					<th width="4%">학생 번호</th>
					<th width="4%">학생 이름</th>
					<th width="4%">아이디</th>
					<th width="4%">비밀번호</th>
					<th width="4%">사진</th>
				</tr>
				<tr>
					<td width="4%">${student.studentId}</td>
					<td width="4%">${student.studentName}</td>
					<td width="4%">${student.emailId}</td>
					<td width="4%" type="hidden" name="password" value="${student.password}">****</td>
					<td width="4%">
						<c:set var="len"
							value="${fn: length(fileInfo.file_name)}" /> <c:set
							var="filetype"
							value="${fn:toUpperCase(fn:substring(fileInfo.file_name, len-4, len)) }" />
						<c:if test="${(filetype eq '.JPG') or (filetype eq '.JPEG') or (filetype eq '.PNG') or (filetype eq '.GIF') }">
							<img src='<c:url value="/admin/getImage/${fileInfo.student_id}"/>' width="100" class="img-thumbnail">
						</c:if>
					</td>
				</tr>
			</table>
		</div>
	</div>
	</div>
	<a class="btn btn-primary text-black" role="button" style="background-color: #5fbef8; border-color: #5fbef8;" href='<c:url value="./studentList"/>'>목록 조회로 돌아가기</a>
	<a class="btn btn-primary text-black" role="button" style="background-color: #5fbef8; border-color: #5fbef8;" href='<c:url value="studentUpdate/${student.studentId}"/>'>수정하기</a>
	<a class="btn btn-primary text-black" role="button" style="background-color: #5fbef8; border-color: #5fbef8;" href='<c:url value="studentDelete/${student.studentId}"/>'>삭제하기</a>
</body>
</html>