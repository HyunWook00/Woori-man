<%@page import="com.woori.dto.MeetingDTO"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	// 모임 날짜 받아오기
	ArrayList<MeetingDTO> allMeeting = (ArrayList<MeetingDTO>) session.getAttribute("allMeeting");

	String[] mainYear = new String[allMeeting.size()]; 	
	String[] mainMonth = new String[allMeeting.size()];	
	String[] mainDay = new String[allMeeting.size()];
	
	for (int i=0; i<allMeeting.size(); i++)
	{
		mainYear[i] =  allMeeting.get(i).getMt_meet().substring(0,4);
		mainMonth[i] =  allMeeting.get(i).getMt_meet().substring(5,7);
		mainDay[i] =  allMeeting.get(i).getMt_meet().substring(8);
		
		//System.out.println(groupYear[i].toString());
		//System.out.print(Integer.parseInt(groupYear[i].toString())+" - ");
		//System.out.print(Integer.parseInt(groupMonth[i].toString())+" - ");
		//System.out.print(Integer.parseInt(groupDay[i].toString())+"\n");
	}
	
	// 캘린더 객체 생성
	Calendar cal = Calendar.getInstance();

	// 날짜 받아오기 (현재 년, 월, 일)
	int year = cal.get(cal.YEAR);
	int month = cal.get(cal.MONTH)+1;
	int days = cal.get(cal.DAY_OF_MONTH);
	
	// 날짜 배열 생성
	int[] arrDate = {31,28,31,30,31,30,31,31,30,31,30,31};
	
	// 만년 달력 그리기
	// 윤년인지 아닌지에 따라서 2월을 29일로 변경
	if(year%4 == 0 && year%100 != 0 || year%400 ==0)
		arrDate[1] = 29;
	
	// ① 작년 꽉 채워서 날 수 뽑기 (2023년 12월 31일까지의 날 수)
	int nalsu = (year-1)*365 + (year-1)/4 - (year-1)/100 + (year-1)/400;  
	
	// ② 이번달 까지 날 수 뽑기 ( ① + 2024년 2월 29일까지의 날 수 )
	for (int i=0; i<month-1; i++)
		nalsu += arrDate[i];
	
	// 1일 날짜 추가
	nalsu ++;
	
	// 요일을 나누기 위한 변수
	int week = nalsu%7;
	
	// 마지막 날짜 뽑는 변수 (-1을 붙이는 이유는 인덱스 값은 0부터 시작이기 때문에)
	int lastDay = arrDate[month-1];
	 
	// 날짜 담을 변수
	String li = "";
	
	// 빈칸 공백
	for(int i=1; i<=week; i++)	
		li += "<li></li>";
	
	// 날짜 뽑기
	for(int i = 1; i<=lastDay; i++)
	{
		week ++;
		//System.out.print(groupYear.length);

		for(int m = 0; m<mainYear.length; m++)
		{
			//System.out.println("들어옴");
			//System.out.print(groupYear.length);
			//System.out.println(m + " : 앞");
			if(year == Integer.parseInt(mainYear[m].toString()) && month==Integer.parseInt(mainMonth[m].toString()) && i==Integer.parseInt(mainDay[m].toString()))
			{	
				//System.out.print(Integer.parseInt(groupYear[3].toString())+" - ");
				//System.out.print(Integer.parseInt(groupMonth[3].toString())+" - ");
				//System.out.print(Integer.parseInt(groupDay[3].toString())+"\n");
				//System.out.println(m + " : 뒤");
				li += "<li class='point'><div class='pointMt'>그룹 이름 : " + allMeeting.get(m).getCg_name() + "<br>모임 구분 : "+ allMeeting.get(m).getMc_name()+"<br>모임 제목 : "
					   + allMeeting.get(m).getMt_title()+"<br>기타 소개 : " + allMeeting.get(m).getMt_etc() + "</div>"+i+"</li>";
				i++;
				//break;
			}
		}	
		
		li += "<li>"+i+"</li>";			// 기본 날짜 뽑는거 

		if (week%7==0)
		{
			li += "<br>";
			week = 0;
		}
		
	}

	// 월이 끝나고 빈칸 처리
	for(int i=0; i<=week; i++)
	{
		if(week%7==0)
			break;
		li += "<li></li>";
		week ++;
	}	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 메뉴 캘린더</title>
<link rel="stylesheet" type="text/css" href="css/font.css">
<link rel="stylesheet" type="text/css" href="css/calendar.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
		
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
		
</script>
</head>

<body>
<div class="sideCalender">
<div class="wrapper">
<div class="nav">
		<div id="prevBtn" role="button" onclick="prevBtn(<%=year%>,<%=month%>)">◀</div>
			<span id="currentMonth"><%=year %>년 <%=month %>월</span>
		<div id="nextBtn" role="button" onclick="nextBtn(<%=year%>,<%=month%>)">▶</div>
	</div>
</div>
<div class="calendar">
	<ul class="week">
		<li class="days">일</li>
		<li class="days">월</li>
		<li class="days">화</li>
		<li class="days">수</li>
		<li class="days">목</li>
		<li class="days">금</li>
		<li class="days">토</li>
	</ul>
	<!-- 달력 생성 부분 -->
	<div class="currentDays">
		<ul id="here">
			<%=li %>
		</ul>
	</div>	
</div>
</div>


</body>
</html>