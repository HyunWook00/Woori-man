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
<title>회비 납부 내역 - 우리만 </title>
<!-- 
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"> 
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
캐러샐 추가
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> 

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
-->
 
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/font.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/groupMain.css">
<link rel="stylesheet" href="<%=cp %>/css/footer.css" />

<!-- 1. 부트스트랩 js -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<!-- 2. 부트스트랩 css -->
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
<!-- 3. jquery -->
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<!-- 4. 부트스트랩 아이콘 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">

</head>
<body>
	<c:import url="MemberHeader.jsp"></c:import>
	<c:import url="GroupHeader.jsp"></c:import>
		<!-- 사이즈 커질 때 양쪽 공백 -->
<div class="groupBody">
		<div class="groupMain_side" >
			<c:import url="GroupSideBar.jsp"></c:import>
		</div>	
		<div class="groupMain_main">
		<div class="newArticle" >
	        <ul class="list-group list-group-flush">
			<h4>회비 정보</h4>
			<div>회비 관련 정보</div>
			<div>회비 금액, 회비 납부일, 회비 설정한 사람, 회비 등록일</div> 
			</ul>	
     	 </div>
     	 <button type="button" onclick="location.href='groupfeeinsertform.woori'">회비 설정하기</button>
     	 <div class="newArticle">
	        <ul class="list-group list-group-flush">
	 		<h4>회비 납부 내역</h4>
			<div>밍<input type="checkbox" name="" id="" checked="checked" /></div>
			<div>낑<input type="checkbox" name="" id="" /></div>
			<div>깡<input type="checkbox" name="" id="" /></div>
			<div>욱<input type="checkbox" name="" id="" checked="checked"/></div>
			<div>농<input type="checkbox" name="" id="" /></div>
			</ul>
     	 </div>
		</div> <!-- groupMain_main -->
</div> <!-- groupBody -->

<!-- 푸터 영역 -->
<div class="footer">
	<c:import url="MemberFooter.jsp"></c:import>
</div>

</body>
</html>