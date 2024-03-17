/**
 login.js 
 */

$(document).ready(function()
{
	$("#loginBtn").click(function()
	{
		//alert("확인");
		var id = $("#id").val();
		var pwd = $("#pwd").val();
		
		if (id == "" || id == null || id == " ")
		{
			alert("아이디를 입력해주세요.");
			$("#id").focus();
			return;
			
			
		}
		else if (pwd == "" || pwd == null || pwd == " ")
		{
			alert("비밀번호를 입력해주세요.");
			$("#pwd").focus();
			return;
		}
		
		
		$("#loginForm").submit();
		
	});
	
});






