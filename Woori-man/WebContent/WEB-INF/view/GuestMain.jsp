<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GuestMain.jsp</title>
<!-- 부트스트랩 적용 CSS -->
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<!-- 부트스트랩 부가 테마 CSS -->
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap-theme.min.css">

<!-- 제이쿼리 적용 JS -->
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>

<!-- 부트스트랩 관련 스크립트 적용 JS -->
<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
<!-- 부트스트랩 JavaScript 파일 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>

<link rel="stylesheet" type="text/css" href="<%=cp%>/css/guestMain.css">

<script type="text/javascript">
$(document).ready(function(){
    $('.dropdown-toggle').on('click', function() {
        var dropdownMenu = $(this).next('.dropdown-menu');
        $('.dropdown-menu').not(dropdownMenu).removeClass('show');
        dropdownMenu.toggleClass('show');
    });
});
</script>
        
</head>

<body>

<div class="container">
	<div class="one">
		<div class="item item-img">
			<img src="images/guest.png">
		</div>
		<div class="item item-button">
			<h2>모임이 쉽고, 재밌어진다 !<br>우.리.만</h2><br>
			<a href="loginform.woori" class="btn btn-default">로그인</a><br>
			<a href="membershipform.woori" class="btn btn-default">회원가입</a><br>
			<p class="join">지금 바로 무료로 회원가입 하세요!</p>
		</div>
	</div>
	<div class="two">
		<div class="item item-image">
			<h3 class="image-text">모임과 일정 관리를 동시에 !</h3>
			<p class="image-text">우리만은 그룹 멤버와 함께하는 공간입니다.</p>
		</div>
	</div>
	<ul>
		<li>
			<div class="imgList">
				<img src="https://ssl.pstatic.net/cmstatic/webclient/dres/20240206174213/images/intro/ko/img_seo01.jpg">
			</div>
			<div>
				<strong>그룹을 만들거나 참여해보세요!</strong>
				<p>친구, 가족, 동료 등 함께 하고 싶은 사람과
				<br>우리만의 공간을 만들어보세요.</p>
			</div>
		</li>
		<li>
			<div class="imgList">
				<img src="https://ssl.pstatic.net/cmstatic/webclient/dres/20240206174213/images/intro/ko/img_seo02.jpg">
			</div>
			<div>
				<strong>모임 활동에 참여해보세요!</strong>
				<p>함께 의견을 모으고, 일정을 공유하며
				<br>게시판과 앨범에는 추억을 쌓아보세요.
				</p>
			</div>
		</li>
		<li>
			<div class="imgList">
				<img src="https://img.freepik.com/free-vector/simple-blank-monthly-calendar-template_23-2149336054.jpg?size=626&ext=jpg">
			</div>
			<div>
				<strong>일정을 편하게 관리해보세요!</strong>
				<p>자신이 참여하고 있는 그룹과 모임 일정을
				<br>캘린더에서 관리해보세요.</p>
			</div>
		</li>
	</ul>

	<div class="question">
	    <h2>자주 묻는 질문</h2><br>
	    <div class="dropdown">
	        <button class="btn btn-default dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
	            어떤 콘텐츠를 이용할 수 있는지 궁금해요
	        </button>
	        <ul class="dropdown-menu position-static">
	            <li><br>어쩌구저쩌구<br>어저구저쩌구<br>어쩌구저쩌구</li>
	        </ul>
	    </div>
	    <div class="dropdown">
	        <button class="btn btn-default dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
	            회원가입 방법이 궁금해요
	        </button>
	        <ul class="dropdown-menu position-static">
	            <li><br>어쩌구저쩌구<br>어저구저쩌구<br>어쩌구저쩌구</li>
	        </ul>
	    </div>
	    <div class="dropdown">
	        <button class="btn btn-default dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
	            로그인 방법이 궁금해요
	        </button>
	        <ul class="dropdown-menu position-static">
	            <li>어쩌구저쩌구<br>어저구저쩌구<br>어쩌구저쩌구</li>
	        </ul>
	    </div>
	</div>
</div>




<br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>