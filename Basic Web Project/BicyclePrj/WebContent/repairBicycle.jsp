<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="font.css"/>
<meta charset="UTF-8">
<title>따릉이 월별 고장내역</title>

</head>
<body style="text-align:center;">

<div class="row text-center m-4" style="width: 100%">
	<h1>월별 고장내역</h1>
	<div style="width: 30%; float:none; margin:0 auto" >
		<h2> <a class="btn btn-primary text-white m-3" role="button" style="background-color:#62847D; border-color:white;" href="repairBicycleResult.do">고장유형에 따른 월별 신고 건수</a></h2>
		<h2> <a class="btn btn-primary text-white m-3" role="button" style="background-color:#62847D; border-color:white;" href="pctResult.do">전월대비 고장 증감율</a></h2>
		<a class="btn btn-primary text-white m-3" role="button" style="background-color:black; border-color:black;" href="index.jsp">메뉴 돌아가기</a>
	</div>
</div>
</body>
</html>