<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.awt.datatransfer.Transferable"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	String root = pageContext.getServletContext().getRealPath("/");
	//String savePath = root + "pds" + "\\" + "saveFile";
	String savePath = "C:/Users/1/git/Woori-man/Woori-man/WebContent/images" + "/";
	
	File dir = new File(savePath);
	
	if(!dir.exists())
		dir.mkdirs();
	
	String encType = "UTF-8";
	int maxFileSize = 5*1024*1024;
	String fileName = "";
	
	try
	{
		MultipartRequest multi = null;
		multi = new MultipartRequest(request, savePath, maxFileSize, encType, new DefaultFileRenamePolicy());
		
		fileName = multi.getFilesystemName("na_name");
		
	}
	catch (Exception e)
	{
		System.out.println(e.toString());
	}
	
	String result = "";
	result = fileName;
	out.println(result); 
%>