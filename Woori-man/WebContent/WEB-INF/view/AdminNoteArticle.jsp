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
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/adminNoteArticle.css">
	
    
</head>
<body>

<div class="header">
	<c:import url="AdminHeader.jsp"></c:import>
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

