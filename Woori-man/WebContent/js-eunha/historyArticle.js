// 2024-03-10 노은하
// 히스토리 게시글 관련 js 파일

$(function()
{
	$(".article-list").click(function()
	{
		window.location.href="historylist.woori";
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
});

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



