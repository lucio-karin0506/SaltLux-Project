<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문제 파일 업로드</title>
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
	<p><p><p><p><p>
	<br>
	
	<div  class="row text-left" style="width: 50%; float: none; margin: 0 auto; ">
	
	<h2>문제 출제 파일 업로드</h2><br><p>
	<p><h4><b>업로드 절차</b><h4></p>
	<p>1. 아래 링크의 문제 업로드 양식 다운 
	<p style="padding-left:20px;"> ▶ <a href="../file/sample_problem_sheet.xlsx" download="sample_problem_sheet.xlsx">sample_problem_sheet.xlsx</a>  </p>
	<p>2. 양식에 맞춰 주관식 및 객관식, 문제내용, 보기, 정답, 해설 작성 </p>
	<p style="padding-left:20px;"> ※ 주관식 및 객관식 선택 후 입력해야할 칸은 초록색, 
	<br style="padding-left:20px;">입력불가인데 입력한 칸은 빨간색으로 확인 가능  
	
	<p>3. 업로드 할 파일의 문제 카테고리 선택</p>
	<p>4. 작성 완료한 문제 파일 업로드	</p>
	
	<p><h4><b>문제 파일 업로드</b><h4></p>
		<table class="col text-left m-10">
			<h4>
			<c:url var="actionURL" value='/student/upload' />
	<form action="${actionURL}" method="post" enctype="multipart/form-data">
					카테고리 선택 : <select name="subjectId">
						<option value="1">java
						<option value="2">sqld
						<option value="3">adsp
						<option value="4">python
					</select> &emsp;<p><br> 
					파일 선택하기 : <input type="file" name="file"><br>
					
				<p><p><p><p>
					<input type="submit" class="btn btn-primary" value=" 업로드">
			</h4>
			</p>
		</table>
	</form>
	</div>
</body>
</html>