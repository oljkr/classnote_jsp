<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="net.testbean.*" %>
<jsp:useBean id="calc" class="net.testbean.CalcBean"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>calcok.jsp</title>
</head>
<body>
	<h3>* Java Bean 이용한 계산 결과 *</h3>
	* 절대값/팩토리얼값을 구하시오 *<br/>
<%
int su=Integer.parseInt(request.getParameter("num"));
out.print(su+" 절대값: "+calc.abs(su));
out.print("<br/>");
out.print(su+" 팩토리얼: "+calc.fact(su));
out.print("<br/>");
%>

</body>
</html>