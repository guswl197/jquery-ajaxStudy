<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<%=request.getContextPath()%>/js/jquery-3.6.0.min.js"></script>
</head>
<body>
	<%=request.getContextPath() %> <!-- -> myhome1을 의미(경로 찾기) -> 써주는거 너무 귀찮 -> CDN사용! -->
	<!-- url : http://127.0.0.1:9090/myhome1/jquery_test/sample1.jsp -->
</body>
</html>
<script>
	$(()=>{
		alert("루트부터 시작 잘될까?"); 
	})
</script>