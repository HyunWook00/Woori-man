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
<title>나의 그룹조회</title>
<link rel="stylesheet" type="text/css" href="/Woori-man/css/MemberMain.css">
<link rel="stylesheet" href="/Woori-man/css/memberHeader.css">
<link rel="stylesheet" type="text/css" href="/Woori-man/css/footer.css">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->

<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>


<style type="text/css">
.content {
	position: relative;
	display: flex;
	flex-direction: column;
	flex-grow: 1;
	box-sizing: border-box;
	width: 100%;
	height: 80%;
}

.waitingGroupList {
	background-color: white;
	flex-shrink: 0;
	margin: 0 auto;
	display: block;
	width: 1000px;
	height: 350px;
	margin: 0 auto;
	justify-content: center;
	flex-shrink: 0;
	border-radius: 20px;
	box-shadow: 0 2px 4px rgb(0 0 0 / 18%);
}

.banner1 {
	background-color: white;
	flex-shrink: 0;
	margin: 0 auto;
	display: block;
	width: 1000px;
	height: 100px;
	margin: 0 auto;
	justify-content: center;
	flex-shrink: 0;
	border-radius: 20px;
	background-size: 375px 104px;
	background-position: 50%;
	background-image:
		url(https://ssl.pstatic.net/static.talk/web/listweb/20240227153200/_next/static/media/img_tip_250.53ea691f.svg);
}

.something {
	background-color: white;
	flex-shrink: 0;
	margin: 0 auto;
	display: block;
	width: 1000px;
	height: 200px;
	margin: 0 auto;
	justify-content: center;
	flex-shrink: 0;
	border-radius: 20px;
}

.listIntro {
	color: #767678;
	font-size: 12px;
	font-weight: 500;
	margin-top: 5px;
	line-height: 17px;
	font-size: 13px;
}

.groupList {
	display: flex;
	margin-top: 16px;
	width: 940px;
	height: 240px;
	border: 1px solid rgba(0, 0, 0, .05);
	/* box-shadow: 0 2px 4px rgba(0, 0, 0, .06); */
	border-radius: 8px;
}

.groupListul {
	border: 1px solid rgba(0, 0, 0, .05);
	border-radius: 8px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, .06);
	display: flex;
	flex-direction: column;
	padding: 10px 0;
	list-style: none;
}

.groupDiv {
	display: flex;
	align-items: center;
	min-width: 0;
}

.groupProfile {
	position: relative;
	display: grid;
	overflow: hidden;
	grid-template-areas: "one";
	grid-gap: 2px;
	gap: 2px;
	width: 100px;
	height: 100px;
	border-radius: 50%;
	background-color: yellow;
}

.groupInfoUl {
	list-style: none;
}

.groupDiv {
	margin-left: 18px;
	flex-grow: 1;
	min-width: 0;
}

.SectionWrapper_content__6c8__ {
	width: 741px;
	height: 372px;
	position: relative;
	opacity: 1;
	transition: opacity .3s cubic-bezier(.33, 1, .68, 1) .2s;
	border-radius: inherit;
}

.AutoRecommendSection_wrap__ocOXD {
	position: absolute;
	top: 0;
	right: 0;
	width: 174px;
	height: 98px;
	background-repeat: no-repeat;
	background-size: contain;
}

.AutoRecommendSection_title_area__gPaaP {
	width: 685px;
	height: 49px;
}

.SectionTitle_title__1eA4E {
	isplay: block;
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
	color: #1e1e23;
	font-size: 17px;
	line-height: 25px;
}

.InvitationList_ul {
	/* display: flex;
	flex-direction: column; */
	display: block;
	overflow-y: scroll;
	border-radius: 8px;
}

.InvitationList_ul::-webkit-scrollbar {
	display: none;
}

.InvitationList_li {
	float: left;
	height: 120px;
	width: 400px;
	padding-bottom: 1px;
	list-style: none;
	margin: 0;
	margin-left: 15px;
	margin-top: 20px;
}

.Invitation {
	width: 400px;
	height: 70px;
}

