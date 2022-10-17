<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>sungjukUpdate.jsp</title>
</head>
<body>
	<h3>* 성적 수정 *</h3>
	<p><a href="sungjukForm.jsp">[성적쓰기]</a></p>
	<p><a href="sungjukList.jsp">[성적목록]</a></p>
<%
	//수정하고자 하는 글 번호 예) sungjukUpdate.jsp?sno=3
	int sno=Integer.parseInt(request.getParameter("sno"));
	
	Connection con=null;
	PreparedStatement pstmt=null;
	ResultSet rs = null;
	
	try {
	
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "system";
		String password = "1234";
		String driver = "oracle.jdbc.driver.OracleDriver"; //ojdbc8.jar
		Class.forName(driver);
		con = DriverManager.getConnection(url, user, password);
		//out.println("오라클DB 서버 연결 성공!!");
	
		//1)단계. select문을 이용해서 수정할 행을 가져온다(sungjukRead.jsp참조)
		StringBuilder sql = new StringBuilder();
		sql.append(" SELECT sno, uname, kor, eng, mat, aver, addr, wdate ");
		sql.append(" FROM sungjuk ");
		sql.append(" WHERE sno=? ");
		
		pstmt = con.prepareStatement(sql.toString());
		pstmt.setInt(1, sno);
		
		rs = pstmt.executeQuery(); 
		if (rs.next()) { 
			//2)단계. 1)의 내용을 폼에 출력 sungjukForm.jsp참조
%>
		<form name="sungjukfrm" id="sungjukfrm" method="post" action="sungjukUpdateProc.jsp">
			<input type="hidden" name="sno" value="<%=sno %>">
			<table>
			<tr>
			  <th>이름</th>
			  <td><input type="text" name="uname" value="<%=rs.getString("uname")%>" maxlength="20" required autofocus></td>
			</tr> 
			<tr>
			  <th>국어</th>
			  <td><input type="number" name="kor" value="<%=rs.getString("kor")%>" size="5" min="0" max="100" placeholder="숫자입력"></td>
			</tr>
		<tr>
			  <th>영어</th>
			  <td><input type="number" name="eng" value="<%=rs.getString("eng")%>" size="5" min="0" max="100" placeholder="숫자입력"></td>
			</tr> 
			<tr>
			  <th>수학</th>
			  <td><input type="number" name="mat" value="<%=rs.getString("mat")%>" size="5" min="0" max="100" placeholder="숫자입력"></td>
			</tr>
		<tr>
			  <th>주소</th>
			  <td>
			  	  <% String addr=rs.getString("addr"); %>
			      <select name="addr" class="form-control">
		              <option value="Seoul" <%if (addr.equals("Seoul")) {out.print("selected");} %>>서울</option>
		              <option value="Jeju"  <%if (addr.equals("Jeju"))  {out.print("selected");} %>>제주</option>
		              <option value="Suwon" <%if (addr.equals("Suwon")) {out.print("selected");} %>>수원</option>
		              <option value="Busan" <%if (addr.equals("Busan")) {out.print("selected");} %>>부산</option>
			      </select> 
			  </td>
			</tr>
		<tr>
			  <td colspan="2" align="center">
			     <input type="submit" value="수정">
			     <input type="reset"  value="취소">
			  </td>
			</tr>
			</table>
			</form>
		
<%
			
		} else {
			out.println("해당 글 없음!!");
		}//if end
	 
	} catch (Exception e) {
		System.out.println("오라클DB연결실패: " + e);
	} finally {//자원반납(순서주의)
		try {
			if (rs != null) { rs.close(); }
		} catch (Exception e) {}
	
		try {
			if (pstmt != null) { pstmt.close();	}
		} catch (Exception e) {}
	
		try {
			if (con != null) { con.close();	}
		} catch (Exception e) {}
	}//end

%>
	</table>
</body>
</html>