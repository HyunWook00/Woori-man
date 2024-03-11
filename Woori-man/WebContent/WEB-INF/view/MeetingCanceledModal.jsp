<%@page import="com.test.mvc.CancelReasonDTO"%>
<%@page import="java.util.ArrayList"%>
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
<title>MeetingCanceledModal</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div class="modal fade" id="cancelReasonModal" tabindex="-1" aria-labelledby="cancelReasonModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h6 class="modal-title fs-5" id="cancelReasonModalLabel">모임 철회하기</h6>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				철회 사유를 선택하세요.
				<div>
				<select name="crc_code" id="crc_code">
					<option value="0">-철회 사유를 선택하세요-</option>
					<c:forEach items="${cancelReason }" var="item">
					<option value="${item.crc_code }">${item.crc_reason }</option>
					</c:forEach>
				</select>
				</div>
			</div>
			<div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소하기</button>
		        <button type="button" class="btn btn-primary" onclick="deleteMeeting(${meetingArticle.mt_code})">철회하기</button>
		      </div>
		</div>
	</div>
</div>

</body>
</html>