$(function()
{
	$(".history-insert").click(function()
	{
		var url = "historyinsertform.woori?ao_code=" + $(this).val();
		window.location.href = url;
	});
});

function goMeetingArticle(mt_code)
{
	var url = "meetingarticle.woori?mt_code=" + mt_code;
	window.location.href=url;
};

function goHistoryArticle(his_code, mt_code)
{
	var url = "historyarticle.woori?his_code=" + his_code + "&mt_code=" + mt_code;
	window.location.href=url;
};
