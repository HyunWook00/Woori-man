<%@page import="com.woori.dto.UserDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.woori.dto.NoteDTO"%>
<%@page import="com.woori.dao.NoteDAO"%>
<%@page import="com.woori.util.PagingUtil"%>
<%@page import="java.net.URLDecoder"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
String cp = request.getContextPath();
%>
<%
	//페이징
	String strNum = request.getParameter("num");
	int num=0;
	if(strNum!=null)
		num = Integer.parseInt(strNum);
	
	String pageNum = request.getParameter("pageNum");
	int currentPage = 1;
	if(pageNum != null)
		currentPage = Integer.parseInt(pageNum);
	
	PagingUtil myUtil = new PagingUtil();
	
	int dataCount = (Integer)request.getAttribute("allSendNote");
	int numPerPage = 10;
	int totalPage = myUtil.getPageCount(numPerPage, dataCount);
	
	if(currentPage > totalPage)
		currentPage = totalPage;
	
	int start = (currentPage-1) * numPerPage + 1;
	int end = currentPage * numPerPage;

	NoteDAO dao = new NoteDAO();
	dao.connection();
	ArrayList<NoteDTO> sendNote = null;
	String sender = ((UserDTO)session.getAttribute("userDTO")).getUs_code();
	sendNote = dao.sendNoteList(sender, start, end);
	dao.close();
	
	String param = "";
	
	String listUrl = "notelist.woori" + param;
	
	String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, listUrl);
	
	// 글 내용 보기 주소
	/*
	String articleUrl = "meetingarticle.woori";
	
	if(param.equals(""))
		articleUrl = articleUrl + "?pageNum=" + currentPage;
	else
		articleUrl = articleUrl + param + "&pageNum=" + currentPage;
	*/



%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>NoteList.jsp</title>

<!-- 부트스트랩 적용 CSS -->
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">

<!-- 부트스트랩 관련 스크립트 적용 JS -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- 제이쿼리 적용 JS -->
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>

<!-- 부트스트랩 아이콘 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

<link rel="stylesheet" href="css/memberHeader.css">
<link rel="stylesheet" href="css/footer.css">
<link rel="stylesheet" href="css/noteList.css">
<script type="text/javascript" src="js/noteList.js"></script>


