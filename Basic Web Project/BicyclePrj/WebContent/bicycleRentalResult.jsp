<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>따릉이 대여소 시간대별 대여 순위</title>
</head>
<body style="text-align:center;">
<div class="row text-center m-4" style="width: 100%">
	<h1> ${lental_hour}시간대 따릉이 대여 순위</h1>
	<div style="width: 70%; float:none; margin:0 auto" >
		<table class="table m-4">
			<thead class="thead-dark">
				<tr>
					<th scope="col">순위</th>
					<th scope="col">대여소명</th>
					<th scope="col">대여횟수</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="bicycleInfo" items="${bicycleList }" varStatus="status" >
					<tr>
						<td>${status.count}</td>
						<td>${bicycleInfo.getLental_office()}</td>
						<td>${bicycleInfo.getLental_count()}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>
<a class="btn btn-primary text-black" role="button" style="background-color:white; border-color:white;" href="bicycleRental.jsp">돌아가기</a>
<a class="btn btn-primary text-white" role="button" style="background-color:black; border-color:black;" href="index.jsp">메뉴 돌아가기</a>
</body>
</html>