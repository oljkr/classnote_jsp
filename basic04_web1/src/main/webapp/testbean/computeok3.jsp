<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="net.testbean.Compute" %>
<jsp:useBean id="comp" class="net.testbean.Compute" scope="page"></jsp:useBean>
<%--
	[액션태그]
	<jsp:useBean id=""></jsp:useBean>
	<jsp:forward page=""></jsp:forward>
	<jsp:include page=""></jsp:include>
 --%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>computeok3.jsp</title>
</head>
<body>
	<h3>* 계산 결과 *</h3>
	<h4>3) Java Bean을 이용해서 객체 생성후 메소드 호출</h4>
	
<%
	int num1=Integer.parseInt(request.getParameter("num1").trim());
	int num2=Integer.parseInt(request.getParameter("num2").trim());
	
	out.print(num1 + "+" + num2 + "=" + comp.add(num1,num2));
	out.print("<hr>");
	out.print(num1 + "-" + num2 + "=" + comp.sub(num1,num2));
	out.print("<hr>");
	out.print(num1 + "*" + num2 + "=" + comp.mul(num1,num2));
	out.print("<hr>");
	out.print(num1 + "/" + num2 + "=" + comp.div(num1,num2));
	out.print("<hr>");
	out.print(num1 + "%" + num2 + "=" + comp.mod(num1,num2));
%>

</body>
</html>