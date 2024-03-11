<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
 -->

<link rel="stylesheet" href="<%=cp%>/css/font.css">
<link rel="stylesheet" href="<%=cp%>/css/memberHeader.css">
<link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">

<!-- 1. 부트스트랩 js -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<!-- 2. 부트스트랩 css -->
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
<!-- 3. jquery -->
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<!-- 4. 부트스트랩 아이콘 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">



<link rel="stylesheet" href="<%=cp%>/css/csPost.css">

<style type="text/css">


</style>
</head>
<body>
	
<div>
	<br>
	<c:import url="MemberHeader.jsp"></c:import>
	<hr />
	<br>
</div>
<div class="inquiryPost">
	<h3 class="aaa">문의 내역 상세 조회</h3>
	<div>
	<table class="table" >
		<tr>
			<th>문의번호 ${inquirypost.iq_code }</th>
			<th>문의유형 ${inquirypost.iqc_name}</th>
			<th>문의제목 ${inquirypost.iq_title}</th>
			<th>문의날짜 ${inquirypost.iq_date }</th>
			<th>문의상태 ${inquirypost.iq_state}</th>
		</tr>
		<tr class="content">
			<th colspan="1">문의내용</td>
			<td colspan="4">${inquirypost.iq_content }</td>
		</tr>
		<tr>
			<th colspan="4" class="admin">담당 관리자 ${inquirypost.ad_name==null? "  -  " : inquirypost.ad_name}</th>
			<th colspan="1">답변 날짜 ${inquirypost.as_date==null? "  -  " : inquirypost.as_date}</th> 
		</tr>
		<tr>
		</tr>
		<tr  class="content">
			<th colspan="1">답변 내용</td>
			<td colspan="5">${inquirypost.as_content==null? " 아직 답변이 등록되지 않았습니다. " : inquirypost.as_content }</td>
		</tr>
	</table>
	</div>
	<button class="mbtn" onclick="location.href='inquirylist.woori'">목록으로</button>
</div>
	
</body>
</html>