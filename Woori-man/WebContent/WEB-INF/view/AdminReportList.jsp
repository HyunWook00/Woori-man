<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AdminReportList.jsp</title>

<!-- 부트스트랩 적용 CSS -->
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">

<!-- 제이쿼리 적용 JS -->
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>

<!-- 부트스트랩 관련 스크립트 적용 JS -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- 부트스트랩 아이콘 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

<link rel="stylesheet" type="text/css" href="<%=cp%>/css/adminHeader.css">

<style type="text/css">
	

    body 
    {
	    font-family: '라인Seed';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/LINESeedKR-Bd.woff2') format('woff2');
	    font-weight: 700;
	    font-style: normal;
	}
	.result_count {font-size: 30pt;}
	.search_input
	{
		border-radius: 20px;
		font-size: 20pt;
	}
	.list_result
	{
		display: flex;
		justify-content: space-between;
		align-items: center;
	}
	p
	{
		margin-block-start: 1em;
	    margin-block-end: 1em;
	    margin-inline-start: 0px;
	    margin-inline-end: 0px;
	}

	#count{color: #4367ad;}
	
	h1{color: #4367ad; font-weight: bold; text-align: center; margin-top: 30px;}
	
    
    .container {
        margin-top: 30px; 
    }
    
    h1 {
        color: #4367ad; 
        font-weight: bold; 
        text-align: center; 
    }
    
    table {
        width: 100%; 
        background-color: #fff; 
        border-collapse: collapse; 
    }
    
    th, td {
	    padding: 10px; 
	    text-align: center; 
	    border-left: none;
	    border-right: none; 
	    border-top: 1px solid #4367ad; 
	    border-bottom: 1px solid #4367ad;
	    height: 80px;
	}	
    
    th {
        background-color: #4367ad; 
        color: white; 
        font-size: 15pt;
    }
    
	.badge {font-size: 12pt;}
	
	.search_btn {background-color: #4367ad; color: white; border-radius: 20px; border: none;}
	
	.category {background-color: #4367ad; color: white; border-radius: 20px; border: none; text-align: center; font-weight: bold;}
	
	a {color: black; text-decoration: none; }
	
	.nav-link
    {
   		color: black;
    }
    
   .tab-content>.active {
    display: contents;
	}

	div.paging
	{ margin-top: 50px;}
	
	nav.page-nav
	{
	   display: flex;
	    justify-content: space-around;
	    align-items: baseline;
	}
	
	ul.page-list
	{
	   display: flex;
	    justify-content: space-between;
	    list-style: none;
	}
	
	a.page-control
	{
	   padding: 3.5px 6px;
	   border: 1px solid #b5b5b5;
	   margin: 4px;
	   text-decoration: none;
	   color: #363636;
	   font-size: 10pt;
	   border-radius: 4px;
	   display: inline-flex;
	}
	
	a.page-control:hover
	{
	   background-color: #395791;
	   border: 1px solid #395791;
	}
	
	a.page-control.now-page
	{
	   background-color: #4367ad;
	   border: 1px solid #4367ad;
	   color: white;
	   font-weight: bold;
	}

	tr:hover
	{
		background: #f3f3f1;
	}
	
	
	
</style>



</head>
<body>

<div class="header-menu row">

	<nav class="navbar">
		<ul class="nav justify-content-center">
		
			<!-- 관리자 계정관리 메뉴 -->
			<li class="nav-item">
				<div class="icon"><a href=""><i class="bi bi-person-badge"></i><span class="menu-title">관리자 계정관리</span></a></div>
				<div class="hover-text">관리자 계정관리</div>
			</li>
			
			<!-- 회원 계정관리 메뉴 -->
			<li class="nav-item">
				<div class="icon"><a href=""><i class="bi bi-people-fill"></i><span class="menu-title">회원 계정관리</span></a></div>
				<div class="hover-text">회원 계정관리</div>
			</li>
			
			<!-- 플랫폼 로고 -->
			<li class="nav-item">
				<div class="icon"><a href=""><i class="bi bi-house-fill"></i><span class="menu-title">우리만 Admin</span></a></div>
				<div class="hover-text">관리자 메인으로 이동</div>
			</li>
			
			<!-- 신고내역 관리 메뉴 -->
			<li class="nav-item">
				<div class="icon"><a href=""><i class="bi bi-shield-fill-exclamation"></i><span class="menu-title">신고내역 관리</span></a></div>
				<div class="hover-text">신고내역 관리</div>
			</li>
			
			<!-- 공지사항 관리 메뉴 -->
			<li class="nav-item">
				<div class="icon"><a href=""><i class="bi bi-card-text"></i><span class="menu-title">공지사항 관리</span></a></div>
				<div class="hover-text">공지사항 관리</div>
			</li>
			
			<!-- 문의사항 관리 메뉴 -->
			<li class="nav-item">
				<div class="icon"><a href=""><i class="bi bi-question-octagon-fill"></i><span class="menu-title">문의사항 관리</span></a></div>
				<div class="hover-text">문의사항 관리</div>
			</li>
			
			<!-- 로그아웃 버튼 -->
			<li class="nav-item">
				<div class="icon"><a href=""><i class="bi bi-unlock-fill"></i><span class="menu-title">로그아웃</span></a></div>
				<div class="hover-text">로그아웃</div>
			</li>
		</ul>
	</nav>
</div>

<div class="container">

<h1>신고내역</h1><hr>
<div class="list_result">
    <p class="result_count">
   	    <span id="count">10</span>건
    </p>
    <div class="right_area">
       <div class="inquiry_category">
           <input type="text" class="search_input" id="search_input">
           <button type="button" class="search_btn" id="search_btn"><i class="bi bi-search"></i></button> 
       </div>
   </div>
</div>

<!-- 신고 유형별 분류 탭 -->
<nav class="nav nav-tabs reporttab" role="tablist">
 			<div class="nav nav-tabs" id="nav-tab" role="tablist">
	    <button class="nav-link active" id="nav-all-tab" data-bs-toggle="tab" data-bs-target="#allReport" 
	    type="button" role="tab" aria-controls="allReport" aria-selected="true">전체</button>
	    <button class="nav-link" id="nav-group-tab" data-bs-toggle="tab" data-bs-target="#groupReport" 
	    type="button" role="tab" aria-controls="groupReport" aria-selected="false">그룹</button>
	    <button class="nav-link" id="nav-meeting-tab" data-bs-toggle="tab" data-bs-target="#meetingReport" 
	    type="button" role="tab" aria-controls="meetingReport" aria-selected="false">모임</button>
	    <button class="nav-link" id="nav-history-tab" data-bs-toggle="tab" data-bs-target="#historyReport" 
	    type="button" role="tab" aria-controls="historyReport" aria-selected="false">히스토리</button>
	    <button class="nav-link" id="nav-board-tab" data-bs-toggle="tab" data-bs-target="#boardReport" 
	    type="button" role="tab" aria-controls="boardReport" aria-selected="false">자유게시판</button>
	</div>
</nav>

<div class="tbl_col_wrap">
	<table class="tbl_col_line tab-content">
		<colgroup>
	        <col/>
	        <col/>
	        <col/>
	        <col/>
	        <col/>
	        <col/>
		</colgroup>
		<thead>
		    <tr>
	            <th scope="col">NO</th>
	            <th scope="col">신고콘텐츠</th>
	            <th scope="col">신고자</th>
	            <th scope="col">신고일</th>
	            <th scope="col">담당자</th>
	            <th scope="col">
					<select class="category">
		               <option selected="selected">처리상태</option>
		               <option>접수완료</option>
		               <option>검토중</option>
		               <option>처리완료</option>
		            </select>
				</th>
	        </tr>
		</thead>
		
		<tbody class="tab-pane fade in active" id="allReport" role="tabpanel" aria-labelledby="nav-all-tab">
			<c:forEach var="report" items="${Report }" >
			<c:set var="n" value="${n+1 }"></c:set>
				<tr onclick="location.href='adminreportarticle.woori'">
					<td>${n }</td>
					<%-- <td>${report.report_type }</td> --%>
					<!-- 만약에 reportType 이라는 HashMap 객체를 넘겨주었다 치고 -->
					<td>${reportType[report.report_type] }</td>
					<td>${report.gm_code }</td>
					<td>${report.report_date }</td>
					<td>${report.ad_code }</td>
					<c:choose>
						<c:when test="${report.report_status==1 }">
							<td><span class="badge bg-danger">접수완료</span></td>
						</c:when>
						<c:when test="${report.report_status==2 }">
							<td><span class="badge bg-primary">검토중</span></td>
						</c:when>
						<c:otherwise>
							<td><span class="badge bg-secondary">처리완료</span></td>
						</c:otherwise>
					</c:choose>
				</tr>
			</c:forEach>
		</tbody>
		
		<tbody class="tab-pane fade" id="groupReport" role="tabpanel" aria-labelledby="nav-group-tab">
			<c:forEach var="group" items="${Report }" >
			<c:if test="${group.report_type == '1' }">
			<c:set var="i" value="${i+1 }"></c:set>
				<tr onclick="location.href='adminreportarticle.woori'">
					<td>${i }</td>
					<td>${reportType[group.report_type] }</td>
					<td>${group.gm_code }</td>
					<td>${group.report_date }</td>
					<td>${group.ad_code }</td>
					<c:choose>
						<c:when test="${group.report_status==1 }">
							<td><span class="badge bg-danger">접수완료</span></td>
						</c:when>
						<c:when test="${group.report_status==2 }">
							<td><span class="badge bg-primary">검토중</span></td>
						</c:when>
						<c:otherwise>
							<td><span class="badge bg-secondary">처리완료</span></td>
						</c:otherwise>
					</c:choose>
				</tr>
				</c:if>
			</c:forEach>
		</tbody>
		
		<tbody class="tab-pane fade" id="boardReport" role="tabpanel" aria-labelledby="nav-board-tab">
			<c:forEach var="board" items="${Report }" >
			<c:if test="${board.report_type == '2' || board.report_type == '3' || board.report_type == '4' }">
			<c:set var="j" value="${j+1 }"></c:set>
				<tr>
					<td>${j }</td>
					<td>${reportType[board.report_type] }</td>
					<td>${board.gm_code }</td>
					<td>${board.report_date }</td>
					<td>${board.ad_code }</td>
					<c:choose>
						<c:when test="${board.report_status==1 }">
							<td><span class="badge bg-danger">접수완료</span></td>
						</c:when>
						<c:when test="${board.report_status==2 }">
							<td><span class="badge bg-primary">검토중</span></td>
						</c:when>
						<c:otherwise>
							<td><span class="badge bg-secondary">처리완료</span></td>
						</c:otherwise>
					</c:choose>
				</tr>
				</c:if>
			</c:forEach>
		</tbody>
		
		<tbody class="tab-pane fade" id="meetingReport" role="tabpanel" aria-labelledby="nav-meeting-tab">
			<c:forEach var="meeting" items="${Report }" >
			<c:if test="${meeting.report_type == '5' || meeting.report_type == '6' || meeting.report_type == '7' }">
			<c:set var="k" value="${k+1 }"></c:set>
				<tr>
					<td>${k }</td>
					<td>${reportType[meeting.report_type] }</td>
					<td>${meeting.gm_code }</td>
					<td>${meeting.report_date }</td>
					<td>${meeting.ad_code }</td>
					
					<c:choose>
						<c:when test="${meeting.report_status==1 }">
							<td><span class="badge bg-danger">접수완료</span></td>
						</c:when>
						<c:when test="${meeting.report_status==2 }">
							<td><span class="badge bg-primary">검토중</span></td>
						</c:when>
						<c:otherwise>
							<td><span class="badge bg-secondary">처리완료</span></td>
						</c:otherwise>
					</c:choose>
					
				</tr>
				</c:if>
			</c:forEach>
		</tbody>
		
		<tbody class="tab-pane fade" id="historyReport" role="tabpanel" aria-labelledby="nav-history-tab">
			<c:forEach var="history" items="${Report }" >
			<c:if test="${history.report_type == '8' || history.report_type == '9' || history.report_type == '10' }">
			<c:set var="l" value="${l+1 }"></c:set>
				<tr>
					<td>${l }</td>
					<td>${reportType[history.report_type] }</td>
					<td>${history.gm_code }</td>
					<td>${history.report_date }</td>
					<td>${history.ad_code }</td>
					<c:choose>
						<c:when test="${history.report_status==1 }">
							<td><span class="badge bg-danger">접수완료</span></td>
						</c:when>
						<c:when test="${history.report_status==2 }">
							<td><span class="badge bg-primary">검토중</span></td>
						</c:when>
						<c:otherwise>
							<td><span class="badge bg-secondary">처리완료</span></td>
						</c:otherwise>
					</c:choose>
				</tr>
				</c:if>
			</c:forEach>
		</tbody>
		
	</table>
	
	<!-- 페이징 처리 영억 -->
      <div class="paging" align="center">
         <nav class="page-nav">
            <a href="" class="page-control pre-page">이전 페이지</a>
            <ul class="page-list">
               <li>
                  <a href="" class="page-control first-page-control">1</a>
               </li>
               <li><a href="" class="page-control pre-page">...</a></li>
               <li><a href="" class="page-control">11</a></li>
               <li><a href="" class="page-control">12</a></li>
               <li><a href="" class="page-control">13</a></li>
               <li><a href="" class="page-control">14</a></li>
               <li><a href="" class="page-control now-page">15</a></li>
               <li><a href="" class="page-control">16</a></li>
               <li><a href="" class="page-control">17</a></li>
               <li><a href="" class="page-control">18</a></li>
               <li><a href="" class="page-control">19</a></li>
               <li><a href="" class="page-control">20</a></li>
               <li><a href="" class="page-control next-page">...</a></li>
               <li>
                  <a href="" class="page-control last-page-control">68</a>
               </li>
            </ul>
            <a href="" class="page-control next-page">다음 페이지</a>
         </nav>
      </div>
	
</div>

</div>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>