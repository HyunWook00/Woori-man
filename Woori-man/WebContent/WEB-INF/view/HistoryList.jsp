<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>히스토리 게시판 - 우리만</title>
<link rel="stylesheet" href="<%=cp %>/css/footer.css" />
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/articleList.css" />
<style type="text/css">

	div.board-info {font-family: 라인Seed;}
	
	div.content-column
	{
		font-size: 12pt; font-weight: bold; font-family: 라인Seed; border-bottom: 1px solid #ff8000;
		border-top: 1px solid #ff8000; display: flex; justify-content: space-between; text-align: center;
	}
	.content-column-name {padding: 5px 0px;}
	.content-column-name, .article {display: inline-block; padding: 5px 0px;}
	div.content-search {margin-bottom: 10px; text-align: right;}
	button.btn-search {background-color: #ff8000; border-radius: 30px; width: 50px; border: none;}
	button.btn-search:hover {background-color: #FF6F0F;}
	
	i.bi-search {color: white; font-size: 12pt;}
	.search-bar {height: 25px;}
	
	div.meeting 
	{
		border: 1px solid #ddd; display: inline-flex;
    	flex-direction: row; align-items: flex-start; width: 500px;
    	justify-content: flex-start; margin: 5px 20px; max-height: 160px;
	}
	div.meeting-info {display: inline-block; width: 48%;}
	div.article-list {display: flex; flex-direction: column; width: 48%;}
	
	div.article {border-bottom: 1px solid #ddd; font-size: 10.5pt;}
	div.article-element {display: inline-block; font-size: 11pt;}
	div.article-number.article-element {font-size: small; color: gray;}
	
	.content-column-name, .article-element {margin: 2px 5px;}
	.article-number, .view-count, .like-count {width: 80px;}
	.article-title {width: 450px;}
	.write-user {width: 100px;}
	.write-date {width: 120px;}
	
	@media screen and (max-width: 768px)
	{
		.container {max-width: 720px; width: 720px;}
	}
	
	.article:hover {background-color: #fff2ea;}
	.meeting-element {padding: 10px 20px; border-right: 1px solid #ddd; margin-right: 10px; width: 220px;}
	.meeting-category {padding: 4px 2px; background-color: #ff8000; color: white; font-family: '라인SEED'; width: 25px; font-size: 10pt;}
	.meeting-title { border-bottom: 1px solid #ff8000; margin: 10px 0px; padding: 0px 10px; font-size: 11pt;}
	.meeting-date,.meeting-city {font-size: 10pt; background-color: #eee; border-radius: 5px; padding: 2px 5px; margin: 5px;}
	.meeting-writer {font-family: '라인Seed'; margin: 5px;}
	.none-history {font-size: 10pt; color: #aaa; padding: 50px 0%;}
	
	@media screen and (max-width: 1060px)
	{
		.content-list {display: flex; flex-direction: column;}
	}
</style>
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
	이런메뉴... 저런메뉴... 조런메뉴...
</div>

<!-- 주요 콘텐츠 영역 -->
<div class="mainContent">

	<!-- 좌측 고정메뉴 -->
	<div class="leftMenu">
		여기 좌측 메뉴가 들어갑ㄴ미다
	</div>
	
	<!-- 중앙 주요 컨텐츠 영역 -->
	<div class="centerContent">
	
		<!-- 게시판 정보 영역 -->
		<div class="board-info">
		
			<div class="board-title">[ <span class="group-name">약속해조</span> ] 히스토리</div>
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
				<c:forEach items="${meetingList }" var="meeting">
				<c:if test="${meeting.mt_status != 4 }">
				<div class="meeting">
					<div class="meeting-category">${fn:substring(meeting.mc_name, 0, 2)}</div>
					<div class="meeting-element" role="button" onclick="goMeetingArticle(${meeting.mt_code})">
						<div class="meeting-title">
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
		
		<!-- 페이징 처리 영억 -->
		<div class="paging" align="center">
			1 2 3 ... 9
		</div>
		
	</div>
	
	<!-- 우측 고정메뉴 영역 -->
	<div class="rightMenu"></div>
</div>

<!-- 푸터 영역 -->
<div class="footer">
<c:import url="MemberFooter.jsp"></c:import>
</div>

</body>
</html>