<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
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
	
	<br><br>
<h1>마이페이지</h1>
</div>
<center>
			<ul><br>
					<div class="card-group" style="width:50%;">    
	          			<div class="card" style="width:70%;">
			  				<div class="card-body">
				    			<h5 class="card-title" style="color:#0acf54;">출제한 문제 확인하기</h5>
				    			<p class="card-text">출제한 문제를 확인하시려면 과목을 선택하신 후 하단 버튼을 클릭해주세요.</p>
				    			<c:url var="actionURL" value='/mypage/list'/>
				    			<form action="${actionURL}" method="post">
								카테고리 선택 : <select name="subjectId">
								<option value="1">java
								<option value="2">sqld
								<option value="3">adsp
								<option value="4">python
								</select> &emsp;<br><p><p>	
				    			<input type="submit" class="btn btn-primary" value=" GO">
				    			</form>
			  				</div>
			  			</div>
			  			<div class="card" style="width:70%;">
			  				<div class="card-body">
				    			<h5 class="card-title" style="color:#0097f6">문제 성취율 확인하기</h5>
				    			<p class="card-text">문제를 얼마나 풀었는지 확인하시려면 하단 버튼을 클릭해주세요.</p>
				    			<a class="btn btn-primary" role="button" href='<c:url value="/mypage/achievment"/>' > GO</a>
	  						</div>
			  			</div>
					</div>
			</ul>
		</center>
</body>
</html>