/**
 idFindForm.js 
 */
$(document).ready(function()
{	
	
	$("#findPwd").click(function()
	{
		if (!$.trim($("#us_id").val()) )
		{
			alert("아이디를 입력해주세요.");
			$("#us_id").focus();
			return;
		}
		if (!$.trim($("#us_name").val()) )
		{
			alert("이름을 입력해주세요.");
			$("#us_id").focus();
			return;
		}
		if (!$.trim($("#us_birthday").val()) )
		{
			alert("생년월일을 입력해주세요.");
			$("#us_birthday").focus();
			return;
		}
		
		$("#pwdResetForm").submit();
		
	});
});

	

	
	











