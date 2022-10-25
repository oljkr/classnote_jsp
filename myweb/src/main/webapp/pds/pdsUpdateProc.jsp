<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp" %>
 <!-- 본문시작 bbsUpdateProc.jsp -->
 <!-- 수정한 요청한 정보를 가져와서, DB에 가서 행 수정하기 -->
	<h3>* 사진 수정 결과 *</h3>
<%
	try{
		//저장위치
		//I:\java202207\workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\myweb\storage
		//1) 첨부된 파일 저장하기
		String saveDirectory=application.getRealPath("/storage");
		int maxPostSize=1024*1024*10;
		String encoding="UTF-8";
		MultipartRequest mr= new MultipartRequest(request, saveDirectory, maxPostSize, encoding, new DefaultFileRenamePolicy());
	
		//2) 1)단계에서 저장한 파일의 파일명, 파일크기 가져오기
		String fileName=""; //파일명
		long fileSize=0;	//파일크기
		File file=null;		//실제 파일 담기
		String item="";		//name="filename"
		
		String orifilename=mr.getParameter("orifilename");
		if(orifilename!=null){
			item=orifilename;
			fileName=orifilename;//mr객체에서 item이 가지고 있는 실제 파일명(sky.png) 가져오기
			fileSize=Long.parseLong(mr.getParameter("orifilesize"));
			
			int pdsno=Integer.parseInt(mr.getParameter("pdsno"));
			String wname=mr.getParameter("wname").trim();
			String subject=mr.getParameter("subject").trim();
			String passwd=mr.getParameter("passwd").trim();
			
			dto.setPdsno(pdsno);
			dto.setWname(wname);
			dto.setSubject(subject);
			dto.setPasswd(passwd);
			dto.setFilename(fileName);
			dto.setFilesize(fileSize);
		}
		else{			
			Enumeration files=mr.getFileNames(); //mr에서 <input type=file>을 전부 수거하기
			while(files.hasMoreElements()){ //여러개의 파일을 첨부하는 경우에 한개씩 처리하기
				item=(String)files.nextElement();//name="filename"
				fileName=mr.getFilesystemName(item);//mr객체에서 item이 가지고 있는 실제 파일명(sky.png) 가져오기
				if(fileName!=null){//실제 파일명을 가져왔다면 
					file=mr.getFile(item); //mr에서 실제 파일 가져오기
					if(file.exists()){//실제 파일이 존재한다면
						fileSize=file.length(); //파일 크기 가져오기
					}//if end
				}//if end
			}//while end
			//기존 파일 삭제하기
			String orifiledel=mr.getParameter("orifiledel").trim();	
			Utility.deleteFile(saveDirectory, orifiledel);
			
			//3) tb_pds테이블 저장하기 
			int pdsno=Integer.parseInt(mr.getParameter("pdsno"));
			String wname=mr.getParameter("wname").trim();
			String subject=mr.getParameter("subject").trim();
			String passwd=mr.getParameter("passwd").trim();
			
			dto.setPdsno(pdsno);
			dto.setWname(wname);
			dto.setSubject(subject);
			dto.setPasswd(passwd);
			dto.setFilename(fileName);
			dto.setFilesize(fileSize);
			
		}
		
		int cnt=dao.updateProc(dto);
		
		if(cnt==0){
			out.println("<p>사진 변경에 실패했습니다!!</p>");
			out.println("<p><a href='javascript:history.back()'>다시시도</a></p>");
		}else{
			out.println("<script>");
			out.println("    alert('사진이 변경되었습니다~');");
			out.println("     location.href='pdsList.jsp'"); //목록페이지 이동
			out.println("</script>");
		}//if end
	
	}catch(Exception e){
		out.print(e);
		out.print("<p>사진 올리기 실패!!</p>");
		out.print("<a href='javascript:history.back()'>다시시도</a>");
	}//end
%>
 
 <!-- 본문끝 -->
<%@ include file="../footer.jsp" %>