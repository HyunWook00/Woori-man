<%@page import="com.test.mybatis.CsDTO"
%><%@page import="java.util.ArrayList"
%><%@ page contentType="text/html; charset=UTF-8"
%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"
%><%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	response.setContentType("text/xml");
	ArrayList<CsDTO> searchFaqList = (ArrayList<CsDTO>)request.getAttribute("searchFaqList");
	
%><?xml version="1.0" encoding="UTF-8"?>
<list>
		<% for(CsDTO dto : searchFaqList)
		{%>
	<faqList>
			<faq_title><%=dto.getFaq_title() %></faq_title>
			<%-- <faq_title>${dto.faq_title}</faq_title> --%>
			<%-- <faq_title>${searchFaqList.faq_title}</faq_title> --%>
			<faq_code><%=dto.getFaq_code() %></faq_code>
			<fc_code><%=dto.getFc_code() %></fc_code>
			<%-- <faq_code>${dto.faq_code}</faq_code> --%>
			<%-- <faq_code>${searchFaqList.faq_code }</faq_code> --%>
	</faqList>
		<%} %>
</list>