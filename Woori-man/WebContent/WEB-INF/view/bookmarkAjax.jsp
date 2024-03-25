<%@page import="com.woori.dto.GroupDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	ArrayList<GroupDTO> groupList = (ArrayList<GroupDTO>) request.getAttribute("groupList");

	StringBuffer sb = new StringBuffer();
	String result = "";
	
	
	
	sb.append("<h2>내 그룹</h2>");
	sb.append("		<hr>");
	sb.append("		<div id=\"groups\" class='group_list row'>");
	sb.append("			<div class='group col-6 col-md-4 col-xl-3'>");
	sb.append("				<div class='gr_option'>");
	sb.append("					<div class='make_gr'>");
	sb.append("						<button class=\"createBtn\" onclick=location.href='creategroupform.woori'>");
	sb.append("							<i class='bi bi-plus-circle-fill'></i></button>");
	sb.append("							<br>");
	sb.append("							만들기");
	sb.append("					</div>");
	sb.append("				</div>");
	sb.append("		</div>");
	
	
	
	for(int i=0; i < groupList.size(); i++)
	{
		sb.append("<div class='group col-6 col-md-4 col-xl-3'>");
		sb.append("			<div  class='gr_option' >");
		sb.append("				<div class='gr_img'>");
		sb.append("					<img onclick=enterGroup(" + groupList.get(i).getCg_code() + ") src=https://mblogthumb-phinf.pstatic.net/MjAyMjAxMjVfMjAy/MDAxNjQzMTAyOTk2NjE0.gw_H_jjBM64svaftcnheR6-mHHlmGOyrr6htAuxPETsg.8JJSQNEA5HX2WmrshjZ-VjmJWqhmgE40Qm5csIud9VUg.JPEG.minziminzi128/IMG_7374.JPG?type=w800>");
		sb.append("				</div>");
		sb.append("				<div class='gr_name'>");
		sb.append("					<div class='explain' onclick=enterGroup("+ groupList.get(i).getCg_code() + ")>");
		sb.append("						<span>그룹명 :" + groupList.get(i).getCg_name() + "</span>");
		sb.append("						<span class='group_count' >그룹원 :" + groupList.get(i).getG_count() + "명</span>");
		sb.append("				</div>");
		
		
		sb.append("<div id=\"bookmark-zone\" class='bookmark_zone'>");
		
		if(groupList.get(i).getGb_code() == 0)
		{
			sb.append("<span  class='book-mark' onclick=bookmark("+ groupList.get(i).getGm_code() + "," + groupList.get(i).getGb_code() + ")>");
			sb.append("		<i  class='bookmark bi bi-bookmark-heart-fill'></i>");
			sb.append("</span>");
		}
		else
		{
			sb.append("<span  class='book-markon' onclick=bookmark("+ groupList.get(i).getGm_code() + "," + groupList.get(i).getGb_code() + ")>");
			sb.append("		<i class='bookmark bi bi-bookmark-heart-fill'></i>");
			sb.append("</span>");
		}
		
		sb.append("					</div>");
		sb.append("				</div>");
		sb.append("			</div>");
		sb.append("	</div>");
		
	}
	
	result = sb.toString();
	out.println(result);
	

%>
























































