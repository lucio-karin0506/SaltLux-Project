<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>성취도 확인하기</title>
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
	<br>
<div style="width: 75%; float: none; margin: 0 auto">
<h5 style="color:#808080">| 과목별 문제 성취율</h5>
<p>
<div style="padding-left:8px;">
<h3 >Java</h3>
<c:if test="${empty checkJavaInfo }">
해당 카테고리에는 제출한 답안이 없습니다.
</c:if>
</div>
<c:if test="${!empty checkJavaInfo }">
<c:forEach var="javaInfo" items="${checkJavaInfo }" varStatus="status">
<c:if test="${status.last }"><h4>총 <b>${status.count}</b>문제 중 <b>${javaCorrCnt}</b>문제 정답</h4></c:if>
</c:forEach>
		<table>
			<table class="table table-bordered">
				<thead class="thead-dark">
<tr>
	<th scope="col">NO</th>
	<th scope="col">채점</th>	
	<th scope="col">입력답</th>
	<th scope="col">정답</th>
	<th scope="col">문제</th>
	<th scope="col">풀이</th>
</tr>
</thead>
<tbody>
<c:forEach var="javaInfo" items="${checkJavaInfo }" varStatus="status">
<tr>
	<td><b>${status.count}</b></td>
	<td style="color:red"><b>${javaInfo.checkResult}</b></td>
	<td>${javaInfo.studentAnswer}</td>
	<td>${javaInfo.problemAnswer}</td>
	<td>${javaInfo.problemContent}<br>
		${javaInfo.problemCase}</td>
	<td>${javaInfo.problemCommentary}</td>
</tr>
</c:forEach>
</tbody>
</table>
</c:if>
</div>
<p><p><p><p>

<div style="width: 75%; float: none; margin: 0 auto;padding-top:20px;padding-left:8px;">
<h3>Sqld</h3>
<c:if test="${empty checkSqldInfo }">
해당 카테고리에는 제출한 답안이 없습니다.
</c:if>
<c:if test="${!empty checkSqldInfo }">
<c:forEach var="sqldInfo" items="${checkSqldInfo }" varStatus="status">
<c:if test="${status.last }"><h4>총 <b>${status.count}</b>문제 중 <b>${sqldCorrCnt}</b>문제 정답</h4></c:if>
</c:forEach>
<table >
			<table class="table table-bordered">
				<thead class="thead-dark">
<tr>
	<th scope="col">NO</th>	
	<th scope="col">채점</th>
	<th scope="col">입력답</th>
	<th scope="col">정답</th>
	<th scope="col">문제</th>
	<th scope="col">풀이</th>
</tr>
</thead>
<tbody>
<c:forEach var="sqldInfo" items="${checkSqldInfo }" varStatus="status">
<tr>
	<td><b>${status.count}</b></td>
	<td style="color:red"><b>${sqldInfo.checkResult}</b></td>
	<td>${sqldInfo.studentAnswer}</td>
	<td>${sqldInfo.problemAnswer}</td>
	<td>${sqldInfo.problemContent}<br>
		${sqldInfo.problemCase}</td>
	<td>${sqldInfo.problemCommentary}</td>
</tr>
</c:forEach>
</tbody>
</table>
</c:if>
</div>
<p><p><p><p>

<div style="width: 75%; float: none; margin: 0 auto;padding-top:20px;padding-left:8px;">
<h3>ADsP</h3>
<c:if test="${empty checkAdspInfo }">
해당 카테고리에는 제출한 답안이 없습니다.
</c:if>
<c:if test="${!empty checkAdspInfo }">
<c:forEach var="adspInfo" items="${checkAdspInfo }" varStatus="status">
<c:if test="${status.last }"><h4>총 <b>${status.count}</b>문제 중 <b>${adspCorrCnt}</b>문제 정답</h4></c:if>
</c:forEach>
<table>
<table class="table table-bordered">
<thead class="thead-dark">
<tr>
	<th scope="col">NO</th>	
	<th scope="col">채점</th>
	<th scope="col">입력답</th>
	<th scope="col">정답</th>
	<th scope="col">문제</th>
	<th scope="col">해설</th>
</tr>
</thead>
<tbody>

<c:forEach var="adspInfo" items="${checkAdspInfo }" varStatus="status">
<tr>
	<td><b>${status.count}</b></td>
	<td style="color:red"><b>${adspInfo.checkResult}</b></td>
	<td>${adspInfo.studentAnswer}</td>
	<td>${adspInfo.problemAnswer}</td>
	<td>${adspInfo.problemContent}<br>
		${adspInfo.problemCase}</td>
	<td>${adspInfo.problemCommentary}</td>
</tr>
</c:forEach>
</tbody>
</table>
</c:if>
</div>



<p><p><p><p>


</body>
</html>