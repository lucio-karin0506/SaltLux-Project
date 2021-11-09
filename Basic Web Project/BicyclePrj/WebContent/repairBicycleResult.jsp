<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>repair 결과</title>
<style>
   table.table > thead > tr > th{
    border-bottom: 1px solid black;
  }
</style>
</head>
<body style="text-align:center;">

<div class="row text-center m-4" style="width: 100%">
   <h1>고장 신고 횟수</h1>
   <div style="width: 70%; float:none; margin:0 auto" >
      <table class="table m-4">
         <thead class="thead-dark">
            <tr>
                  <th scope="col">월</th>
                  <th scope="col">고장 유형</th>
                  <th scope="col">고장 신고 횟수</th>
            </tr>
         </thead>
      </table>     
      <div style="width:15%; float:left;">
        <table class="table align-middle">
            <td rowspan="6">1월</td>
            <td>&nbsp;</td>
            <tr>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td>&nbsp;</td>
            </tr> 
            <td rowspan="6">2월</td>
            <td>&nbsp;</td>
            <tr>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td>&nbsp;</td>
            </tr>
            <td rowspan="6">3월</td>
            <td>&nbsp;</td>
            <tr>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td>&nbsp;</td>
            </tr> 
            <td rowspan="6">4월</td>
            <td>&nbsp;</td>
            <tr>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td>&nbsp;</td>
            </tr> 
            <td rowspan="6">5월</td>
            <td>&nbsp;</td>
            <tr>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td>&nbsp;</td>
            </tr> 
            <td rowspan="6">6월</td>
            <td>&nbsp;</td>
            <tr>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td>&nbsp;</td>
            </tr> 
            <td rowspan="6">7월</td>
            <td>&nbsp;</td>
            <tr>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td>&nbsp;</td>
            </tr> 
            <td rowspan="6">8월</td>
            <td>&nbsp;</td>
            <tr>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td>&nbsp;</td>
            </tr> 
            <td rowspan="6">9월</td>
            <td>&nbsp;</td>
            <tr>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td>&nbsp;</td>
            </tr> 
            <td rowspan="6">10월</td>
            <td>&nbsp;</td>
            <tr>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td>&nbsp;</td>
            </tr> 
            <td rowspan="6">11월</td>
            <td>&nbsp;</td>
            <tr>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td>&nbsp;</td>
            </tr> 
            <td rowspan="6">12월</td>
            <td>&nbsp;</td>
            <tr>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td>&nbsp;</td>
            </tr> 
          
        </table>
      </div>
      <div style="width:85%; float:right;">
        <table class="table">
          <tbody>
              <c:forEach var="repair" items="${repairList}">
                 <tr>
                    <!-- <td>${repair.month}월</td> -->
                    <td>${repair.repairType}</td>
                    <td>${repair.repairCnt}</td>
                 </tr>
              </c:forEach>
           </tbody>
        </table>
      </div>
   </div>
</div>

<a class="btn btn-primary text-white" role="button" style="background-color:black; border-color:black;" href="repairBicycle.jsp">돌아가기</a>
</body>
</html>