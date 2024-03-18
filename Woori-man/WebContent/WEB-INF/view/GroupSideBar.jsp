<%@page import="com.woori.dto.GroupDTO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
		
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GroupSideBar.jsp</title>
<link rel="stylesheet" type="text/css" href="css/font.css">
<link rel="stylesheet" type="text/css" href="css/groupSide.css">
<!-- <link rel="stylesheet" href="./bootstrapt/css/bootstrap.min.css" /> -->
<!-- <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
 -->
<!-- 1. 부트스트랩 js -->
<!-- 2. 부트스트랩 css -->
<!-- 3. jquery -->
<!-- 4. 부트스트랩 아이콘 -->
<link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
<script type="text/javascript">

	$(function()
	{
		// 2024-03-03 노은하
		// 정기모임 발의가 가능한 직위는 정기모임, 번개모임 무엇을 발의할것인지 분기
		$(".create-article").click(function()
		{
			var position = '${groupMemberDTO.pos_code}';
			if (position == '1' || position == '2')
				$("#meetingCategoryModal").modal("show");
			else
				window.location.href="meetinginsertform.woori?mc_code=2";
		});
	});

</script>
</head>
<body>

<div class="SideBarBody">
<div class="groupProfile">
  	<nav class="nav nav-tabs profile" role="tablist">
 		<div class="nav nav-tabs" id="nav-tab" role="tablist">
		    <button class="nav-link active" id="nav-groupProfile" data-bs-toggle="tab" data-bs-target="#groupProfile" 
		    type="button" role="tab" aria-controls="allReport" aria-selected="true">그룹 프로필</button>
		    <button class="nav-link" id="nav-groupMyProfile" data-bs-toggle="tab" data-bs-target="#groupMyProfile"
		    type="button" role="tab" aria-controls="groupReport" aria-selected="false">마이 프로필</button>
		</div>
	</nav>	
	  <div class="tab-content" id="nav-tabContent">
		  <div class="tab-pane fade show active" id="groupProfile" role="tabpanel" aria-labelledby="nav-groupProfile">
	 		<div class="cgName">[ ${groupDTO.cg_name } ]</div>
		 	<div class="profileimg">
		 		<!-- 추후 프로필 사진 추가 -->
		 		<img alt="깜찍한 고양이 사진" src="<%=cp %>/images/cat3.jpg">
		 	</div>
	 		<div class="profile1">
		 	<c:forEach var="position" items="${groupPosition }">
		 		${position.pos_name } : ${position.gm_nickname } <br>
		 	</c:forEach> 
		 		${groupDTO.cg_date} 개설 <br>
		 		멤버 : ${groupDTO.gm_count }명 <br>
		 		<hr>
		 	</div>
		 	<div class="profile2">
		 		${groupDTO.cg_intro }<br>
		 		포인트 : ${groupDTO.group_point }pt<br>	
		 		<c:if test="${groupMemberDTO.pos_code== 1 }">
		 			<button type="button" class="mySideBtn" onclick="location.href='groupupdateform.woori?cg_code=${groupDTO.cg_code}'"> 그룹 수정 </button>
		 		</c:if>
		 		<hr>
		 	</div>
		  </div>
		  <div class="tab-pane fade" id="groupMyProfile" role="tabpanel" aria-labelledby="nav-groupMyProfile">
			<div class="profileimg">
				<img alt="깜찍한 고양이 사진" src="<%=cp %>/images/cat2.jpg"><br> 
	 		</div>
				<div class="myProfile1">
		 		<!-- <span>밍</span> 그룹원 <br>
		 		2019.01.01 가입 <br>
		 		 안녕 반가워용>.< <br> -->
		 		<span>${groupMemberDTO.gm_nickname } </span>${groupMemberDTO.pos_name } <br>
		 		${groupMemberDTO.gm_regdate } 가입 <br>
		 		${groupMemberDTO.gm_intro } <br>
		 	</div>
			 <div class="profileButton">
				<button class="mySideBtn create-article">모임 발의</button>
				<button class="mySideBtn" onclick="location.href='groupmypage.woori'">마이페이지</button>
		 	</div>
				<hr>
		  </div>
	</div>
</div> <!-- reportContent -->
<c:import url="SideCalendar.jsp"></c:import>
<hr>
<div id="menulist" class="menulist"> 
	<p><a><i class="bi bi-file-text"></i>전체글 보기</a></p>
	<p><a href="meetinglist.woori"><i class="bi bi-calendar-event"></i>모임</a></p>
	<p><a href="historylist.woori"><i class="bi bi-file-text"></i>히스토리</a></p>
	<p><a href="freeboardlist.woori"><i class="bi bi-file-text"></i>${groupDTO.brd_name }</a></p>
	<hr>
	<p><a href="groupfee.woori"><i class="bi bi-currency-dollar"></i>회비</a></p>
	<p><a href="groupmemberlist.woori"><i class="bi bi-people-fill"></i>그룹원</a></p>
	<hr>
	<p id="versionUp">
	[ 평균을 이겨라 ] <br>
	추후 업데이트 예정
	</p>
	<br><br>
	<hr>
	<!-- 모달을 실행할 버튼 -->
	<button type="button" ${positionCount == 0 ? 'class=\"wthdrBtnActive\"' : 'class=\"wthdrBtn\"' }
	 data-bs-toggle="modal" data-bs-target="#groupWthdr" ${positionCount == 0 ? '' : 'disabled=\"disabled\"' }>
		그룹 탈퇴
	</button>
	
	<!-- 모달 내용 및 처리 -->
	<div class="modal fade" id="groupWthdr" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	  <div class="modal-dialog .modal-dialog-scrollable">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="staticBackdropLabel">그룹 탈퇴</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	      <div class="groupWthdr">그룹 탈퇴 전에 꼭 확인하세요</div><br>
		  <div>그룹을 탈퇴하면</div>
		  <div>이 그룹에서 작성한 모든 컨텐츠는 삭제 및 수정이 불가합니다.</div>
		  <div>수정 및 삭제를 원하실 경우 탈퇴하기 전에 수정 및 삭제 처리를 해주시길 바랍니다.</div>
		  <div>현재 모임 참석 확정 상태일 경우 모임일이 지나야 탈퇴가 가능합니다.</div>
		  <div>탈퇴를 해야할 경우 모임 발의자에게 문의하여 상태를 변경하시길 바랍니다.</div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
	        <button type="button" class="btn btn-primary" onclick="location.href='groupwthdrinsert.woori'">그룹 탈퇴</button>
	      </div>
	    </div>
	  </div>
	</div>
	<hr>
