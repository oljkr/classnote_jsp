<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- JSP 코드 주석 --%>
<%-- JSP 주석 자동 코딩 Ctrl+Shift+/ --%>
<%--
	● [한글 인코딩] - 섞어 쓰지 않도록 주의
	  - 조합형(UTF -8) : 초성+중성+종성으로 조합. 더 많은 한글 표현이 가능
	  - 완성형(EUC -KR) : MS949
	
	● JSP Directive(지시자)
	<%@ page %>
	<%@ include %>
	<%@ taglib %>
	
	● <%@ page %> 지시자
	language=""		생략가능
	contentType=""	필수요소
	pageEncoding=""
	import=""
	
	● JSP페이지에서 사용 가능한 문법
	 - HTML tag
	 - CSS	<style></style>
	 - JavaScript <script></script>
	 - JSP <% %>
	 
	● JSP 코드 작성 영역 선언
	  <%  %> 스크립트릿(Scriptlet)
 --%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>01_JSP기본문법.jsp</title>
</head>
<body>

	<h3>JSP 기본문법</h3>
	<hr>
	<h4>대한민국</h4>
	<hr>
	1+2+3
	<hr>
	
<%
	//한줄 주석
	/* 여러줄 주석 */
	/*
		스크립트릿(Scriptlet)
		- JSP 코드 작성 영역
		- Tomcat WAS에 의해 JSP코드가 해석되고(참고로 ASP는 안 됨!!), 결과값을 HTML문서로 변환해서
		  Frontend단으로 응답해 준다.
	*/
	out.print("무궁화");
	out.print(123+456); //jsp에서는 연산이 됨
	out.print(5+7);
	out.print(8.9);
	out.print('X');
	
	//HTML 태그를 JSP에서 사용하는 경우 "" 안에서 작성
	out.print("<h1>악마</h1>");
	out.print("<img src='../images/devil.png'>");
	out.print("<hr>");

%>

<%-- 스크립트릿 주석 Ctrl+Shift+/
<%
	//스크립트릿은 문서에 여러번 가능하다
	out.println("<style>.txt{color:red}</style>");
	out.println("<span class=txt>오필승코리아</span>");
%>
 --%>
	

</body>
</html>