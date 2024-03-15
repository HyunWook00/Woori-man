<%@page import="com.woori.dto.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
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
	//2024-03-04 노은하
	// 페이징
	String strNum = request.getParameter("num");
	int num=0;
	if(strNum!=null)
		num = Integer.parseInt(strNum);
	
	String pageNum = request.getParameter("pageNum");
	int currentPage = 1;
	if(pageNum != null)
		currentPage = Integer.parseInt(pageNum);
	
	String searchKey = request.getParameter("searchKey");
	String searchValue = request.getParameter("searchValue");
	
	if(searchKey != null)
	{
		if(request.getMethod().equalsIgnoreCase("GET"))
			// 디코딩 처리
			searchValue = URLDecoder.decode(searchValue, "UTF-8");
	}
	else
	{
		searchKey = "title";
		searchValue = "";
	}
	
	PagingUtil myUtil = new PagingUtil();
	
	ArrayList<BoardDTO> lists = (ArrayList<BoardDTO>)request.getAttribute("boardList");
	int dataCount = lists.size();
	
	int numPerPage = 10;
	int totalPage = myUtil.getPageCount(numPerPage, dataCount);
	
	if(currentPage > totalPage)
		currentPage = totalPage;
	
	int start = (currentPage-1) * numPerPage + 1;
	int end = currentPage * numPerPage;
	
	
	String param = "";
	
	if(!searchValue.equals(""))
	{
		param += "?searchKey=" + searchKey;
		param += "&searchValue=" + searchValue;
	}
	
	String listUrl = "/freeboardlist.woori" + param;
	
	String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, listUrl);
	
	// 글 내용 보기 주소
	String articleUrl = cp + "/Article.jsp";
	
	if(param.equals(""))
		articleUrl = articleUrl + "?pageNum=" + currentPage;
	else
		articleUrl = articleUrl + param + "&pageNum=" + currentPage;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FreeBoardList.jsp</title>
<link rel="stylesheet" href="<%=cp %>/css/footer.css" />
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/groupContentCommon.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/articleList.css" />
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<style type="text/css">

	.view-count, .like-count {width: 80px;}
	
	@media screen and (max-width: 768px)
	{
		.container {max-width: 720px; width: 720px;}
	}
	
</style>
</head>
<body>

<!-- 2024-02-18 노은하 -->
<!-- 그룹내 자유게시판 글목록 페이지 -->

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
			<div class="board-title">[ <span class="group-name">${groupDTO.cg_name }</span> ] ${groupDTO.brd_name }</div>
		</div>
		
		<!-- 게시글 검색 영역 -->
		<div class="content-search">
			<div class="count-article">
				새글 <span id="new-article">${newArticle }</span> / <span id="total-article">${fn:length(boardList) }</span>
			</div>
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
			<!-- 게시글 컬럼명 영역 -->
			<div class="content-column">
				<div class="content-column-name article-number">글번호</div>
				<div class="content-column-name article-title">제목</div>
				<div class="content-column-name write-user">작성자</div>
				<div class="content-column-name write-date">작성일</div>
				<div class="content-column-name view-count">조회수</div>
				<div class="content-column-name like-count">좋아요</div>
			</div><!-- div.content-column -->
			
			
			<!-- 게시글 목록 영역 -->
			<div class="content-list">
				<c:forEach var="idx" begin="<%=start-1 %>" end="<%=end-1 %>">
				<div class="article">
					<div class="article-number article-element">${boardList[idx].num }</div>
					<div class="article-title article-element">
						<a href="freeboardarticle.woori?article=${boardList[idx].brd_code }">${boardList[idx].brd_subject }</a>
					</div>
					<div class="write-user article-element">${boardList[idx].gm_nickname }</div>
					<div class="write-date article-element">${boardList[idx].brd_date }</div>
					<div class="view-count article-element">${boardList[idx].brd_view }</div>
					<div class="like-count article-element">${boardList[idx].brd_like }</div>
				</div>
				</c:forEach>
			</div>
		
		</div>
		<div class="button-div">
			<button type="button" class="article-button create-article" onclick="location.href='freeboardinsertform.woori'">글쓰기</button>
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
		
	</div>
	
</div>

<!-- 푸터 영역 -->
<div class="footer">
<c:import url="MemberFooter.jsp"></c:import>
</div>

</body>
</html>