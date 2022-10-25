<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp" %>
 <!-- 본문시작 bbsUpdate.jsp -->
 <!-- 글번호가 일치하는 행을 가져와서, 수정폼에 출력하기 -->
<h3>* 게시판 수정 *</h3>
<p>
	<a href="pdsForm.jsp">[글쓰기]</a>
	&nbsp;&nbsp;
	<a href="pdsList.jsp">[글목록]</a>
</p>
<div class="container">
<%
	int pdsno=Integer.parseInt(request.getParameter("pdsno"));//수정 글번호
	dto=dao.read(pdsno); //글번호가 일치하는 행을 가져오기
	if(dto==null){
		out.println("해당 글 없음!!");
	}else{
%>
	<form name="pdsfrm" id="pdsfrm" method="post" action="pdsUpdateProc.jsp" enctype="multipart/form-data" onsubmit="return pdsCheck()"><!-- myscript.js -->
	<input type="hidden" name="pdsno" value="<%=pdsno%>">
	<input type="hidden" name="orifilesize" value="<%=dto.getFilesize()%>">
	<input type="hidden" name="orifiledel" value="<%=dto.getFilename()%>">
	<table class="table">
	<tr>
	   <th class="success">작성자</th>
	   <td><input type="text" name="wname" id="wname" value="<%=dto.getWname()%>" class="form-control" maxlength="20" required></td>
	</tr>
	<tr>
	   <th class="success">제목</th>
	   <td><input type="text" name="subject" id="subject" value="<%=dto.getSubject()%>" class="form-control" maxlength="100" required></td>
	</tr>
	<tr>
	   <th class="success">비밀번호</th>
	   <td><input type="password" name="passwd" id="passwd" class="form-control" maxlength="10" required></td>
	</tr>
	<tr>
	    <th class="success" rowspan="2" >첨부파일</th>
	    <td style="text-align: left">기존 선택된 파일 : <input type="text" name="orifilename" id="orifilename" value="<%=dto.getFilename()%>" size="40"><input type="button" id="delbutton" value="파일 삭제" onclick="removeInput()"></td>
	</tr>
		<td style="text-align: left">새로 변경할 파일 : <input type="file" name="filename" id="filename"></td>
    <tr>
	    <td colspan="2" align="center">
	       <input type="submit" value="사진 올리기" class="btn btn-success">
	       <input type="reset"  value="취소" class="btn btn-danger">
	    </td>
	</table>
	</form>
<%
	}//if end
%>
</div>
 
<!-- 본문끝 -->
<%@ include file="../footer.jsp" %>