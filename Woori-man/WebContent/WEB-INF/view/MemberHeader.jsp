<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<link rel="stylesheet" href="<%=cp %>/css/memberHeader.css">
<!-- 로그인 성공한 회원들 페이지에 띄워주는 헤더 메뉴들 -->
<!-- 2023-02-09 노은하  -->
<div class="header-menu row" id="member-header-wrap">
	<nav class="navbar member-header bg-body-tertiary">
		<div class='header-logo-wrap'>
			<a class="icon-main" href="membermain.woori"><img alt="logo" src="<%=cp%>/images/로고5_80-40.png"></a>
			<div class="member-header-hover-text">메인 홈페이지로 이동</div>
		</div>
		
		<div class="header-menu-wrap">
			<ul class="nav member-header justify-content-end">
			
				<li class="nav-item member-header-item">
					<div class="icon member-header-icon-div position-relative">
						<a href="notelist.woori"><i class="bi bi-envelope-fill member-header-icon member-header-message"></i></a>
						<!-- 미확인 쪽지 갯수 -->
						<c:if test="${messageCount > 0 }">
							<span class="position-absolute translate-middle badge rounded-pill bg-danger message-count">
								${messageCount }
							</span>
						</c:if>
					</div>
					<div class="member-header-hover-text">쪽지 보기</div>
				</li>
				
				<!-- 웹 브라우저가 625 이상 일때 보여지는 메뉴들 -->
				<li class="nav-item default-menu member-header-item">
					<div class="icon member-header-icon-div member-info-icon" role="button"><i class="bi bi-person-circle member-header-icon"></i></div>
					<div class="member-header-hover-text">회원정보</div>
					<div class="member-header-user-info">
						<div class="profile-close">
							<i class="bi bi-x-square" role="button" id="header-user-info-closed-btn"></i>
						</div>
						<div class="profile-image">
							<img src="${userDTO.us_profile == null ? 'images/basic-profile.png' : us_profile }">
						</div>
						<div class="profile-name">
							<span id="user-name">${userDTO.us_name }</span><span id="user-id">(${userDTO.us_id })</span><span id="user-code">#${userDTO.us_code }</span>
						</div>
						<div class="profile-signdate">
							<span id="user-signup">가입일 : ${userDTO.us_signup }</span>
						</div>
						<div class="profile-group-count">
							<span id="group-count">가입한 그룹 : ${groupCount }개</span>
						</div>
						<div class="profile-friends-count">
							<span id="friends-count">등록한 친구 : ${friendsCount }명 <span id="friends-edit"><a href="friends.woori">관리</a></span></span>
						</div>
						<div class="profile-button">
							<a class="button-user-modify" href="user.woori">정보수정 <i class="bi bi-pencil-square"></i></a>
							<a class="button-logout" href="logout.woori">로그아웃 <i class="bi bi-door-open"></i></a>
						</div>
					</div>
					<script type="text/javascript">
						$(function()
						{
							var infoFlag = false;
							
							$(".member-info-icon").click(function()
							{
								if(!infoFlag)
								{
									$(".member-header-user-info").slideDown();
									infoFlag = true;
								}
								else if(infoFlag)
								{
									$(".member-header-user-info").slideUp();
									infoFlag = false;
								}
							});
							$("#header-user-info-closed-btn").click(function()
							{
								$(".member-header-user-info").slideUp();
							});
						});
					</script>
				</li>
				<li class="nav-item default-menu member-header-item">
					<div class="icon member-header-icon-div"><i class="bi bi-door-open-fill member-header-icon member-header-log-out" onclick="location.href='logout.woori'" role="button"></i></div>
					<div class="member-header-hover-text">로그아웃</div>
				</li>
				
				<!-- 웹 브라우저가 625 이하 일때 보여지는 메뉴 -->
				<li class="nav-item small-menu">
					<div class="icon member-header-icon-div dropdown">
						<button class="btn dropdown-toggle member-header-btn" type="button" data-bs-toggle="dropdown" aria-expanded="false">
							<i class="bi bi-list member-header-icon"></i>
						</button>
						<ul class="dropdown-menu dropdown-menu-end dropdown-menu-start">
							<li><a href="" class="dropdown-item header-info-modify">정보수정</a></li>
							<li><a href="logout.woori" class="dropdown-item header-logout">로그아웃</a></li>
						</ul>
					</div>
				</li>
				
			</ul>
		</div>
	</nav>
</div>