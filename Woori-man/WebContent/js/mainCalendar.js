/**
 * mainCalendar.js
 */

function prevBtn(year, month)
{
	//alert(year+month);
	
	if(month == 1)
	{
		year --;
		month = 12;
	}
	else
		month --;				
	
	//alert(month);
	
	var params = "year=" + year + "&month=" + month;
	
	//alert(params);
	
	//alert("들어옴");
	$.ajax(
	{
		type : "get"
		,url : "maincalendarajax.woori"
		,data : params
		,success : function(args)
		{
			$(".currentDays").html(args);
			$("#currentMonth").text( year + "년" + month + "월");
			$("#prevBtn").attr("onclick", "prevBtn(" + year + "," + month +")");
			$("#nextBtn").attr("onclick", "nextBtn(" + year + "," + month +")");
		}
		,beforeSend: false
		,error: function(e)
		{
			alert(e.responseText);
		}
			
	});
	
}

function nextBtn(year, month)
{
	//alert(year+month);
	
	if(month == 12)
	{
		year ++;
		month = 1;
	}
	else
		month ++;				
	
	//alert(month);
	
	var params = "year=" + year + "&month=" + month;
	
	//alert(params);
	
	//alert("들어옴");
	$.ajax(
	{
		type : "get"
		,url : "maincalendarajax.woori"
		,data : params
		,success : function(args)
		{
			$(".currentDays").html(args);
			$("#currentMonth").text( year + "년" + month + "월");
			$("#prevBtn").attr("onclick", "prevBtn(" + year + "," + month +")");
			$("#nextBtn").attr("onclick", "nextBtn(" + year + "," + month +")");
		}
		,beforeSend: false
		,error: function(e)
		{
			alert(e.responseText);
		}
	});
}