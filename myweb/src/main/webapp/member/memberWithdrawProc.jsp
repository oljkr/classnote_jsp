<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp" %>
 <!-- 본문시작 memberWithdrawProc.jsp -->
<h3>* 회원탈퇴 결과 *</h3>
<%
	String id=(String)session.getAttribute("s_id");
	String pw=request.getParameter("passwd").trim();
	dto.setId(id);
	dto.setPasswd(pw);
	
	int cnt=dao.memberWithdraw(dto);
	if(cnt==0){
		out.println("<p>비밀번호가 일치하지 않습니다</p>");
		out.println("<p><a href='javascript:history.back()'>다시시도</a></p>");
	}else{
		//세션변수 모든 제거하기
		session.removeAttribute("s_id");
		session.removeAttribute("s_passwd");
		session.removeAttribute("s_mlevel");
		
		String message="";
		message += "회원 탈퇴 되었습니다. 이용해 주셔서 감사합니다.\\n";
		message += "재가입을 원할 경우 이메일로 문의하시기 바랍니다";
		out.println("<script>");
		out.println("    alert('" + message + "');");
		out.println("     location.href='loginForm.jsp'"); //목록페이지 이동
		out.println("</script>");
	}//if end
%>

 <!-- 본문끝 -->
<%@ include file="../footer.jsp" %>