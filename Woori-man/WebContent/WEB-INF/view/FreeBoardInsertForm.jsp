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
<title>자유게시글 작성하기 - 우리만</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/groupContentCommon.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/article.css">
<link rel="stylesheet" href="<%=cp %>/css/footer.css" />
<link rel="stylesheet" href="<%=cp %>/css/boardForm.css" />
<script type="text/javascript" src="<%=cp%>/js/freeBoardForm.js"></script>
</head>
<body>

<!-- 2024-03-04 노은하 -->
<!-- 자유게시글 작성 폼 페이지 -->

<!-- 헤더 -->
<div class="header">
	<c:import url="MemberHeader.jsp"></c:import>
</div>

<!-- 상단메뉴 영역 -->
<div class="menuList">
 	<c:import url="GroupHeader.jsp"></c:import>
</div>

<div class="container">

	<!-- 좌측 고정메뉴 -->
	<div class="leftMenu">
		<div class="groupMain_side">
		<c:import url="GroupSideBar.jsp"></c:import>
		</div>
	</div>
	
	<!-- 중앙 주요 컨텐츠 -->
	<div class="centerContent">
	
		<!-- 게시판 정보 -->
		<div class="board-info">
		
			<!-- 추후 세션에서 그룹명 받아오기 -->
			<div class="board-title">[ <span class="group-name">${groupDTO.cg_name }</span> ] ${groupDTO.brd_name }</div>
			<div class="button-zone">
				<div class="button-div">
					<button type="button" class="article-button article-list" onclick="location.href='freeboardlist.woori'">취소하기</button>
				</div>
			</div><!-- .button-zone -->
		</div><!-- .board-info -->
		
		<div class="content">
			<form action="freeboardinsert.woori" class="board-insert-form" id="board-insert-form" method="post" enctype="multipart/form-data">
				<div class="board-title-div"><input type="text" id="brd_subject" name="brd_subject" placeholder="제목을 입력하세요." class="board-title"></div>
				<div class="board-content-div"><textarea placeholder="내용을 입력하세요." name="brd_content" id="brd_content" class="board-content"></textarea></div>
				<div class="board-attach-div">
					<div class="board-attach">
						<input type="file" class="form-control-sm board-attach" name="ba_name" id="ba_name">
					</div>
					<i class="bi bi-plus-square add-attach" role="button"></i>
				</div>
				<div class="warning-info">타인의 개인정보를 유출하거나, 타인을 비방하는 내용이 담긴 게시글은 무통보 삭제처리됩니다.</div>
				<div class="btn-div">
					<button type="button" class="board-form-btn cancel-btn" onclick="location.href='freeboardlist.woori'">취소</button>
					<button type="button" class="board-form-btn submit-btn" onclick="articleInsert()">등록</button>
				</div>
			</form>
		
		</div>
	
	</div>
	
</div>

<!-- 푸터 영역 -->
<div class="footer">
<c:import url="MemberFooter.jsp"></c:import>
</div>

</body>
</html>