<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="stylesheet" type="text/css"  href="/css/mypage.css" />
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

<div class="row text-center m-4">
   	</div> 
<!--    <div id="lock">
            <i class="material-icons">lock_outline</i>
        </div>-->
        	<h1><span>My</span> Page</h1>
        
        <c:url var="actionURL" value='/mypage/main'/>
		<form action="${actionURL}" method="post">
		<center>
		<hr width="50%" align="center"/>
		
		<div style="padding:10px">
		<span>
		<input type="password"  placeholder="로그인 비밀번호 입력하세요" name="password" required style="height:30px; width: 370px">
		</span>
		
		<span>
		<input type="submit" value=" 확인" class="/mypage/main" required style="align-item:center"><p>
		</span>
		</div>
          	개인정보를 안전하게 보호하기 위해 비밀번호 확인 후 접속할 수 있습니다.
		<hr width="50%" align="center"/>
		</center>
        </form>
   
</body>
</html>