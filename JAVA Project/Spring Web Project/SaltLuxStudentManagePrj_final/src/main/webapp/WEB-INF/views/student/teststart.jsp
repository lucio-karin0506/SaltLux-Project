<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@	taglib	prefix="c"	uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문제 풀기</title>
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
<script type="text/javascript">

function button_event(){
	var is_empty = false;
	if (confirm("답안을 제출하시겠습니까?") == true){    //확인
		$('#answerform').find('input[type!="hidden"]').each(function(){
		    if(!$(this).val()) {
		        is_empty = true;
		    }
		});
		 
		if(is_empty) {
		    alert('답안을 모두 작성 후 제출하세요');
		}else{
			document.answerform.submit();
	    	alert('답안이 제출되었습니다!');
	    	history.pushState(null, null, location.replace);
		}
	}else{   //취소
	    return false;
	}
	}
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

<body>

	<div class="row text-center" style="width: 70%; float: none; margin: 0 auto">
		<table class="table m-4" >
			<thead class="thead-dark">
				<tr>
					<th scope="col"><a href='<c:url value="/student/testSolve"/>' >문제 풀기</th>
					<th scope="col"><a href='<c:url value="/student/testMake"/>' >문제 출제</a></th>
					<th scope="col"><a href='<c:url value="/mypage/info"/>' >마이페이지</a></th>

				</tr>
			</thead>
		</table>
	</div>
	<p><p><p><p><p>
	<br>


<div style="width: 70%; float: none; margin: 0 auto">

<c:if test="${subjectId eq '1'}">
<h2>Java</h2>
</c:if>
<c:if test="${subjectId eq '2'}">
<h2>SQLD</h2>
</c:if>
<c:if test="${subjectId eq '3'}">
<h2>ADsP</h2>
</c:if>
<c:if test="${subjectId eq '4'}">
<h2>python</h2>
</c:if>

<!--  -->

<!-- 풀 문제가 없는 경우 -->
<c:if test="${empty problemList}">
해당 카테고리는 더 이상 풀 문제가 없습니다.<br>
다른 카테고리를 선택하세요.<p>
<div style="padding-right:85px;">
<a class="btn btn-secondary me-md-2" role="button" href='<c:url value="/student/testSolve"/>'>카테고리 재선택</a>
</div>
</c:if>
<p>

<!-- 풀 문제가 있는 경우 -->

<c:if test="${not empty problemList}">
<form action='<c:url value="/student/problems"/>' method="post" name="answerform" id="answerform">
<table style="table-layout:fixed;text-align:center;">
<table class="table table-bordered">
				<thead class="thead-dark">
<tr>
	<th scope="col" >NO</th>  
	<th scope="col" style="text-align:center;">문제</th>
	<th scope="col" style="text-align:center;">답안 입력</th>
</tr>
</thead>
<tbody>
<c:forEach var="problem" items="${problemList}" varStatus="status">
	<!-- 답안 테이블에 추가하기 위해 넘길 값을 hidden처리 -->
	<input type="hidden" name="problemId" value="${problem.problemId }">
	<input type="hidden" name="subjectId" value="${problem.subjectId }">

<tr>
	<!-- 문제 순서 -->
	<td style="text-align:center;"> ${status.count}</td>
	
	<!-- 문제 내용 및 보기 -->
	<td> <b>[Q.${status.count}]</b> ${problem.problemContent }<p><p>
		${problem.problemCase }<p><p><p><p><p></td>

<!--  div-->
	
	<!-- 답안 -->
	<td>	
	<c:if test="${problem.problemCase eq ' ' }">
		<input type="text" name="answer${status.count}" placeholder="정답입력"><br>
	</c:if>	
  	<c:if test="${problem.problemCase ne ' ' }">	
			1<input type="radio" name="answer${status.count}" value="1">
			2<input type="radio" name="answer${status.count}" value="2">
			3<input type="radio" name="answer${status.count}" value="3">
			4<input type="radio" name="answer${status.count}" value="4"><br>		
	</c:if>	
	</td>
</tr>
</c:forEach>
</tbody>
<!-- /div-->
</table>
<p><p><p>


<input type="button" value="제출하기" class="btn btn-secondary" onclick="button_event();" style="background-color:#0097f6;border-color: #0097f6;">
<!-- <input type="reset" value="취소"> <p> -->
</form>
</c:if>



</body>
</html>