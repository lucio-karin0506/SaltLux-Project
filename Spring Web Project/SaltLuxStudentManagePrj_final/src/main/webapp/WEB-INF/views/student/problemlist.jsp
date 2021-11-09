<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>업로드한 문제 리스트 확인</title>
<style>
	@import url('https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@400&display=swap');
   	* {
   	font-family: 'IBM Plex Sans KR', sans-serif;
   	}
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
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
<body>
<body>
	<div class="row text-center" style="width: 70%; float: none; margin: 0 auto">
		<table class="table m-4">
			<thead class="thead-dark">
				<tr>
					<th scope="col"><a href='<c:url value="/student/testSolve"/>' ><h5>문제 풀기</h5></a></th>
					<th scope="col"><a href='<c:url value="/student/testMake"/>' ><h5>문제 출제</h5></a></th>
					<th scope="col"><a href='<c:url value="/mypage/info"/>' ><h5>마이페이지</h5></a></th>	

				</tr>
			</thead>
		</table>	
	</div>
	<br><br>
	<p>
	<div class="row text-left m-4">
		<c:if test="${message eq '에러'}">
			<!-- 오류가 있다면 -->

			<div class="sortleft">
				<h1>
					<img src='<c:url value="/images/warning0.jpg"/>' width="50">
					파일을 다시 업로드 해주세요 !
				</h1>
				<p>
				<p>
				<h3>업로드한 파일이 엑셀 파일인지 확인해주세요!</h3>
				<p>
				<h3>
					엑셀 파일을 올렸다면?
					</h2>
					<h4>
						확인사항) <br> 1. 엑셀의 열 항목 중 '문제내용'과 '문제정답'은 값이 존재해야 합니다. <br>
						2. '문제 해설' 항목 오른쪽에 값이 들어가 있는지 확인해주세요. <br>
						<div>
							<img src='<c:url value="/images/주의사항2.png"/>' width="800">
						</div>
						<h4>
			</div>
		</c:if>
	</div>

	<c:if test="${message ne '에러'}">
		<!-- 오류가 없다면 -->
		<p>
		<h1>파일업로드 완료</h1>
		<br />
		<div style="width: 70%; float: none; margin: 0 auto">
			<table class="table m-4">
				<table class="table table-bordered">
					<thead class="thead-dark">
						<tr>
							<th scope="col">문제와 보기</th>
							<th scope="col">답</th>
							<th scope="col">설명</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="problemList" items="${problemList}">
							<c:if test="${problemList.subjectId eq '1'}">
								<tr>
									<td>Java) ${problemList.problemContent}<br>${problemList.problemCase}</td>
									<td>${problemList.problemAnswer}</td>
									<td>${problemList.problemCommentary}</td>
								</tr>
							</c:if>
							<c:if test="${problemList.subjectId eq '2'}">
								<tr>
									<td>SQLD) ${problemList.problemContent}<br>${problemList.problemCase}</td>
									<td>${problemList.problemAnswer}</td>
									<td>${problemList.problemCommentary}</td>
								</tr>
							</c:if>
							<c:if test="${problemList.subjectId eq '3'}">
								<tr>
									<td>ADsP) ${problemList.problemContent}<br>${problemList.problemCase}</td>
									<td>${problemList.problemAnswer}</td>
									<td>${problemList.problemCommentary}</td>
								</tr>
							</c:if>
							<c:if test="${problemList.subjectId eq '4'}">
								<tr>
									<td>python) ${problemList.problemContent}<br>${problemList.problemCase}</td>
									<td>${problemList.problemAnswer}</td>
									<td>${problemList.problemCommentary}</td>
								</tr>
							</c:if>
						</c:forEach>
					</tbody>
				</table>
			</table>
		</div>
	</c:if>
	<a class="btn btn-primary text-black" role="button" style="background-color:#5fbef8; border-color:#5fbef8;" href='<c:url value="/student/testMake"/>'>뒤로가기</a>
	<a class="btn btn-primary text-black" role="button" style="background-color:#5fbef8; border-color:#5fbef8;" href='<c:url value="/loginHome"/>'>메인으로 돌아가기</a>

</body>
</html>