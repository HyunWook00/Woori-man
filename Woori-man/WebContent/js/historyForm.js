// 히스토리 작성폼 전용 자바스크립트
$(function()
{
	
	$(".board-content").keyup(function()
	{
		var text = $(this).val();
		if (text.length >= 1001)
		{
			alert("본문은 1,000글자까지 입력이 가능합니다.");
			$(this).val(text.substring(0,1000));
		}
	});
	
	// 첨부파일 추가
	$(".add-attach").click(function()
	{
		var element = "<div class=\"board-attach\">";
		element += "<input type=\"file\" class=\"form-control-sm board-attach\" name=\"ha_name\">";
		element += "<i class=\"bi bi-dash-square delete-attach\" role=\"button\" onclick=deleteAttach(this)></i>";
		element += "</div>";
		$(this).before(element);
	});
	
	// 히스토리 수정
	$(".update-btn").click(function()
	{
		var content = document.getElementById("his_content").value;
		if (content.trim()=="")
		{
			alert("내용을 입력하세요.");
			document.getElementById("his_content").focus();
			return;
		}
		document.getElementById("his_content").value = content.trim();
		document.getElementById("history-insert-form").submit();
	})
});


function articleInsert()
{
	var content = document.getElementById("his_content").value;
	if (content.trim()=="")
	{
		alert("내용을 입력하세요.");
		document.getElementById("his_content").focus();
		return;
	}
	document.getElementById("his_content").value = content.trim();
	document.getElementById("history-insert-form").submit();
}

//첨부파일 삭제
function deleteAttach(obj)
{
	$(obj).parent().remove();
}

