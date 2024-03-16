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
 
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/font.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/groupMain.css">
<link rel="stylesheet" href="<%=cp %>/css/footer.css" />
<!-- 1. 부트스트랩 js -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<!-- 2. 부트스트랩 css -->
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
<!-- 3. jquery -->
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<!-- 4. 부트스트랩 아이콘 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">

</head>

</head>
<body>

	<c:import url="MemberHeader.jsp"></c:import>
	<c:import url="GroupHeader.jsp"></c:import>
		<!-- 사이즈 커질 때 양쪽 공백 -->
<div class="groupBody">
		<div class="groupMain_side" >
			<c:import url="GroupSideBar.jsp"></c:import>
		</div>	
		<div class="groupMain_main">
			<div id="slideWrap" class="carousel slide" data-ride="carousel">
				<div class="carousel-inner">
				<h4>정기 모임</h4>
				<c:choose>
					<c:when test="${empty regularMeeting }">
						<div class="carousel-item active nullMeeting">
							<img src="<%=cp %>/images/gray_back3.png" alt="" width="100%" height="250">
							 <div class="carousel-caption"  style="text-shadow: none; bottom: 0px">
							 <br>
			              		 <h4>현재 발의 된 정기 모임이 없습니다. </h4>
			           		 </div>
						</div> 
					</c:when>
					<c:otherwise>
						<c:forEach var="regular" items="${regularMeeting }">
						<div class="${regular.num == 1 ? 'carousel-item active' : 'carousel-item'}">
							<img src="<%=cp %>/images/gray_back3.png" alt="" width="100%" height="250">
							 <div class="carousel-caption"
							  style="text-shadow: none; bottom: 0px">
							 <br>
			            		 <h4>${regular.mt_title } </h4>
			       				 <p>모임 날짜 : ${regular.mt_meet }</p>
			       				 <p>모임 지역 : ${regular.rg_name } ${regular.ct_name }</p>
			       				 <p>참석 여부 확인기간 : ${regular.mt_date } ~ ${regular.mt_vote }</p>
			       				 <button class="button">참석 여부 선택하러 가기</button>
			          		 </div>
						</div>
						</c:forEach> 
					</c:otherwise>
				</c:choose>
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
			<h4>번개 모임</h4>
				<c:choose>
					<c:when test="${empty impromptuMeeting}">
						<div class="carousel-item active nullMeeting">
							<img src="<%=cp %>/images/gray_back3.png" alt="" width="100%" height="250">
							 <div class="carousel-caption"  style="text-shadow: none; bottom: 0px">
							 <br>
			              		 <h4>현재 발의 된 번개 모임이 없습니다. </h4>
			           		 </div>
						</div> 
					</c:when>
					<c:otherwise>
						<c:forEach var="impromptu" items="${impromptuMeeting }">
						<div class="${impromptu.num == 1 ? 'carousel-item active' : 'carousel-item'}">
							<img src="<%=cp %>/images/gray_back3.png" alt="" width="100%" height="250">
							 <div class="carousel-caption"  style="text-shadow: none; bottom: 0px">
							 <br>
			              		 <h4>${impromptu.mt_title }</h4>
			         				 <p>모임 날짜 : ${impromptu.mt_meet }</p>
			         				 <p>모임 지역 : ${impromptu.rg_name} ${impromptu.ct_name}</p>
			         				 <p>참석 여부 확인기간 :${impromptu.mt_date} ~ ${impromptu.mt_vote }</p>
			         				 <button class="button">참석 여부 선택하러 가기</button>
			           		   </div>
						</div> 
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>
			<a class="carousel-control-prev" href="#slideWrap2" data-slide="prev">
				<span class="carousel-control-prev-icon"></span>
			</a> 
			<a class="carousel-control-next" href="#slideWrap2" data-slide="next">
			 <span class="carousel-control-next-icon"></span>
			</a>
		</div> <!-- end carousel slide -->
		<div class="newArticle" >
	        <ul class="list-group list-group-flush">
			<h4>${groupDTO.brd_name } 최신글</h4>
			<c:forEach var="newborad" items="${newBorad }">
				<li class="list-group-item list" 
				onclick="loaction.href='freeboardarticle.woori?article=${newborad.brd_code }'">${newborad.brd_subject }</li>
			</c:forEach>
			</ul>	
     	 </div>
     	 <div class="newArticle">
	        <ul class="list-group list-group-flush">
	 		<h4>히스토리 최신글</h4>
 				<c:forEach var="newHistory" items="${newHistory }">
 						<li class="list-group-item list" 
 						onclick="loaction.href='historyarticle.woori?his_code='${newHistory.his_code}">
 						[${newHistory.mt_title }] 모임의 ${newHistory.gm_nickname }님이 작성한 후기입니다.</li>
 				</c:forEach>
			</ul>
     	 </div>
	<!-- 최신글 끝 -->
	        <div id = "notices">
			<h4 class="notices">공지사항</h4>
				<ol class="list-group list-group-numbered notices">
				<a class="more" href="noticeslist.woori">더보기 > </a>
					<c:forEach var="noticesList" items="${noticesList }">
				  		<li class="list-group-item notices" onclick="location.href='noticespost.woori?nf_code=${noticesList.nf_code }'">${noticesList.nf_title }</li>
				  	</c:forEach>
				</ol>
			</div>
		</div> <!-- groupMain_main -->
</div> <!-- groupBody -->

<!-- 푸터 영역 -->
<div class="footer">
	<c:import url="MemberFooter.jsp"></c:import>
</div>

</body>
</html>