package net.control;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Welcome extends HttpServlet {
	//나의 클래스의 부모가 class     : extends     상속(확장) 
	//나의 클래스의 부모가 interface : implements  상속(구현)

	@Override //<-재정의(리폼)
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//전송방식 method=get방식으로 요청하면 doGet() 함수가 자동으로 호출됨
		//req : 모델1방식의 내부객체 request와 동일
		//resp : 모델1방식의 내부객체 response와 동일
		
		try {
			
			//HTML 문서 구조로 응답(2바이트 이상의 언어를 사용할것이므로 charset도 설정..)
			resp.setContentType("text/html; charset=UTF-8");
			
			//단순하게 문자로 응답(AJAX 사용할 때 많이 씀..)
			//resp.setContentType("text/plain; charset=UTF-8");
			
			//요청한 사용자에게 응답하기 위한 출력 객체
			PrintWriter out=resp.getWriter();
			out.print(" ");
			out.print(" <!DOCTYPE html> ");
			out.print(" <html> ");
			out.print(" <head> ");
			out.print(" 	<meta charset='UTF-8'> ");
			out.print(" 	<title>환영합니다</title> ");
			out.print(" </head> ");
			out.print(" <body> ");
			out.print(" 	<strong>대한민국</strong> ");
			out.print(" 	<hr> ");
			out.print(" 	<span style='color:red'>오필승코리아</span> ");
			out.print(" 	<hr> ");
			out.print(" 	<table border='1'> ");
			out.print(" 	<tr> ");
			out.print(" 		<th>이름</th> ");
			out.print(" 		<td>무궁화</td> ");
			out.print(" 	</tr> ");
			out.print(" 	</table> ");
			out.print(" </body> ");
			out.print(" </html> ");
			
		}catch (Exception e) {
			System.out.println("요청실패:" + e);
		}
	}//doGet() end

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//전송방식 method=post방식으로 요청하면 doPost() 함수가 자동으로 호출됨
	}//doPost() end

	
	
}//class end