.somethingList {
	border: 1px solid rgba(0, 0, 0, .05);
	border-radius: 8px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, .06);
	margin-top: 14px;
	list-style: none;
	width: 811px;
	height: 146px;
}

.somethingList_li {
	width: 811px;
	height: 48px;
	display: list-item;
	list-style: none;
	padding: 0;
	margin: 0;
}

.somethingSpan {
	display: block;
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
	color: #303038;
	margin: 0 8px 0 6px;
	font-size: 14px;
	font-weight: 500;
}

.footer-inner {
	padding: 35px 36px 55px;
	box-sizing: border-box;
	width: 100%;
	margin: 0 auto;
}

.footer-li {
	display: inline-flex;
	align-items: center;
	vertical-align: top;
	list-style: none;
	font-size: 8x;
}

a {
	text-decoration-line: none;
}

a:visited  {
	 color:  black;
	 text-decoration:  none;
}

/* 
.carousel-indicators{
	position: absolute;
    right: 0;
    bottom: 0;
    left: 0;
    z-index: 2;
    display: flex;
    justify-content: center;
    padding: 0;
    margin-right: 15%;
    margin-bottom: 1rem;
    margin-left: 15%;
    list-style: none;
}

.carousel-inner{
	position: relative;
    width: 100%;
    overflow: hidden;
    height: 300px;
    background: yellow;

}
 */
.testTitle {
	width: 85%;
	height: 160px;
	background: white;
	margin: auto;
	/* margin-top: 32px; */
	border-radius: 20px;
	display: flex;
	align-items: center;
	flex-direction: column;
	padding-top: 15px;
}

.carousel-item {
	height: 140px;
	background-repeat: no-repeat;
	background-position: 100% 0;
	background-size: 140px;
	margin-top: 50px;
}

.firstbox {
	flex-shrink: 0;
	margin: 0 auto;
	display: block;
	width: 1000px;
	height: 100px;
	margin: 0 auto;
	justify-content: center;
	flex-shrink: 0;
	border-radius: 20px;
}

.GroupProfileBtn {
	margin-top: 20px;
	right: 0;
	top: 21px;
	display: inline-block;
}

.btn_edit {
	display: inline-block;
	height: 30px;
	min-width: 50px;
	padding: 2px 9px 3px;
	border-radius: 4px;
	border: solid 1px rgba(212, 216, 229, .5);
	background-color: rgba(212, 216, 229, .25);
	box-sizing: border-box;
	text-align: center;
	margin-left: 110px;

}

.subIndexEdit {
	font-size: 14px;
	font-weight: 500;
	line-height: 17px;
	letter-spacing: -.47px;
	color: #7b8994;
}


.accept{
   width: 58px;
   height: 30px;
   /* float: right; */
   text-align: center;
   /* border-radius: 20px; */
   /* vertical-align: middle; */
   padding: 19px 0 18px;
   border-radius: 5px;
   background-color: #ff8a3d;
   border: none;
}
.btnArea_new {
	display: block;
	text-align: center;
	height: 61px;
	width: 100%;
	height: 143px;
	margin-top: 30px;
	margin-left: 20px;
}

.refuse{
   margin-left: 5px;
   width: 58px;
   height: 30px;
   /* float: right; */
   text-align: center;
   /* border-radius: 20px; */
   /* vertical-align: middle; */
   padding: 19px 0 18px;
   border-radius: 5px;
   background-color: #959eae;
   border: none;
}

.refuseOnly{
   width: 80px;
   height: 50px;
   /* float: right; */
   text-align: center;
   /* border-radius: 20px; */
   /* vertical-align: middle; */
   padding: 19px 0 18px;
   border-radius: 5px;
   background-color: #adb5bd;
   border: none;
}

.refuseAndBlock{
   width: 80px;
   height: 50px;
   /* float: right; */
   text-align: center;
   /* border-radius: 20px; */
   /* vertical-align: middle; */
   padding: 19px 0 18px;
   border-radius: 5px;
   background-color: #959eae;
   border: none;
}


.btn_text {
	font-size: 17px;
	font-weight: 600;
	letter-spacing: -.5px;
	color: #fff;
	width: 60px;
    height: 4px;
    
    justify-content: center;
    align-items: center;
    display: flex;
} 

