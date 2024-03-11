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
<title>AdminInquiryList.jsp</title>

<!-- 부트스트랩 적용 CSS -->
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">

<!-- 부트스트랩 관련 스크립트 적용 JS -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- 부트스트랩 아이콘 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

<!-- 제이쿼리 적용 JS -->
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>

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
	
	.category, .iq_status {background-color: #4367ad; color: white; border-radius: 20px; border: none; text-align: center; font-weight: bold;}
	
	
	a {color: black; text-decoration: none; }
	
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
		background-color: #f3f3f1;
	}
	
	
	
</style>


<script type="text/javascript">

	// 리스트 카테고리별 분기
	function categoryFilter()
	{
		var category = $("#category").val();
		$(location).attr("href", "admininquirycategorylist.woori?category=" + category);
	}

	// 리스트 처리상태(접수완료/관리자검토중/처리완료)별 분기
    function statusFilter() 
    {
    	
        var iq_status = $("#iq_status").val();        
        //var count = $("#count").val();
        //$(location).attr("href", "inquirystatuslist.action?status=" + status + "&count=" + count);
        $(location).attr("href", "admininquirystatuslist.woori?iq_status=" + iq_status);
        
    }
    
    $(document).ready(function() 
	{	
    	// 이전에 저장된 카테고리 값을 가져옴
        var savedCategory = localStorage.getItem("savedCategory");
        if (savedCategory) 
        {
        	// 이전에 저장된 카테고리가 있으면 해당 값을 #category 요소의 값으로 설정
            $("#category").val(savedCategory);
        }
		
        // #category 요소의 값이 변경될 때마다 실행될 함수
        $("#category").change(function() 
  		{
        	// 변경된 카테고리 값을 로컬 스토리지에 저장
            localStorage.setItem("savedCategory", $(this).val());
        });

     	// 이전에 저장된 IQ 상태 값을 가져옴
        var savedStatus = localStorage.getItem("savedStatus");
        if (savedStatus) 
        {
        	// 이전에 저장된 IQ 상태가 있으면 해당 값을 #iq_status 요소의 값으로 설정
            $("#iq_status").val(savedStatus);
        }
        
     	// #iq_status 요소의 값이 변경될 때마다 실행될 함수
        $("#iq_status").change(function() 
   		{
        	// 변경된 IQ 상태 값을 로컬 스토리지에 저장
            localStorage.setItem("savedStatus", $(this).val());
        });
    });
</script>



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

<h1>문의사항</h1><hr>
<div class="list_result">
	<!-- 게시물 갯수 -->
    <p class="result_count">
   	    <span id="count">${count }</span>건
    </p>
    
    <!-- 검색창 -->
    <div class="inquiry_category">
	    <form action="" class="searchForm">
           <input type="text" class="search_input" id="search_input" name="search_input">
           <button type="submit" class="search_btn" id="search_btn" name="search_btn"><i class="bi bi-search"></i></button> 
	   </form>
   </div>
   
</div>
<!-- 리스트 -->
<div class="tbl_col_wrap">
	<table class="tbl_col_line">
		<colgroup>
	        <col style="width: 75px" />
	        <col style="width: 100px" />
	        <col style="width: 200px;" />
	        <col style="width: 125px;" />
	        <col style="width: 125px;" />
	        <col style="width: 125px;" />
	        <col style="width: 125px;" />
		</colgroup>
		<thead>
		    <tr>
	            <th scope="col">NO</th>
	            <th scope="col">
					<select class="category" id="category" onchange="categoryFilter()">
		               <option value="">문의유형(전체)</option>
		               <!-- 
		               <option value="" >전체</option>
		               <option value="1">로그인</option>
		               <option value="2">그룹</option>
		               <option value="3">모임</option>
		               <option value="4">기타</option> -->
		               <c:forEach var="category" items="${inquiryCategory }">
		               <option value="${category.iqc_code }">${category.iqc_name }</option>
		               </c:forEach>
		               
		            </select>
				</th>
	            <th scope="col">제목</th>
	            <th scope="col">문의자</th>
	            <th scope="col">문의일</th>
	            <th scope="col">담당자</th>
	            <th scope="col">
					<select class="iq_status" id="iq_status" onchange="statusFilter()">
					    <option>처리상태</option>
					    <option value="" >전체</option>
					    <option value="1">접수완료</option>
					    <option value="2">관리자 검토중</option>
					    <option value="3">처리완료</option>	
					</select>
				</th>
	        </tr>
		</thead>
		<tbody>
			<c:forEach var="inquiry" items="${inquiryList }">
			<c:set var="i" value="${i+1 }"></c:set>
			<tr>
				<td>${i }</td>
				<td>${inquiry.iqc_name }</td>
				<td><a href="admininquiryarticle.woori?iq_code=${inquiry.iq_code }&ad_code=${inquiry.ad_code }">${inquiry.iq_title }</a></td>
				<td>${inquiry.us_id }</td>
				<td>${inquiry.iq_date }</td>
				<td>${inquiry.ad_code== 0 ? "" : inquiry.ad_code }</td>				
				<c:choose>
					<c:when test="${inquiry.iq_status==1 }">
						<td><span class="badge bg-danger">접수완료</span></td>
					</c:when>
					<c:when test="${inquiry.iq_status==2 }">
						<td><span class="badge bg-primary">관리자 검토중</span></td>
					</c:when>
					<c:otherwise>
						<td><span class="badge bg-secondary">처리완료</span></td>
					</c:otherwise>
				</c:choose>
			</tr>
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