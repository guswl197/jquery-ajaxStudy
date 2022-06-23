<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userid= request.getParameter("userid"); 
	String username= request.getParameter("username"); 
	String password= request.getParameter("password"); 
	String phone= request.getParameter("phone"); 
	String email= request.getParameter("email"); 
	String address= request.getParameter("address"); 
	
	
%>
<%=userid%><br/>
<%=username%><br/>
<%=password%><br/>
<%=phone%><br/>
<%=email%><br/>
<%=address%><br/>

