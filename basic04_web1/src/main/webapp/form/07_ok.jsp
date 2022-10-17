<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>07_ok.jsp</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<%
	double num1=Double.parseDouble(request.getParameter("num1").trim());
	String op=request.getParameter("op").trim();
	
	double num2=Double.parseDouble(request.getParameter("num2").trim());
	double temp=0;
	int result=0;
	
	if(op.equals("+")){
		temp = num1+num2;
	}else if(op.equals("-")){
		temp = num1-num2;
	}else if(op.equals("*")){
		temp = num1*num2;
	}else if(op.equals("/")){
		temp = num1/num2;
	}else if(op.equals("%")){
		temp = num1%num2;
	}
	
	
	
%>

<div class="col-md-3 container mt-5">
  <h2>연산결과</h2>            
  <table class="table table-borderless">
    <thead>
      <tr class="table-light">
        <th>첫번째 수</th>
        <th>연산자</th>
        <th>두번째 수</th>
        <th>   </th>
        <th>결과</th>
      </tr>
    </thead>
    <tbody>
      <tr class="table-primary">
        <td><%=num1 %></td>
        <td><%=op %></td>
        <td><%=num2 %></td>
        <td>=</td>
        <td>
<%
		//temp값이 정수인지 실수인지 확인 if조건이 true이면 정수이다.
			if(Math.ceil(temp)==Math.floor(temp)){
				result=(int)temp;
				out.print(result);
			}else{
				out.print(temp);
			}
%>
        </td>
      </tr>
    </tbody>
  </table>
</div>


</body>
</html>