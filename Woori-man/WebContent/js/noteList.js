/**
 noteList.js
 */

$(document).ready(function()
	{
		// 보낸 쪽지 탭 클릭 시 
		$("#send-tab").click(function()
		{
			$(".form-check-input").removeAttr("checked");
			$(".compose-btn").find(".btn-delete").attr("onclick", "deleteSendNote()");
		});
		
		// 전체 수신 쪽지 클릭 시
		$("li.receive-note").click(function()
		{
			$(".form-check-input").removeAttr("checked");
			$(".compose-btn").find(".btn-delete").attr("onclick", "deleteReceiveNote()");
		});
		
		// 제목 클릭 시 쪽지 내용 보여주기
		$(".title").click(function()
		{
			//		 클릭한 타이틀   td  안에 있는    안에 있는   의 input  의 value
			var note_code = $(this).prev().find("div").children().first().val(); 
			//alert(note_code);
			// 보류..
			//alert($(this).find(".read-status").children().first().text());
			
			var params = "note_code=" + note_code;
			//alert(params);
			
			$.ajax(
			{
				type: "GET"
				, url: "notearticle.woori"
				, data: params
				, success: function(args)
				{
					//alert("다녀옴");
					//alert(args);
					$("#modal-result").html(args);
					$("#messageModal1").modal("show");
					
				}
				, error: function(e)
				{
					alert(e.responseText);
				}
			});
			
			
		});

		 
		$(".btn-close").click(function()
		{
			$(location).attr("href", "notelist.woori");
		});
		
		/*
		$(".btn-answer").click(function()
		{
			$(location).attr("href", "notewriteform.woori");
		});
		*/

	});
	
	
	// 쪽지 체크박스 전체 선택
    function selectAllMessagesInTab(tabId) {
        $("#" + tabId + " input[type='checkbox']").prop("checked", $("#" + tabId + " #selectAll").prop("checked"));
    }

 	// 각 탭에서 전체 선택 체크박스 클릭 시 해당 탭에 있는 모든 쪽지 체크박스를 선택
    $(".nav-link").click(function() {
        var tabId = $(this).attr("id").replace("-tab", "");
        $("#" + tabId + " input[type='checkbox']").prop("checked", $("#" + tabId + " #selectAll").prop("checked"));
    });
	
	// 받은 쪽지 삭제
	function deleteReceiveNote()
	{
		//alert("수신 삭제~");
		var check = $(".form-check-input:checked");
		var delCode = "";
		for(var i=0; i<check.length; i++)
		{
			delCode += check[i].value + "/";
		}
		var index = delCode.length;
		delCode = delCode.substring(0, index-1);
		
		$.ajax({
	        type: "GET",
	        url: "receivenotedelete.woori",
	        data: { del_code: delCode },
	        success: function (response) {
	            alert("삭제되었습니다.");
	            location.reload();
	        },
	        error: function (e) {
	            alert("삭제 중 오류가 발생했습니다.");
	        }
	    });
	}
	
	// 보낸 쪽지 삭제
	function deleteSendNote()
	{
		//alert("발신 삭제~");
		var check = $(".form-check-input:checked");
		var delCode = "";
		for(var i=0; i<check.length; i++)
		{
			delCode += check[i].value + "/";
		}
		var index = delCode.length;
		delCode = delCode.substring(0, index-1);
		
		$.ajax({
	        type: "GET",
	        url: "sendnotedelete.woori",
	        data: { del_code: delCode },
	        success: function (response) {
	            alert("삭제되었습니다.");
	            location.reload();
	        },
	        error: function (e) {
	            alert("삭제 중 오류가 발생했습니다.");
	        }
	    });
		
		
	}



