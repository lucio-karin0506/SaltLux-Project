<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>출제한 문제 확인하기</title>
<style>
	@import url('https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@400&display=swap');
   	* {
   	font-family: 'IBM Plex Sans KR', sans-serif;
   	}
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script	src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script	type="text/javascript">
$(document).ready(function(){
	$(".delete").click(function(){
	if(confirm("이 작업은 되돌릴 수 없습니다. 문제를 삭제하겠습니까?")){
		return true;
	}else{
		return false;
	}
})
});
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
	<br>
	<br><br>
	
	<div style="width: 70%; float: none; margin: 0 auto">
	<h3 style="padding-left:8px;">${id}님의 출제 목록</h3>
		<table class="table">
			<table class="table table-bordered">
				<thead class="thead-dark">
					<tr>
						<th scope="col">NO</th>
						<th scope="col">문제</th>
						<th scope="col">정답</th>
						<th scope="col">해설</th>
						<th scope="col"></th>
						<th scope="col"></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="problemList" items="${problemList}"
						varStatus="status">
						<tr>
							<td>${status.count }</td>
							<c:if test="${problemList.subjectId eq '1'}">

								<td>Java) ${problemList.problemContent}<br>${problemList.problemCase}</td>
								<td>${problemList.problemAnswer}</td>
								<td>${problemList.problemCommentary}</td>

							</c:if>
							<c:if test="${problemList.subjectId eq '2'}">

								<td>SQLD) ${problemList.problemContent}<br>${problemList.problemCase}</td>
								<td>${problemList.problemAnswer}</td>
								<td>${problemList.problemCommentary}</td>

							</c:if>
							<c:if test="${problemList.subjectId eq '3'}">

								<td>ADsP) ${problemList.problemContent}<br>${problemList.problemCase}</td>
								<td>${problemList.problemAnswer}</td>
								<td>${problemList.problemCommentary}</td>

							</c:if>
							<c:if test="${problemList.subjectId eq '4'}">
								<td>python) ${problemList.problemContent}<br>${problemList.problemCase}</td>
								<td>${problemList.problemAnswer}</td>
								<td>${problemList.problemCommentary}</td>
							</c:if>
							<td><a href='<c:url value="/mypage/delete/${problemList.problemId }"/>' class="delete" >삭제</a></td>
							<td><a href='<c:url value="/mypage/myproblemsupdate/${problemList.problemId }"/>'>수정</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</table>
	</div>
</body>
</html>