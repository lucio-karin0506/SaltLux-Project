<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정된 문제와 답, 설명 확인 페이지</title>
<style>
	@import url('https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@400&display=swap');
   	* {
   	font-family: 'IBM Plex Sans KR', sans-serif;
   	}
</style>
<link rel="stylesheet" type="text/css" href="/css/font.css" />
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
<body >
	<div style="width: 70%; float:none; margin:0 auto;text-align:center;" >
		<table class="table m-4" style="table-layout:fixed;">
			<thead class="thead-dark">
				<tr>
					<th scope="col"><a href='<c:url value="/loginHome"/>' ><h5>메인페이지</h5></th>
					<th scope="col"><a href='<c:url value="/mypage/main"/>' ><h5>출제한 문제 확인하기</h5></a></th>
					<th scope="col"><a href='<c:url value="/mypage/achievment"/>' ><h5>문제 성취율 확인</h5></a></th>
				</tr>
			</thead>
		</table>	
	</div>
	
<c:forEach var="updateproblem" items="${updateproblem}" >
	<div style="width: 70%; float: none; margin: 0 auto">
	<h1>문제 수정완료</h1>
		<table class="table m-4">
			<table class="table table-bordered">
				
				<thead class="thead-dark">
					<tr>
						<th scope="col">문제</th>	
					</tr>
				</thead>
				<tbody>
						<tr>
							
								<td>${updateproblem.problemContent}</td>
						</tr>	
				</tbody>
			
				
				<c:if test="${updateproblem.problemCase ne null}">
				
				<thead class="thead-dark">
					<tr>
						<th scope="col">보기</th>
					</tr>
				</thead>
				<tbody>
						<tr>
							<td>${updateproblem.problemCase}</td>
								
						</tr>	
				</tbody>
				</c:if>
				<thead class="thead-dark">
					<tr>
						<th scope="col">답</th>
						
					</tr>
				</thead>
				<tbody>
					<tr>
								<td>${updateproblem.problemAnswer}</td>
								
						</tr>		
						
				</tbody>
				<thead class="thead-dark">
					<tr>
						<th scope="col">설명</th>
						
					</tr>
				</thead>
				<tbody>
						<tr>
								<td>${updateproblem.problemCommentary}</td>
								
						</tr>	
				</tbody>
			</table>
		</table>
		</div>
		</c:forEach>
</body>
</html>