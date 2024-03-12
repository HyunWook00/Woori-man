<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GrouHeader.jsp (그룹 헤더)</title>
<link rel="stylesheet" type="text/css" href="css/font.css">
<link rel="stylesheet" type="text/css" href="css/groupHeader.css">
</head>
<body>

<div class="groupHeader">
	<div class="groupHeader_title" ><a href="groupmain.woori">${groupDTO.cg_name}</a></div>
	<div><a href="">그룹원</a></div>
	<div><a href="">모임</a></div>
	<div><a href="">히스토리</a></div>
</div>


</body>
</html>