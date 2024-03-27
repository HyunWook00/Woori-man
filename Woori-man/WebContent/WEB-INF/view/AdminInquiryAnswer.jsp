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
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/adminInquiryArticle.css">
 

</head>
<body>

<div class="header">
	<c:import url="AdminHeader.jsp"></c:import>
</div>



<div class="container">

	<h1>문의사항</h1><hr>
	<div class="table-wrap">
	<form action="admininquiryanswer.woori" method="get" id="inquiryAnswerForm">
	<table class="table-Inquiry">
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
            <tr>
	            <th>답변내용</th>
	            <td>
					<div class="form-group">
	                    <textarea rows="5" class="form-control" id="as_content" name="as_content"></textarea>
                    </div>
				</td>
	        </tr>
            <tr><th>답변 전송 방법</th>
            <td>
	            <div class="row justify-content-center">
            <div class="col-auto">
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                    <label class="form-check-label" for="flexCheckDefault">SMS 전송</label>
                </div>
            </div>
            <div class="col-auto">
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked">
                    <label class="form-check-label" for="flexCheckChecked">E-mail 전송</label>
                </div>
            </div>
        </div>
			</td>
	        </tr>
	
	</table>
	
	<div class="btns">
		<button type="button" class="list-btn" onclick="location.href='admininquirylist.woori'">목록으로</button>
		<button type="submit" class="submit-btn">작성완료</button>
	</div>
	<input type="hidden" name="iq_code" value="${inquiryArticle.iq_code }">
	</form>
	</div>

	

	
	
</div>


<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>