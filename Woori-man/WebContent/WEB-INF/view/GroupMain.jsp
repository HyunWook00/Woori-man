<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GroupMain</title>
<!-- 
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"> 
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
캐러샐 추가
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> 

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
-->
 
<link rel="stylesheet" type="text/css" href="css/font.css">
<link rel="stylesheet" type="text/css" href="css/font.css">
<!-- 1. 부트스트랩 js -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<!-- 2. 부트스트랩 css -->
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
<!-- 3. jquery -->
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<!-- 4. 부트스트랩 아이콘 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">

<style type="text/css">

/* 기본 공통 CSS */

*
{
	font-family: 라인Seed;
	font-weight: bold;
}

h3
{
	background-color: white;
	padding: 10px;
	border-bottom: 1px solid #ff8000;
	border-top: 1px solid #ff8000;
	color: #ff8000 !important;
}

.left
{
	margin: 10px;
	text-align: center;
}

.center
{
	padding: 5px;
	margin: 10px;
}

.center hr
{
	border: 0;
    border-top: 1px solid #213245;
}

.button:hover
{
	border: solid 2px #ff8000;
	border-radius: 5px;
	color: #ff8000;
	background-color: white;
	padding: 8px;
}

.button
{
	border: solid 2px #ffffff;
	border-radius: 5px;
	color: #ffffff;
	background-color: #ff8000;
	padding: 8px;
	
}

/* footer CSS */

.footer
{
	width:100%;
	text-align: center;
	
}

.footer a
{
	padding: 20px;
	margin: 10px;
}

/* 캐러셀 CSS */
.carousel
{
	padding: 10px;
	width: 49%;
	text-align: center;
	display: inline-block;
}

.carousel-caption {

    padding-bottom: 30px !important;
    width: 100%;
    right: 0 !important;
    left: 0 !important;
}

.carousel-caption p
{
	color: #ff8000;
	font-weight: bold;
	font-family: 라인seed;
	font-size: 13pt;
}
.carousel-caption h3
{
	color: #ff8000 !important;
	background-color: transparent;
	font-weight: bold;
	font-family: 라인seed;
	border: none;
}

	.carousel-control-prev , .carousel-control-next
	{
		border: 1px solid #ff8000;
	}


/* 최신글 CSS */
.list-group-flush
{
	width: 49%;
	display: inline-block;
	text-align: center;
	margin: 4px;
}

.list
{
    position: relative;
    display: block;
    margin-bottom: 0px !important;
    background-color: #fff;
}

.list-group-flush>.list-group-item:last-child 
{
    border-bottom-width: 1px;
}

.notices
{
 	text-align: left;
}

.more
{
	color: black;
	text-decoration: none;
	text-align: right;		
}


/* 캘린더 CSS */
#groupMyProfile th, td
{
	padding: 10px;
	background-color: white;
}

table
{
	width: 100%;
}

/* .groupMain_side
{
	display: inline-block; 
}

.groupMain_main
{
	width: 1280px;
}
 */


</style>

</head>

</head>
<body>

	<c:import url="MemberHeader.jsp"></c:import>
	<c:import url="GroupHeader.jsp"></c:import>
		<!-- 사이즈 커질 때 양쪽 공백 -->
<div class="container">
	<div class="row justify-content-center">
		<div class="col-4 groupMain_side" >
			<c:import url="GroupSideBar.jsp"></c:import>
		</div>	
		<div class="col-6 groupMain_main">
			<div id="slideWrap" class="carousel slide" data-ride="carousel">			
				<div class="carousel-inner">
				<h3>정기 모임</h3>
				<c:forEach var="regular" items="${regularMeeting }">
				<div class="${regular.mt_rank == 1 ? 'carousel-item active' : 'carousel-item'}">
					<img src="img/gray_back2.png" alt="" width="100%" height="250">
					 <div class="carousel-caption"
					  style="text-shadow: none; bottom: 0px">
					 <br>
	            		 <h3>${regular.mt_title } </h3>
	       				 <p>모임 날짜 : ${regular.mt_meet }</p>
	       				 <p>모임 지역 : ${regular.ct_name }</p>
	       				 <p>참석 여부 확인기간 :${regular.ao_date }</p>
	       				 <button class="button">참석 여부 선택하러 가기</button>
	          		 </div>
				</div>
				</c:forEach> 
				  <button class="carousel-control-prev" type="button" data-bs-target="#slideWrap" data-bs-slide="prev">
				    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
				    <span class="visually-hidden">Previous</span>
				  </button>
				  <button class="carousel-control-next" type="button" data-bs-target="#slideWrap" data-bs-slide="next">
				    <span class="carousel-control-next-icon" aria-hidden="true"></span>
				    <span class="visually-hidden">Next</span>
				  </button>
				</div> 
			</div> <!-- end carousel slide -->
		<div id="slideWrap2" class="carousel slide" data-ride="carousel">			
			<div class="carousel-inner">
			<h3>번개 모임</h3>
				<c:forEach var="impromptu" items="${impromptuMeeting }">
					<div class="${impromptu.mt_rank == 1 ? 'carousel-item active' : 'carousel-item'}">
						<img src="img/gray_back2.png" alt="" width="100%" height="250">
						 <div class="carousel-caption"  style="text-shadow: none; bottom: 0px">
						 <br>
		              		 <h3>${impromptu.mt_title }</h3>
		         				 <p>모임 날짜 : ${impromptu.mt_meet }</p>
		         				 <p>모임 지역 : ${impromptu.ct_name}</p>
		         				 <p>참석 여부 확인기간 :${impromptu.ao_date }</p>
		         				 <button class="button">참석 여부 선택하러 가기</button>
		           		   </div>
					</div> 
				</c:forEach>
			</div>
			<a class="carousel-control-prev" href="#slideWrap2" data-slide="prev">
				<span class="carousel-control-prev-icon"></span>
			</a> 
			<a class="carousel-control-next" href="#slideWrap2" data-slide="next">
			 <span class="carousel-control-next-icon"></span>
			</a>
		</div> <!-- end carousel slide -->
	<hr>
		<div id="newBoard" >
	        <ul class="list-group list-group-flush">
			<h3>왁자지껄 최신글</h3>
			<c:forEach var="newborad" items="${newBorad }">
				<c:if test="${newborad.brdr_code == null}">
					<li class="list-group-item list">${newborad.brd_subject }</li>
				</c:if>
			</c:forEach>
			</ul>	
	        <ul class="list-group list-group-flush">
	 		<h3>히스토리 최신글</h3>
 				<c:forEach var="newHistory" items="${newHistory }">
 				<%-- 	<c:if test="${newHistory.his_title==null }"> --%>
 						<li class="list-group-item list">${newHistory.his_title }</li>
 				<%-- 	</c:if> --%>
 				</c:forEach>
			</ul>
     	 </div>
	<!-- 최신글 끝 -->
	        <div id = "notices">
			<h3 class="notices">공지사항</h3>
				<ol class="list-group list-group-numbered notices">
				<a class="more" href="noticeslist.woori">더보기 > </a>
					<c:forEach var="notices" items="${noticesList }">
				  		<li class="list-group-item notices">${notices.nf_title }</li>
				  	</c:forEach>
				</ol>
			</div>
		</div> <!-- groupMain_main -->
	</div> <!-- row -->
</div> <!-- container -->

<div class="footer col-xs-12 col-sm-12 col-md-12">
	<footer>
		<br> <a>이용약관</a> <a>개인정보처리방침</a> <a>약속해조 정책</a> <a>고객센터</a> <a>ⓒ 약속해조</a>
	</footer>
</div>

</body>
</html>