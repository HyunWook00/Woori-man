$(function()
{
	$(".article-list").click(function()
	{
		window.location.href="freeboardlist.woori?pageNum=" + $(this).val();
	});
	
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
	
	$(".article-modify").click(function()
	{
		var brd_code = $(this).val();
		window.location.href="freeboardupdateform.woori?brd_code=" + brd_code;
	});
	
	$(".article-delete").click(function()
	{
		var brd_code = $(this).val();
		if (confirm("해당 게시글을 삭제하시겠습니까?"))
		{
			window.location.href="freeboarddelete.woori?brd_code=" + brd_code;
		}
	});
	
	$(".comment-submit-btn").click(function()
	{
		var comment = document.getElementById("commentContent");
		if (comment.value.trim().length <= 0)
		{
			alert("내용을 입력하세요.");
			comment.value = comment.value.trim();
			comment.focus();
			return;
		}
		
		comment.value = comment.value.trim();
		document.getElementById("boardCommentForm").submit();
	});
	
	// 대댓글 달기, 내 댓글 수정하기 취소 버튼
	$(".comment-cancel-btn").click(function()
	{
		$(".write-recomment").css("display", "none");
		$(".modify-comment-div").css("display", "none");
		$(".comment-detail").css("display", "inline-block");
		$(".comment-like").css("display", "inline-block");
	});
});

function articleLike(obj)
{
	var brd_code = obj.value;
	var params = "brd_code=" + brd_code;
	
	$.ajax(
	{
		type: "GET"
		, url: "freeboardarticlelikejax.woori"
		, data: params
		, success: function(args)
		{
			$("#article-like-icon").removeClass("bi-heart").addClass("bi-heart-fill");
			$(".article-like-count").text(args);
		}
		, error: function(e)
		{
			alert(e.responseText);
		}
	});
	
	obj.classList.remove("article-like-btn");
	obj.classList.add("article-unlike-btn");
	$(obj).attr("onclick", "articleUnlike(this)");

}

function articleUnlike(obj)
{
	var brd_code = obj.value;
	var params = "brd_code=" + brd_code;
	
	$.ajax(
	{
		type: "GET"
		, url: "freeboardarticleunlikejax.woori"
		, data: params
		, success: function(args)
		{
			$("#article-like-icon").removeClass("bi-heart-fill").addClass("bi-heart");
			$(".article-like-count").text(args);
			
		}
		, error: function(e)
		{
			alert(e.responseText);
		}
	});
	
	obj.classList.remove("article-unlike-btn");
	obj.classList.add("article-like-btn");
	$(obj).attr("onclick", "articleLike(this)");
}

// 대댓글 달기
function insertRecomment(commentCode)
{
	document.getElementsByClassName("comment-cancel-btn")[0].click();
	var id = "#" + commentCode + "-recomment";
	$(id).css("display", "block");
	$(id).find("form").css("display", "block");
}

// 내 댓글 수정하기
function modifyComment(commentCode)
{
	document.getElementsByClassName("comment-cancel-btn")[0].click();
	var id = "#" + commentCode + "-modify";
	$(id).nextAll().css("display", "none");
	$(id).css("display", "block");
	$(id).find("form").css("display", "block");
}

// 나의 대댓글 수정하기
function modifyRecomment(recommentCode)
{
	document.getElementsByClassName("comment-cancel-btn")[0].click();
	var id = "#" + recommentCode + "-modify-recomment";
	$(id).nextAll().css("display", "none");
	$(id).css("display", "block");
	$(id).find("form").css("display", "block");
}


function deleteComment(commentCode, brd_code)
{
	if (confirm("해당 댓글을 삭제하시겠습니까?"))
	{
		window.location.href="boardcommentdelete.woori?bc_code=" + commentCode + "&brd_code=" + brd_code;
	}
}

// 댓글 좋아요
function insertCommentLike(obj)
{
	var commentCode = obj.value;
	var params = "commentCode=" + commentCode;
	
	$.ajax(
	{
		type: "GET"
		, url: "boardcommentlike.woori"
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

// 대댓글 좋아요
function insertRecommentLike(obj)
{
	var recommentCode = obj.value;
	var params = "recommentCode=" + recommentCode;
	
	$.ajax(
	{
		type: "GET"
		, url: "boardrecommentlike.woori"
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

// 댓글 좋아요 삭제
function deleteCommentLike(obj)
{
	var commentCode = obj.value;
	var params = "commentCode=" + commentCode;
	
	$.ajax(
	{
		type: "GET"
		, url: "boardcommentunlike.woori"
		, data: params
		, success: function(args)
		{
			$(obj).find("i").removeClass("bi-heart-fill").addClass("bi-heart");
			$(obj).attr("onclick", "insertCommentLike(this)");
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
		, url: "boardrecommentunlike.woori"
		, data: params
		, success: function(args)
		{
			$(obj).find("i").removeClass("bi-heart-fill").addClass("bi-heart");
			$(obj).attr("onclick", "insertRecommentLike(this)");
			$(obj).next().remove();
			$(obj).after(args);
		}
		, error: function(e)
		{
			alert(e.responseText);
		}
	});
}

// 게시글 신고
function reportArticle(brd_code)
{
	if (confirm("해당 게시글을 정말 신고하시겠습니까?"))
	{
		window.location.href="reportboardarticle.woori?brd_code=" + brd_code;
	}
}

// 댓글 신고
function reportComment(commentCode, brd_code)
{
	var params = "commentCode=" + commentCode;
	$.ajax(
	{
		type: "GET"
		, url: "reportboardcommentajax.woori"
		, data: params
		, success: function(args)
		{
			document.getElementById("report-modal-body").innerHTML = args;
			$("#reportModal").modal("show");
			var onclickEvent = "location.href='boardcommentreport.woori?commentCode=" + commentCode + "&brd_code=" + brd_code + "'";
			$("#report-submit-btn").attr("onclick", onclickEvent);
		}
		, error: function(e)
		{
			alert(e.responseText);
		}
	});
}

//대댓글 신고
function reportRecomment(recommentCode, brd_code)
{
	var params = "recommentCode=" + recommentCode;
	$.ajax(
	{
		type: "GET"
		, url: "reportboardrecommentajax.woori"
		, data: params
		, success: function(args)
		{
			document.getElementById("report-modal-body").innerHTML = args;
			$("#reportModal").modal("show");
			var onclickEvent = "location.href='boardrecommentreport.woori?recommentCode=" + recommentCode + "&brd_code=" + brd_code + "'";
			$("#report-submit-btn").attr("onclick", onclickEvent);
		}
		, error: function(e)
		{
			alert(e.responseText);
		}
	});
}