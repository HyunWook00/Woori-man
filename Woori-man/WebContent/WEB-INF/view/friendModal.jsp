<%@page import="com.woori.dto.FriendsDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	StringBuilder sb = new StringBuilder();
	
	FriendsDTO user = (FriendsDTO)request.getAttribute("userSearch");
	int count = (int)request.getAttribute("count");
	
	String action = "friendadd.woori?us_code1=" + "1" + "&us_code2=" + user.getUs_code2();
	
	if(user.getUs_code2()==null || user.getUs_code2().equals(""))
		sb.append("검색 결과가 존재하지 않습니다.");	
	else
	{
		if(count >= 1)
		{
			sb.append(String.format("<img src='images/%s'> %s %s (%s)", user.getUs_profile(), user.getUs_code2(), user.getUs_id(), user.getUs_name()));
			sb.append("<p>해당 회원은 이미 친구로 등록하였습니다.</p>");
		}
		else
		{
		 	sb.append(String.format("<img src='images/%s'> %s %s (%s)", user.getUs_profile(), user.getUs_code2(), user.getUs_id(), user.getUs_name()));			
			sb.append(String.format("<button type='button' class='btn plus_btn' onclick=\"location.href='%s'\">친구추가</button>", action));
		}
	}
%>
<%= sb.toString() %>