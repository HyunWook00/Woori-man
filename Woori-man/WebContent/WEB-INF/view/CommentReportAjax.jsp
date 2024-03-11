<%@page import="com.project.woori.CommentDTO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%

	// 2024-02-29 노은하
	// 댓글 신고 ajax
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	CommentDTO comment = (CommentDTO)request.getAttribute("comment");
	StringBuilder sb = new StringBuilder();
	
	sb.append(String.format("<br>댓글 작성자 : %s<br>", comment.getCommentWriterName()));
	sb.append(String.format("댓글 내용 : %s<br><br>", comment.getCommentContent()));
	sb.append("<span class='report-info'>신고를 접수하시면 해당 댓글은 즉시 블라인드 처리되며, 관리자 검토 후 적합한 조취가 취해집니다.<br>");
	sb.append("한 번 접수한 신고는 취소할 수 없습니다.<span>");
%>
<%=sb.toString() %>