</head>
<body>

	<div class="header">
		<c:import url="MemberHeader.jsp"></c:import>
	</div>	
	
	<div class="container">
		<h2>
			<i class="bi bi-envelope"></i> 쪽지함 <i class="bi bi-envelope"></i>
		</h2>
		<hr>
		<div class="message-kind">
			
			<div class="nav nav-tabs" id="nav-tab" role="tablist">
				    <button class="nav-link active" id="nav-receive-tab" data-bs-toggle="tab" data-bs-target="#receive" 
				    type="button" role="tab" aria-controls="receive" aria-selected="true">전체 수신 쪽지</button>
				    <button class="nav-link" id="nav-friend-tab" data-bs-toggle="tab" data-bs-target="#friend" 
				    type="button" role="tab" aria-controls="friend" aria-selected="false">친구 수신 쪽지</button>
				    <button class="nav-link" id="nav-admin-tab" data-bs-toggle="tab" data-bs-target="#admin" 
				    type="button" role="tab" aria-controls="admin" aria-selected="false">관리자 수신 쪽지</button>
				    <button class="nav-link" id="nav-send-tab" data-bs-toggle="tab" data-bs-target="#send" 
				    type="button" role="tab" aria-controls="send" aria-selected="false">발신 쪽지</button>
				    
				</div>
			
		</div>

		<div class="table-wrap tab-content">
			<!-- <table class="table message-table tab-pane fade in active" id="receive"> -->
			<table class="table message-table tab-pane fade show active" id="receive" role="tabpanel" aria-labelledby="nav-receive-tab">
				<thead>
					<tr>
						<th>
							<div class="form-check">
								<input class="form-check-input" type="checkbox" id="selectAll"
								name="selectAll" onclick="selectAllMessagesInTab('receive')"> 
								<label class="form-check-label"	for="selectAll"></label>
							</div>
						</th>
						<th>제목</th>
						<th>발신자</th>
						<th>수신자</th>
						<th>날짜</th>
						<th><select>
								<option>읽음상태</option>
								<option>읽음</option>
								<option>읽지않음</option>
						</select></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="receive" items="${receiveNote }">
						<tr class="message-item">
							<td>
								<div class="form-check">
									<input class="form-check-input" type="checkbox"
										value="${receive.note_code }" id="selectReceive" name="selectReceive"> <label
										class="form-check-label" for="selectReceive"></label>
								</div>
							</td>
							<td class="title">${receive.note_title }</td>
							<td>${receive.senderid }</td>
							<td>${receive.receiverid }</td>
							<td>${receive.note_date }</td>
							<td class="read-status">
							<c:choose>
								<c:when test="${receive.note_status=='1' }">
									<span class="badge bg-secondary">읽음</span>
								</c:when>
								<c:otherwise>
									<span class="badge bg-danger">읽지않음</span>
								</c:otherwise>
							</c:choose>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<table class="table message-table tab-pane fade" id="send" role="tabpanel" aria-labelledby="nav-send-tab">
				<thead>
					<tr>
						<th>
							<div class="form-check">
								<input class="form-check-input" type="checkbox" id="selectAll"
								name="selectAll" onclick="selectAllMessagesInTab('send')">  
								<label class="form-check-label" for="selectAll"></label>
							</div>
						</th>
						<th>제목</th>
						<th>발신자</th>
						<th>수신자</th>
						<th>날짜</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="send" items="<%= sendNote %>">
						<tr class="message-item">
							<td>
								<div class="form-check">
									<input class="form-check-input" type="checkbox"
										value="${send.note_code }" id="selectSend" name="selectSend">
									<label class="form-check-label" for="selectSend"></label>
								</div>
							</td>
							<td class="title">${send.note_title }</td>
							<td>${send.senderid }</td>
							<td>${send.receiverid }</td>
							<td>${send.note_date }</td>
						</tr>
					</c:forEach>
					<tr>
					
					</tr>
				</tbody>
			</table>
			<!-- 페이징 처리 영역 -->
			<div class="paging" align="center">
				<nav class="page-nav">
					<%
					if (dataCount != 0)
					{
					%>
						<%=pageIndexList %>
					<%
					}
					else
					{
					%>
						등록된 게시물이 존재하지 않습니다.
					<%
					}
					%>
				</nav>
			</div><!-- .paging -->
			<table class="table message-table tab-pane fade" id="admin" role="tabpanel" aria-labelledby="nav-admin-tab">
				<thead>
					<tr>
						<th>
							<div class="form-check">
								<input class="form-check-input" type="checkbox" value="" id="selectAll" 
								name="selectAll" onclick="selectAllMessagesInTab('admin')">  
								<label class="form-check-label" for="selectAll"></label>
							</div>
						</th>
						<th>제목</th>
						<th>발신자</th>
						<th>수신자</th>
						<th>날짜</th>
						<th><select>
								<option>읽음상태</option>
								<option>읽음</option>
								<option>읽지않음</option>
						</select></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="receiveAdmin" items="${receiveAdminNote }">
						<tr class="message-item">
							<td>
								<div class="form-check">
									<input class="form-check-input" type="checkbox"
										value="${receiveAdmin.note_code }" id="selectAdmin"
										name="selectAdmin"> <label class="form-check-label"
										for="selectAdmin"></label>
								</div>
							</td>
							<td class="title">${receiveAdmin.note_title }</td>
							<td>${receiveAdmin.senderid }</td>
							<td>${receiveAdmin.receiverid }</td>
							<td>${receiveAdmin.note_date }</td>
							<c:choose>
								<c:when test="${receiveAdmin.note_status=='1' }">
									<td><span class="badge bg-secondary">읽음</span></td>
								</c:when>
								<c:otherwise>
									<td><span class="badge bg-danger">읽지않음</span></td>
								</c:otherwise>
							</c:choose>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<table class="table message-table tab-pane fade" id="friend" role="tabpanel" aria-labelledby="nav-friend-tab">
				<thead>
					<tr>
						<th>
							<div class="form-check">
								<input class="form-check-input" type="checkbox" id="selectAll"
								name="selectAll" onclick="selectAllMessagesInTab('friend')"> 
								<label class="form-check-label" for="selectAll"></label>
							</div>
						</th>
						<th>제목</th>
						<th>발신자</th>
						<th>수신자</th>
						<th>날짜</th>
						<th><select>
								<option>읽음상태</option>
								<option>읽음</option>
								<option>읽지않음</option>
						</select></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="receiveFriend" items="${receiveFriendNote }">
						<tr class="message-item">
							<td>
								<div class="form-check">
									<input class="form-check-input" type="checkbox"
										value="${receiveFriend.note_code }" id="selectFriend"
										name="selectFriend"> <label class="form-check-label"
										for="selectFriend"></label>
								</div>
							</td>
							<td class="title">${receiveFriend.note_title }</td>
							<td>${receiveFriend.senderid }</td>
							<td>${receiveFriend.receiverid }</td>
							<td>${receiveFriend.note_date }</td>
							<c:choose>
								<c:when test="${receiveFriend.note_status=='1' }">
									<td><span class="badge bg-secondary">읽음</span></td>
								</c:when>
								<c:otherwise>
									<td><span class="badge bg-danger">읽지않음</span></td>
								</c:otherwise>
							</c:choose>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		

		</div>
		<div class="compose-btn">
			<button type="button" class="btn btn-delete" onclick="deleteReceiveNote()">쪽지 삭제</button>
			<button type="button" class="btn btn-write"	onclick="location.href='notewriteform.woori'">쪽지 작성</button>
		</div>
	</div>
	
	<div class="footer">
		<c:import url="MemberFooter.jsp"></c:import>
	</div>

	<div class="modal fade" id="messageModal1" tabindex="-1" aria-labelledby="messageModalLabel1" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title fs-5" id="messageModalLabel1">쪽지 내용</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"	aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="card">
						<div class="card-header">
							<i class="bi bi-envelope"></i>
						</div>
						<div class="card-body" id="modal-result">
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	

</body>
</html>
