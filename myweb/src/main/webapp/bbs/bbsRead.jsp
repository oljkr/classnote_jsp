<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp" %>
 <!-- 본문시작 bbsList.jsp -->
	<h3>* 게시판 상세보기 *</h3>
<p>
	<a href="bbsForm.jsp">[글쓰기]</a>
	&nbsp;&nbsp;
	<a href="bbsList.jsp?col=<%=col%>&word=<%=word%>&nowPage=<%=nowPage%>">[글목록]</a>
</p>
<div class="container">
<%
	int bbsno=Integer.parseInt(request.getParameter("bbsno").trim());
	dto=dao.read(bbsno);
	if(dto==null){
		out.println("해당 글없음!!");
	}else{
		dao.incrementCnt(bbsno); //조회수 증가
%>
	<table>
		<tr>
			<th>글번호</th>
			<td><%=dto.getBbsno()%></td> 
		</tr>
		<tr>
			<th>제목</th>
			<td><%=dto.getSubject()%></td>
		</tr>
		<tr>
			<th>내용</th>
			<td>
<%
			//특수문자로 치환하기
			//사용자가 입력한 엔터(\n)를 <br>태그로 바꾸기
			String content=Utility.convertChar(dto.getContent());
			out.print(content);
				
%>
			</td>
		</tr>
		<tr>
			<th>조회수</th>
			<td><%=dto.getReadcnt()%></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td><%=dto.getWname()%></td>
		</tr>
		<tr>
			<th>작성일</th>
			<td><%=dto.getRegdt()%></td>
		</tr>
		<tr>
			<th>IP</th>
			<td><%=dto.getIp()%></td>
		</tr>
		<tr>
			<th>글비밀번호</th>
			<td><%=dto.getPasswd()%></td>
		</tr>
		</table>
		
		<br>
		<input type="button" value="답변쓰기" onclick="location.href='bbsReply.jsp?bbsno=<%=bbsno%>'">
		<input type="button" value="수정" onclick="location.href='bbsUpdate.jsp?bbsno=<%=bbsno%>&col=<%=col%>&word=<%=word%>'">
		<input type="button" value="삭제" onclick="location.href='bbsDel.jsp?bbsno=<%=bbsno%>'">
<%
		
	}//if end
%>
</div>
 <!-- 본문끝 -->
<%@ include file="../footer.jsp" %>