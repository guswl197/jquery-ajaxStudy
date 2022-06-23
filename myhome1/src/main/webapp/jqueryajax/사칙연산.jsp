<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
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
		xvalue=document.getElementById("xvalue").value; 
		yvalue=document.getElementById("yvalue").value;  

		$.ajax({
			url: "operation.jsp", 
			data :{xvalue : xvalue, yvalue : yvalue, op : op },
			dataType : "json" //받을 때 json으로 받겠다고 했으므로 파싱이 필요없다. 
		})
		.done((res)=>{
			if(res.result=="success"){
				$("#result").html(res.value); 
			}
			else{
				$("#result").html("error"); 
			}
		})
		.fail((jx,msg)=>{
			
		})
	}
</script>
