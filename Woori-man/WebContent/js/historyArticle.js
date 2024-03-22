// 2024-03-10 노은하
// 히스토리 게시글 관련 js 파일

$(function()
{
	// 목록으로 돌아가기
	$(".article-list").click(function()
	{
		window.location.href="historylist.woori";
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
		document.getElementById("historyCommentForm").submit();
	});
	
	$(".article-delete").click(function()
	{
		if (confirm("히스토리를 정말 삭제하시겠습니까?"))
		{
			window.location.href="deletehistory.woori?his_code=" + $(this).val();
		}
		
	});
});

//내 댓글 수정하기
function modifyComment(commentCode)
{
	document.getElementsByClassName("comment-cancel-btn")[0].click();
	var id = "#" + commentCode + "-modify";
	$(id).nextAll().css("display", "none");
	$(id).css("display", "block");
}

//나의 대댓글 수정하기
function modifyRecomment(recommentCode)
{
	document.getElementsByClassName("comment-cancel-btn")[0].click();
	var id = "#" + recommentCode + "-modify-recomment";
	$(id).nextAll().css("display", "none");
	$(id).css("display", "block");
	$(id).find("form").css("display", "block");
}

//대댓글 달기
function insertRecomment(commentCode)
{
	document.getElementsByClassName("comment-cancel-btn")[0].click();
	var id = "#" + commentCode + "-recomment";
	$(id).css("display", "block");
	$(id).find("form").css("display", "block");
}

// 게시글 좋아요
function articleLike(obj)
{
	var his_code = obj.value;
	var params = "his_code=" + his_code;
	
	$.ajax(
	{
		type: "GET"
		, url: "historyarticlelikejax.woori"
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

// 게시글 좋아요 취소
function articleUnlike(obj)
{
	var his_code = obj.value;
	var params = "his_code=" + his_code;
	
	$.ajax(
	{
		type: "GET"
		, url: "historyarticleunlikejax.woori"
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

//댓글 신고
function reportComment(commentCode, his_code, mt_code)
{
	var params = "commentCode=" + commentCode;
	$.ajax(
	{
		type: "GET"
		, url: "reporthistorycommentajax.woori"
		, data: params
		, success: function(args)
		{
			document.getElementById("report-modal-body").innerHTML = args;
			$("#reportModal").modal("show");
			var onclickEvent = "location.href='historycommentreport.woori?commentCode=" + commentCode + "&his_code=" + his_code + "&mt_code=" + mt_code + "'";
			$("#report-submit-btn").attr("onclick", onclickEvent);
		}
		, error: function(e)
		{
			alert(e.responseText);
		}
	});
}

//대댓글 신고
function reportRecomment(recommentCode, his_code, mt_code)
{
	var params = "recommentCode=" + recommentCode;
	$.ajax(
	{
		type: "GET"
		, url: "reporthistoryrecommentajax.woori"
		, data: params
		, success: function(args)
		{
			document.getElementById("report-modal-body").innerHTML = args;
			$("#reportModal").modal("show");
			var onclickEvent = "location.href='historyrecommentreport.woori?recommentCode=" + recommentCode + "&his_code=" + his_code + "&mt_code=" + mt_code + "'";
			$("#report-submit-btn").attr("onclick", onclickEvent);
		}
		, error: function(e)
		{
			alert(e.responseText);
		}
	});
}

//게시글 신고
function reportArticle(his_code)
{
	if (confirm("해당 게시글을 정말 신고하시겠습니까?"))
	{
		window.location.href="reporthistoryarticle.woori?his_code=" + his_code;
	}
}



