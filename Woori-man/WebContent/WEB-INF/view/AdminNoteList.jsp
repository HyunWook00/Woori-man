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
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/adminList.css">

</head>
<body>

<div class="header">
	<c:import url="AdminHeader.jsp"></c:import>
</div>

<div class="container">

<h1>쪽지</h1><hr>
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