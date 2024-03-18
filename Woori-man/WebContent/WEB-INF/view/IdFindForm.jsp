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
<title>아이디 찾기</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/IdFind.css">
<link rel="stylesheet" href="css/sweetalert2.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!-- 제이쿼리 적용 JS -->
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="js/idFindForm.js"></script>
<script type="text/javascript">



</script>


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
		<h2>아이디 찾기</h2>
		<hr>
	</div>
		
	<div id="tblDiv">
		<p>회원정보를 통한 아이디 찾기</p>
		<span>회원정보에 등록한 이름, 생년월일, 전화번호를 통해 아이디를 찾을 수 있습니다.</span><br><br>
		<form action="idfind.woori" method="post" >
			<table class="table">
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
						<input type="text"id="us_birthday" name="us_birthday" class="txt"
						placeholder="생년월일 앞 6자리">
					</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td>
						<input type="text" id="us_tel" name="us_tel" class="txt"
						placeholder=" ' - ' 제외  전화번호">
					</td>
				</tr>
				<tr>
					<th></th>
					<td>
						<button type="button" id="findId" name="findId" class="btn">확인</button>
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
























































