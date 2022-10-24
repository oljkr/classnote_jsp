<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp" %>
 <!-- 본문시작 memberWithdraw.jsp -->
<h3>* 회원탈퇴 *</h3>
<form method="post" action="memberWithdrawProc.jsp" onsubmit="return pwCheck()"><!-- myscript.js -->
	<table>
	<tr>
		<th>비밀번호</th>
		<td><input type="password" name="passwd" id="passwd" required></td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="submit" value="삭제">
		</td>
	<tr>
	</table>
</form>
 <!-- 본문끝 -->
<%@ include file="../footer.jsp" %>