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
<title>notification.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/notification.css">
<!-- 부트스트랩 css -->
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
<!-- 부트스트랩 아이콘 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<!-- 부트스트랩 js -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<!-- 제이쿼리 적용 JS -->
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="js/notification.js"></script>

</head>
<body>

<div class="header">
	<c:import url="AdminHeader.jsp"></c:import>
</div>

<div class="wrap">
<div class="container main" style="background-color: rgb(0 0 0 / 4%);"> 
	<div class="sub_main">
		<div class="notice">
			<h2>공지사항</h2> 
			<div class="go_notice">
				<button class="notice_btn" onclick="noticeInsert()">작성하기</button>
			</div>
		</div>
	</div>
	
	<div class="selection">
		<ul class="tbl_list">
			<c:forEach var="list" items="${noticeList }">
				<li class="tbl">
					<a href="notificationread.woori?nf_code=${list.nf_code}">
					<strong>${list.nf_title }</strong>
					<br>
					<span>${list.nf_date }</span>
					</a>
				</li>
			</c:forEach>
		</ul>
	</div>

	
	
	
	<!-- <div class="selection">
		<ul class="tbl_list">
			<li class="tbl">
				<a href="">
					<strong>[10번공지] 우리만! 모바일 버전이 출시!</strong>
					<br>
					<span>2024년 2월 11 일</span>
				</a>				
			</li>
			<li class="tbl">
				<a href="">
					<strong>[9번공지] 건강한 연휴 보냅시다!!!</strong>
					<br>
					<span>2024년 2월 7 일</span>
				</a>				
			</li>
			<li class="tbl">
				<a href="">
					<strong>[8번공지] 불법촬영물등 유통 방지를 위한 기술적·관리적 조치 적용을 안내드립니다. </strong>
					<br>
					<span>2024년 2월 5 일</span>
				</a>				
			</li>
			<li class="tbl">
				<a href="">
					<strong>[7번공지] '개인정보 처리방침' 개정 안내</strong>
					<br>
					<span>2024년 1월 30 일</span>
				</a>				
			</li>
			<li class="tbl">
				<a href="">
					<strong>[6번공지] 우리만 그룹 활동 정책 변경 안내</strong>
					<br>
					<span>2024년 1월 25 일</span>
				</a>				
			</li>
			<li class="tbl">
				<a href="">
					<strong>[5번공지] 새로운 이용약관 안내</strong>
					<br>
					<span>2024년 1월 22 일</span>
				</a>				
			</li>
			<li class="tbl">
				<a href="">
					<strong>[4번공지] 그래도 해야합니다!</strong>
					<br>
					<span>2024년 1월 19 일</span>
				</a>				
			</li>
			<li class="tbl">
				<a href="">
					<strong>[3번공지] 하지만 너무 힘들어유~~ㅜㅜ</strong>
					<br>
					<span>2024년 1월 16 일</span>
				</a>				
			</li>			
			<li class="tbl">
				<a href="">
					<strong>[2번공지] 다들 화이팅 하자구요~!!!</strong>
					<br>
					<span>2024년 1월 10 일</span>
				</a>				
			</li>			
			<li class="tbl">
				<a href="">
					<strong>[1번공지] 새해 기념</strong>
					<br>
					<span>2024년 1월 1 일</span>
				</a>				
			</li>			
		
		</ul>
	</div> -->
	
	
</div>
</div>




</body>
</html>
























































