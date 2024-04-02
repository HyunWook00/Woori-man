/**
 noteWrite.js
 */

$(function()
	{
		$(".submit-btn").click(function()
		{
			
			if (document.getElementById("note_content").value.trim()=="")
			{
				alert("내용을 입력하세요.");
				$("#note_content").val("");
				$("#note_content").focus();
				return;
			}
			
			$("#noteForm").submit();
		});
		
		
		$("#modal-btn").css("display", "none");
		$("#search").click(function()
		{
			var value = $("#searchValue").val();
			//alert("눌렀따");
			if (value == "") 
			{
	            alert("검색어를 입력해주세요.");
	            return;
	        } 
			
			else
			{
				$("#modal-btn").click();
				
			}
			
		});
		
		$("#modal-btn").click(function()
		{
			param = "searchValue=" + $("#searchValue").val();
			
			$.ajax(
			{
				type: "GET"
				, url: "friendlistsearch.woori"
				, data: param
				, success: function(args)
				{
					//alert("다녀왔다고해");
					//alert(args);
					$(".lists").html(args);
					$("#messageModal1").modal("show");
					$(".invite-btn").attr("onclick", "friendInsert(this)");
				}
				, error: function(e)
				{
					alert(e.responseText);
				}
			});
			
		});
		
		
	});
	
	function friendInsert(obj)
	{
		$("#messageModal1").modal("hide");
		var fr_code = $(obj).val();
		$("#fr_code").val(fr_code);
	}
