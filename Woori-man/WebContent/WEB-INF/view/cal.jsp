<%@page import="com.test.mvc.MeetingDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%

	/* ArrayList<MeetingDTO> dtoArr = (ArrayList<MeetingDTO>) request.getAttribute("dto");

	String meetYear[] = null;
	String meetMonth = "";
	String meetDay = "";
	
	meetYear[0] = dtoArr.get(0).getMt_meet();

	String str = meetYear[0].split("-");
	
	 */
	int year = 0; 
	int month = 0; // 0 ~ 11
	
	// 년도, 월 중 하나라도 지정(넘겨져 오지)되지 않으면 오늘날짜 기준으로 월달력 출력
	if(request.getParameter("year") == null || request.getParameter("month") == null) {
		Calendar today = Calendar.getInstance();
		year = today.get(Calendar.YEAR);
		month = today.get(Calendar.MONTH);
	} else {
		// 출력하고자 하는 달력의 년도와 월
		year = Integer.parseInt(request.getParameter("year")); // 2022,..
		month = Integer.parseInt(request.getParameter("month")); // 0 ~ 11
		
		// 이전달 year, month-1 / 다음달 year, month+1
		if(month == -1) {
			month = 11;
			year = year-1;
		}
		if(month == 12) {
			month = 0;
			year = year+1;
		}
	}
	// 출력하고자 달의 1일 객체 + 1일 요일 + 마지막 날짜
	Calendar firstDate = Calendar.getInstance();
	firstDate.set(Calendar.YEAR, year);
	firstDate.set(Calendar.MONTH, month);
	firstDate.set(Calendar.DATE, 1);
	int firstDay = firstDate.get(Calendar.DAY_OF_WEEK); // 1일의 요일 정보
	int lastDate = firstDate.getActualMaximum(Calendar.DATE);
	
	
	
	// 출력 알고리즘(td 개수 구하기)
	int startTd = firstDay - 1;
	int endTd = 0;
	if((startTd+lastDate)%7 != 0) {
		endTd = 7 - (startTd+lastDate) % 7;
	}
	int tdCnt = startTd + lastDate + endTd;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%-- <link rel="stylesheet" type="text/css" href="<%=cp %>/css/main.css"> --%>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/bootstrap.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css"> 
<style type="text/css">
	/* @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap'); */
	
	/* *
	{
		font-family: 'Poppins', sans-serif !important;
		box-sizing: unset !important;
	} */
	
	td
	{
	    text-align: center;
    	font-weight: bold;
	}
	
	th
	{
		background-color: #fff !important;
		width: 150px;
		
	}
	
	table
	{
	    width : 150px !important;
	    border-collapse: unset;	
	}
	
	.cal_content
	{
    	max-width: 830px !important;
	    display: flex;
	    flex-direction: column;
	    align-items: center;
	    padding: unset;

	}
	
	.day
	{
		border-radius: 50%;	
		width: 20px;
		height: 25px;
	}
	
	.day15
	{
		border: 1px solid;
		background-color: #ccc;
	}
	
	
	.cal
	{
		margin-top: 50px;
		
	}
	
	span
	{
	
	}
	
	.g_day
	{
		display: flex;
    	justify-content: center;
	}
	.week
	{
		
	}
	
	.btn
	{
		border: unset;
	}
	
	.btn:active
	{
	    background-color: #6c757db3!important;
	}
	.btn:hover
	{
	    background-color: #ccc;
	}
	.btn:focus-visible
	{
	    background-color: unset;
	    border-color: unset;
	    outline: unset;
	    box-shadow: unset;
	}
	
	.bi
	{
	
	}
	
	
	
	.table-bordered > :not(caption) > * > * 
	{
    	border: unset;
    	/* background-color: rgba(0, 0, 250, 0.1) !important; */
    	padding: 2px;
    	font-size: 15px;	
	
	}
	
	
	
	

</style>
<!-- 제이쿼리 적용 JS -->
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

	function loadCalendarPrev(year, month) 
	{
	    var xhr = new XMLHttpRequest();
	    xhr.onreadystatechange = function() 
	    {
	        if (xhr.readyState == XMLHttpRequest.DONE)
	        {
	            if (xhr.status == 200)
	            {
	                // 성공적으로 응답을 받았을 때 처리할 내용
	                document.getElementById("calendar_area").innerHTML = xhr.responseText;
	            } 
	        }
	    };
	    
	    xhr.open('GET', '<%=cp%>/cal.jsp?year=' + year + '&month=' + month, true);
	    xhr.send();
	}
	
	function loadCalendarNext(year, month)
	{
	    var xhr = new XMLHttpRequest();
	    xhr.onreadystatechange = function() 
	    {
	        if (xhr.readyState == XMLHttpRequest.DONE)
	        {
	            if (xhr.status == 200) 
	            {
	                // 성공적으로 응답을 받았을 때 처리할 내용
	                document.getElementById("calendar_area").innerHTML = xhr.responseText;
	            } 
	        }
	    };
	    
	    xhr.open('GET', '<%=cp%>/cal.jsp?year=' + year + '&month=' + month, true);
	    xhr.send();
	}

</script>



</head>
<body>

<div>
	
<%-- <%=meetYear%> --%>

	
</div>



<div id="calendar_area" class="cal">
	<div  class="cal_content container mt-3 260px;260px;">
		
				<div class="bt">
					<button class="btn btn-outline-dark btn-sm" onclick="loadCalendarPrev(<%=year%>, <%=month-1%>)">
		    			<i class="bi bi-caret-left-fill"></i>
					</button>
					<span class="fw-bold"><%=year%>년 <%=month+1%>월</span>
					<button class="btn btn-outline-dark btn-sm" onclick="loadCalendarNext(<%=year%>, <%=month+1%>)">
		    			<i class="bi bi-caret-right-fill"></i>
					</button>
				</div>
				<div>
					<table class="table text-left table-bordered">
						<tr class="table-light text-center fs-5 tr-h">
							<th class="text-danger">Sat</th>
							<th>Mon</th>
							<th>Tue</th>
							<th>Wed</th>
							<th>Thu</th>
							<th>Fri</th>
							<th class="text-primary">Sat</th>
						</tr>
						<tr>
							<%
								for(int i=1; i<=tdCnt; i++) {
							%>
									<td>
										<%
											if(i>startTd && i<=startTd+lastDate) {
												if(i%7 == 0) {
										%>
													<div class="g_day"><div class="text-primary day day<%=i-startTd%>"><%=i-startTd%></div></div> 
										<%			
												} else if(i%7 == 1) {
										%>				
													<div class="g_day"><div class="text-danger day day<%=i-startTd%>"><%=i-startTd%></div></div>
										<%																
												}else {
										%>			
													<div class="g_day"><div class="day day<%=i-startTd%>"><%=i-startTd%></div></div>
										<%			
												}	
											} else {
										%>
												&nbsp;
										<%
											}
										%>		
									</td>
							<%	
									if(i!=tdCnt && i%7 == 0) {
							%>
										</tr><tr>
							<%			
									}
								}
							%>
						</tr>
					</table>
				</div>
				<!--  
					1. bootstrap 적용
					2. 첫번줄 일 월 화 수 목 금 토 
					3. 토요일 파란색 / 일요일 빨간색
				-->
				
			</div>
			
</div>
	

</body>
</html>
























































