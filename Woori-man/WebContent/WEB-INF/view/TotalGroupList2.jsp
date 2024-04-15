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

<link rel="stylesheet" href="/Woori-man/css/TotalGroupList2.css">

<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>



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