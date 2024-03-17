<%@page import="com.woori.dto.GroupDTO"%>
<%@page import="com.woori.dto.FriendsDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	StringBuffer sb = new StringBuffer();	
	ArrayList<FriendsDTO> friendsList = (ArrayList<FriendsDTO>)request.getAttribute("friendsList");
	
	// 세션 연결하면 groupDTO 에서 가져오기
	
	GroupDTO groupDTO = (GroupDTO)session.getAttribute("groupDTO");
	String cg_code = groupDTO.getCg_code();
	
	for (int i=0; i<friendsList.size(); i++)
	{	
		String fr_code = friendsList.get(i).getFr_code();
		//String cg_code = friendsList.get(i).getCg_code();
		
		// get 방식을 위한 url 구성
		String url = "groupinvite.woori?fr_code=" + fr_code + "&cg_code=" + cg_code;
		
		sb.append("<li><div class='friend-profile'>");
		sb.append("<div class='friend-info'>");
		sb.append("<img alt='profile' src='images/basic-profile.png'>#" + friendsList.get(i).getUs_code2() + 
				friendsList.get(i).getUs_name() + '(' + friendsList.get(i).getUs_id() + ")</div>");
		
		sb.append("<div class='btns'>");	
		//sb.append("<button type='button' class='invite-btn' onclick=\"location.href='groupinvite.woori'\">초대하기</button></div></div></li>");	
		sb.append("<button type='button' class='invite-btn' onclick=\"location.href='" + url + "'\">초대하기</button></div></div></li>");
		// 왜~ 초대가 안 보내지냐면~
		// location.href 로 데이터를 전송하려면 get 방식으로 보내야 하는데
		// 기존에 구성한 href 링크는 get 방식으로 보내주는 데이터가 단 하나도 실리지 않아서
		// NullPointException 이 뜨는 것이다~~~~~
	}
%>
<%=sb.toString() %>