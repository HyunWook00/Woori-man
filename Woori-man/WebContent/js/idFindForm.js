/**
 idFindForm.js 
 */
$(document).ready(function()
{	
	
	$("#findId").click(function()
	{
		var us_name = $("#us_name").val();			// 이름
		var us_birthday = $("#us_birthday").val();	// 생년월일
		var us_tel = $("#us_tel").val();				// 전화번호
		var params = "us_name=" + us_name + "&us_birthday=" + us_birthday + "&us_tel=" + us_tel;	// 넘길 변수 합치기 
		
		
		$.ajax({
            type: "GET"
            , url: "idfind.woori"
            , data: params
            , success: function(args)
			{
            	alert($.trim(args));
			}
			,beforeSend: checkInfo
	 		, error: function(e)
			{
				alert(e.responseText);
			}
           
        });		
		
	});
});


function checkInfo()
{
	var flag = true;
	
	if (!$.trim($("#us_name").val()) )
	{
		alert("이름을 입력해주세요.");
		$("#us_name").focus();
		flag = false;
		return flag;
	}
	if (!$.trim($("#us_birthday").val()) )
	{
		alert("생년월일을 입력해주세요.");
		$("#us_birthday").focus();
		flag = false;
		return flag;
	}
	if (!$.trim($("#us_tel").val()) )
	{
		alert("전화번호를 입력해주세요.");
		$("#us_tel").focus();
		flag = false;
		return flag;
	}
	
	
	return flag;
}











