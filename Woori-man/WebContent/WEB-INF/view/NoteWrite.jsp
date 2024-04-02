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
<link rel="stylesheet" href="css/noteWrite.css">
<script type="text/javascript" src="js/noteWrite.js"></script>

	
</head>
<body>
<div class="header">
	<c:import url="MemberHeader.jsp"></c:import>
</div>

    <div class="container">
    <div class="card">
        <div class="card-header">
            <h1 class="card-title text-center">쪽지 작성</h1>
        </div>
        <form action="friendnotewrite.woori" method="get" id="noteForm">
        <div class="card-body">
                <div class="mb-3">
                    <label for="searchValue" class="form-label">받는 사람</label>
                    <div class="input-group col-md-6">
				        <input type="text" class="form-control" id="searchValue" name="searchValue" placeholder="수신자를 입력하세요"
				        value = "${code }">
				        <button type="button" class="btn bi bi-search" id="search" data-toggle="modal" data-target="#messageModal1"></button>
				        <button type="button" id="modal-btn" data-toggle="modal" data-target="#messageModal1"></button>
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
					<button type="button" class="list-btn" onclick="location.href='notelist.woori'">목록으로</button>
					<button type="button" class="submit-btn">전송하기</button>
				</div>
				
        </div>
            </form>
    </div>
</div>

<div class="modal fade" id="messageModal1" tabindex="-1" aria-labelledby="messageModalLabel1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title fs-5" id="messageModalLabel1"></h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" >
                </button>
            </div>
            <div class="modal-body">
            <div class="card">
         	
            <div class="card-body friends">
            
				<ul class="lists">
				
				
				
				</ul>
				
			</div>
             
            </div>
            </div>
            </div>
        </div>
    </div>


</body>
</html>