</div>
</div> <!-- Mycontent -->

<div>
	<c:import url="MeetingCategoryModal.jsp"></c:import>
</div>

<%-- <div class="groupSideBar">
		<!-- 그룹 프로필 + 그룹원 목록 -->
		 <ul class="nav nav-tabs">
			<li class="nav-item mtab active" >
				<a href="#groupProfile" data-toggle="tab">그룹 프로필</a>
			</li>
			<li class="nav-item mtab">
				<a href="#groupMyProfile" data-toggle="tab">마이 프로필</a>
			</li>
		 </ul>	
		 <div class="tab-content sidetab"> 
		 <div class="tab-pane fade in active" id="groupProfile">
		 	<sapn>${groupInfo.cg_name}</sapn> <br>
		 	<div class="profileimg">
		 		<!-- 추후 프로필 사진 추가 -->
		 		<img alt="깜찍한 고양이 사진" src="img/cat3.jpg">
		 	</div>
		 	<div class="profile1">
		 	<c:forEach var="position" items="${groupPosition }">
		 		${position.pos_name } : ${position.gm_nickname } <br>
		 	</c:forEach> 
		 		${groupInfo.cg_date} 개설 <br>
		 		멤버 : ${groupInfo.gm_count }명 <br>
		 		<hr>
		 	</div>
		 	<div class="profile2">
		 		${groupInfo.cg_intro }<br>
		 		포인트 : ${groupInfo.group_point }pt<br>	
		 		<br>  
		 		<hr>
		 	</div>
		 </div>      
 		<div class="tab-pane fade" id="groupMyProfile">
 		<div class="profileimg">
			<img alt="깜찍한 고양이 사진" src="img/cat2.jpg"><br> 
 		</div>
			<div class="profile1">
		 		<!-- <span>밍</span> 그룹원 <br>
		 		2019.01.01 가입 <br>
		 		 안녕 반가워용>.< <br> -->
		 		<span>${groupMyInfo.gm_nickname } </span>${groupMyInfo.pos_name } <br>
		 		${groupMyInfo.gm_regdate } 가입 <br>
		 		${groupMyInfo.gm_intro } <br>
		 		 
		 	</div>
		 	<div class="profile2">
				<button type="button" class="button">모임 발의</button>
				<button class="button" onclick="location.href='groupmypage.woori'">마이페이지</button>
				<hr>
		 	</div>
		 </div>
		</div>
		<c:import url="sideCalender.jsp"></c:import>
		<hr>
		<div id="menulist" class="menulist"> 
			<p><a><i class="bi bi-file-text"></i>전체글 보기</a></p>
			<p><a><i class="bi bi-calendar-event"></i>모임</a></p>
			<p><a><i class="bi bi-file-text"></i>후기</a></p>
			<p><a><i class="bi bi-file-text"></i>자유게시판</a></p>
			<hr>
			<p><a><i class="bi bi-currency-dollar"></i>회비</a></p>
			<p><a><i class="bi bi-people-fill"></i>그룹원</a></p>
			<hr>
			[ 평균을 이겨라 ] <br>
			추후 업데이트 예정
			<br><br>
			<hr>
			<!-- 모달을 실행할 버튼 -->
			<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#groupWthdr">
				그룹 탈퇴
			</button>
			
			<!-- 모달 내용 및 처리 -->
			<div class="modal fade" id="groupWthdr" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
			  <div class="modal-dialog .modal-dialog-scrollable">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h1 class="modal-title fs-5" id="staticBackdropLabel">그룹 탈퇴</h1>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <div class="modal-body">
			      <div class="groupWthdr">그룹 탈퇴 전에 꼭 확인하세요</div><br>
				  <div>그룹을 탈퇴하면</div>
				  <div>이 그룹에서 작성한 모든 컨텐츠는 삭제 및 수정이 불가합니다.</div>
				  <div>수정 및 삭제를 원하실 경우 탈퇴하기 전에 수정 및 삭제 처리를 해주시길 바랍니다.</div>
				  <div>현재 모임 참석 확정 상태일 경우 모임일이 지나야 탈퇴가 가능합니다.</div>
				  <div>탈퇴를 해야할 경우 모임 발의자에게 문의하여 상태를 변경하시길 바랍니다.</div>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
			        <button type="button" class="btn btn-primary">Understood</button>
			      </div>
			    </div>
			  </div>
			</div>
			
		</div> <!-- end left -->
	</div> --%>
</body>
</html>