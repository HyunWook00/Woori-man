<%@page import="com.woori.dto.MeetingDTO"%>
<%@page import="com.woori.dto.GroupDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.woori.dao.MeetingDAO"%>
<%@page import="com.woori.util.PagingUtil"%>
<%@page import="java.net.URLDecoder"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	meetingList = dao.getCompleteMeetingLists(cg_code, start, end, key, value);
	dao.close();
	
	String param = "";
	
	if(!value.equals(""))
	{
		param += "?key=" + key;
		param += "&value=" + value;
	}
	
	String listUrl = "historylist.woori" + param;
	
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
<title>히스토리 게시판 - ${groupDTO.cg_name }</title>
<link rel="stylesheet" href="<%=cp %>/css/footer.css" />
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/groupContentCommon.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/articleList.css" />
<link rel="stylesheet" href="<%=cp %>/css/historyList.css" />
<script type="text/javascript" src="<%=cp %>/js/historyList.js"></script>
<script type="text/javascript">

	function goMeetingArticle(mt_code)
	{
		var url = "meetingarticle.woori?mt_code=" + mt_code;
		window.location.href=url;
	}
	
	function goHistoryArticle(his_code, mt_code)
	{
		var url = "historyarticle.woori?his_code=" + his_code + "&mt_code=" + mt_code;
		window.location.href=url;
	}

</script>

</head>
<body>

<!-- 2024-02-19 노은하 -->
<!-- 그룹내 히스토리 글목록 페이지 -->

<!-- 헤더 영역 -->
<div class="header">
	<c:import url="MemberHeader.jsp"></c:import>
</div>

<!-- 상단메뉴 영역 -->
<div class="menuList">
 	<c:import url="GroupHeader.jsp"></c:import>
</div>

<!-- 주요 콘텐츠 영역 -->
<div class="mainContent">

	<!-- 좌측 고정메뉴 -->
	<div class="leftMenu">
		<div class="groupMain_side">
		<c:import url="GroupSideBar.jsp"></c:import>
		</div>
	</div>
	
	<!-- 중앙 주요 컨텐츠 영역 -->
	<div class="centerContent">
	
		<!-- 게시판 정보 영역 -->
		<div class="board-info">
		
			<div class="board-title">[ <span class="group-name">${groupDTO.cg_name }</span> ] 히스토리</div>
			<!-- <div class="count-article">새글 <span id="new-article">23</span> / <span id="total-article">500</span></div> -->
		</div>
		
		<!-- 게시글 검색 영역 -->
		<div class="content-search">
			<form action="" class="search-form">
				<select name="searchCategory" id="" class="search-category">
					<option value="">제목</option>
					<option value="">작성자</option>
					<option value="">내용</option>
				</select>
				<input type="text" name="searchContent" class="search-bar" />
				<button type="submit" class="btn-search"><i class="bi bi-search"></i></button>
			</form>
		</div>
		
		<div class="content-list-div">
			
			<!-- 게시글 목록 영역 -->
			<div class="content-list">
				<c:forEach items="<%=meetingList %>" var="meeting">
				<c:if test="${meeting.mt_status == 2 }">
				<div class="meeting">
					<div class="meeting-category">${fn:substring(meeting.mc_name, 0, 2)}</div>
					<div class="meeting-element">
						<div class="meeting-title" role="button" onclick="goMeetingArticle(${meeting.mt_code})">
						<c:choose>
						<c:when test="${fn:length(meeting.mt_title) >= 10 }">
						${fn:substring(meeting.mt_title, 0, 9) } ···
						</c:when>
						<c:otherwise>
						${meeting.mt_title }
						</c:otherwise>
						</c:choose>
						</div>
						<div class="meeting-writer">${meeting.gm_nickname }</div>
						<div class="meeting-date">${meeting.mt_meet }</div>
						<div class="meeting-city">${meeting.rg_name } ${meeting.ct_name }</div>
						<c:if test="${attendStatus[meeting.mt_code] != null }">
						<button type="button" class="article-button history-insert" value="${attendStatus[meeting.mt_code] }">후기 작성하기</button>
						</c:if>
					</div>
					<div class="article-list">
						<c:choose>
						<c:when test="${fn:length(historyList[meeting.mt_code]) <= 0 }">
							<div class="none-history">작성된 모임 후기가 존재하지 않습니다.</div>
						</c:when>
						<c:otherwise>
						<c:forEach items="${historyList[meeting.mt_code] }" var="history">
						<div class="article" role="button" onclick="goHistoryArticle(${history.his_code}, ${meeting.mt_code })">${history.gm_nickname }님이 작성한 후기입니다.</div>
						</c:forEach>
						</c:otherwise>
						</c:choose>
					</div>
				</div>
				</c:if>
				</c:forEach>
			</div>
		</div><!-- .content-list-div -->
		
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
		
	</div><!-- .centerContent -->
	
	<!-- 우측 고정메뉴 영역 -->
	<div class="rightMenu"></div>
</div>

<!-- 푸터 영역 -->
<div class="footer">
<c:import url="MemberFooter.jsp"></c:import>
</div>

</body>
</html>