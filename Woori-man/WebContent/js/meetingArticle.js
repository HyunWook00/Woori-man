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
		$(".write-recomment-div").css("display", "none");
		$(".modify-comment-div").css("display", "none");
		$(".comment-detail").css("display", "inline-block");
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
	
	// 모임 철회
	$(".article-delete").click(function()
	{
		$("#cancelReasonModal").modal("show");
	});
	
	// 모임 수정
	$(".article-modify").click(function()
	{
		var mt_code = $(this).val();
		window.location.href="meetingupdateform.woori?mt_code="+mt_code;
	});
});

//----- 나의 댓글 & 대댓글 수정하기, 대댓글 달기 폼 오픈 완료 ----------------------------
//내 댓글 수정하기
function modifyComment(commentCode)
{
	document.getElementsByClassName("comment-cancel-btn")[0].click();
	var id = "#" + commentCode + "-modify";
	$(id).nextAll().css("display", "none");
	$(id).css("display", "block");
}

// 내 대댓글 수정하기
function modifyRecomment(recommentCode)
{
	document.getElementsByClassName("comment-cancel-btn")[0].click();
	var id = "#" + recommentCode + "-modify-recomment";
	$(id).nextAll().css("display", "none");
	$(id).css("display", "block");
}

//대댓글 달기
function insertRecomment(commentCode)
{
	document.getElementsByClassName("comment-cancel-btn")[0].click();
	var id = "#" + commentCode + "-recomment";
	$(id).css("display", "block");
	$(id).find("form").css("display", "block");
}
//----------------------------------------------------------------------------------------

// 모임 참석 여부 투표 -------------------------------------------------------------------
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
//----------------------------------------------------------------------------------------

//2024-02-28 노은하
// 댓글 좋아요 입력 ok
function insertCommentLike(obj)
{
	var commentCode = obj.value;
	var params = "commentCode=" + commentCode;
	 
	$.ajax(
	{
		type: "GET"
		, url: "meetingcommentlike.woori"
		, data: params
		, success: function(args)
		{
			$(obj).find("i").removeClass("bi-heart").addClass("bi-heart-fill");
			$(obj).attr("onclick", "deleteCommentLike(this)");
			$(obj).next().remove();
			$(obj).after(args);
		}
		, error: function(e)
		{
			alert(e.responseText);
		}
	});
}

// 댓글 좋아요 삭제
function deleteCommentLike(obj)
{
	var commentCode = obj.value;
	var params = "commentCode=" + commentCode;
	
	$.ajax(
	{
		type: "GET"
		, url: "meetingcommentunlike.woori"
		, data: params
		, success: function(args)
		{
			$(obj).find("i").removeClass("bi-heart-fill").addClass("bi-heart");
			$(obj).attr("onclick", "insertCommentLike(this)");
			$(obj).next().remove();
			$(obj).after(args);
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

// 대댓글 좋아요 입력
function insertRecommentLike(obj)
{
	var recommentCode = obj.value;
	var params = "recommentCode=" + recommentCode;
	 
	$.ajax(
	{
		type: "GET"
		, url: "meetingrecommentlike.woori"
		, data: params
		, success: function(args)
		{
			$(obj).find("i").removeClass("bi-heart").addClass("bi-heart-fill");
			$(obj).attr("onclick", "deleteRecommentLike(this)");
			$(obj).next().remove();
			$(obj).after(args);
		}
		, error: function(e)
		{
			alert(e.responseText);
		}
	});
}

// 대댓글 좋아요 삭제
function deleteRecommentLike(obj)
{
	var recommentCode = obj.value;
	var params = "recommentCode=" + recommentCode;
	
	$.ajax(
	{
		type: "GET"
		, url: "meetingrecommentunlike.woori"
		, data: params
		, success: function(args)
		{
			$(obj).find("i").removeClass("bi-heart-fill").addClass("bi-heart");
			$(obj).attr("onclick", "insertRecommentLike(this)");
			$(obj).next().remove();
			$(obj).after(args);
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

// 댓글 삭제
function deleteComment(commentCode, mt_code)
{
	if (confirm("해당 댓글을 삭제하시겠습니까?"))
	{
		window.location.href="meetingcommentdelete.woori?mcm_code=" + commentCode + "&mt_code=" + mt_code;
	}
}

// 댓글 신고
function reportComment(commentCode, mt_code)
{
	var params = "commentCode=" + commentCode;
	$.ajax(
	{
		type: "GET"
		, url: "reportmeetingcommentajax.woori"
		, data: params
		, success: function(args)
		{
			document.getElementById("report-modal-body").innerHTML = args;
			$("#reportModal").modal("show");
			var onclickEvent = "location.href='meetingcommentreport.woori?commentCode=" + commentCode + "&mt_code=" + mt_code + "'";
			$("#report-submit-btn").attr("onclick", onclickEvent);
		}
		, error: function(e)
		{
			alert(e.responseText);
		}
	});
}

// 대댓글 신고
function reportRecomment(recommentCode, mt_code)
{
	var params = "recommentCode=" + recommentCode;
	$.ajax(
	{
		type: "GET"
		, url: "reportmeetingrecommentajax.woori"
		, data: params
		, success: function(args)
		{
			document.getElementById("report-modal-body").innerHTML = args;
			$("#reportModal").modal("show");
			var onclickEvent = "location.href='meetingrecommentreport.woori?recommentCode=" + recommentCode + "&mt_code=" + mt_code + "'";
			$("#report-submit-btn").attr("onclick", onclickEvent);
		}
		, error: function(e)
		{
			alert(e.responseText);
		}
	});
}

// 게시글 신고
function reportArticle(mt_code)
{
	if (confirm("해당 모임을 정말 신고하시겠습니까?"))
	{
		window.location.href="reportmeetingarticle.woori?mt_code=" + mt_code;
	}
}

	

