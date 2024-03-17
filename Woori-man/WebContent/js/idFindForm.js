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
            	alert(args);
			}
	 		, error: function(e)
			{
				alert(e.responseText);
			}
           
        });		
		
	});
});