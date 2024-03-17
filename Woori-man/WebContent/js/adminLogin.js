/**
 adminLogin.js
 */

$(document).ready(function()
{
	$("#loginBtn").click(function()
	{
		//alert("확인");
		var ad_code = $("#ad_code").val();
		var ad_pwd = $("#ad_pwd").val();
		
		if (ad_code == "" || ad_code == null || ad_code == " ")
		{
			alert("아이디를 입력해주세요.");
			$("#ad_code").focus();
			return;
			
			
		}
		else if (ad_pwd == "" ||ad_pwd == null || ad_pwd == " ")
		{
			alert("비밀번호를 입력해주세요.");
			$("#ad_pwd").focus();
			return;
		}
		
		
		$("#loginForm").submit();
		
	});
	
});


