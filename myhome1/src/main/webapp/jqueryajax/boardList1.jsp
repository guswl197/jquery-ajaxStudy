<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="org.json.*" %>
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
	<div class="container">
		<h2>테이블</h2>
		<p></p>
		<table class="table" id="mytable">
			<thead class="thead-dark">
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>조회수</th>
			<tbody id="tbody">
			</tbody>
		</table>
		
		<p></p>
		<ul id="bookList">
		</ul>
	</div>
</body>
</html>

<script>
$(()=>{
	init(); 
})

function init(){
	let url = "json2.jsp"; 
	
	$.ajax({
		url : url,
		dataType : "json",
		method : "POST"
	})
	.done((result)=>{
		
		console.log(result); 
		let totalCnt= result.totalCnt;
		let data= result.data; 
		
		data.forEach((item)=>{
			let row= "<tr>"; 
			row+="<td>"+item.id+"</td>"; 
			row+="<td>"+item.title+"</td>";  
			row+="<td>"+item.writer+"</td>";  
			row+="<td>"+item.hit+"</td>"; 
			row+="</tr>";
			$("#tbody:last").append(row); 
		});
	})
	.fail((jqXHR, error)=>{
		console.log(error); 
	})
	
}
</script>

