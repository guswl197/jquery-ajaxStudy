<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	값1 : <input type="text" name="xvalue" id="xvalue"></br>
	값2 : <input type="text" name="yvalue" id="yvalue"></br>
	
	<button id="add" type="button">더하기</button>
	<button id="sub" type="button">빼기</button>
	<button id="mul" type="button">곱하기</button>
	<button id="div" type="button">나누기</button>
	
	<div id="result"></div>
</body>
</html>
<script>
	window.onload= function(){ //콜백함수에 인자를 쓰고 싶다면 ()=>{} 으로
		document.getElementById("add").addEventListener("click",() => { oper(1)});
		document.getElementById("sub").addEventListener("click",() => { oper(2)});
		document.getElementById("mul").addEventListener("click",() => { oper(3)});
		document.getElementById("div").addEventListener("click",() => { oper(4)});
	}
	
	function oper(op){
		let numop=op;
		var xhttp= new XMLHttpRequest(); 
		xhttp.onload= function(){
			let data=JSON.parse(this.responseText); //파실작업을 해서 string -> JSON객체로 전환
			if(data.result=="success"){
				document.getElementById("result").innerHTML="값은" + data.value+ "입니다.";
			}
			else{
				document.getElementById("result").innerHTML="에러발생"; 
			}
		}
		
		xvalue=document.getElementById("xvalue").value; 
		yvalue=document.getElementById("yvalue").value;  

		let url="operation.jsp?xvalue="+xvalue+"&yvalue="+yvalue+"&op="+numop; 

		console.log(url); 
		xhttp.open("GET", url, true); 
		xhttp.send(); 
	}
</script>