<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp" %>
 <!-- 본문시작 pdsRead.jsp -->
 <h3>* 포토갤러리 상세보기 *</h3>
 <p><a href="pdsForm.jsp">[사진 올리기]</a></p>
  <p><a href="pdsList.jsp">[사진 목록]</a></p>

<div class="container">
<%
	int pdsno=Integer.parseInt(request.getParameter("pdsno").trim());
	dto=dao.read(pdsno);
	if(dto==null){
		out.println("해당 글없음!!");
	}else{
		dao.incrementCnt(pdsno); //조회수 증가
%>
	<table>
		<tr>
			<th>제목</th>
			<td><%=dto.getSubject()%></td>
		</tr>
		<tr>
			<th>조회수</th>
			<td><%=dto.getReadcnt()%></td>
		</tr>
		<tr>
			<th>사진</th>
			<td><img src="../storage/<%=dto.getFilename()%>"></td>
		</tr>
		<tr>
			<th>파일크기</th>
			<td><%=Utility.toUnitStr(dto.getFilesize())%></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td><%=dto.getWname()%></td>
		</tr>
		<tr>
			<th>작성일</th>
			<td><%=dto.getRegdate()%></td>
		</tr>
		<tr>
			<th>글비밀번호</th>
			<td><%=dto.getPasswd()%></td>
		</tr>
		</table>
		
		<br>
		<input type="button" value="답변쓰기" onclick="location.href='pdsReply.jsp?pdsno=<%=pdsno%>'">
		<input type="button" value="수정" onclick="location.href='pdsUpdate.jsp?pdsno=<%=pdsno%>&col=<%=col%>&word=<%=word%>'">
<%
	}//if end
%>
</div>
 
 <!-- 본문끝 -->
<%@ include file="../footer.jsp" %>