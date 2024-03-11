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
<title>AdminHeader.jsp</title>

<!-- 경로 확인~!~! -->
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/adminHeader.css">

</head>
<body>

<!-- 2023-02-09 노은하 -->
<!-- 관리자 전용 헤더 페이지 -->

<!--
아래 구문들 헤드 영역에 삽입 필요

부트스트랩 5.3.2
<%-- <link rel="stylesheet" type="text/css" href="<%=cp %>/css/bootstrap.css"> --%>

부트스트랩 아이콘
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

-->

<div class="header-menu row">

	<nav class="navbar">
		<ul class="nav justify-content-center">
		
			<!-- 관리자 계정관리 메뉴 -->
			<li class="nav-item">
				<div class="icon"><a href=""><i class="bi bi-person-badge"></i><span class="menu-title">관리자 계정관리</span></a></div>
				<div class="hover-text">관리자 계정관리</div>
			</li>
			
			<!-- 회원 계정관리 메뉴 -->
			<li class="nav-item">
				<div class="icon"><a href=""><i class="bi bi-people-fill"></i><span class="menu-title">회원 계정관리</span></a></div>
				<div class="hover-text">회원 계정관리</div>
			</li>
			
			<!-- 플랫폼 로고 -->
			<li class="nav-item">
				<div class="icon"><a href=""><i class="bi bi-house-fill"></i><span class="menu-title">우리만 Admin</span></a></div>
				<div class="hover-text">관리자 메인으로 이동</div>
			</li>
			
			<!-- 신고내역 관리 메뉴 -->
			<li class="nav-item">
				<div class="icon"><a href=""><i class="bi bi-shield-fill-exclamation"></i><span class="menu-title">신고내역 관리</span></a></div>
				<div class="hover-text">신고내역 관리</div>
			</li>
			
			<!-- 공지사항 관리 메뉴 -->
			<li class="nav-item">
				<div class="icon"><a href=""><i class="bi bi-card-text"></i><span class="menu-title">공지사항 관리</span></a></div>
				<div class="hover-text">공지사항 관리</div>
			</li>
			
			<!-- 문의사항 관리 메뉴 -->
			<li class="nav-item">
				<div class="icon"><a href=""><i class="bi bi-question-octagon-fill"></i><span class="menu-title">문의사항 관리</span></a></div>
				<div class="hover-text">문의사항 관리</div>
			</li>
			
			<!-- 관리자 쪽지 관리 메뉴 -->
			<li class="nav-item">
				<div class="icon"><a href=""><i class="bi bi-envelope-fill"></i><span class="menu-title">관리자 쪽지 관리</span></a></div>
				<div class="hover-text">관리자 쪽지 관리</div>
			</li>
		</ul>
	</nav>
</div>

</body>
</html>