<%@page import="com.woori.dto.GroupDTO"%>
<%@page import="com.woori.dao.MeetingDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.woori.dto.MeetingDTO"%>
<%@page import="com.woori.util.PagingUtil"%>
<%@page import="java.net.URLDecoder"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	// 2024-02-24 노은하
	// 페이징
	String strNum = request.getParameter("num");
	int num=0;
	if(strNum!=null)
		num = Integer.parseInt(strNum);
	
	String pageNum = request.getParameter("pageNum");
	int currentPage = 1;
	if(pageNum != null)
		currentPage = Integer.parseInt(pageNum);
	
	String key = (String)request.getAttribute("key");
	String value = (String)request.getAttribute("value");
	
	if(key != null)
	{
		if(request.getMethod().equalsIgnoreCase("GET"))
			// 디코딩 처리
			value = URLDecoder.decode(value, "UTF-8");
	}
	else
	{
		key = "MT_TITLE";
		value = "";
	}
	
	PagingUtil myUtil = new PagingUtil();
	
	int dataCount = (Integer)request.getAttribute("allArticle");
	int numPerPage = 10;
	int totalPage = myUtil.getPageCount(numPerPage, dataCount);
	
	if(currentPage > totalPage)
		currentPage = totalPage;
	
	int start = (currentPage-1) * numPerPage + 1;
	int end = currentPage * numPerPage;

	MeetingDAO dao = new MeetingDAO();
	ArrayList<MeetingDTO> meetingList = null;
	String cg_code = ((GroupDTO)session.getAttribute("groupDTO")).getCg_code();
	meetingList = dao.getMeetingLists(cg_code, start, end, key, value);
	dao.close();
	
	String param = "";
	
	if(!value.equals(""))
	{
		param += "?key=" + key;
		param += "&value=" + value;
	}
	
	String listUrl = "meetinglist.woori" + param;
	
	String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, listUrl);
	
	// 글 내용 보기 주소
	String articleUrl = "meetingarticle.woori";
	
	if(param.equals(""))
		articleUrl = articleUrl + "?pageNum=" + currentPage;
	else
		articleUrl = articleUrl + param + "&pageNum=" + currentPage;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${groupDTO.cg_name } - 모임게시판</title>
<link rel="stylesheet" href="<%=cp %>/css/footer.css" />
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/articleList.css" />
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/groupContentCommon.css">
<link rel="stylesheet" href="<%=cp %>/css/meetingList.css" />

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

<!-- 2024-02-11 노은하 -->
<!-- 각 그룹별 모임 목록 페이지 -->

<!-- 헤더 영역 -->
<div class="header">
	<c:import url="MemberHeader.jsp"></c:import>
</div>

<!-- 상단메뉴 영역 -->
<div class="menuList">
 	<c:import url="GroupHeader.jsp"></c:import>
</div>

