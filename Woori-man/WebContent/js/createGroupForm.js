/**
 * createGroupForm.js
 */


$(document).ready(function()
{
	
	form = $("#createForm");
	
	
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
		
		if ($("input[name='gc_code']:checked").val() == null)
		{
			alert("그룹 카테고리를 선택 해주세요.");
			return;
		}
		
		
		form.submit();
		
	});
	
	
}); 
