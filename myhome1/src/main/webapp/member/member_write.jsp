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

	<div class="container">
		<h3 style="margin-top:50px">회원가입</h3>
		<div style = "margin-top:50px">
			<form name="myform" id="myform" method="post">
				<input type="hidden" id="idcheckyn" value="N">
				
				<div class="input-group mb-3">
				    <input type="text" class="form-control" placeholder="아이디 입력하세요" id="userid" name="userid" >
				    <div class="input-group-append">
				    	<button class="btn btn-success" id="btnIdCheck" type="button">중복체크</button>
				    </div>
				</div>
				
				<div class="input-group mb-3">
				   <input type="text" class="form-control" placeholder="패스워드 입력하세요" id="password" name="password" >
				</div>
				
				<div class="input-group mb-3">
				   <input type="text" class="form-control" placeholder="패스워드 입력하세요" id="password2" name="password2">
				</div>
				
				<div class="input-group mb-3">
				   <input type="text" class="form-control" placeholder="이름" id="username" name="username">
				</div>
				
				<div class="input-group mb-3">
				   <input type="text" class="form-control" placeholder="전화번호" id="phone" name="phone">
				</div>
				
				<div class="input-group mb-3">
				   <input type="text" class="form-control" placeholder="이메일" id="email" name="email">
				</div>
				
				<div class="input-group mb-3">
				   <input type="text" class="form-control" placeholder="주소" id="address" name="address">
				</div>
				
				<div class="input-group mb-3">
				   <input type="file" class="form-control" placeholder="파일첨부" id="file" name="file">
				</div>
				
				<div class="input-group mb-3" style="justify-content :center">
				   <button class="btn btn-success" id="btnSave" type="button">회원가입</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>
<script>
$(()=>{
	$("#btnIdCheck").click(()=>{
		$.ajax({
			url : "idcheck.jsp",
			data: {"userid":$("#userid").val()},
			dataType : "json",
			method : "POST"
		})
		.done((res)=>{
			if(res.result=="true"){
				alert("사용 가능한 아이디입니다."); 
				$("#btnIdCheck").val("Y");
				$("#userid").prop("readonly", true); 
			}
			else{
				alert("이미 사용중인 아이디입니다."); 	
			}
		})
		.fail((jqXHR, error)=>{
			console.log(error); 
		})
	});
	
	//
	$("#btnSave").click(()=>{
		
		/* 1번 방법 
			let parameter= "userid= "+ $("#userid").val()+ "&password"+$("#password").val(); 
			parameter += "&username="+$("#username").val();
			parameter += "&email="+$("#email").val();
			parameter += "&phone="+$("#phone").val();
			parameter += "&address="+$("#address").val(); */
			
		//2번 방법(직렬화)-> 더 간소 but 파일 전송 시 사용x 
		//폼직렬화는 form태그에 enctype이 지정되어 있으면 직렬화가 수행이 안된다. 
		parameter=$("#myform").serialize(); 	
		console.log(parameter); 
			
		//3번 방법 -> enctype이 지정되어 있을 때
	  /*const formData= new FormData(document.myform);
		//첨부파일이 있으면 첨부파일을 별도로 추가를 해야 한다. 
		formData.append("upload", file.files[0]]); 
		
		console.log(formData);
		for(key of formData.keys()){
			console.log(key,formData.get(key)); 
		} */
				
		$.ajax({
			url : "save.jsp",
			data: parameter,
			dataType : "text",
			method : "POST"
		})
		.done((res)=>{
			console.log(res);
			location.href="<%=request.getContextPath()%>/index.jsp"; 
		})
		.fail((jqXHR, error)=>{
			console.log(error); 
		})
	})
})
</script>

<!-- 아이디 중복 체크
	id.check.jsp 
	클라이언트에서 userid를 보내면 서버에서 idcheck.jsp에서 받아서 중복된다면 {"result" : "false"}
	그 밖의 경우는 false대신 true -> value 값을 Y로 바꾸기
	jquery의 경우 prop("readonly", true)   
 -->