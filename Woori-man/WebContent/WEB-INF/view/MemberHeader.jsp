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
<title>MemberHeader.jsp</title>

<!-- 경로 수정 확인~! -->
<link rel="stylesheet" href="<%=cp %>/css/memberHeader.css">

</head>
<body>

<!-- 로그인 성공한 회원들 페이지에 띄워주는 헤더 메뉴들 -->
<!-- 2023-02-09 노은하 -->

<!--
아래 구문들 헤드 영역에 삽입 필요

부트스트랩 5.3.2
<%-- <link rel="stylesheet" type="text/css" href="<%=cp %>/css/bootstrap.css"> --%>

부트스트랩 아이콘
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

-->

<div class="header-menu row">
	<nav class="navbar bg-body-tertiary">
	
		<div>
			<a class="icon-main"><img alt="logo" src="<%=cp%>/images/로고5_80-40.png"></a>
			<div class="hover-text">메인 홈페이지로 이동</div>
		</div>
		
		<div>
			<ul class="nav justify-content-end">
			
				<li class="nav-item">
					<div class="icon position-relative">
						<i class="bi bi-envelope-fill"></i>
						<!-- 미확인 쪽지 갯수 -->
						<span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
							5
						</span>
					</div>
					<div class="hover-text">쪽지 보기</div>
				</li>
				
				<!-- 웹 브라우저가 625 이상 일때 보여지는 메뉴들 -->
				<li class="nav-item default-menu">
					<div class="icon"><i class="bi bi-person-circle"></i></div>
					<div class="hover-text">정보 수정</div>
				</li>
				<li class="nav-item default-menu">
					<div class="icon"><i class="bi bi-door-open-fill"></i></div>
					<div class="hover-text">로그아웃</div>
				</li>
				
				<!-- 웹 브라우저가 625 이하 일때 보여지는 메뉴 -->
				<li class="nav-item small-menu">
					<div class="icon dropdown">
						<button class="btn dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
							<i class="bi bi-list"></i>
						</button>
						<ul class="dropdown-menu dropdown-menu-end dropdown-menu-start">
							<li><a href="" class="dropdown-item">정보수정</a></li>
							<li><a href="" class="dropdown-item">로그아웃</a></li>
						</ul>
					</div>
				</li>
				
			</ul>
		</div>
	</nav>
</div>


</body>
</html>