// 자유게시판 전용 자바스크립트
var attachNum = 2;

$(function()
{
	$(".board-title").keyup(function()
	{
		var text = $(this).val();
		if (text.length >= 41)
		{
			alert("제목은 40글자까지 입력이 가능합니다.");
			$(this).val(text.substring(0,40));
		}
	});
	
	$(".board-content").keyup(function()
	{
		var text = $(this).val();
		if (text.length >= 1001)
		{
			alert("본문은 1,000글자까지 입력이 가능합니다.");
			$(this).val(text.substring(0,1000));
		}
	});
	
	$(".add-attach").click(function()
	{
		var name = "bf_name" + attachNum++;
		var element = "<input type=\"file\" class=\"form-control-sm board-attach\" name=\"" + name + "\" id=\"" + name + "\">";
		$(this).before(element);
	});
});

function articleInsert()
{
	var title = document.getElementById("brd_subject").value;
	var content = document.getElementById("brd_content").value;
	if (title.trim()=="")
	{
		alert("제목을 입력하세요.");
		document.getElementById("brd_subject").focus();
		return;
	}
	
	if (content.trim()=="")
	{
		alert("내용을 입력하세요.");
		document.getElementById("brd_content").focus();
		return;
	}
	document.getElementById("brd_subject").value = title.trim();
	document.getElementById("brd_content").value = content.trim();
	
	document.getElementById("board-insert-form").submit();
}

function articleUpdate()
{
	var title = document.getElementById("brd_subject").value;
	var content = document.getElementById("brd_content").value;
	if (title.trim()=="")
	{
		alert("제목을 입력하세요.");
		document.getElementById("brd_subject").focus();
		return;
	}
	
	if (content.trim()=="")
	{
		alert("내용을 입력하세요.");
		document.getElementById("brd_content").focus();
		return;
	}
	document.getElementById("brd_subject").value = title.trim();
	document.getElementById("brd_content").value = content.trim();
	
	document.getElementById("board-update-form").submit();
}



