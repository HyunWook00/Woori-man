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
<title>AdminNoteList.jsp</title>

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
	
	.btn-write {border: none;
            font-size: 15pt;
            background-color: #4367ad;
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            transition: background-color 0.3s ease;}
	
        .btn-write:hover {
            background-color: #395791;
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

<h1>쪽지</h1><hr>
<div class="list_result">
    <p class="result_count">
   	    <span id="count">5</span>건
    </p>
    <div class="right_area">
       <div class="inquiry_category">
           <input type="text" class="search_input" id="search_input">
           <button type="button" class="search_btn" id="search_btn"><i class="bi bi-search"></i></button> 
       </div>
   </div>
</div>
<div class="tbl_col_wrap">
	<table class="tbl_col_line">
		<colgroup>
	        <col style="width: 125px" />
	        <col style="width: 600px" />	        
	        <col style="width: 125px;" />
	        <col style="widh: 125px;" />
		</colgroup>
		<thead>
		    <tr>
	            <th scope="col">NO</th>
	            <th scope="col">제목</th>	            
	            <th scope="col">발신자</th>
	            <th scope="col">발신일</th>
	        </tr>
		</thead>
		
		<tbody>		

			<c:forEach var="note" items="${adminNote }">
			<c:set var="i" value="${i+1 }"></c:set>
				<tr>
					<td>${i }</td>
					<td><a href="adminnotearticle.woori?an_code=${note.an_code }">${note.an_title }</a></td>				
					<td>${note.ad_code }</td>
					<td>${note.an_send }</td>
				</tr>
			</c:forEach>
			
			
<!-- 			 -->
			<!-- <tr>
				<td>5</td>
				<td><a href="AdminNoteArticle.jsp">안녕하세요. 관리자입니다.</a></td>
				<td>회원1, 회원2, 회원3, ...</td>
				<td>admin123</td>
				<td>2024-02-15</td>
			</tr>
			<tr>
				<td>4</td>
				<td>안녕하세요. 관리자입니다.</td>
				<td>회원전체</td>
				<td>admin123</td>
				<td>2024-02-15</td>
			</tr>
			<tr>
				<td>3</td>
				<td>안녕하세요. 관리자입니다.</td>
				<td>회원1, 회원2, 회원3, ...</td>
				<td>admin123</td>
				<td>2024-02-15</td>
			</tr>
			<tr>
				<td>2</td>
				<td>안녕하세요. 관리자입니다.</td>
				<td>회원1, 회원2, 회원3, ...</td>
				<td>admin123</td>
				<td>2024-02-15</td>
			</tr>
			<tr>
				<td>1</td>
				<td>안녕하세요. 관리자입니다.</td>
				<td>회원1, 회원2, 회원3, ...</td>
				<td>admin123</td>
				<td>2024-02-15</td>
			</tr> -->
			
		</tbody>
	</table>
	
	<div class="text-end mt-3">
        <button type="button" class="btn-write" onclick="location.href='adminnotewriteform.woori'">작성하기</button>
    </div>
</div>

</div>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>