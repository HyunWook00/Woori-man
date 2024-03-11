// 대댓글 달기 버튼 누르면 관련 요소 보여주기
function insertRecomment(mcm_code)
{
	document.getElementsByClassName("comment-cancel-btn")[0].click();
	var comment = document.getElementById(mcm_code+"-recomment");
	$(comment).css("display", "block");
	$(comment).children().css("display", "block");
}

// 내 댓글 수정하기
function modifyMyComment(mcm_code)
{
	document.getElementsByClassName("comment-cancel-btn")[0].click();
	var modify = document.getElementById(mcm_code + "-modify");
	var content = modify.nextElementSibling;
	var like = content.nextElementSibling;
	
	content.style.display = "none";
	like.style.display = "none";
	modify.style.display = "block";
	
	$(".update-comment-form").css("display", "block");
}