<div class="mainContent">

	<!-- 좌측 고정메뉴 -->
	<div class="leftMenu">
		<div class="groupMain_side">
		<c:import url="GroupSideBar.jsp"></c:import>
		</div>
	</div>
	
	<!-- 중앙 주요 컨텐츠 영역 -->
	<div class="centerContent">
	
		<!-- 게시판 정보 -->
		<div class="board-info">
		
			<!-- 추후 세션에서 그룹명 받아오기 -->
			<div class="board-title">[ <span class="group-name">${groupDTO.cg_name }</span> ] 모임 게시판</div>
		
		</div>
		
		<!-- 게시글 검색 영역 -->
		<div class="content-search">
		
				<div class="count-article">
					새글 <span id="new-article">${articleCount }</span> / <span id="total-article">${allArticle }</span>
				</div>
				
			<form action="" class="search-form">
				<select name="searchCategory" id="searchCategory" class="search-category">
					<option value="mt_title">제목</option>
					<option value="mt_wrtite">발의자</option>
					<option value="mt_meet">모임일</option>
				</select>
				<input type="text" name="searchContent" class="search-bar" />
				<button type="submit" class="btn-search"><i class="bi bi-search"></i></button>
			</form>
			
		</div><!-- .content-search -->
		
		<div class="content-list-div">
		
			<!-- 게시글 컬럼명 영역 -->
			<div class="content-column">
			
				<form action="" class="filter-form">
					<div class="content-column-name article-number">글번호</div>
	
					<!-- 전체보기 / 정기모임 / 번개모임 -->
					<div class="content-column-name meeting-category">
					
						<select class="column-filter" name="meeting-category" id="meeting-category">
							<option selected="selected">모임종류</option>
							<option value="regular">정기모임</option>
							<option value="irregular">번개모임</option>
						</select>
						
					</div>
					
					<div class="content-column-name article-title">제목</div>
					<div class="content-column-name write-user">발의자</div>
					<div class="content-column-name write-date">발의일</div>
					
					<!-- 전체보기 / 빠른순 / 느린순 -->
					<div class="content-column-name meeting-date">
					
						<select name="meeting-date" id="meeting-date" class="column-filter">
							<option selected="selected">모임일시</option>
							<option value="asc">빠른순</option>
							<option value="desc">느린순</option>
						</select>
						
					</div>
				
					<!-- 전체보기 / 참석여부 확인중 / 확정된 모임 / 철회된 모임 -->
					<div class="content-column-name meeting-status">
					
						<select class="column-filter" name="meeting-state" id="meeting-state">
							<option selected="selected">모임상태</option>
							<option value="">참석여부 확인중</option>
							<option value="">확정된 모임</option>
							<option value="">철회된 모임</option>
						</select>
									
					</div>
				</form>
			</div><!-- div.content-column -->
			
			
			<!-- 게시글 목록 영역 -->
			<div class="content-list">
			
				<!-- 컨트롤러에서 받아온 게시글 정보 배열 lists에서 하나씩 꺼내오기 -->
				<c:forEach var='meeting' items="<%=meetingList %>">
				
				<div class="article">
				
					<div class="article-number article-element">${meeting.num }</div>
					
					<!-- 정기모임 / 번개모임 뱃지 달아주기 -->						
					<div class="meeting-category article-element">
					<c:choose>
						<c:when test="${meeting.mc_code==1}">
							<span class="meeting-regular meeting-badge">정기모임</span>
						</c:when>
						
						<c:when test="${meeting.mc_code==2}">
							<span class="meeting-irregular meeting-badge">번개모임</span>
						</c:when>
					</c:choose>
					</div><!-- .meeting-category -->
					
					<!-- 모임 제목(글제목) -->
					<div class="article-title article-element">
						<a href="meetingarticle.woori?mt_code=${meeting.mt_code }">${meeting.mt_title }</a>
					</div>
					
					<!-- 발의자(작성자) -->
					<div class="write-user article-element">
						${meeting.gm_nickname }
					</div>
						
					<!-- 발의일(작성일) -->
					<div class="write-date article-element">
						${meeting.mt_date }
					</div>
					
					<!-- 모임 예정일 -->
					<div class="meeting-date article-element">
						${meeting.mt_meet }
					</div>
					
					<!-- 모임 상태 -->
					<c:set var="mt_status" value="${meeting.mt_status }"></c:set>
					<div class="meeting-status article-element">
						<c:choose>
							<c:when test="${mt_status==1 }">
								<span class="meeting-vote meeting-badge">참석여부 확인중</span>
							</c:when>
							<c:when test="${mt_status==2 }">
								<span class="meeting-complete meeting-badge">모임확정</span>
							</c:when>
							<c:when test="${mt_status==3 }">
								<span class="meeting-cancel meeting-badge">모임철회</span>
							</c:when>
						</c:choose>
					</div>
				</div><!-- .article -->
				<!-- 모임글 하나 forEach 끝 이제 다음 객체로 다시 반복 -->
				</c:forEach>
				
			</div><!-- .content-list -->
			<!-- 모임글 목록 출력 끝 -->
			
		</div><!-- content-list-div -->
		
		<!-- 하단 모임발의(새글쓰기) / 내글보기 버튼 영역 -->
		<div class="button-div">
			<button type="button" class="article-button create-article">모임발의</button>
			<button type="button" class="article-button my-article">내글보기</button>
		</div>
		
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
	</div><!-- centerContent -->
</div><!-- mainContent -->

<c:import url="MeetingCategoryModal.jsp"></c:import>

<!-- 푸터 영역 -->
<div class="footer">
<c:import url="MemberFooter.jsp"></c:import>
</div>



</body>
</html>