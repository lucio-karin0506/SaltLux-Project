<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<script type="text/javascript">
	$(function() {
		$("input[type=button]").click(function() {
			req_url = "http://127.0.0.1:5000/ai_bot"
			var form = $("form")[0];
			var form_data = new FormData(form);
			$.ajax({
				url: req_url,
				data: form_data,
				type: "POST",
				async: true,
				processData: false,
				contentType: false,
				success: function(data){
					console.log(data);
					question = $("input[name=question]").val();
					$("#result").append("<p>Q: " + question + "<br>A: " + data + "</p>");
					$("input[name=question]").val("")
				},
				error: function(e){
					alert(e);
				}
			})
		})
	});
</script>

</head>
<body>

<h1>질문 입력 ㄱㄱ</h1>

<form action="#" method="post">
	Question: <input type="text" name="question" size="50">
	<input type="button" value="물어보기">
</form>

<div id='result'></div>

</body>
</html>