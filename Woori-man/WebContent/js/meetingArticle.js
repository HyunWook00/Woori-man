$(function()
{
	// 목록으로 돌아가기
	$(".article-list").click(function()
	{
		$(location).attr("href", "meetinglist.woori");
	});
	
	// 대댓글 달기, 내 댓글 수정하기 취소 버튼
	$(".comment-cancel-btn").click(function()
	{
		// 대댓글 달기 메뉴 div
		$(".write-recomment").css("display", "none");
		// 댓글 수정하기 메뉴 div
		$(".modify-comment").css("display", "none");
		// 대글 수정하기 때 지워놨던 메뉴들 다시 보여주기
		$(".comment-detail").css("display","inline-block");
		$(".comment-like").css("display", "inline-block");
	});
	
	$(".now-count").val($(".now-count").parent().parent().prev().val().legnth);
	
	// 2024-03-01 노은하
	// 댓글수 카운트 작업
	$("textarea").keyup(function()
	{
		var nowCount = $(this).siblings().last().children().last().children(".now-count");
		if ($(this).val().length >= 201)
		{
			alert("댓글은 200자 이하로만 작성이 가능합니다.");
			$(this).val($(this).val().substring(0,200));
		}
		nowCount.text($(this).val().length);
	});
	
	$(".article-delete").click(function()
	{
		$("#cancelReasonModal").modal("show");
	});
});

// 모임 참석 여부 투표
function voteAttend(mt_code, value)
{
	var message = "해당 모임에 ";
	if(value == 1)
		message += "참석 하시겠습니까?";
	else if(value == 2)
		message += "불참석 하시겠습니까?";
	
	if(confirm(message))
		window.location.href = "meetingvoteinsert.woori?mt_code=" + mt_code + "&aoc_code=" + value;
	
}

//2024-02-28 노은하
// 댓글 좋아요 입력
function commentLikeInsert(commentCode, gm_code)
{
	var gmCode = gm_code;
	var params = "mcmCode=" + commentCode + "&gmCode=" + gm_code;
	var obj = document.getElementById("comment-like-btn-" + commentCode);
	var objId = "#comment-like-btn-" + commentCode;
	 
	$.ajax(
	{
		type: "GET"
		, url: "commentlikeajax.woori"
		, data: params
		, success: function(args)
		{
			obj.innerHTML = args;
			 
			$(objId).removeClass("comment-like-btn");
			$(objId).addClass("comment-unlike-btn");
			$(objId).attr("onclick", "commentLikeDelete(" + commentCode + "," + gm_code + ")");
			 
		}
		, error: function(e)
		{
			alert(e.responseText);
		}
	});
}

// 대댓글 좋아요 입력
function recommentLikeInsert(recommentCode, gm_code)
{
	var gmCode = gm_code;
	var params = "mrcmCode=" + recommentCode + "&gmCode=" + gm_code;
	var obj = document.getElementById("recomment-like-btn-" + recommentCode);
	var objId = "#recomment-like-btn-" + recommentCode;
	 
	$.ajax(
	{
		type: "GET"
		, url: "recommentlikeajax.woori"
		, data: params
		, success: function(args)
		{
			//obj.innerHTML = "";
			
			obj.innerHTML = args;
			 
			$(objId).removeClass("recomment-like-btn");
			$(objId).addClass("recomment-unlike-btn");
			$(objId).attr("onclick", "recommentLikeDelete(" + recommentCode + "," + gm_code + ")");
			 
		}
		, beforeSend: function()
		{
			return true;
		}
		, error: function(e)
		{
			alert(e.responseText);
		}
	});
}

// 모임 철회
function deleteMeeting(mt_code)
{
	var crc_code = document.getElementById("crc_code").value;
	if(crc_code == 0)
	{
		alert("철회 사유를 선택하세요.");
		return;
	}
	url = "deletemeeting.woori?mt_code=" + mt_code + "&crc_code=" + crc_code;
	window.location.href=url;
}