.btn_text2 {
	font-size: 17px;
	font-weight: 600;
	letter-spacing: -.5px;
	color: #fff;
	width: 60px;
    height: 4px;
    margin-left: 9px;
    justify-content: center;
    align-items: center;
    display: flex;
} 

.unblockBtn{
	width: 70px;
    margin-left: -10px;

}

div.toggleDiv { display: flex; flex-direction: row; justify-content: center;}

.blockedGroup{
   width: 500px; 
   border-radius: 20px;
   display: inline-block;
}

.accordion-body{
	height: 200px;
	overflow: scroll;
}

.accordion-body::-webkit-scrollbar {
	display: none;
}


/* 필수 */
.InvitationList_ul .InvitationList_li:nth-child(2n-1) {
    padding-right: 33px;
}

.GroupProfileImage{
	padding-right: 20px;
	float: left;
}

.GroupPrifile_txt{
	width: 450px;
}

.banner{
	display:flex;
	justify-content: center;
	width: 100%;
	height: 245px;
	background-color: #f7f1eb;
	margin-bottom: 30px;
}

.banner-text{
	margin-top: 35px;
	padding-right: 20px; 
	margin: auto 0;
	margin-left: -150px;
}

.bannerImage{
	width : 416px;
	height: 245px;
	margin-right: 220px;
	margin-left: -250px;
}



</style>


<script type="text/javascript">

	
	function invitaionAccept(gi_code)
	{
		//alert("수락메소드 호출되겠지?");
		var params = "gi_code=" + gi_code;
		$.ajax(
		{
			type: "GET"
			, url: "invitationacccept.woori"
			, data: params
			, success: function(args)
			{
				$("#member-info-gi_code").val(gi_code);
				$("#memberInfoModal").modal("show");
				
			}
			, error: function(e)
			{
				alert(e.responseText);
			}
		});
		
		//window.location.href="invitationacccept.woori?gi_code=" + gi_code;
	}
	
	// 그룹원 정보 등록하기
	function memberInfoInsert()
	{
		var params = "gi_code=" + gi_code;
		$.ajax(
		{
			type: "GET"
			, url: "invitationacccept.woori"
			, data: params
			, success: function(args)
			{
				$("#member-info-gi_code").val(gi_code);
				$("#memberInfoModal").modal("show");
				
			}
			, error: function(e)
			{
				alert(e.responseText);
			}
		});
	}
	
	
	function invitaionRefuse(gi_code)
	{
		//alert(gi_code);
		//alert("초대거절만 할게용");
		window.location.href="invitationrefuse.woori?gi_code=" + gi_code;
	}

	function invitationBlock(gi_code, cg_code)
	{
		//alert("그룹차단도 할래용" + gi_code + ", " + cg_code+ ", " + us_code);
		//window.location.href="invitationblock.woori?gi_code=" + gi_code;
		window.location.href="invitationblock.woori?gi_code=" + gi_code + "&cg_code=" + cg_code;
	}
	
	function invitationUnblock(cg_code)
	{
		window.location.href="invitationUnblock.woori?cg_code=" + cg_code;
	}


/* 
 	$(function()
	{
		var obj = document.getElementsByClassName("carousel-item")[0];
		$(obj).addClass("active");
		
	})
 
 */
 </script>

</head>
<body>

<div class="container">
	<jsp:include page="MemberHeader.jsp" />
