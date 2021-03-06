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
	<form id="form">
		<input type="hidden" name="seq" id="seq" value="1000"> </br>
		<div id="result"></div>
		<button id="btnPress" type="button">히든 값 읽기</button>
		</br></br>
		이름 : <input type="text" name="username"></br>
		이메일 : <input type="text" name="email"></br>
		
		<h1>radio button</h1>
		나이 : </br>
			<input type="radio" name="age" value="10">10대
			<input type="radio" name="age" value="20">20대
			<input type="radio" name="age" value="30">30대
			<input type="radio" name="age" value="40">40대
			<input type="radio" name="age" value="50">50대
			</br>
			
		<h1>관심 분야(checkbox)</h1>
			<input type="checkbox" name="interest" value="1">프로그래밍
			<input type="checkbox" name="interest" value="2">웹프로그래밍
			<input type="checkbox" name="interest" value="3">Database
			<input type="checkbox" name="interest" value="4">빅데이터
			<input type="checkbox" name="interest" value="5">인공지능
		</br>
		
		<h1>좋아하는(select)</h1>
			<select name="color">
				<option value="">--선택하세요--</option>
				<option value="red">red</option>
				<option value="green">green</option>
				<option value="blue">blue</option>
				<option value="cyan">cyan</option>
				<option value="magentga">magentga</option>
			</select>
		</br>
		
		<textarea name="intro" cols="30" rows="10"></textarea>
		</form>
</body>
</html>

<script>
	$(()=>{
		loadData(); 
		$("#btnPress").click(()=>{

			$("input[type=hidden][name=seq]").val(12345);
			$("#result").html($("input[type=hidden][name=seq]").val());
			
			console.log($("input[type=text][name=username]").val());
			console.log($("input[type=text][name=email]").val());
			
			console.log($("select[name=color]").val());
			console.log($("textarea[name=intro]").val());
			
			let age= $("input[type=radio][name=age]:checked").val(); 
			console.log(age); 
			
			//checkbox는 여러개 선택 가능
			let interest=""; 
			$("input[type=checkbox][name=interest]:checked").each(function(i,item){ //(인덱스, 아이템)
				 console.log(i, item.value); 
				 interest+=$(this).val()+" "; 
			})
			console.log(interest); 
		});
	})
	
	function loadData(){
		$("input[type=text][name=username]").val("홍길동"); 	
		$("input[type=text][name=email]").val("hongkildong@hanmail.net");
		
		//radio버튼은 인덱스 대신 eq() 사용, prop함수는 속성을 바꾼다. 간단한 스타일도 변경가능하다.
		//jquery가 1.0버전 일 때는 prop대신 attr함수를 사용했음, 현재 prop로 변경됨
		$("input[type=radio][name=age]").eq(1).prop("checked", true); //1번방 데이터를 선택하라
		
		
		$("input[type=checkbox][name=interest]").eq(1).prop("checked", true);
		$("input[type=checkbox][name=interest]").eq(3).prop("checked", true);
		
		$("select[name=color]").val("blue");
		$("textarea[name=intro]").val("자기소개서입니다.\n저는 서울에서 태어나"); 
	}
</script>