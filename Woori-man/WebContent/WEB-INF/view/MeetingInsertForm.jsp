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
<title>모임 발의하기 - 우리만</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b35408bccc20d37942f3ecd3c0ff44b3"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/groupContentCommon.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/article.css">
<link rel="stylesheet" href="<%=cp %>/css/footer.css" />
<link rel="stylesheet" href="<%=cp %>/css/meetingForm.css" />
<script type="text/javascript" src="<%=cp %>/js/meetingForm.js"></script>
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
			<div class="board-title">[ <span class="group-name">${groupDTO.cg_name }</span> ] 모임 게시판</div>
			
			<div class="button-zone">
				<div class="button-div">
					<button type="button" class="article-button article-list">취소하기</button>
				</div>
			</div><!-- .button-zone -->
		</div><!-- .board-info -->
		
		<div class="content">
			<form action="meetinginsert.woori" class="meeting-insert-form" method="post">
				<input type="hidden" id="mc_code" name="mc_code" value="${mc_code }" />
					
				<div><span class="meeting-writer">${groupMemberDTO.gm_nickname }</span>님이 발의중인 모임은</div>
				<div><span class="group-name">${groupDTO.cg_name }</span>그룹의<span class="meeting-category">${mc_code==1? '정기모임':'번개모임' }</span> 입니다.</div>
				<div>모임 제목은 <input type="text" name="mt_title" id="mt_title" class="meeting-title" placeholder="모임 제목을 입력하세요.(최대 50글자)"/> 입니다.</div>
				<div class="meeting-date-div">모임 예정일은 <input type="date" id="mt_meet" name="mt_meet" class="meeting-date" /> 입니다.</div>
				<div class="meeting-region-div">
					<div class="list-column">
						<div class="list-column-name">시·도</div>
						<ul class="select-list">
						<c:forEach items="${regionList }" var="region">
							<li value="${region.rg_code }" role="button" class="region-item">${region.rg_name }</li>
						</c:forEach>
						</ul>
					</div>
					<div class="list-column">
						<div class="list-column-name">시·구·군</div>
						<c:forEach items="${regionList }" var="region">
							<ul class="select-list city-list"  id="region-${region.rg_code }">
							<c:forEach items="${cityList[region.rg_code] }" var="city">
								<li value="${city.ct_code }" role="button" class="city-item" id="ct_code">${city.ct_name }</li>
							</c:forEach>
							</ul>
						</c:forEach>
					</div>
					<div class="meeting-region-info">모임 지역은<input type="hidden" readonly="readonly" id="ct_code" name="ct_code" class="ct_code"> <span class="meeting-region"></span> 입니다.</div>
				</div>
				
				<div class="submit-btn-div">
					<button type="submit" class="meeting-insert-btn">발의하기</button>
				</div>
				
				<div class="sub-content-div">
					<div class="meeting-etc">
						기타 메모사항<br>
						<div class="etc-write">
							<textarea name="mt_etc" id="mt_etc" placeholder="기타 메모사항을 입력하세요. (최대 100글자)" class="meeting-etc-input" ></textarea>
							<span class="count"><span class="now-count">0</span> / 100</span>
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