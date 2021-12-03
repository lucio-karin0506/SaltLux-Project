<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="font.css"/>
<meta charset="UTF-8">
<title>2019 vs 2020</title>
</head>
<body style="text-align:center;">

<div class="row text-center m-4" style="width: 100%">
	<h1>2019년 대비 2020년 따릉이 대여 횟수 증감률</h1>
	<div style="width: 70%; float:none; margin:0 auto" >
		<table class="table m-4">
			<thead class="thead-dark">
				<tr>
					<th scope="col">월</th>
					<th scope="col">2019년도(횟수)</th>
					<th scope="col">2020년도(횟수)</th>
					<th scope="col">증감률(%)</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="yearInfo" items="${year_count_list }">
					<tr>
						<td>${yearInfo.getMonth()}</td>
						<td>${yearInfo.getMonth_2019()}</td>
						<td>${yearInfo.getMonth_2020()}</td>
						<td>${yearInfo.getIncreasing_pct()}</td>
					</tr>
				</c:forEach>
				<tr>
					<td>총계</td>
					<td>${countedMap['sum2019']}</td>
					<td>${countedMap['sum2020']}</td>
					<td>${countedMap['sum_pct']}</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>
<a class="btn btn-primary text-white" role="button" style="background-color:black; border-color:black;" href="index.jsp">메뉴 돌아가기</a>
</body>
</html>