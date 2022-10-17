<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>06_ok.jsp</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<%
	//request 내부객체
	/* out.print(request.getParameter("uname"));
	out.print("<hr>");
	out.print(request.getParameter("kor"));
	out.print("<hr>");
	out.print(request.getParameter("eng"));
	out.print("<hr>");
	out.print(request.getParameter("mat"));
	out.print("<hr>"); */
	
	//request에 2바이트 이상의 언어에 해당하는 것이 전달되면 이걸 인코딩해야함.
	//한글 인코딩
	request.setCharacterEncoding("UTF-8"); //조합형
	//request.setCharacterEncoding("EUC-KR"); //완성형
	
	//사용자가 입력 요청한 정보를 개별적으로 가져오기
	String uname=request.getParameter("uname").trim();
	int kor=Integer.parseInt(request.getParameter("kor").trim());
	int eng=Integer.parseInt(request.getParameter("eng").trim());
	int mat=Integer.parseInt(request.getParameter("mat").trim());
	int aver=(kor+eng+mat)/3;

%>
	<!-- 성적결과 테이블에 출력 -->
	<div class="col-md-3 container mt-3">
	  <h2>* 성적 결과 *</h2>            
	  <table class="table table-dark table-hover">
	    <tr class>
			<th>이름</th>
			<td><%=uname%></td>
		</tr>
		<tr>
			<th>국어</th>
			<td><%=kor%></td>
		</tr>
		<tr>
			<th>영어</th>
			<td><%=eng%></td>
		</tr>
		<tr>
			<th>수학</th>
			<td><%=mat%></td>
		</tr>
		<tr>
			<th>평균</th>
			<td><%=aver%></td>
		</tr>
	  </table>
	</div>

</body>
</html>