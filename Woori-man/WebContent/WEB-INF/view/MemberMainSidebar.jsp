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
<title>MemberMainSidebar.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/MemberSideBar.css">
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<style type="text/css">



</style>
 <!-- 부트스트랩 js -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script> 
<!-- 제이쿼리 적용 JS -->
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">



</script>

</head>
<body>

		<div class="sidebar">	
			<div class="menus_area sticky">
				<div class="sub_area">
					<div class="menu_option option_top" onclick="location.href='membermain.woori'">Woori</div>
					<div class="menu_option" onclick="location.href='user.woori'"><img src="images/profile.png" class="menu_img" /></div>
					<div class="menu_option" onclick="location.href='notelist.woori'"><img src="images/letter.png" class="menu_img" /></div>
					<div class="menu_option" onclick="location.href='friends.woori'"><img src="images/friend.png" class="menu_img" /></div>
					<div class="menu_option" onclick="location.href='noticeslist.woori'"><img src="images/notice.png" class="menu_img" /></div>
					<div class="menu_option" onclick="location.href='inquirylist.woori'"><img src="images/QnA.png" class="menu_img" /></div>
					<div class="menu_option" onclick="location.href='faq.woori'"><img src="images/faq.png" class="menu_img" /></div>
				</div>
			</div>
		</div>
		
		<div class="off">
			<button class="btn btn-primary off_btn" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasScrolling" aria-controls="offcanvasScrolling"><i class="bi bi-list-ul"></i></button>

			<div class="offcanvas offcanvas-start" data-bs-scroll="true" data-bs-backdrop="false" tabindex="-1" id="offcanvasScrolling" aria-labelledby="offcanvasScrollingLabel">
			  <div class="offcanvas-header">
			    <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
			  </div>
			  <div class="offcanvas-body">
			    <div class="menu_option option_top" onclick="location.href='membermain.woori'">Woori</div>
				<div class="menu_option" onclick="location.href='user.woori'"><img src="images/profile.png" class="menu_img" />프로필</div>
				<div class="menu_option" onclick="location.href='notelist.woori'"><img src="images/letter.png" class="menu_img" />쪽지</div>
				<div class="menu_option" onclick="location.href='friends.woori'"><img src="images/friend.png" class="menu_img" />친구</div>
				<div class="menu_option" onclick="location.href='noticeslist.woori'"><img src="images/notice.png" class="menu_img" />공지사항</div>
				<div class="menu_option" onclick="location.href='inquirylist.woori'"><img src="images/QnA.png" class="menu_img" />문의사항</div>
				<div class="menu_option" onclick="location.href='faq.woori'"><img src="images/faq.png" class="menu_img" />자주묻는 질문</div>
			  </div>
			</div>
		</div>
 
</body>
</html>
























































