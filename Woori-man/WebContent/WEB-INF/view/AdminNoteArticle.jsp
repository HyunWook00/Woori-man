<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>쪽지 보내기</title>
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
		
		body {font-family: 라인Seed;}
    
        .container {
            margin-top: 50px;
            width: 1140px;
        }
        .card {
            border-radius: 15px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .card-header {
            background-color: #4367ad;
            color: white;
            border-radius: 15px 15px 0 0;
        }
        .card-body {
            padding: 20px;
        }
        .recipient-list {
            max-height: 200px;
            overflow-y: auto;
        }
        
        .list-btn,
        .submit-btn {
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
        .submit-btn:hover {
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
        
        .submit-btn {margin-left: 10px;}
        .list-btn {margin-right: 10px;}
        
        #searchRecipient {width: 50%;}
        
        .bi-search {
        	border: none;
            font-size: 12pt;
            background-color: #4367ad;
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }
        
        .bi-search:hover {background-color: #395791;}
        
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
    <div class="card">
        <div class="card-header">
            <h1 class="card-title justify-contetn-center">쪽지</h1>
        </div>
        <div class="card-body">
            <form action="#" method="post">
                <div class="mb-3">
                    <label for="searchRecipient" class="form-label">수신자 : 전체회원</label>
                    <!-- <div class="input-group col-md-6">
				        <input type="text" class="form-control" id="searchRecipient" placeholder="수신자를 검색하세요">
				        <button type="button" class="btn bi bi-search"></button>
				    </div>
                    <div class="recipient-list mt-2 row">
                        <div class="col-md-3">
					        <div class="form-check">
					            <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault1">
					            <label class="form-check-label" for="flexCheckDefault1">전체회원</label>
					        </div>
						    </div>
						    <div class="col-md-3">
						        <div class="form-check">
						            <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault2">
						            <label class="form-check-label" for="flexCheckDefault2">그룹장만</label>
						        </div>
						    </div>
						    <div class="col-md-3">
						        <div class="form-check">
						            <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault3">
						            <label class="form-check-label" for="flexCheckDefault3">총무만</label>
						        </div>
						    </div>
						    <div class="col-md-3">
						        <div class="form-check">
						            <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault4">
						            <label class="form-check-label" for="flexCheckDefault4">??</label>
						        </div>
						    </div>
                    </div> -->
                </div>
                <div class="mb-3">
                    <label for="subject" class="form-label">제목</label>
                    <input type="text" class="form-control" id="an_title" name="an_title"
                    value="${adminNoteArticle.an_title }" readonly="readonly" style="border: none;">
                </div>
                <div class="mb-3">
                    <label for="an_content" class="form-label">내용</label>
                    <textarea class="form-control" id="an_content" name="an_content" rows="5" 
                    readonly="readonly" style="border: none;">${adminNoteArticle.an_content }</textarea>
                </div>
                
                <div class="btns">
					<button type="button" class="list-btn" onclick="location.href='adminnotelist.woori'">목록으로</button>					
				</div>
            </form>
        </div>
    </div>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

