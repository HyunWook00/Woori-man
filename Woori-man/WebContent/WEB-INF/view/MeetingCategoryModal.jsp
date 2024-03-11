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
<title>MeetingCategoryModal</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<!-- 2023-03-02 노은하 -->
<!-- 모임 발의 카테고리 선택 모달창 -->

<!-- 모달창 -->
<div class="modal fade" id="meetingCategoryModal" tabindex="-1" aria-labelledby="meetingCategoryModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h6 class="modal-title fs-5" id="meetingCategoryModalLabel">모임 종류 선택</h6>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body" id="meetingCategory-modal-body">
			
			<!-- 세션에서 직위 코드 받아와서 분기하기 -->
			<div class="meeting-category-div regular">
				<a href="meetinginsertform.woori?mc_code=1">정기모임 발의하기</a>
			</div>
			<div class="meeting-category-div irregular">
				<a href="meetinginsertform.woori?mc_code=2">번개모임 발의하기</a>
			</div>
			
			</div>
			<div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소하기</button>
		   </div>
		</div>
	</div>
</div>

<button type="button" class="btn btn-primary" id="modal-btn" data-bs-toggle="modal" data-bs-target="#meetingCategoryModal">
</button>

</body>
</html>