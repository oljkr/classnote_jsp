<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- pds의 ssi.jsp 공통코드 --%>

<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>

<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>

<%@ page import="net.utility.*"%>
<%@ page import="net.pds.*"%>

<jsp:useBean id="dao" class="net.pds.PdsDAO" scope="page"></jsp:useBean>
<jsp:useBean id="dto" class="net.pds.PdsDTO" scope="page"></jsp:useBean>

<%request.setCharacterEncoding("UTF-8");%>

<%
	//검색-------------------------------------------------------
	String word=request.getParameter("word"); //검색어
	String col=request.getParameter("col"); //검색칼럼
	word=Utility.checkNull(word); //문자열값이 null이면 빈문자열로 치환
	col=Utility.checkNull(col);
	
	//현재페이지-------------------------------------------------------
	int nowPage=1;
	if(request.getParameter("nowPage")!=null){
		nowPage=Integer.parseInt(request.getParameter("nowPage"));
	}//if end
%>