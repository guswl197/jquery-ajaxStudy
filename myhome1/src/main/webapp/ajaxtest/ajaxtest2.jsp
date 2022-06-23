<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	아이디 : <input type="text" name="userid" id="userid"></br>
	<button id="btnSend" type="button">보내기</button>
	<div id="result"></div>
</body>
</html>
<script>
window.onload= function(){
	document.getElementById("btnSend").addEventListener("click", loadData); 
}

function loadData(){
	var xhttp= new XMLHttpRequest(); 
	xhttp.onload= function(){
		console.log(this.responseText); 
		document.getElementById("result").innerHTML= this.responseText;
	}
	let url= "receive1.jsp?userid="+document.getElementById("userid").value; 
	console.log(url); 
	
	xhttp.open("GET", url, true); 
	xhttp.send(); 
}
</script>