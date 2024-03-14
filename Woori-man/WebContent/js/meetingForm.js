$(function()
{
	$(".meeting-region-div").css("display", "none");
	$(".meeting-title").change(function()
	{
		if($(this).val().trim()=="")
		{
			alert("공백은 입력이 불가능합니다.");
			return;
		}
		$(this).val($(this).val().trim());
		var date = new Date();
		
		var minDay = new Date(date.setDate(date.getDate()+6));
		
		var maxDay = new Date(date.setDate(date.getDate()+83));
		
		$("#mt_meet").attr("min", minDay.toISOString().substring(0,10));
		$("#mt_meet").attr("max", maxDay.toISOString().substring(0,10));
		$("#mt_meet").attr("value", minDay.toISOString().substring(0,10));
		
		$(".meeting-date-div").fadeIn("slow");
	});
	
	$(".meeting-date").change(function()
	{
		$(".meeting-region-div").fadeIn("slow");
	});
	
	$(".region-item").click(function()
	{
		$(".region-item").removeClass("selected-item");
		$(this).addClass("selected-item");
		var cityId = "#region-" + $(this).val();
		$(".city-list").css("display", "none");
		$(cityId).css("display", "block");
	});
	
	$(".city-item").click(function()
	{
		$(".city-item").removeClass("selected-item");
		$(this).addClass("selected-item");
		$(".meeting-region").text($(".region-item.selected-item").text() + " " + $(this).text());
		$(".ct_code").val($(this).val());
		$(".meeting-region-info").css("display", "flex");
		$(".submit-btn-div").css("display", "block");
		$(".sub-content-div").css("display", "block");
	});
	
	$(".meeting-etc-input").keyup(function()
	{
		$(".now-count").text($(this).val().length);
	});
	
	$(".article-list").click(function()
	{
		window.location.href="meetinglist.woori";
	});
	
});