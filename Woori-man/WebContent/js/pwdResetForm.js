/**
 pwdResetForm.js
 */


$(document).ready(function()
{
	$("#findPwd").click(function()
	{
		//alert("확인");
		var pwd1 = $("#us_pwd1").val();
		var pwd2 = $("#us_pwd2").val();
		
		
		if ($.trim($("#us_pwd1").val()).length < 8 || $.trim($("#us_pwd1").val()).length > 20 )
		{
			alert("8 ~ 20 자리의 비밀번호를 입력해주세요.")
			$("#us_pwd1").focus();
			return;
		}
		if (pwd1 != pwd2)
		{
			alert("비밀번호가 일치하지 않습니다.");
			return;
		}
		$("#resetForm").submit();
		alert("비밀번호 변경이 완료되었습니다.");
		
	});
	
});