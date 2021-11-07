<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문제 선택</title>
<style>
	@import url('https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@400&display=swap');
   	* {
   	font-family: 'IBM Plex Sans KR', sans-serif;
   	} 	
</style>
<link ref="stylesheet" type="text/css" href="/css/upload.css"/>
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

	<div style="width: 70%; float: none; margin: 0 auto">
		<table class="table m-4" style="text-align: center;">
			<thead class="thead-dark">
				<tr>
					<th scope="col"><a href='<c:url value="/student/testSolve"/>' ><h5>문제 풀기</h5></a></th>
					<th scope="col"><a href='<c:url value="/student/testMake"/>' ><h5>문제 출제</h5></a></th>
					<th scope="col"><a href='<c:url value="/mypage/info"/>' ><h5>마이페이지</h5></a></th>

				</tr>
			</thead>
		</table>
	</div>
	<p><p><p><p><p>
	<br>

	
	
<c:url var="testInsert" value="/student/selectproblems"/>

<p>
<div style="width: 70%; float: none; margin: 0 auto">
<center>
		<div class="card-group" style="width:80%;" border="none">
			<div class="card" style="width: 80%;">
				<form action="${testInsert }" method="post">
					<div class="card-body">
						<p><h4 class="card-title">문제 유형 선택</h4><br></p>
						<p class="card-text">
						<div class="btn-group-vertical" role="group"
							aria-label="Basic radio toggle button group" style="width: 80%;">
							<input type="radio" class="btn-check" name="subjectId" id="subjectId1" 
								value="1" autocomplete="off" checked> 
							<label class="btn btn-outline-primary" for="subjectId1">Java</label> 
							<input type="radio" class="btn-check" name="subjectId" id="subjectId2"
								value="2" autocomplete="off"> 
							<label class="btn btn-outline-primary" for="subjectId2">SQLD</label> 
							<input type="radio" class="btn-check" name="subjectId" id="subjectId3" 
								value="3" autocomplete="off"> 
							<label class="btn btn-outline-primary" for="subjectId3">ADsP</label>
							<!-- input type="radio" name="subjectId" value="4" >python</p -->	
						</div>
						</p>
					</div>
					</div>
					<div class="card" style="width:80%;">
					<div class="card-body">
							<p><h4 class="card-title">문제 수 선택 </h4><br></p>
							<p class="card-text">
							<div style="width: 80%;">
							<select name=problemCnt class="form-select" multiple aria-label="multiple select example">
								<option value="5" selected>5</option>
								<option value="10">10</option>
								<option value="15">15</option>
								<option value="20">20</option>
							</select>
							</div>
							</p>
					</div>
			</div>
			</div>
	</center>
</p>
<center>
<div style="width: 80%;">
<a class="btn btn-secondary me-md-2" role="button" href='<c:url value="/loginHome"/>' style="float: left;">◀ 뒤로가기</a>
<input type="submit" value="문제풀기 ▶" class="btn btn-secondary me-md-2" style="float:right;background-color:#0097f6;border-color: #0097f6;">
</div>
</center>
</div>
</div>
</div>
</form>

</body>
</html>