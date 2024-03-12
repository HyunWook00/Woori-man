<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="com.woori.dto.MeetingDTO"%>
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
	ArrayList<MeetingDTO> myMeeting = (ArrayList<MeetingDTO>)session.getAttribute("myMeeting");

	String[] MyGroupYear = new String[myMeeting.size()]; 	
	String[] MyGroupMonth = new String[myMeeting.size()];	
	String[] MyGroupDay = new String[myMeeting.size()];
	
	for (int i=0; i<myMeeting.size(); i++)
	{
		MyGroupYear[i] =  myMeeting.get(i).getMt_meet().substring(0,4);
		MyGroupMonth[i] =  myMeeting.get(i).getMt_meet().substring(5,7);
		MyGroupDay[i] =  myMeeting.get(i).getMt_meet().substring(8);
		
		//System.out.println(groupYear[i].toString());
		//System.out.print(Integer.parseInt(groupYear[i].toString())+" - ");
		//System.out.print(Integer.parseInt(groupMonth[i].toString())+" - ");
		//System.out.print(Integer.parseInt(groupDay[i].toString())+"\n");
	}
	
	// 캘린더 객체 생성
	Calendar myCal = Calendar.getInstance();

	// 날짜 받아오기 (현재 년, 월, 일)
	int myYear = myCal.get(myCal.YEAR);
	int myMonth = myCal.get(myCal.MONTH)+1;
	int myDays = myCal.get(myCal.DAY_OF_MONTH);
	
	// 날짜 배열 생성
	int[] myArrDate = {31,28,31,30,31,30,31,31,30,31,30,31};
	
	// 만년 달력 그리기
	// 윤년인지 아닌지에 따라서 2월을 29일로 변경
	if(myYear%4 == 0 && myYear%100 != 0 || myYear%400 ==0)
		myArrDate[1] = 29;
	
	// ① 작년 꽉 채워서 날 수 뽑기 (2023년 12월 31일까지의 날 수)
	int myNalsu = (myYear-1)*365 + (myYear-1)/4 - (myYear-1)/100 + (myYear-1)/400;  
	
	// ② 이번달 까지 날 수 뽑기 ( ① + 2024년 2월 29일까지의 날 수 )
	for (int i=0; i<myMonth-1; i++)
		myNalsu += myArrDate[i];
	
	// 1일 날짜 추가
	myNalsu ++;
	
	// 요일을 나누기 위한 변수
	int myWeek = myNalsu%7;
	
	// 마지막 날짜 뽑는 변수 (-1을 붙이는 이유는 인덱스 값은 0부터 시작이기 때문에)
	int myLastDay = myArrDate[myMonth-1];
	 
	// 날짜 담을 변수
	String myLi = "";
	
	// 빈칸 공백
	for(int i=1; i<=myWeek; i++)	
		myLi += "<li></li>";
	
	// 날짜 뽑기
	for(int i = 1; i<=myLastDay; i++)
	{
		myWeek ++;
		//System.out.print(groupYear.length);

		for(int m = 0; m<MyGroupYear.length; m++)
		{
			//System.out.println("들어옴");
			//System.out.print(groupYear.length);
			//System.out.println(m + " : 앞");
			if(myYear == Integer.parseInt(MyGroupYear[m].toString()) && myMonth==Integer.parseInt(MyGroupMonth[m].toString()) && i==Integer.parseInt(MyGroupDay[m].toString()))
			{	
				//System.out.print(Integer.parseInt(groupYear[3].toString())+" - ");
				//System.out.print(Integer.parseInt(groupMonth[3].toString())+" - ");
				//System.out.print(Integer.parseInt(groupDay[3].toString())+"\n");
				//System.out.println(m + " : 뒤");
				myLi += "<li class='myPoint'><div class='myPointmeet'>"+myMeeting.get(m).getMt_title()+"<br>"
					   + myMeeting.get(m).getCt_name()+"<br></div>"+i+"</li>";
				i++;
				//break;
			}
		}	
		
		myLi += "<li>"+i+"</li>";			// 기본 날짜 뽑는거 

		if (myWeek%7==0)
		{
			myLi += "<br>";
			myWeek = 0;
		}
		
	}

	// 월이 끝나고 빈칸 처리
	for(int i=0; i<=myWeek; i++)
	{
		if(myWeek%7==0)
			break;
		myLi += "<li></li>";
		myWeek ++;
	}	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 캘린더</title>
<link rel="stylesheet" type="text/css" href="css/font.css">
<link rel="stylesheet" type="text/css" href="css/myCalendar.css">
<!-- 3. jquery -->
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>

<script type="text/javascript">
		
		function myPrevBtn(myYear, myMonth)
		{
			if(myMonth == 1)
			{
				myYear --;
				myMonth = 12;
			}
			else
				myMonth --;				
			
			var params = "myYear=" + myYear + "&myMonth=" + myMonth;
			
			$.ajax(
			{
				type : "get"
				,url : "MyCalenderAjax.jsp"
				,data : params
				,success : function(args)
				{	
					$(".myCurrentDays").html(args);
					$("#myCurrentMonth").text( myYear + "년" + myMonth + "월");
					$("#myPrevBtn").attr("onclick", "myPrevBtn(" + myYear + "," + myMonth +")");
					$("#myNextBtn").attr("onclick", "myNextBtn(" + myYear + "," + myMonth +")");
				}
				,beforeSend: false
				,error: function(e)
				{
					alert(e.responseText);
				}
					
			});
		
		}
		 
		function myNextBtn(myYear, myMonth)
		{
			if(myMonth == 12)
			{
				myYear ++;
				myMonth = 1;
			}
			else
				myMonth ++;				
			
			var params = "myYear=" + myYear + "&myMonth=" + myMonth;
			
			$.ajax(
			{
				type : "get"
				,url : "MyCalendarAjax.jsp"
				,data : params
				,success : function(args)
				{
					//alert(myMonth);
					$(".myCurrentDays").html(args);
					$("#myCurrentMonth").text( myYear + "년" + myMonth + "월");
					$("#myNextBtn").attr("onclick", "myNextBtn(" + myYear + "," + myMonth +")");
					$("#myPrevBtn").attr("onclick", "myPrevBtn(" + myYear + "," + myMonth +")");
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
<div class="myPageCalender">
	<div class="myNav">
		<div id="myPrevBtn" role="button" onclick="myPrevBtn(<%=myYear%>,<%=myMonth%>)">◀</div>
			<span id="myCurrentMonth"><%=myYear %>년 <%=myMonth %>월</span>
		<div id="myNextBtn" role="button" onclick="myNextBtn(<%=myYear%>,<%=myMonth%>)">▶</div>
	</div>
<div class="myCalendar">
	<ul class="myWeek">
		<li class="days">일</li>
		<li class="days">월</li>
		<li class="days">화</li>
		<li class="days">수</li>
		<li class="days">목</li>
		<li class="days">금</li>
		<li class="days">토</li>
	</ul>
	<!-- 달력 생성 부분 -->
	<div class="myCurrentDays">
		<ul class="date">
			<%=myLi %>
		</ul>
	</div>	
</div>
</div>


</body>
</html>