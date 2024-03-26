<%@page import="com.woori.dto.FriendsDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%

	// 친구 추가 및 삭제시 갱신된 결과 Ajax 처리 Jsp

	ArrayList<FriendsDTO> friendsList = (ArrayList<FriendsDTO>) request.getAttribute("friendsList");
	
	StringBuffer sb = new StringBuffer();
	String result = "";
	
	sb.append("<div id='friendResult'>");
	sb.append("		<table  id='searchTable' class=\"table tbl\"> ");
	sb.append("			<tr>");
	sb.append("				<th>회원코드</th>");
	sb.append("				<th>아이디</th>");
	sb.append("				<th>이름</th>");
	sb.append("				<th>친구추가</th>");
	sb.append("			</tr>");
	sb.append("			<tr id='searchFriends'>");
	sb.append("				<td colspan='4'>");
	sb.append("					회원코드 또는 아이디 또는 이름으로 검색 해주세요.");
	sb.append("				</td>");
	sb.append("			</tr>");
	sb.append("		</table>");
	sb.append("</div>");
	
	sb.append("<div class='mb-3' >");
	sb.append("		<div id=\"friendList\" class='result-title'>");
	sb.append("			<div class='friend-title modal-option'>친구 목록</div>");
	sb.append("			<table class='table tbl'> ");
	sb.append("				<tr>");
	sb.append("					<th>회원코드</th>");
	sb.append("					<th>아이디</th>");
	sb.append("			    	<th>이름</th>");
	sb.append("					<th>삭제</th>");
	sb.append("				</tr>");
	
	for(int i = 0; i < friendsList.size(); i++)
	{
		sb.append("			<tr id='result-info'>");
		sb.append("				<td>" + friendsList.get(i).getUs_code2() + "</td>");
		sb.append("				<td>" + friendsList.get(i).getUs_id() + "</td>");
		sb.append("				<td>" + friendsList.get(i).getUs_name() + "</td>");
		sb.append("				<td>");
		sb.append("					<button type='button' class='deleteBtn bi-btn' onclick=deleteFriends(" + friendsList.get(i).getFr_code() + ",'" + friendsList.get(i).getUs_id() + "')><i class='bi bi-trash'></i></button>");
		sb.append("				</td>");
		sb.append("			</tr>");
	}
	sb.append("			</table>");
	sb.append("		</div>");
	sb.append("	</div>");

	result = sb.toString();
	out.println(result);



%>
























































