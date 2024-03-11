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
<title>공지사항 - 우리만</title>
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


<style type="text/css">

	*
	{
		font-family: 라인Seed;
		font-weight: bold;
		text-align: center;
	}
	
	.aaa
	{
		margin-left: 15%;
		text-align: left;
	}
	
	hr 
	{
		margin-left: auto;
		margin-right: auto;
		width: 70%;
		height: 30%;
	}
	
	
	.btn
	{
		font-size: 13pt;
		padding: 10px;
		width: 100pt;
	}

	.btnSelect
	{
		background-color:  #ff8000;
		color: white;
	}
	
	.btnSelect:hover
	{
		background-color: #e97501;
		color: white;
	}
	
	
	.Mycontent
	{
	    width: 1343px;
	    margin-left: 15%;
	}
	
	.table
	{
		box-shadow: 3px 3px 3px #ddd;
	}
	.table th
	{
		color: #ff8000;
	}

	/* footer CSS */

	.footer
	{
		width:100%;
		text-align: center;
		
	}
	
	.footer a
	{
		padding: 20px;
		margin: 10px;
		width: 30pt;
	}
	
	
</style>

</head>
<body>

<!-- 임시 헤더 영역 -->
<div>
	<br>
	<c:import url="MemberHeader.jsp"></c:import>
	<hr />
	<br>
</div>

<div class = "notices">
	<h3 class="aaa">공지사항</h3>
	<hr />
	<br>
	<div class="Mycontent">
		<table class="table table-hover">
			<tr>
				<th>번호</th>
				<th>공지</th>
				<th>작성날짜</th>
				<th>작성자</th>
			</tr>
			<c:forEach var="noticesList" items="${noticesList }" varStatus="status">
			<tr onclick="location.href='noticespost.woori?nf_code=${noticesList.nf_code }'">
				<td>${status.count }</td>
				<td>${noticesList.nf_title }</td>
				<td>${noticesList.nf_date }</td>
				<td>${noticesList.ad_name }</td>
			</tr>
			</c:forEach>
			</table>
	</div>
</div> 


<!-- footer 영역 추후 임포트 -->
<div class="footer col-xs-12 col-sm-12 col-md-12">
	<footer>
		<br> 
		<a>이용약관</a> <a>개인정보처리방침</a> <a>우리만 정책</a> <a>고객센터</a> <a> ⓒ 우리만</a>
	</footer>
</div>
<br>

</body>
</html>