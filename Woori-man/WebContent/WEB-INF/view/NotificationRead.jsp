<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath(); 
%>
<%
	String nf_code = request.getParameter("nf_code");
	

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/adminHeader.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/bootstrap.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
 
<style type="text/css">
body {
	font-family: Arial, sans-serif;
}

.main
{
    display: flex;
    justify-content: center;	
    background-color: #f9f9f9;
}




.content 
{
    max-width: 800px !important;
    /* padding: 50px; */
    border: 1px solid #ccc;
    border-radius: 5px;
    background-color: white; 
    height: 820px;
    margin-top: 20px;
    margin-left: unset !important;
    margin-right: unset !important;
    padding: 0;
}

.section
{
    max-width: 798px;
    padding-left: 50px;
    padding-right: 50px;
    margin-top: 50px;	
 	
}



.holding-notice
{
    margin-left: 20px;
}
h1
{
    font-size: 20px;
    margin-top: 15px;
    font-weight: bold;
}

.ct-title
{
}

.top
{
	display: flex;
    justify-content: space-between;
    align-items: center;
    max-width: 798px;
    
    padding-left: 50px;
    padding-right: 50px;
    
}

.go-list
{
    display: flex;
    align-items: center;
}

a
{
	text-decoration: none;
	color: unset;
}

.ct-read
{
	max-width: 798px;
}


</style>
<!-- 부트스트랩 js -->
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<!-- 제이쿼리 적용 JS -->
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

	$(document).ready(function()
	{
		$("span:('일정관리')").css({color:"#ff8000"});
		
		
	});
	


</script>
</head>
<body>


<div class="header">
	<c:import url="/AdminHeader.jsp"></c:import>
</div>

<div class="main ma">
	<div class="container content">
	    <div class="holding-notice">
	    	<h1>공지사항</h1>
	    </div>
	    <hr>
	    
		<div class="ct-content">
    		<div class="top">
		    	<div class="ct-title">
		    		<span style="">${notice.nf_title }</span><br>
					<span style="font-weight: lighter; font-size: small;">${notice.nf_date }</span>
		    	</div>
		    	<div class="go-list">
		    		<label>
		    			<a href="notice.woori" style="display: flex; align-items: center;">
		    				<i class="bi bi-list-task" style="color: unset; font-size: 23px; padding: 3px; "></i>
		    			목록</a>
		    		</label>
		    	</div>
	    	</div>
			
			<div class="section" style="">
				<div>
					<img style="max-width: 100%; height: auto;" src="https://coresos-phinf.pstatic.net/a/2ib6hg/h_bh3Ud018svc1owj4cq4s0oqp_2q622p.png">
				</div>
				<div style="font-size: 20px;"> 
					<span>${notice.nf_content }</span>
				</div>	
					<br>
				<div>
					
				</div>
				
			</div>
	     
	     
					 	
	    	
    	</div> 
	</div>
</div>



</body>
</html>
























































