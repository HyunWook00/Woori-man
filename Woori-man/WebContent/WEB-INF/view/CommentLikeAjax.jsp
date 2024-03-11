<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	
	// 2024-02-28 노은하
	// 댓글 좋아요 버튼 클릭 ajax 처리
	
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	int commentCount = (int)request.getAttribute("commentCount");
	int type = (Integer)request.getAttribute("type");
	StringBuilder sb = new StringBuilder();
	//sb.append("");
	
	
	if(type == 1)
		sb.append("<span class=\"position-absolute top-0 start-100 translate-middle badge rounded-pill bg-like\">" + commentCount + "</span>");
	else if(type == 2)
	{
		if(commentCount > 0)
			sb.append("<span class=\"position-absolute top-0 start-100 translate-middle badge rounded-pill bg-like\">" + commentCount + "</span>");
	}		
	
	/*
	if(commentCount > 0)
	{
		sb.append("<span class=\"position-absolute top-0 start-100 translate-middle badge rounded-pill bg-like\">");
		sb.append(commentCount);
		sb.append("</span>");
	}
	*/
	
%>
<%= sb.toString()%>