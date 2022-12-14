<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>03_sessionTest.jsp</title>
</head>
<body>
<h3>session λ΄μ₯κ°μ²΄</h3>
<%
	/*
	  π [νμ΄μ§ μ΄λ]
	    - HttpSession session
	    - μμ²­ν μ¬μ©μμκ² κ°λ³μ μΌλ‘ μ κ·Ό(λλ§μ μΊλΉλ·)
	    - μ μΈν μΈμλ³μλ μ μ­μ  μνλ‘ μ μ§λλ€(λ΄κ° λΈλ‘κ·Έλ, μΉ΄νλ, μ₯λ°κ΅¬λλ μ΄λν΄λ μ μ­μ μΌλ‘ μ μ§λ¨)
	    - μμ²­ν μ λ³΄μ μνλ₯Ό μ μ§νκΈ° μν΄μ
	    - μΌμ μκ°λμ μ΄λ²€νΈκ° λ°μλμ§ μμΌλ©΄ μλ μ­μ 
	      (μνμ¬μ΄νΈμμ 10λΆμ΄ μ§λλ©΄ μλ λ‘κ·Έμμνλ κ²μ²λΌ...μ°μ₯νλ €λ©΄ λ΄κ° μ΄λ²€νΈλ₯Ό λ°μμμΌμΌ ν¨.)	    				
				
	*/
	
	//μΈμ λ΄μ₯κ°μ²΄μμ λ°κΈ ν΄μ£Όλ μμ΄λ
	out.print("μΈμ μμ μμ΄λ : ");
	out.print(session.getId()); //32μλ¦¬
	out.print("<hr>");
	
	//μΈμλ³μ
	//->λ³λμ μλ£νμ΄ μλ€
	//->myweb νλ‘μ νΈμ λͺ¨λ  νμ΄μ§μμ κ³΅μ λλ μ μ­λ³μ(νλ² λ‘κ·ΈμΈνλ©΄ λ©μΌ/μΉ΄ν/λΈλ‘κ·Έ λ± μνμ μ§μ μ¬μ©)
	
	//μΈμλ³μ
	//μ μλμ λ³μμ application, session, requestμ μκΈμλ§ λ°μ κ΅¬λΆνμ λ€.
	session.setAttribute("s_id", "itwill");
	session.setAttribute("s_pw", "12341234");
	
	//μΈμλ³μκ° κ°μ Έμ€κΈ°
	Object obj=session.getAttribute("s_id");
	String s_id=(String)obj; //λ€νμ±
	String s_pw=(String)session.getAttribute("s_pw");
	
	out.print("μΈμλ³μ s_id : "+s_id+"<hr>");
	out.print("μΈμλ³μ s_pw : "+s_pw+"<hr>");
	
	//μΈμλ³μ κ°μ  μ κ±°(λ‘κ·Έμμν λ) -> nullκ°
	session.removeAttribute("s_id");
	session.removeAttribute("s_pw");
	
	out.print("μΈμλ³μ μ­μ ν<hr>");
	out.print("μΈμλ³μ s_id : "+session.getAttribute("s_id"));
	out.print("<hr>");
	out.print("μΈμλ³μ s_pw : "+session.getAttribute("s_pw"));
	out.print("<hr>");
	
	//μΈμμμ­μ μλ λͺ¨λ κ° μ λΆ κ°μ  μ­μ 
	session.invalidate();
//--------------------------------------------------------------

	//μΈμ μκ°
	out.print("νμ¬ μΈμ μ μ§ μκ° : ");
	out.print(session.getMaxInactiveInterval());
	out.print("μ΄(30λΆ)");
	out.print("<hr>");
	
	session.setMaxInactiveInterval(60*10);
	out.print("λ³κ²½λ μΈμ μ μ§ μκ° : ");
	out.print(session.getMaxInactiveInterval());
	out.print("μ΄(30λΆ)");
	out.print("<hr>");
	
	/*
	  /WEB-INF/web.xml λ°°μΉκ΄λ¦¬μμμ μΈμμκ° λ³κ²½
	  <!-- μΈμ μ μ§ μκ° μ€μ (20λΆ) -->
	  <session-config>
     	<session-timeout>20</session-timeout>
      </session-config>
	*/

%>

</body>
</html>