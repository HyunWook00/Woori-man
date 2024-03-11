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

<link rel="stylesheet" href="<%=cp %>/css/memberHeader.css">

</head>
<body>

<!-- 로그인 성공한 회원들 페이지에 띄워주는 헤더 메뉴들 -->
<!-- 2023-02-09 노은하 -->

<div class="header-menu row">
	<nav class="navbar member-header bg-body-tertiary">
	
		<div>
			<a class="icon-main"><img alt="logo" src="<%=cp%>/images/로고5_80-40.png"></a>
			<div class="hover-text">메인 홈페이지로 이동</div>
		</div>
		
		<div>
			<ul class="nav member-header justify-content-end">
			
				<li class="nav-item member-header-item">
					<div class="icon member-header-icon-div position-relative">
						<i class="bi bi-envelope-fill member-header-icon"></i>
						<!-- 미확인 쪽지 갯수 -->
						<span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
							5
						</span>
					</div>
					<div class="hover-text">쪽지 보기</div>
				</li>
				
				<!-- 웹 브라우저가 625 이상 일때 보여지는 메뉴들 -->
				<li class="nav-item default-menu">
					<div class="icon member-header-icon-div"><i class="bi bi-person-circle member-header-icon"></i></div>
					<div class="hover-text">정보 수정</div>
				</li>
				<li class="nav-item default-menu">
					<div class="icon member-header-icon-div"><i class="bi bi-door-open-fill member-header-icon"></i></div>
					<div class="hover-text">로그아웃</div>
				</li>
				
				<!-- 웹 브라우저가 625 이하 일때 보여지는 메뉴 -->
				<li class="nav-item small-menu">
					<div class="icon member-header-icon-div dropdown">
						<button class="btn dropdown-toggle member-header-btn" type="button" data-bs-toggle="dropdown" aria-expanded="false">
							<i class="bi bi-list member-header-icon"></i>
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