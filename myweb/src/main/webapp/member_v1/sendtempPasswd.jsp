<%@page import="net.utility.MyAuthenticator"%>
<%@page import="javax.mail.Transport"%>
<%@page import="java.util.Date"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="net.utility.Utility"%>
<%@page import="javax.mail.Session"%>
<%@page import="javax.mail.Authenticator"%>
<%@page import="java.util.Properties"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp" %>
 <!-- 본문시작 sendtempPasswd.jsp -->
 
<%  //임시 비밀번호 발급 기능
	String tempPasswd="";
	
 	String charline="ABCDEabcde12345!@#$%";
	char[] chararr=charline.toCharArray();

	for(int x=0;x<10;x++){
		tempPasswd+=chararr[(int)(Math.random()*20)];
	}
	out.println("<br>");
	String id= request.getParameter("id").trim();
%>

<%  //메일보내기 기능
	try{
		//1)사용하고자 하는 메일서버에서 인증받은 계정과 비번 등록하기

		//2)메일서버(POP3/SMTP) 지정하기
		String mailServer="mw-002.cafe24.com"; //cafe24메일서버
		Properties props=new Properties();
		props.put("mail.smtp.host", mailServer);
		props.put("mail.smtp.auth", true);
		
		//3)메일서버에서 인증받은 계정+비번
		Authenticator myAuth=new MyAuthenticator(); //다형성
		
		//4) 2)와 3)이 유효한지 검증
		Session sess=Session.getInstance(props, myAuth);
		//out.print("메일 서버 인증 성공!!");
		
		//5)메일 보내기
		request.setCharacterEncoding("UTF-8");
		String to     =request.getParameter("email").trim(); //받는사람 이메일 주소
		String from   ="aabbcc@naver.com";//보내는 사람
		String subject="임시 비밀번호 발급입니다."; //메일 제목
		String content=""; //메일 내용
		
		//엔터 및 특수문자 변경
		content=Utility.convertChar(content);
		
		//내용 형식 꾸미기
		content+="<hr>";
		content+="<table border='1'>";
		content+="<tr>";
		content+="	  <th>아이디</th>";
		content+="	  <th>임시비밀번호</th>";
		content+="</tr>";
		content+="<tr>";
		content+="	  <td>"+id+"</td>";
		content+="	  <td>"+tempPasswd+"</td>";
		content+="</tr>";
		content+="</table>";
		

		//받는 사람 이메일 주소
		InternetAddress[] address={ new InternetAddress(to) };
		/*
			수신인이 여러명인 경우
			InternetAddress[] address={ new InternetAddress(to1),
										new InternetAddress(to2),
										new InternetAddress(to3), ~~~};
		*/
		
		//메일 관련 정보 작성
		Message msg=new MimeMessage(sess);
		
		//받는사람
		msg.setRecipients(Message.RecipientType.TO, address);
		//참조 Message.RecipientType.CC
		//숨은참조 Message.RecipientType.BCC
		
		//보내는 사람
		msg.setFrom(new InternetAddress(from));
		
		//메일 제목
		msg.setSubject(subject);
		
		//메일 내용
		msg.setContent(content, "text/html; charset=UTF-8");
		
		//메일 보낸날짜
		msg.setSentDate(new Date());
		
		//메일 전송
		Transport.send(msg);
		
		out.print(id+"님에게 임시 비밀번호를 메일로 발송하였습니다");
		out.print("<br>");

	}catch(Exception e){
		out.println("<p>메일 전송 실패!!" +  e + "</p>");
		out.println("<p><a href='javascript:history.back();'>다시시도</a></p>");
	}//end
%>

<%//임시 비밀번호로 회원의 정보를 수정

	dto.setId(id);
	dto.setPasswd(tempPasswd);
	int cnt=dao.updateTempPw(dto);
	if(cnt==0){
		out.println("이메일로 전송된 임시 비번으로 회원정보 수정 실패");
	}else{
		out.println("이메일로 전송된 임시 비번으로 회원정보가 수정됩니다");
	}//if end

%>
	
 <!-- 본문끝 -->
<%@ include file="../footer.jsp" %>