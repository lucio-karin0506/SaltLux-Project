<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="font.css"/>
<meta charset="UTF-8">
<title>대여소 지역구 검색</title>
</head>
<body style="text-align:center">

<div class="row text-center m-4" style="width: 100%">
	<h1>따릉이 지역구별 대여횟수</h1>
	<div class="form" style="width: 90%; float:none; margin:0 auto" >
		<form action="location.do" method="post">
		
		<input type="text" name="gu" style="width: 600px" placeholder=" 행정구를 입력하세요! ex.종로구"><p><p>
	<input type="submit" value=" 검 색">
			
		</form>
	</div>
</div>

<a class="btn btn-primary text-white" role="button" style="background-color:black; border-color:black;" href="index.jsp">메뉴 돌아가기</a>
</body>
</html>