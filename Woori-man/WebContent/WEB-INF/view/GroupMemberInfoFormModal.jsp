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
<title>그룹원 정보 입력 창</title>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
<style type="text/css">

div.member-info-element {margin: 5px 30px;}
input.member-info-input {border: 1px solid #adadad; border-radius: 5px; padding: 2px 5px;}
span.member-info-message {font-size: small; color: red; margin: 20px 0px 0px 30px; display: inline-block;}

</style>
<script type="text/javascript">

function formCheck()
{
	var nickname = document.getElementById("gm_nickname").value;
	if(nickname.trim().length <= 0)
	{
		alert("닉네임을 입력하세요.");
		return false;
	}
	
	document.getElementById("member-info-form").submit();
}

</script>
</head>
<body>

<!-- Modal -->
<div class="modal fade" id="memberInfoModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="staticBackdropLabel">약속해조 그룹원 정보 입력</h1>
      </div>
      <div class="modal-body">
        <form action="groupaccept.woori" id="member-info-form" method="post">
	        <div class="member-info-element member-info-nickname">
	        	닉네임 : <input type="text" name="gm_nickname" id="gm_nickname" value="${userDTO.us_id }" class="member-info-input">
	        </div>
	        <div class="member-info-element member-info-intro">
	        	상태메세지 : <input type="text" name="gm_intro" id="gm_intro" placeholder="상태메세지를 입력하세요." class="member-info-input">
	        </div>
	        <input type="hidden" name="gi_code" id="member-info-gi_code">
	        <input type="hidden" name="gm_profile">
        </form>
      	<span class="member-info-message">*그룹원 정보 입력이 완료되어야 그룹 활동이 가능합니다.</span>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">나중에 하기</button>
        <button type="button" class="btn btn-primary" onclick="formCheck()">등록완료</button>
      </div>
    </div>
  </div>
</div>

</body>
</html>