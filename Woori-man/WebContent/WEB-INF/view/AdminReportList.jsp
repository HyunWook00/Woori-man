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
	
	.category,#report_status  {background-color: #4367ad; color: white; border-radius: 20px; border: none; text-align: center; font-weight: bold;}
	
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
	
	#title {cursor: pointer;}
	
</style>

<script type="text/javascript">

	/* $(function()
	{	
		var report_code = $("#report_code").html();
		var ad_code = $("#ad_code").html();
		
		$("#title").click(function()
		{
			$(location).attr("href", "adminreportarticle.woori?report_code=" + report_code + "&ad_code=" + ad_code);
		});
	}); */
	
	// 리스트 처리상태(접수완료/관리자검토중/처리완료)별 분기
    function statusFilter() 
    {
    	
        var report_status = $("#report_status").val();        
        //var count = $("#count").val();
        //$(location).attr("href", "inquirystatuslist.action?status=" + status + "&count=" + count);
        $(location).attr("href", "adminreportstatuslist.woori?report_status=" + report_status);
        
    }
    
    $(document).ready(function() 
	{	
     	// 이전에 저장된 IQ 상태 값을 가져옴
        var savedStatus = localStorage.getItem("savedStatus");
        if (savedStatus) 
        {
        	// 이전에 저장된 IQ 상태가 있으면 해당 값을 #iq_status 요소의 값으로 설정
            $("#report_status").val(savedStatus);
        }
        
     	// #iq_status 요소의 값이 변경될 때마다 실행될 함수
        $("#report_status").change(function() 
   		{
        	// 변경된 IQ 상태 값을 로컬 스토리지에 저장
            localStorage.setItem("savedStatus", $(this).val());
        });
     	
     	
    });

</script>

</head>
<body>

<div class="header">
	<c:import url="AdminHeader.jsp"></c:import>
</div>

<div class="container">

<h1>신고내역</h1><hr>
<div class="list_result">
    <p class="result_count">
   	    <span id="count">${count }</span>건
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
	    <button class="nav-link" id="nav-board-tab" data-bs-toggle="tab" data-bs-target="#boardReport" 
	    type="button" role="tab" aria-controls="boardReport" aria-selected="false">자유게시판</button>
	    <button class="nav-link" id="nav-meeting-tab" data-bs-toggle="tab" data-bs-target="#meetingReport" 
	    type="button" role="tab" aria-controls="meetingReport" aria-selected="false">모임</button>
	    <button class="nav-link" id="nav-history-tab" data-bs-toggle="tab" data-bs-target="#historyReport" 
	    type="button" role="tab" aria-controls="historyReport" aria-selected="false">히스토리</button>	    
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
	            <th scope="col">제목</th>
	            <th scope="col">신고자</th>
	            <th scope="col">신고일</th>
	            <th scope="col">담당자</th>
	            <th scope="col">
					<select class="report_status" id="report_status" onchange="statusFilter()">
					    <option>처리상태</option>
					    <option value="" >전체</option>
					    <option value="1">접수완료</option>
					    <option value="2">관리자 검토중</option>
					    <option value="3">처리완료</option>	
					</select>
				</th>
	        </tr>
		</thead>
		
		<tbody class="tab-pane fade in active" id="allReport" role="tabpanel" aria-labelledby="nav-all-tab">
			<c:forEach var="all" items="${Report }" >
			<c:set var="n" value="${n+1 }"></c:set>
				<tr>
					<td>${n }</td>
					<%-- <td>${report.report_type }</td> --%>
					<!-- 만약에 reportType 이라는 HashMap 객체를 넘겨주었다 치고 -->
					<td>${reportType[all.report_type] }</td>
					<td><a href="adminreportarticle.woori?report_code=${all.report_code }
					&ad_code=${all.ad_code }&report_type=${all.report_type }">${all.report_title }</a></td>
					<td>${all.us_code1 }</td>
					<td>${all.report_date }</td>
					<td>${all.ad_code }</td>
					<c:choose>
						<c:when test="${all.report_status==1 }">
							<td><span class="badge bg-danger">접수완료</span></td>
						</c:when>
						<c:when test="${all.report_status==2 }">
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
				<tr>
					<td>${i }</td>
					<td>${reportType[group.report_type] }</td>
					<td><a href="adminreportarticle.woori?report_code=${group.report_code }
					&ad_code=${group.ad_code }&report_type=${group.report_type }">${group.report_title }</a></td>
					<td>${group.us_code1 }</td>
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
					<td><a href="adminreportarticle.woori?report_code=${board.report_code }
					&ad_code=${board.ad_code }&report_type=${board.report_type }">${board.report_title }</a></td>
					<td>${board.us_code1 }</td>
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
					<td><a href="adminreportarticle.woori?report_code=${meeting.report_code }
					&ad_code=${meeting.ad_code }&report_type=${meeting.report_type }">${meeting.report_title }</a></td>
					<td>${meeting.us_code1 }</td>
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
					<td><a href="adminreportarticle.woori?report_code=${history.report_code }
					&ad_code=${history.ad_code }&report_type=${history.report_type }">${history.report_title }</a></td>
					<td>${history.us_code1 }</td>
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