<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>LOGIN Success PAGE</title>
<link rel="stylesheet" type="text/css" href="/css/fontGowunDodum.css" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

<script>
	$(function() {
		var responseMessage = "<c:out value="${msg}" />";
		if (responseMessage != "") {
			alert(responseMessage)
		}
	})
</script>

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
<body style="text-align: center">
	<c:if test="${id ne 'admin' && password ne '1234' }">
		<div style="width: 70%; float: none; margin: 0 auto">
			<table class="table m-4">
				<thead class="thead-light">
					<tr>
						<th scope="col"><a href='<c:url value="/student/testSolve"/>'><h3>문제
									풀기</h3></a></th>
						<th scope="col"><a href='<c:url value="/student/testMake"/>'><h3>문제
									출제하기</h3></a></th>
						<th scope="col"><a href='<c:url value="/mypage/info"/>'><h3>마이페이지</h3></a></th>
					</tr>
				</thead>
			</table>
		</div>
	</c:if>
	<br>
	<p>
	<p>
	<div class="row text-center m-4">
		<h1>'솔트룩스 채용확정형 빅데이터 AI 융합 개발자 양성과정' 학생 관리 애플리케이션</h1>
		<p>
		<p>
			<c:choose>
				<c:when test="${id eq 'admin' && password eq '1234' }">
					<center>
						<ul>
							<br>
							<div class="card-group" style="width: 50%;">
								<div class="card" style="width: 70%;">
									<div class="card-body">
										<h5 class="card-title" style="color: #0acf54;">학생 정보 조회</h5>
										<p class="card-text">학생의 이름, 번호, 이메일 등 정보를 조회하려면 하단 링크를
											클릭해주세요.</p>
										<a href='<c:url value="/admin/studentList"/>'
											class="btn btn-primary">GO</a>
									</div>
								</div>
								<div class="card" style="width: 70%;">
									<div class="card-body">
										<h5 class="card-title" style="color: #0097f6">학생 정보 입력</h5>
										<p class="card-text">학생 정보를 직접 입력하려면 하단 링크를 클릭해주세요.</p>
										<a href='<c:url value="/admin/studentInsert"/>'
											class="btn btn-primary">GO</a>
									</div>
								</div>
							</div>
						</ul>
					</center>
				</c:when>
				<c:otherwise>
					<center>
						<ul>
							<br>
							<div class="card-group" style="width: 50%;">
								<div class="card" style="width: 70%;">
									<div class="card-body">
										<h5 class="card-title" style="color: #0acf54;">문제 풀기</h5>
										<p class="card-text">문제를 풀기 원하시면 하단 버튼을 클릭해주세요.</p>
										<a href='<c:url value="/student/testSolve"/>'
											class="btn btn-primary">GO</a>
									</div>
								</div>
								<div class="card" style="width: 70%;">
									<div class="card-body">
										<h5 class="card-title" style="color: #0097f6">문제 출제하기</h5>
										<p class="card-text">문제를 출제하기 원하시면 하단 버튼을 클릭해주세요.</p>
										<a href='<c:url value="/student/testMake"/>'
											class="btn btn-primary">GO</a>
									</div>
								</div>
							</div>
						</ul>
					</center>
				</c:otherwise>
			</c:choose>
		</p>
	</div>
	<p>
		<br>
</body>
</html>
