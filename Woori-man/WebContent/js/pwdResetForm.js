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
		
		if (pwd1 != pwd2)
		{
			alert("비밀번호가 일치하지 않습니다.");
			return;
		}
		
		if (pwd1 == "" || pwd2 == "")
		{
			alert("올바른 비밀번호를 입력해주세요.");
			return;
		}
		
		$("#resetForm").submit();
		
	});
	
});