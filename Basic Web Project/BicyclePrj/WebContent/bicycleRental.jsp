<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="font.css"/>
<meta charset="UTF-8">
<title>따릉이 대여소 대여 순위 안내</title>
</head>
<body style="text-align:center">

<div class="row text-center m-4" style="width: 100%">
      <h1>대여소 대여 순위 안내</h1>
      <div style="width: 70%; float:none; margin:0 auto" >
         <form action="bicycleinput.do" method="post">

         검색하고 싶은 시간을 선택하세요: <p><p><select name="lental_hour" style="width:600px;height:30px">
            <c:forEach var="i" begin="0" end="9">
               <option value="0${i }">0${i }</option>
            </c:forEach>
            <c:forEach var="i" begin="10" end="23">
               <option value="${i }">${i }</option>
            </c:forEach>
         </select><p>
         <br>
         
         검색하고 싶은 지역 키워드를 입력하세요: <input type="text" class="form-control m-4" name="lental_office" placeholder="ex.혜화" />
         
         <div style="width: 70%; float:none; margin:0 auto; display: flex" >
            <div style="width: 30%; float:none; margin:0 auto" >
               <input type="submit" class="form-control" value=" 검 색">
            </div>
            <div style="width: 30%; float:none; margin:0 auto" >
               <input type="reset" class="form-control" value=" 취 소">
            </div>
         </div>
            
         </form>
      </div>
</div>

<a class="btn btn-primary text-white" role="button" style="background-color:black; border-color:black;" href="index.jsp">메뉴 돌아가기</a>

</body>
</html>