<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="com.test.mybatis.MeetingDTO"%>
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
	ArrayList<MeetingDTO> meetingDTO = (ArrayList<MeetingDTO>)session.getAttribute("groupMeetingDTO");

	String[] groupYear = new String[meetingDTO.size()]; 	
	String[] groupMonth = new String[meetingDTO.size()];	
	String[] groupDay = new String[meetingDTO.size()];
	
	for (int i=0; i<meetingDTO.size(); i++)
	{
		groupYear[i] =  meetingDTO.get(i).getMt_meet().substring(0,4);
		groupMonth[i] =  meetingDTO.get(i).getMt_meet().substring(5,7);
		groupDay[i] =  meetingDTO.get(i).getMt_meet().substring(8);
		
		//System.out.println(groupYear[i].toString());
		//System.out.print(Integer.parseInt(groupYear[i].toString())+" - ");
		//System.out.print(Integer.parseInt(groupMonth[i].toString())+" - ");
		//System.out.print(Integer.parseInt(groupDay[i].toString())+"\n");
	}
	
	// 캘린더 객체 생성
	Calendar cal = Calendar.getInstance();

	// 날짜 받아오기 (현재 년, 월, 일)
	int year = Integer.parseInt(request.getParameter("year"));
	int month = Integer.parseInt(request.getParameter("month"));
	
	//System.out.printf("%d년 %d월", year , month);
	
	//int monthTemp = month;
	//System.out.println(month);
	
	// 날짜 배열 생성
	int[] arrDate = {31,28,31,30,31,30,31,31,30,31,30,31};
	
	// 만년 달력 그리기
	// 윤년인지 아닌지에 따라서 2월을 29일로 변경
	if(year%4 == 0 && year%100 != 0 || year%400 ==0)
		arrDate[1] = 29;
	else 
		arrDate[1] = 28;
	
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
	 
	//System.out.println(month);
	//System.out.println(lastDay);
	
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

		for(int m = 0; m<groupYear.length; m++)
		{
			//System.out.println("들어옴");
			//System.out.print(groupYear.length);
			//System.out.println(m + " : 앞");
			if(year == Integer.parseInt(groupYear[m].toString()) && month==Integer.parseInt(groupMonth[m].toString()) && i==Integer.parseInt(groupDay[m].toString()))
			{	
				//System.out.print(Integer.parseInt(groupYear[3].toString())+" - ");
				//System.out.print(Integer.parseInt(groupMonth[3].toString())+" - ");
				//System.out.print(Integer.parseInt(groupDay[3].toString())+"\n");
				//System.out.println(m + " : 뒤");
				li += "<li class='point'><div class='pointMt'>"+meetingDTO.get(m).getMt_title()+"<br>"
					   + meetingDTO.get(m).getMt_etc()+"<br></div>"+i+"</li>";
				i++;
				//break;
			}
		}	
		
		// 기본 날짜 뽑는거 
		li += "<li>"+i+"</li>";

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
<%= "<ul>" + li + "</ul>"%>