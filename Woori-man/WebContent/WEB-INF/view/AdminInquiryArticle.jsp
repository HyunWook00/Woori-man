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

<!-- 부트스트랩 관련 스크립트 적용 JS -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<!-- 부트스트랩 아이콘 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

<!-- 제이쿼리 적용 JS -->
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>

<link rel="stylesheet" type="text/css" href="<%=cp%>/css/adminHeader.css">
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/adminInquiryArticle.css">

<script type="text/javascript">
  
  	$(document).ready(function()
	{
		var as_content = $("#as_content").html();
		
		if (as_content != "")
		{
			$(".answer-btn").css("display", "none");
		}
		
	});	
  
  </script>

</head>
<body>


<div class="header">
	<c:import url="AdminHeader.jsp"></c:import>
</div>


<div class="container">

	<h1>문의사항</h1><hr>
<%-- 	<form action="inquiryanswerform.action?iq_code=${inquiryArticle.iq_code}" method="get"> --%>
	<div class="table-wrap">
	<table class="tbl-Inpuiry">
		    <tr>
		    	<th>문의유형</th>
		    	<td>${inquiryArticle.iqc_name }</td>
	    	</tr>
	    	<tr>
	            <th>제목</th>
	            <td>${inquiryArticle.iq_title }</td>
            </tr>
            <tr>
	            <th>문의자</th>
	            <td>${inquiryArticle.us_id }</td>
            </tr>
            <tr>
	            <th>문의일</th>
	            <td>${inquiryArticle.iq_date }</td>
	        </tr>
            <tr>
	            <th>문의내용</th>
	            <td>${inquiryArticle.iq_content }<br>
	            <%-- <img src="${inquiryAttach.iqa_name }"> --%>
	            <%-- <c:forEach var="attach" items="${inquiryAttach }">
	            <img src="images/${attach.iqa_name }">
	            </c:forEach> --%>
	            </td>
	        </tr>
	</table>
	</div>
	
	<div class="answer">
			<table class="tbl-answer">
		    <tr>
		    	<th>답변</th>
	    	</tr>
	    	<tr>
	    		<td id="as_content">${inquiryArticle.as_content }</td>
	    	</tr>
	    	<tr class="admin-info">
            	<td colspan="2" style="text-align: right;">담당자: ${inquiryArticle.ad_code==0 ? "" : inquiryArticle.ad_code } 답변일 : ${inquiryArticle.as_date }</td>
        	</tr>
	</table>
	
	<div class="btns">
		<button type="button" class="list-btn" onclick="location.href='admininquirylist.woori'">목록으로</button>
		<button type="button" class="answer-btn" onclick="location.href='admininquiryanswerform.woori?iq_code=${inquiryArticle.iq_code}'">답변하기</button>
	</div>
	
	
	</div>
	
	
	
	
</div>


<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>