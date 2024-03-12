$(function()
{
	$(".article-list").click(function()
	{
		window.location.href="freeboardlist.woori";
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

function insertRecomment(commentCode)
{
	/*
	alert(commentCode);
	document.getElementsByClassName("comment-cancel-btn")[0].click();
	//var comment = document.getElementById(commentCode + "-recomment");
	*/
	var id = commentCode + "-recomment";
	alert(id);
	$("#"+id).css("display", "block");
	//document.getElementById(id).style.display = "block";
	//$(id).css("display", "block");
	
}

// 내 댓글 수정하기
function modifyComment(commentCode)
{
	//document.getElementsByClassName("comment-cancel-btn")[0].click();
	var modify = document.getElementById(commentCode + "-modify");
	var content = modify.nextElementSibling;
	var like = content.nextElementSibling;
	
	content.style.display = "none";
	like.style.display = "none";
	modify.style.display = "block";
}

function reportComment(commentCode)
{
	alert(commentCode);
}

function deleteComment(commentCode)
{
	alert(commentCode);
}

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