</div>

	<div class="content">


		<!-- <div class="TotalGroupCategory"></div> -->

		<div class="TotalGroupList" style="background-color: #white;">


		<div class="banner">
			
			<div class="banner-image">
				<img alt="대체이미지" src=" https://www.daangn.com/_next/static/media/jobs_hero_3x.b118130e.png" class="bannerImage">
			</div>
			<div class="banner-text">
				<h2 style="font-size: 50px;">우리만!</h2>
				<span style="font-size: 20px;">우리들만의 그룹을 조회하세요</span>
			</div>
				
		</div>

			<!-- <div class="firstbox"
				style="padding: 24px 28px 28px; margin-top: 30px;">
				<div class="title"
					style="display: flex; align-items: center; justify-content: center";>
					<h2 style="font-size: 30px;">
						<span style="font-weight: bold; color: #ff8a3d;">우리만의 그룹을 확인하세요!</span>
					</h2>
				</div>
			</div> -->
			
			
		
 		<!-- 초대 그룹 리스트 캐러셀-->
 		
			
			<!-- 캐러셀 끝 -->

			<section class="GroupListSection">
				<div class="waitingGroupList"
					style="padding: 24px 28px 28px; margin-top: 30px;">
					<div class="title">
						<h2 style="font-size: 18px; display: flex;">
							<span style="font-weight: bold;">가입그룹 리스트</span>
						</h2>
					</div>

					<div class="listIntro">나의 가입그룹을 조회하세요!</div>

					<div class="groupList">
						<ul class="InvitationList_ul">

							<c:forEach var="myGroupList" items="${myGroupList }">
							<!-- 그룹명, 그룹프사, 그룹멤버등록일, 그룹카테고리, 그룹 한줄소개 -->

								<li class="InvitationList_li">
									<div class="Invitation">

										<div class="GroupProfileImage"
											>
											<img alt="대체이미지" src="images/profile.png"
												style="width: 50px; height: 50px;">
										</div>
										<div class="GroupProfile_txt"
											style="width: 450px; height: 200px;">
											<div class="GourpProfileName">
												<span class="GroupName" style="font-weight: bold;">${myGroupList.cg_name}</span>
												<span class="GroupName_Category" style="color: #767678; font-size: 13px;">${myGroupList.gc_name }</span>
												<br> 
												<%-- <span class="GroupName_Category" style="color: #767678; font-size: 13px;">나의 그룹원 등록일 : ${myGroupList.gm_regdate}</span>
												<br> --%>
												<div class="GroupIntroduce">
													<p>${myGroupList.cg_intro }</p>
												</div>
											</div>


										</div>
									</div>
								</li>
								
							</c:forEach>
						</ul>
					</div>
				</div>
			</section>


			<section class="GroupListSection">
				<div class="waitingGroupList"
					style="padding: 24px 28px 28px; margin-top: 40px; padding-bottom: 50px;">
					<div class="title">
						<h2 style="font-size: 18px; display: flex;">
							<span style="font-weight: bold;">대기그룹 리스트</span>
						</h2>
					</div>

					<div class="listIntro">그룹원 정보 입력 대기중인 그룹입니다!
					</div>

					<div class="groupList">
						<ul class="InvitationList_ul">
						
							
							<!-- 그룹명, 그룹프사, 그룹카테고리, 그룹장닉네임, 그룹한줄소개, 그룹초대응답일 -->
							<c:forEach var="waitingGroupList" items="${waitingGroupList }">

								<li class="InvitationList_li">
									<div class="Invitation">

										<div class="GroupProfileImage"
											style="float: left; padding-right: 20px;">
											<img alt="대체이미지" src="images/profile.png"
												style="width: 50px; height: 50px;">
										</div>
										<div class="GroupProfile_txt"
											style="width: 450px; height: 200px;">
											<div class="GourpProfileName">
												<span class="GroupName" style="font-weight: bold;">${waitingGroupList.cg_name}</span>
												<span class="GroupName_Category" style="color: #767678; font-size: 13px;">${waitingGroupList.gc_name }</span>
												<br> 
												<%-- <span class="GroupName_Category" style="color: #767678; font-size: 13px;">나의 초대 응답일 : ${waitingGroupList.gi_response}</span>
												<br> --%>
												<div class="GroupIntroduce">
													<p>${waitingGroupList.cg_intro }</p>
												</div>
											</div>
										</div>
									
									</div>
									
									<button type="button" class="btn_edit" onclick="memberInfoInsert()">
									  <span class="subIndexEdit">그룹원 정보 등록하기</span>
									</button>
									
									
								</li>
								
								
							</c:forEach>
						</ul>
					</div>
				</div>
			</section>
			
			

			<!-- <div class="banner1"
				style="padding: 24px 28px 28px; margin-top: 40px; margin-bottom: 40px;">
				<a href="" class="banner"></a>
			</div> -->


		<div class="bigToggle" style="display: flex; justify-content: center; border-radius: 20px; margin-top: 30px;">	

			<div class="toggleDiv" style="float: left;">
			<!-- 초대 그룹 토글 -->
			<div class="blockedGroup">
				
				<div class="accordion" id="accordionInvite">
				  <div class="accordion-item">
				    <h2 class="accordion-header">
				      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
				         <span style="font-weight: bold; font-size: 18px;">초대그룹 리스트</span>
				      </button>
				    </h2>
				    <div id="collapseOne" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
				      <div class="accordion-body">
				        
				        <ul class="InvitationList_ul">

							<c:forEach var="inviteGroupList" items="${inviteGroupList }">
							<!-- 그룹명, 그룹프사, 그룹멤버등록일, 그룹카테고리, 그룹 한줄소개 -->

								<li class="InvitationList_li">
									<div class="Invitation" style="margin: 0 auto; display: flex;" >

										<div class="GroupProfileImage"
											style="float: left; padding-right: 20px;">
											<img alt="대체이미지" src="images/cat1.jpg" style="width: 50px; height: 50px; border-radius: 20px;">
										</div>
										<div class="GroupProfile_txt"
											style="width: 450px; height: 100px;">
											<div class="GourpProfileName">
												<span class="GroupName" style="font-weight: bold;">${inviteGroupList.cg_name}</span>
												<span class="GroupName_Category" style="color: #767678; font-size: 13px;">${inviteGroupList.gc_name }</span>
												<br> 
												<%-- <span class="GroupName_Category" style="color: #767678; font-size: 13px;">나의 그룹원 등록일 : ${myGroupList.gm_regDate}</span>
												<br> --%>
												<div class="GroupIntroduce" style="width: 200px;">
													<p>${inviteGroupList.cg_intro }</p>
												</div>
											</div>
										</div>
										
									<div class="btnArea_new" style="display: flex;">
										<button type="button" class="accept" data-bs-toggle="modal" data-bs-target="#exampleModalAccept" >
										  <span class="btn_text">수락</span>
										</button>
										<button type="button" class="refuse" data-bs-toggle="modal" data-bs-target="#exampleModalRefuse" value="${inviteGroupList.gi_code }">
										  <span class="btn_text">거절</span>
										</button>
									</div>	
									
									
							
							<!--수락 Modal -->
							<div class="modal fade" id="exampleModalAccept" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
							  <div class="modal-dialog">
							    <div class="modal-content">
							      <div class="modal-header">
							        <h1 class="modal-title fs-5" id="exampleModalLabel">그룹 초대 수락 / 거절</h1>
							        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							      </div>
							      <div class="modal-body">
							        해당 그룹의 초대를 수락하시겠습니까?
							      </div>
							      <div class="modal-footer">
							        <button type="button" class="accept" data-bs-dismiss="modal" onclick="invitaionAccept(${inviteGroupList.gi_code })" value="${inviteGroupList.gi_code }">
							        	<span class="btn_text">수락</span>
							        </button>
							        <button type="reset" class="refuse">
							        	<span class="btn_text">취소</span>
							        </button>
							      </div>
							    </div>
							  </div>
							</div> <!-- 수락 modal 끝 -->
							
							<!--거절 Modal -->
							<div class="modal fade" id="exampleModalRefuse" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
							  <div class="modal-dialog">
							    <div class="modal-content">
							      <div class="modal-header">
							        <h1 class="modal-title fs-5" id="exampleModalLabel">초대 거절 / 차단</h1>
							        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							      </div>
							      <div class="modal-body">
							      	<span style="font-weight: bold; font-size: 15px;">
							        초대를 거절한 그룹의 초대를 더이상 받지 않을 수 있습니다.<br>
							        해당 그룹의 초대를 더이상 받지 않으시겠습니까?<br>
							        </span>
							      </div>
							      <div class="modal-footer">
							      <!-- 
							        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">이번만 거절만 할게요</button>
							        <button type="button" class="btn btn-primary">더이상 받지 않을래용</button>
									 -->
									
									<button type="button" class="refuseOnly" data-bs-dismiss="modal" onclick="invitaionRefuse(${inviteGroupList.gi_code })" value="${inviteGroupList.gi_code }">
							        	<span class="btn_text2">거절만</span>
							        </button>
							        <button type="button" class="refuseAndBlock"  data-bs-dismiss="modal"  onclick="invitationBlock(${inviteGroupList.gi_code }, ${inviteGroupList.cg_code })" value="${inviteGroupList.gi_code }">
							        	<span class="btn_text2">차단도</span>
							        </button>
									
																	      
							      </div>
							    </div>
							  </div>
							</div> <!-- 거절 modal 끝 -->
							
						
									
									<!-- <div class="btnDiv" style="float: left;">
									 	<button type="button" class="btn_edit" onclick="invitationunblock()">
									  		<span class="subIndexEdit">차단 해제</span>
										</button>
									</div> -->
									</div>
								</li>
								
							</c:forEach>
						</ul>
				        
				      </div>
				    </div>
				  </div>
  
			</div>
			</div>

		</div> <!-- 초대 togglediv끝 -->
		
		<!-- 차단 그룹 toggle -->	
		<div class="toggleDiv" style="float: right;">	
		 <div class="blockedGroup">
				
				<div class="accordion" id="accordionBlock">
				  <div class="accordion-item">
				    <h2 class="accordion-header">
				      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
				        <span style="font-weight: bold; font-size: 18px;">차단그룹 리스트</span>
				      </button>
				    </h2>
				    <div id="collapseTwo" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
				      <div class="accordion-body">
				        
				         <ul class="InvitationList_ul">

							<c:forEach var="blockedGroupList" items="${blockedGroupList }">
							<!-- 그룹명, 그룹프사, 그룹멤버등록일, 그룹카테고리, 그룹 한줄소개 -->

								<li class="InvitationList_li">
									<div class="Invitation" style="margin: 0 auto; display: flex;" >

										<div class="GroupProfileImage"
											style="float: left; padding-right: 20px;">
											<img alt="대체이미지" src="images/cat1.jpg" style="width: 50px; height: 50px; border-radius: 20px;">
										</div>
										<div class="GroupProfile_txt"
											style="width: 450px; height: 100px;">
											<div class="GourpProfileName">
												<span class="GroupName" style="font-weight: bold;">${blockedGroupList.cg_name}</span>
												<span class="GroupName_Category" style="color: #767678; font-size: 13px;">${blockedGroupList.gc_name }</span>
												<br> 
												<%-- <span class="GroupName_Category" style="color: #767678; font-size: 13px;">나의 그룹원 등록일 : ${myGroupList.gm_regDate}</span>
												<br> --%>
												<div class="GroupIntroduce" style="width: 200px;">
													<p>${blockedGroupList.cg_intro }</p>
												</div>
											</div>
										</div>
									<!-- 	
									<div class="btnArea_new" style="display: flex;">
										<button type="button" class="accept" data-bs-toggle="modal" data-bs-target="#exampleModalAccept">
										  <span class="btn_text">수락</span>
										</button>
										<button type="button" class="refuse" data-bs-toggle="modal" data-bs-target="#exampleModalRefuse">
										  <span class="btn_text">거절</span>
										</button>
									</div>	
 									-->
 									
 									<div class="btnDiv" style="float: left; margin-left: -30px;">
									 	<button type="button" class="unblockBtn" onclick="invitationUnblock(${blockedGroupList.cg_code })">
									  		<span class="subIndexEdit">차단해제</span>
										</button>
									</div>
									</div>
								</li>
							</c:forEach>
						</ul>
				      </div>
				    </div>
				  </div>
  
			</div>
			</div>	
			
			</div> <!-- 차단 toggle div 끝 -->
			
		</div>	


			<jsp:include page="MemberFooter.jsp" />
			<c:import url="GroupMemberInfoFormModal.jsp"></c:import>



	</div>
</body>
</html>