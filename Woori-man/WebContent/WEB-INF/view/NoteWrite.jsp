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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NoteWrite.jsp</title>
    
    <!-- 부트스트랩 적용 CSS -->
	<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
	
	<!-- 제이쿼리 적용 JS -->
	<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
	
	<!-- 부트스트랩 관련 스크립트 적용 JS -->
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
	
	<!-- 부트스트랩 아이콘 -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
	
	<link rel="stylesheet" href="css/memberHeader.css">
	
	<style type="text/css">
	@font-face {
    font-family: '라인Seed';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/LINESeedKR-Bd.woff2') format('woff2');
    font-weight: 700;
    font-style: normal;
	}
	
	body
	{
		font-family: 라인Seed;
		font-size: 15pt;  
	}
	.card-header
	{
		background-color: #ff8000;
		color: white;
	}
	.list-btn, .submit-btn
	{
		background-color: #ff8000;
        color: white;
        border-radius: 10px;
        border: none;
	}
	
	.list-btn:hover, .submit-btn:hover
	{
		color: black;
	}
	
	.container
	{
		max-width: 50%;
        margin: 20px auto;
        padding: 20px;
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	}
	
	.bi-search 
	{
    	border: none;
        font-size: 12pt;
        background-color: #ff8000;
        color: white;
        padding: 10px 20px;
        border-radius: 5px;
        cursor: pointer;
        text-decoration: none;
        transition: background-color 0.3s ease;
    }
    
    .bi-search:hover 
    {
    	background-color: #ff8000;
    	color: black;
   	}
   	
   	.btns
   	{
   		text-align: center;
   	}
	textarea{resize: none;}
	
	
	</style>
	<script type="text/javascript">
	
		$(function()
		{
			$(".submit-btn").click(function()
			{
				
				if (document.getElementById("note_content").value.trim()=="")
				{
					alert("내용을 입력하세요.");
					$("#note_content").val("");
					$("#note_content").focus();
					return;
				}
			});
			
		});
	
	</script>
	
</head>
<body>
<div class="header-menu row">
    <nav class="navbar bg-body-tertiary">
    
        <div>
            <a class="icon-main"><img alt="logo" src=""></a>
            <div class="hover-text">메인 홈페이지로 이동</div>
        </div>
        
        <div>
            <ul class="nav justify-content-end">
            
                <li class="nav-item">
                    <div class="icon"><i class="bi bi-bell-fill"></i></div>
                    <div class="hover-text">알림 보기</div>
                </li>
                
                <!-- 웹 브라우저가 625 이상 일때 보여지는 메뉴들 -->
                <li class="nav-item default-menu">
                    <div class="icon"><i class="bi bi-person-circle"></i></div>
                    <div class="hover-text">정보 수정</div>
                </li>
                <li class="nav-item default-menu">
                    <div class="icon"><i class="bi bi-door-open-fill"></i></div>
                    <div class="hover-text">로그아웃</div>
                </li>
                
                <!-- 웹 브라우저가 625 이하 일때 보여지는 메뉴 -->
                <li class="nav-item small-menu">
                    <div class="icon dropdown">
                        <button class="btn dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                            <i class="bi bi-list"></i>
                        </button>
                        <ul class="dropdown-menu dropdown-menu-end dropdown-menu-start">
                            <li><a href="" class="dropdown-item">정보수정</a></li>
                            <li><a href="" class="dropdown-item">로그아웃</a></li>
                        </ul>
                    </div>
                </li>
                
            </ul>
        </div>
    </nav>
</div>

    <div class="container">
    <div class="card">
        <div class="card-header">
            <h1 class="card-title text-center">쪽지 작성</h1>
        </div>
        <form action="friendnotewrite.action" method="get">
        <div class="card-body">
                <div class="mb-3">
                    <label for="searchRecipient" class="form-label">받는 사람</label>
                    <div class="input-group col-md-6">
				        <input type="text" class="form-control" id="searchRecipient" placeholder="수신자를 입력하세요"
				        value = "${code }">
				        <button type="button" class="btn bi bi-search"></button>
				    </div>
                </div>
                <div class="mb-3">
                    <label for="note_title" class="form-label">제목</label>
                    <input type="text" class="form-control" id="note_title" name="note_title" placeholder="쪽지 제목을 입력하세요">
                </div>
                <div class="mb-3">
                    <label for="note_content" class="form-label">내용</label>
                    <textarea class="form-control" id="note_content" name="note_content" rows="5" placeholder="쪽지 내용을 입력하세요"></textarea>
                </div>
                
				<input type="hidden" id="fr_code" name="fr_code" value="${fr_code }"> 
				
                <div class="btns">
					<button type="button" class="list-btn" onclick="location.href='/receivenote.woori'">목록으로</button>
					<button type="button" class="submit-btn">전송하기</button>
				</div>
				
        </div>
            </form>
    </div>
</div>

</body>
</html>
