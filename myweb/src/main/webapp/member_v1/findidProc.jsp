<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp" %>
 <!-- 본문시작 findidProc.jsp -->

	<div style="text-align:center">
		<h3>* 아이디/비밀번호 찾기 결과 *</h3>
<%
		String mname=request.getParameter("mname").trim();
		String email=request.getParameter("email").trim();
		dto.setMname(mname);
		dto.setEmail(email);
		
		int cnt=dao.findID(dto);

		out.println("입력한 이름 : <strong>" + mname + "</strong>");
		out.println("<br>");
		out.println("입력한 이메일 : <strong>" + email + "</strong>");
		
		//아이디 찾기
		String id=dao.showId(dto);
		if(cnt==0){
			out.println("<p style='color:red'>일치하는 정보가 존재하지 않습니다.</p>");
		}else{
			out.println("<p>일치하는 정보가 존재하는 회원입니다.</p>");
			out.println("<br>");
			out.println("일치하는 회원의 아이디 : <strong>" +id+ "</strong><br>");
			
			%>
			<form name="findidProcfrm" id="findidProcfrm" method="post" action="sendtempPasswd.jsp">
			<input type="hidden" name="id" value="<%=id%>">
			<input type="hidden" name="mname" value="<%=mname%>">
			<input type="hidden" name="email" value="<%=email%>">
			<input type="submit" value="이메일로 임시비밀번호 발급받기" class="btn btn-success">
			</form>
			<%
			
		}//if end
%>
		<hr>
		<a href="javascript:history.back()">[다시 입력하여 찾기]</a>
		&nbsp;&nbsp;
		<a href="javascript:window.close()">[창닫기]</a>
	</div>


 <!-- 본문끝 -->
<%@ include file="../footer.jsp" %>