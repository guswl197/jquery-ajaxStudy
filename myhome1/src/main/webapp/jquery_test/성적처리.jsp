<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	이름 : <input type="text" name="name" id="name"></br>
	국어 : <input type="text" name="kor" id="kor"></br>
	영어 : <input type="text" name="eng" id="eng"></br>
	수학 : <input type="text" name="math" id="math"></br>
	
	<button id="btnPress" type="button">추가</button></br>
	
	<div class="container">
		<h2>테이블</h2>
		<p></p>
		<table class="table" id="mytable">
			<thead class="thead-dark">
				<th>이름</th>
				<th>국어</th>
				<th>영어</th>
				<th>수학</th>
				<th>총점</th>
				<th>평균</th>
			<tbody id="tbody">z
			</tbody>
		</table>
	</div>
	
</body>
</html>
<script>
	$(()=>{
		$("#btnPress").click(()=>{
		let name, kor, eng, math, sum, avg; 
		name=$("input[type=text][name=name]").val(); 
		kor=parseInt($("input[type=text][name=kor]").val()); 
		eng=parseInt($("input[type=text][name=eng]").val()); 
		math=parseInt($("input[type=text][name=math]").val());
		sum=kor+eng+math; 
		avg= sum/3;
		
		$("#mytable > tbody:last")
		.append('<tr><td>'+name+'</td><td>'+kor+'</td><td>'+eng+'</td><td>'+math+'</td><td>'+sum+'</td><td>'+avg+'</td></tr>'); 
		})
	})
</script>