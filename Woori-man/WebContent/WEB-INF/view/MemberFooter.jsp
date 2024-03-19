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
<title>MemberFooter</title>
<style type="text/css">
.footer-atag {color: #767676 !important; text-decoration: none;}
.footer-atag:visited {color: #767676; text-decoration: none;}
</style>
</head>
<body>

<!-- 2024-03-01 노은하 -->
<!-- 플랫폼 푸터 jsp 파일 작업 -->

<div class="footer-body">
	© 약속해조<span><a class="footer-atag" href="cs.woori">고객센터</a></span>
	<span><a class="footer-atag" href="inquirylist.woori">문의사항</a></span>
	<span><a class="footer-atag" href="reportlist.woori">신고내역</a></span> 
</div>

</body>
</html>