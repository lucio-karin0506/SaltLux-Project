<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>LOGIN</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<style>
    @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');
   	* {
   	font-family: 'Noto Sans KR', sans-serif;
   	}
   	
.container {
	width: 500px;
	line-height: 60px;
	margin: 100px auto;
}

h1 {
	text-align: center;
}
h1 span {
	color: #0097f6;
}
.login {
	background-color: #d4edfd;
	color: white;
	border-radius: 5px;
	border: 0;
	padding: 13px 180px;
}

#signup {
	background-color: #d4edfd;
	color: white;
	border-radius: 5px;
	border: 0;
	font-size: 40px;
}
p {
	text-align: center;
}
i {
	color: lightgray;
}
#person {
	position: absolute;
	top: 278px;
	margin: 0 405px;
}
#lock {
	position: absolute;
	top: 339px;
	margin: 0 405px;
}
input {
	border: 1px solid lightgray;
	border-radius: 1px;
}
</style>
<script>
	$(function() {
		var responseMessage = "<c:out value="${msg}" />";
		if (responseMessage != "") {
			alert(responseMessage)
		}
	})
</script>
</head>
<body style="align-item:center;">
   	<div class="container">
   	<div class="row text-center">
   	<a href="home"><img src="images/saltlux.png" width ="100"></a>
   	</div> 
        <div id="person">
            <i class="material-icons">person_outline</i>
        </div>
        <div id="lock">
            <i class="material-icons">lock_outline</i>
        </div>
        	<h1><span>Login</span> Page</h1>
        <hr />
        <form action="${loginURL }" method="post" >
            <center>
            <input type="text" placeholder="아이디" name="id" required style="height:30px; width: 370px" /><br />
            <input type="password" placeholder="비밀번호" name="password" required style="height:30px; width: 370px" /><br />
            <input type="submit" value="LOGIN" class="loginHome" style="text-align:center;">
            </center>
            <!--input type="submit" value="HOME" class="HOME" style="text-align:center;"-->
        </form>
        <hr />
    </div>
</body>
</html>