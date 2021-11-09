<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>따릉이 월별 고장비율</title>
</head>
<body style="text-align:center;">

<div class="row text-center m-4" style="width: 100%">
	<h1>따릉이 월별 고장비율</h1>
	<div style="width: 70%; float:none; margin:0 auto" >
		<table class="table m-4">
			<thead>
				<tr>
					<th scope="col">월</th>
					<th scope="col">고장 신고 횟수</th>
					<th scope="col">전월 대비 고장증가율(%)</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="repair" items="${repairList}">
					<tr>
						<td>${repair.month}월</td>
						<td>${repair.repairCnt}</td>
						<td>${repair.repairPct}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>
<a class="btn btn-primary text-black" role="button" style="background-color:white; border-color:white;" href="repairBicycle.jsp">돌아가기</a>
<a class="btn btn-primary text-white" role="button" style="background-color:black; border-color:black;" href="index.jsp">메뉴 돌아가기</a>
</body>
</html>