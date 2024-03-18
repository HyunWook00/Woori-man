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
<title>PwdFindForm.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/pwdFind.css">
<!-- 부트스트랩 아이콘 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<!-- 부트스트랩 js -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<!-- 제이쿼리 적용 JS -->
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="js/pwdFindForm.js"></script>

</head>
<body>


<div class="tabs">
    <div class="tab" id="idTab">
        <i class="bi bi-person"></i>
        <a href="idfindform.woori" class="activeTab">아이디 찾기</a>
    </div>
    <div class="tab" id="passwordTab">
        <i class="bi bi-file-lock"></i>
        <a href="pwdfindform.woori">비밀번호 찾기</a>
    </div>
</div>

<div id="mainDiv">
	<div>
		<h2>비밀번호 찾기</h2>
		<hr>
	</div>
	
	<div id="tblDiv">
		<p>회원정보에 통한 비밀번호 찾기</p>
		<span>회원정보에 등록한 아이디, 이름, 생년월일을 통해 비밀번호 재설정을 할 수 있습니다.</span><br><br>
		<form action="pwdfind.woori" method="post" id="pwdResetForm">
			<table class="table">
				<tr>
					<th>아이디</th>
					<td>
						<input type="text" id="us_id" name="us_id" class="txt"
						placeholder="아이디">
					</td>
				</tr>
				<tr>
					<th>이름</th>
					<td>
						<input type="text" id="us_name" name="us_name" class="txt"
						placeholder="이름">
					</td>
				</tr>
				<tr>						
					<th>생년월일</th>
					<td>
						<input type="text" id="us_birthday" name="us_birthday" class="txt"
						placeholder="생년월일 앞 6자리">
					</td>
				</tr>
				
				<tr>
					<th></th>
					<td>
						<button type="button" id="findPwd" name="findPwd" class="btn">확인</button>
					</td>
				</tr>
			</table>
			<br><br><br>	
			<hr id="hr2">
		</form>
	</div>
	
	
</div>
</body>
</html>
























































