<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOME</title>
<style>
	@import url('https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@400&display=swap');
   	* {
   	font-family: 'IBM Plex Sans KR', sans-serif;
   	}
</style>
<link rel="stylesheet" type="text/css" href="/css/font.css" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>

</head>

<body style="text-align: center; background-color: black;">
	<div style="padding-top: 10%;">
		<a href='<c:url value="/login"/>' width="100%" height="100%">
			<div class="row align-self-center m-5">
				<div>
					<img src='<c:url value="/images/saltlux_text.png"/>' width="400">
				</div>
			</div>
		</a>
		<p>
		<p>

			<a href='<c:url value="/login"/>'
				style="color: white; font-size: 1.5em; font-weight: bold; text-decoration-line: none;"
				class="btn btn-black;">화면을 클릭하세요</a>
	</div>
</body>
</html>