/**
 * createGroupForm.js
 */


$(document).ready(function()
{
	
	$('input[name="gc_code"]').change(function()
	{
		var val = $(this).val();
		var checked = $(this).prop('checked');
		
		$(".caseItem").css("background-color", "#F7F7F8");			
		
		var item = "case" + val;
		
		
		if (checked)
		{
			$("."+ item).css('background-color', '#495057ba');
		}
		
	});
	
	
	$("#submitBtn").click(function()
	{
		
		var brd_name = $("#brd_name").val(); 
		var form = $("#createForm")[0];
		var data = new FormData(form);
		
		if ($("#cg_name").val() == "" || $("#cg_name").val() == null)
		{
			alert("그룹 이름을 입력 해주세요.");
			return;
		}
		if ($("#cg_intro").val() == "" || $("#cg_intro").val() == null)
		{
			alert("그룹 한 줄 소개를 입력 해주세요.");
			return;
		}
		
		if ($("input[name='gc_code']:checked").val() == null)
		{
			alert("그룹 카테고리를 선택 해주세요.");
			return;
		}
		
		if ($("#basicImg").val())
		{
			$("#createForm").submit();
		}
		
		
		if ($("#basicImg").val() == null || $("#basicImg").val() == "")
		{
			$.ajax(
			{
				type: "POST"
				, url: "GroupProfileReceive.jsp"
				, data: data
				, contentType: false
				, processData: false
				, success: function(args)
				{
					if (args != null)
					{
						setTimeout(function()
						{
							alert("그룹 개설이 완료 되었습니다.");
							$("#createForm").submit();
							
		                }, 1500); 
						
					};
				}
				, error: function(e)
				{
					alert(e.responseText);
				}
			});	
		}
		
		
	});
	
	
}); 
