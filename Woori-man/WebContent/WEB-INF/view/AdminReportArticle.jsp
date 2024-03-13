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
<title>AdminInquiryArticle.jsp</title>

<!-- 부트스트랩 적용 CSS -->
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">

<!-- 제이쿼리 적용 JS -->
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>

<!-- 부트스트랩 관련 스크립트 적용 JS -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- 부트스트랩 아이콘 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

<link rel="stylesheet" type="text/css" href="<%=cp%>/css/adminHeader.css">

    <style>
    	@font-face 
	    {
		    font-family: '라인Seed';
		    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/LINESeedKR-Bd.woff2') format('woff2');
		    font-weight: 700;
		    font-style: normal;
		}
    
        th {
            font-family: '라인Seed';
        }
        
        h1 {
            color: #4367ad;
            font-weight: bold;
            text-align: center;
            margin-top: 30px;
        }
        
        .container {
            margin-top: 30px;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        
        .table-wrap {
            margin-top: 50px;
        }
        
        table {
            width: 100%;
            border-collapse: collapse;
            border: 1px solid #dee2e6;
            font-size: 15pt;
        }
        
        
        th, td {
            border: 1px solid #dee2e6;
            padding: 8px;
            text-align: center;
        }
        
        .tbl-Report th,
		.tbl-answer th {
		    width: 30%;
		    font-weight: bold;
		}
		
		th {background-color: #f8f9fa;}
        
        .list-btn,
        .result-btn {
            border: none;
            font-size: 15pt;
            background-color: #4367ad;
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }
        
        .list-btn:hover,
        .result-btn:hover {
            background-color: #395791;
        }
       
        
        .btns {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }
        
        @media (max-width: 576px) {
            .btns {
                flex-direction: column;
            }
        }
        
        .result-btn {margin-left: 10px;}
        .list-btn {margin-right: 10px;}
        
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
	<div class="table-wrap">
	<table class="tbl-Report">
            <tr>
	            <th>신고자</th>
	            <td>${reportArticle.us_code1 }</td>
            </tr>
            <tr>
	            <th>신고일</th>
	            <td>${reportArticle.report_date }</td>
	        </tr>
            <tr>
	            <th>신고내용</th>
	            <td>제목 : ${reportArticle.report_title }<br>
	            	내용 : ${reportArticle.report_content }<br>
	            	날짜 : ${reportArticle.write_date }<br>
	            	작성자 : ${reportArticle.us_code2 }</td>
	        </tr>
	        <tr><th>신고 처리 결과</th>
            <td>
            	${reportArticle.rr_status  }
			</td>
            <tr class="admin-info">
            	<td colspan="2" style="text-align: right;">담당자: ${reportArticle.ad_code==0 ? "" : reportArticle.ad_code } 답변일 : ${reportArticle.report_process }</td>
        	</tr>
	        </tr>
	</table>
	</div>
	
	<div class="btns">
		<button type="button" class="list-btn" onclick="location.href='adminreportlist.woori'">목록으로</button>
		<button type="button" class="result-btn" onclick="location.href='adminreportresultform.woori?report_code=${reportArticle.report_code}&report_type=${reportArticle.report_type }'">신고처리</button>
	</div>
	
	
</div>


<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>