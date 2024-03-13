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
<title>로그인</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>
	<form action="entergroup.woori" method="get">
	
	<input type="text" value="2" id="cg_code" name="cg_code"/>
	
	<button type="submit">로그인</button>
	</form>
	
</body>
</html>