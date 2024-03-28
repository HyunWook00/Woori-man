<%@page import="com.woori.dto.FriendsDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	StringBuffer sb = new StringBuffer();
	ArrayList<FriendsDTO> searchFriend = (ArrayList<FriendsDTO>)request.getAttribute("searchFriend");
	
	
	for (int i=0; i<searchFriend.size(); i++)
	{	
		String fr_code = searchFriend.get(i).getFr_code();
		
		String url = "friendselect.woori?fr_code=" + fr_code;
		
		sb.append("<li><div class='friend-profile'>");
		sb.append("<div class='friend-info'>");
		sb.append("<img alt='profile' src='images/basic-profile.png' class='friend'>#" + searchFriend.get(i).getUs_code2() + 
				searchFriend.get(i).getUs_name() + '(' + searchFriend.get(i).getUs_id() + ")</div>");
		
		sb.append("<div class='btns'>");	
		sb.append("<button type='button' class='invite-btn' onclick=\"location.href='" + url + "'\" value='" + fr_code +"'>선택하기</button></div></div></li>");
		
	}
	
%>
<%=sb.toString()%>