<%@page import="com.woori.dto.FriendsDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	ArrayList<FriendsDTO> friends = (ArrayList<FriendsDTO>) request.getAttribute("friends");
	
	String result = "";
	
	StringBuffer sb = new StringBuffer();
	
	if (friends.size() == 0)
	{
		sb.append("<td colspan='4'>검색결과가 없습니다.</td>");
		result = sb.toString();
		out.println(result);
	}
	else
	{
		sb.append("<tr>");
		sb.append("<th>회원코드</th>");
		sb.append("<th>아이디</th>");
		sb.append("<th>이름</th>");
		sb.append("<th>친구추가</th>");
		sb.append("</tr>");
		
		for (int i = 0; i < friends.size(); i++)
		{
			sb.append("<tr>");
			sb.append("<td>"+ friends.get(i).getUs_code() + "</td>");
			sb.append("<td>"+ friends.get(i).getUs_id() + "</td>");
			sb.append("<td>"+ friends.get(i).getUs_name() + "</td>");
			sb.append("<td><button onclick=addFriends(" + friends.get(i).getUs_code() + ")><i class='bi bi-person-plus'></i></button></td>");
			sb.append("</tr>");
			sb.append("<input type='hidden'" + "id='id'" + "value='" + friends.get(i).getUs_id() +"'>");
		}
		
		result = sb.toString();
		out.println(result);
	}
	
	
	
%>

