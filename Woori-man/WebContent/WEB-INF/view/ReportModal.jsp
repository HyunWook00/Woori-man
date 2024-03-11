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
<title>ReportModal</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/bootstrap.css">
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

<!-- 2024-02-29 노은하 -->
<!-- 신고버튼 클릭시 띄워주는 모달 -->

<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#reportModal">
  Launch demo modal
</button>

<div class="modal fade" id="reportModal" tabindex="-1" aria-labelledby="reportModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h6 class="modal-title fs-5" id="reportModalLabel">신고접수</h6>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				정말...  신고 하시겠어요?
			</div>
			<div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소하기</button>
		        <button type="button" class="btn btn-primary">신고하기</button>
		      </div>
		</div>
	</div>
</div>

</body>
</html>