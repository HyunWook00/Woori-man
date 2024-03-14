<%@page import="com.woori.dto.NoteDTO"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	StringBuffer sb = new StringBuffer();
	// note_title, senderid, receiver, note_date, note_content 
	
	NoteDTO dto = (NoteDTO)request.getAttribute("dto");
	String temp = (String)request.getAttribute("temp");
	
	sb.append("<table class='table note-article'>");
	sb.append("<tr><th>제목</th><td>" + dto.getNote_title() + "</td></tr>");
	sb.append("<tr><th>발신자</th><td>" + dto.getSenderid() + "</td></tr>");
	sb.append("<tr><th>수신자</th><td>" + dto.getReceiverid() + "</td></tr>");
	sb.append("<tr><th>날짜</th><td>" + dto.getNote_date() + "</td></tr>");
	sb.append("<tr><th>내용</th><td>" + dto.getNote_content() + "</td></tr>");
	
	sb.append("</table>");

	// 받은 쪽지면 답장하기 버튼
	if (temp != null)
	{
		sb.append("<div class='btns text-center'><button type='button' class='btn btn-answer'>답장하기</button></div>");
	}
	
	// 제목 보낸사람 받은사람 날짜 내용 
%>
<%=sb.toString() %>
