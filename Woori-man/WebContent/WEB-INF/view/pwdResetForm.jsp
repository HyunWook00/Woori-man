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
<title>비밀번호 찾기</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/pwdReset.css">
<!-- 부트스트랩 아이콘 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<!-- 부트스트랩 js -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<!-- 제이쿼리 적용 JS -->
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="js/pwdResetForm.js"></script>
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
		<h2>비밀번호 재설정</h2>
		<hr>
	</div>
	
	
	<div id="tblDiv">
		
		<form action="pwdreset.woori" method="post" id="resetForm">
			<div id="spDiv">
				<span>※ 비밀번호를 변경해 주세요.<br>
				다른 아이디나 사이트에서 사용한 적 없는 안전한 비밀번호 변경을 권장드립니다.</span><br><br>
			</div>
			<div class="myId">
				<h3>내 아이디 : ${us_id }</h3>
			</div>
			<table class="table">
				<tr>
					<th>새 비밀번호</th>
					<td>
						<input type="password" id="us_pwd1" name="us_pwd1" class="txt"
						placeholder="비밀번호">
						<span style="font-size: small;">공백없이 영문,숫자,특수문자(!, @, #, ~)의 조합</span>
					</td>
				</tr>
				<tr>
					<th>새 비밀번호 확인</th>
					<td>
						<input type="password" id="us_pwd2" name="us_pwd2" class="txt"
						placeholder="비밀번호 확인">
					</td>
				</tr>
				<tr>
					<th></th>
					<td></td>
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
			<input type="hidden" name="us_code" value="${us_code }">
		</form>
	</div>
	
	
</div>
</body>
</html>
























































