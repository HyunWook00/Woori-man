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
<title>AdminInquiryResult.jsp</title>

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

</head>
<body>


<div class="header">
	<c:import url="AdminHeader.jsp"></c:import>
</div>



<div class="container">

	<h1>신고내역</h1><hr>
	<div class="table-wrap">
	<form action="adminreportresult.woori" method="get" id="reportResultForm">
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
	        <tr><th>신고 처리</th>
            <td>
            <!-- <div class="row justify-content-center">
            <div class="col-auto">
            <div class="form-check">
			  <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
			  <label class="form-check-label" for="flexRadioDefault1">
			    Default radio
			  </label>
			</div>
			</div>
			<div class="col-auto">
				<div class="form-check">
				  <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2" checked>
				  <label class="form-check-label" for="flexRadioDefault2">
				    Default checked radio
				  </label>
				</div>
            </div> -->
            
            <div class="row justify-content-center">
            <c:forEach var="report" items="${reportResult }">
	            <div class="col-auto">
		            <div class="form-check">
					  <input class="form-check-input" type="radio" name="rr_code" 
					  id="${report.rr_code }" value="${report.rr_code }">
					  <label class="form-check-label" for="${report.rr_code }">
					    ${report.rr_status }
					  </label>
					</div>
				</div>
				</c:forEach>
			</div>
            </td>
            
	        </tr>
	</table>
	
	<div class="btns">
		<button type="button" class="list-btn" onclick="location.href='adminreportlist.woori'">목록으로</button>
		<button type="submit" class="submit-btn">처리완료</button>
	</div>
	
	<input type="hidden" name="report_code" value="${reportArticle.report_code }">
	<input type="hidden" name="ad_code" value="${reportArticle.ad_code }">
	<input type="hidden" name="report_type" value="${reportArticle.report_type }">
	
	</form>
	</div>
	
	
	
</div>


<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>