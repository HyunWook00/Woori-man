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
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/adminReportArticle.css">

	<script type="text/javascript">
    
    	$(document).ready(function()
		{
			var rr_status = $("#rr_status").html();
			//alert(rr_status);
			
			if (rr_status != "")
			{
				$(".result-btn").css("display", "none");
			}
			
		});	
    
    </script>

</head>
<body>


<div class="header">
	<c:import url="AdminHeader.jsp"></c:import>
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
            <td id="rr_status">${reportArticle.rr_status }</td>
            <tr class="admin-info">
            	<td colspan="2" style="text-align: right;">담당자: ${reportArticle.ad_code==0 ? "" : reportArticle.ad_code } 답변일 : ${reportArticle.report_process }</td>
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