<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp" %>
 <!-- 본문시작 bbsUpdateProc.jsp -->
 <!-- 수정한 요청한 정보를 가져와서, DB에 가서 행 수정하기 -->
	<h3>* 글수정 *</h3>
<p>
	<a href="bbsForm.jsp">[글쓰기]</a>
	&nbsp;&nbsp;
	<a href="bbsList.jsp">[글목록]</a>
</p>

<%
	//수정 요청한 정보 가져와서 변수에 담기
	String wname=request.getParameter("wname").trim();//작성자
	String subject=request.getParameter("subject").trim();//제목
	String content=request.getParameter("content").trim();//내용
	int bbsno=Integer.parseInt(request.getParameter("bbsno"));
	String passwd=request.getParameter("passwd").trim();
	String ip=request.getRemoteAddr();//요청 PC의 IP

	//dto에 담기
	dto.setWname(wname);
	dto.setSubject(subject);
	dto.setContent(content);
	dto.setBbsno(bbsno);
	dto.setPasswd(passwd);
	dto.setIp(ip);
	
	int cnt=dao.updateProc(dto);
	
	if(cnt==0){
		out.println("<p>글 수정에 실패했습니다!!<br>비밀번호가 일치하지 않습니다</p>");
		out.println("<p><a href='javascript:history.back()'>다시시도</a></p>");
	}else{
		out.println("<script>");
		out.println("    alert('글이 수정되었습니다~');");
		//http://localhost:9090/myweb/bbs/bbsList.jsp?col=subject_content&word=도토리
		out.println("     location.href='bbsList.jsp?col=" + col + "&word=" + word + "';"); //목록페이지 이동
		out.println("</script>");
	}//if end
	
%>

 <!-- 본문끝 -->
<%@ include file="../footer.jsp" %>