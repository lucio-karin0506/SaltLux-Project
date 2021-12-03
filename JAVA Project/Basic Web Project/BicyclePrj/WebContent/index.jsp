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
<title>따릉이 서비스 메뉴</title>

</head>
<body style="text-align:center;">
<div class="row text-center m-4">
   <div>
      <img src="images/bicycle_image.jpg" width ="100"> 
   </div>
       <h1>2020년의 따릉이는 어땠을까?</h1>
       
       <center>
         <div class="card w-75">
            <a style="background-color:#62847D; border-color:white" href="bicycleYearCount.do" >
            <div class="card-body">
              <h5 class="card-title text-white">2019년 대비 2020년 따릉이 대여 횟수 증감률 조회</h5>
            </div>
            </a>
          </div>
          <div class="card w-75">
            <a style="background-color:#62847D; border-color:white" href="bicycleRental.jsp" >
            <div class="card-body">
              <h5 class="card-title text-white">대여소 대여 순위 조회</h5>
            </div>
            </a>
          </div>
          <div class="card w-75">
            <a style="background-color:#62847D; border-color:white" href="bicycleReturn.jsp" >
               <div class="card-body">
               <h5 class="card-title text-white">대여소 반납 순위 조회</h5>
               </div>
            </a>	
          </div>
          <div class="card w-75">
            <a style="background-color:#62847D; border-color:white" href="repairBicycle.do" >
            <div class="card-body">
              <h5 class="card-title text-white">수리 데이터 조회</h5>
            </div>
            </a>
          </div>
          <div class="card w-75">
            <a style="background-color:#62847D; border-color:white" href="location.do" >
            <div class="card-body">
              <h5 class="card-title text-white">지역구 대여소 검색</h5>
            </div>
            </a>
          </div>
       </center>
      
</div>
</body>
</html>