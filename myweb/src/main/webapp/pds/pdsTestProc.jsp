<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>pdsTestProc.jsp</title>
</head>
<body>
	<h3>* 파일 첨부 테스트 결과*</h3>
<%
	/*
	request.setCharacterEncoding("UTF-8");
	out.print(request.getParameter("uname"));
	out.print("<hr>");
	out.print(request.getParameter("subject"));
	out.print("<hr>");
	out.print(request.getParameter("content"));
	out.print("<hr>");
	out.print(request.getParameter("filenm"));
	out.print("<hr>");
	*/
	
	try{
		//1.첨부된 파일 저장하기
		//첨부된 파일을 저장하는 폴더 생성 /src/main/webapp/storage
		
		//실제 물리적인 경로
		String saveDirectory=application.getRealPath("/storage");
		out.print(saveDirectory);
		out.print("<hr>");
		
		//저장 최대용량 (10M)
		int maxPostSize=1024*1024*10;
		
		//한글 인코딩
		String encoding="UTF-8";
		
		MultipartRequest mr= new MultipartRequest(request, saveDirectory, maxPostSize, encoding, new DefaultFileRenamePolicy());
		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		
		//2. mr 참조변수가 가리키고 있는 텍스트 정보 가져오기
		out.print(mr.getParameter("uname"));
		out.print("<hr>");
		out.print(mr.getParameter("subject"));
		out.print("<hr>");
		out.print(mr.getParameter("content"));
		out.print("<hr>");
		
		//3. /storage폴더에 저장된 파일 정보 확인하기
		//1) mr에서 <input type=file>을 전부 수거하기
		//열거형 Enumeration enum={"KIM","LEE","PARK"}
		//만일, 첨부된 파일이 3개 였다면 files={<input type=file>,<input type=file>,<input type=file> ~~}
		Enumeration files=mr.getFileNames();
		
		//2) 1)의 files가 가지고 있는 값들 중에서 개별적으로 접근하기 위해 name 가져오기
		//	 첨부 <input type=file name=filenm>
		String item=(String)files.nextElement(); //filenm
		
		//3) 2)의 item 이름(filenm)이 가지고 있는 실제 파일을 mr객체에서 가져오기
		String ofileName=mr.getOriginalFileName(item);
		out.print("원본 파일명 : " + ofileName);
		out.print("<hr>");
		String fileName=mr.getFilesystemName(item);
		out.print("리네임 파일명 : " + fileName);
		out.print("<hr>");

		//4) /storage폴더에 저장된 파일의 기타 정보 확인하기
		File file=mr.getFile(item); //실제 파일 가져오기
		if(file.exists()){//파일이 존재하는지?
			out.print("파일명 : " + file.getName());
			out.print("<hr>");
			out.print("파일크기 : " + file.length() + "byte");
			out.print("<hr>");
		}else{
			out.print("해당 파일이 존재하지 않음!!");
		}//if end
		
	}catch(Exception e){
		out.print(e);
		out.print("");
		out.print("<a href='javascript:history.back();'>다시시도</a>");
	}//end
%>

</body>
</html>