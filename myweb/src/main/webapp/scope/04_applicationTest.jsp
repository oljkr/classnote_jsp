<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>04_applicationTest</title>
</head>
<body>
	<h3>λ΄μ₯κ°μ²΄</h3>
<%
	/*
	   π [application λ΄μ₯κ°μ²΄]
		- ServletContext application
		- μ¬μ©μ λͺ¨λκ° κ³΅μ νλ μ μ­μ  μλ―Έμ κ°μ²΄
		- μλ²μ λν μ λ³΄λ₯Ό κ΄λ¦¬νλ κ°μ²΄
	
	*/
	
	// /bbsν΄λμ μ€μ  λ¬Όλ¦¬μ μΈ κ²½λ‘
	
	//I:\java202207\workspace
	//             \.metadata
	//             \.plugins
	//             \org.eclipse.wst.server.core
	//             \tmp0
	//             \wtpwebapps
	//             \myweb
	//             \bbs
	
	//μΉκ²½λ‘ http://localhost:9090/myweb/bbs
	out.print(application.getRealPath("/bbs")); //μΆμ²
	out.print("<hr>");
	out.print(request.getRealPath("/bbs"));
	out.print("<hr>");
	
	//application λ΄λΆ λ³μ
	application.setAttribute("uid", "ITWILL");
	out.print(application.getAttribute("uid"));
	out.print("<hr>");
	//--------------------------------------------------------
	
	/*
	   π [application λ΄μ₯κ°μ²΄] - μμ²­ν μ¬μ©μμκ² μλ΅ν  λ	*/
	   //response.sendRedirect("") νμ΄μ§ μ΄λ
	   
	   //μμ²­ν μ¬μ©μμκ² μλ΅ λ©μΈμ§ μ μ‘(AJAXμμ λ§μ΄ μ¬μ©)
	   PrintWriter print=response.getWriter();//λ¦¬ν΄νμ΄ PrintWriter			


%>

</body>
</html>