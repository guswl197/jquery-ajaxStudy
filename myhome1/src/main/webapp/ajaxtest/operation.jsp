<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
int xvalue=Integer.parseInt(request.getParameter("xvalue")); 
int yvalue=Integer.parseInt(request.getParameter("yvalue")); 
int op= Integer.parseInt(request.getParameter("op"));
int result; 

if(op==1){
	result= xvalue+yvalue; 
}
else if(op==2){
	result= xvalue-yvalue; 
}
else if(op==3){
	result= xvalue*yvalue; 
}
else{ //4
	result= xvalue/yvalue; 
}

// http://localhost:9090/myhome1/ajaxtest/operation.jsp?xvalue=1&yvalue=2&op=1 
%>

{"result":"success", "value":"<%=result %>"}

 