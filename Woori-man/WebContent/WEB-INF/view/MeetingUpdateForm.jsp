<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모임 수정하기 - ${meeting.mt_title }</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b35408bccc20d37942f3ecd3c0ff44b3"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/groupContentCommon.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/article.css">
<link rel="stylesheet" href="<%=cp %>/css/footer.css" />
<link rel="stylesheet" href="<%=cp %>/css/meetingUpdateForm.css" />
<script type="text/javascript" src="<%=cp %>/js/meetingUpdateForm.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>

<!-- 2024-03-01 노은하 -->
<!-- 모임 발의 폼 페이지 -->

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
			<div class="board-title">[ <span class="group-name">${groupDTO.cg_name }</span> ] ${meeting.mt_title }</div>
			
			<div class="button-zone">
				<div class="button-div">
					<button type="button" class="article-button article-list" value="${meeting.mt_code }">취소하기</button>
				</div>
			</div><!-- .button-zone -->
		</div><!-- .board-info -->
		
		<div class="content">
			<form action="meetingupdate.woori" class="meeting-insert-form" id="meeting-update-form" method="post">
				<div class="main-content-div">
					<input type="hidden" id="mt_code" name="mt_code" value="${meeting.mt_code }" />
						
					<div><span class="meeting-writer">${groupMemberDTO.gm_nickname }</span>님이 수정중인 모임은</div>
					<div><span class="group-name">${groupDTO.cg_name }</span>그룹의<span class="meeting-category">${meeting.mc_code==1? '정기모임':'번개모임' }</span> 입니다.</div>
					<div>모임 제목은 <input type="text" name="mt_title" id="mt_title" class="meeting-title" value="${meeting.mt_title }" readonly="readonly"/> 입니다.</div>
					<div class="meeting-date-div">모임 예정일은 <input type="text" id="mt_meet" name="mt_meet" class="meeting-date" value="${meeting.mt_meet }" readonly="readonly"/> 입니다.</div>
					<div class="meeting-region-div">
						<div class="meeting-region-info">모임 지역은<span class="meeting-region">${meeting.rg_name } ${meeting.ct_name }</span> 입니다.</div>
					</div><!-- .meeting-region-div -->
					<div class="submit-btn-div">
						<button type="submit" class="meeting-update-btn" >수정하기</button>
					</div>
				</div>
				
				
				<div class="sub-content-div">
					<div class="meeting-etc">
						<span class="meeting-etc">기타 메모사항</span><br>
						<div class="etc-write">
							<textarea name="mt_etc" id="mt_etc" placeholder="기타 메모사항을 입력하세요. (최대 100글자)" class="meeting-etc-input" >${meeting.mt_etc }</textarea>
							<span class="count"><span class="now-count">0</span> / 100</span>
						</div>
					</div>
					<div class="meeting-visited">
						<span class="meeting-visitied">방문장소 등록</span><br>
						<c:choose>
						<c:when test="${fn:length(places) <= 0 }">
						<div class="visited-content">
							<input type="text" class="visited-form-element visited-form-zipcode" name="vp_zipcode" placeholder="우편번호" readonly="readonly">
							<input type="button" onclick="findPostcode(this)" value="우편번호 찾기"><br>
							<input type="text" class="visited-form-element visited-form-addr1" name="vp_addr1" placeholder="도로명주소" readonly="readonly"><br>
							<input type="text" class="visited-form-element visited-form-addr2" name="vp_addr2" placeholder="상세주소">
						</div>
						</c:when>
						
						<c:otherwise>
						<c:forEach items="${places }" var="place">
						<div class="visited-content">
							<input type="text" class="visited-form-element visited-form-zipcode" name="vp_zipcode" placeholder="우편번호" value="${place.vp_zipcode }" readonly="readonly">
							<input type="button" onclick="findPostcode(this)" value="우편번호 찾기"><br>
							<input type="text" class="visited-form-element visited-form-addr1" name="vp_addr1" placeholder="도로명주소" value="${place.vp_addr1 }" readonly="readonly"><br>
							<input type="text" class="visited-form-element visited-form-addr2" name="vp_addr2" placeholder="상세주소" value="${place.vp_addr2 }">
						</div>
						</c:forEach>
						</c:otherwise>
						</c:choose>
						
						<div>
						<button type="button" class="visited-add-btn article-button">추가</button>
						<button type="button" class="visited-remove-btn article-button">삭제</button>
						</div>
						
					</div>
				</div>
				
			</form>
		</div>
	
	</div><!-- .centerContent -->
	
</div>


<!-- 푸터 영역 -->
<div class="footer">
<c:import url="MemberFooter.jsp"></c:import>
</div>

</body>
</html>