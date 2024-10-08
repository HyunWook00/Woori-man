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
<title>플랫폼 마이페이지</title>

<!-- <link rel="stylesheet" type="text/css" href="/Woori-man/css/MemberMain.css"> -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<link rel="stylesheet" href="/Woori-man/css/memberHeader.css">
<link rel="stylesheet" href="/Woori-man/css/PlatformMyPageMain2.css">
<link rel="stylesheet" type="text/css" href="/Woori-man/css/footer.css">

<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> --> 

<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<!-- 부트스트랩 버전 변경해서 모달 가져오기 -->


<script type="text/javascript">
	$(document).ready(function()
	{
		$("#mymodal").click(function()
		{
			$("#exampleModal").modal("show");
		});
	});
</script>


</head>
<body>

<div class="container" style="width: 120%;">
<jsp:include page="MemberHeader.jsp" />
</div>
	<div class="myPageMain">


		<div class="leftArea">

			<div class="profileImg_div">
				<div class="profile_img">
					<a href="#" onclick="changeImage()" class="photo"> <img
						alt="대체이미지" src="images/profile.png" class="photo_img"> <span
						class="photo_edit"></span>
					</a>
				</div>
				<%-- <c:forEach var="user" items="${userList }"> --%>
				<div class="profileName_div">
					<p class="userName">${myProfile.us_name }</p>
					<p class="userNickName">${myProfile.us_id }</p>
				</div>
				<%-- </c:forEach> --%>
			</div>

			<div class="profileList_div">
				<ul class="profileList_ul">
					<!-- <li class="profileList_li">
						<a href="">나의 모임일정</a>
					</li> -->

					<li class="profileList_li">
						<a href="group.woori" style="color: black !important;">나의 그룹 관리</a> 
					</li>
				</ul>

				<ul class="profileList_ul2">
					
					<!-- 				
					<li class="profileList_li"
						style="border-top: 1px solid rgba(146, 146, 148, .3); padding-top: 20px; border-length: 100px;"><a
						href="platformaccountupdateform.do">계정관리/비밀번호변경</a>
					</li>
				    -->
					<li class="profileList_li2" style="padding-top: 5px; border-length: 100px;"><a href="inquirylist.woori" style="color: black !important;">나의 문의내역</a></li>
					<li class="profileList_li2"><a href="reportlist.woori" style="color: black !important;">나의 신고내역</a></li>
				</ul>
			</div>

<!-- 
			<footer class="footer" style="text-align: center;">
				<div class="footer_home"
					style="padding: 30px 0 40px; box-sizing: border-box;">
					<ul class="guide_link" style="list-style: none; display: block; position:absolute; bottom:30px; margin-left: 50px;">
						<li><a href=""> <span class="footer_text">로그아웃 ㅣ</span>
						</a></li>

						<li><a href=""> <span class="footer_text">고객센터 ㅣ</span>
						</a></li>

						<li><a href=""> <span class="footer_text">이용가이드</span>
						</a></li>
					</ul>

				</div>
			</footer>

 -->
 		</div>


		<div class="rightArea">

			<div class="rightArea_01"
				style="margin-left: 60px; margin-top: 15px;">

				<div class="userPwd_title_div">
					<h2 class="userPwd_title_h2">계정관련 정보 재설정</h2>
				</div>

				<!-- <form action="platformaccountupdate.do" method="POST" id="PlatformAccountUpdateForm"> -->
				<div class="userInfo">
					<span
						style="font-size: 15px; font-weight: bold; color: #96a1aa; margin-left: 30px;">기본정보</span>

					<%-- <c:forEach var="user" items="${userList }"> --%>
					<div class="myProfile">
						<ul class="myProfile_ul">

							<li class="myProfile_li">
								<div class="myProfile_photo">
									<img alt="대체이미지" src="images/profile.png" class="photo_img"
										style="width: 56px; height: 56px; margin-top: 0;">
								</div>
							</li>

							<li class="myProfile_li">
								<div class="myProfile_account">
									<div class="myProfile_account_name">${myProfile.us_name }</div>
									<div class="myProfile_account">${myProfile.us_id }</div>
								</div>
							</li>
						</ul>

						<ul class="myInfo_ul">
							
							<li style="width: 650px; height: 30px; display: flex;">
								<div class="subIndex_row phoneImg" style="float: left; margin-right: 30px;">
									<i class="bi bi-phone"></i>
								</div>
								<div class="subIndex_row phone" style="margin-bottom: 3px; float: right;">
									<span class="phoneNumber" name="us_tel" id="us_tel">${myProfile.us_tel }</span>
								</div>
							</li>
							
							<li style="height: 30px; display: flex;">
								<div class="subIndex_row phoneImg" style="float: left; margin-right: 30px;">
									<i class="bi bi-envelope-open"></i>
								</div>
							
								<div class="subIndex_row email" style="float: right;">
									<span class="myInfo_email" name="us_email" id="us_email">${myProfile.us_email }</span>
								</div>
							</li>
							
							<li style="height: 30px; display: flex;">
								
								<div class="subIndex_row phoneImg" style="float: left; margin-right: 30px;">
									<i class="bi bi-house"></i>
								</div>
							
								<div class="subIndex_row address" style="float: right;">
									<span class="myInfo_addr" name="us_zipCode" id="us_zipCode">${myProfile.us_zipcode }</span><br>
									<span class="myInfo_addr" name="us_addr1" id="us_addr1">${myProfile.us_addr1 }</span>
									<span class="myInfo_addr" name="us_addr2" id="us_addr2">${myProfile.us_addr2 }</span>
									
<%-- 								기존 값 받아오는 거 어케 할지..
									<button type="button" id="addressBtn" class="btn_edit"
										onclick="location.href='platformaccountupdateform.do?us_tel=${myProfile.us_tel}&us_email=${myProfile.us_email}&us_zipCode=${myProfile.us_zipCode }&us_addr1=${myProfile.us_addr1}&us_addr2=${myProfile.us_addr2}'"
										style="float: right;">
										<!-- <a href="platformaccountupdate.do"> -->
										<span class="subIndexEdit">수정</span>
										<!-- </a> -->
									</button>
 --%>								
 								</div>
							</li>
							<button type="button" class="btn_edit" data-bs-toggle="modal" data-bs-target="#exampleModal1" style="float: right;">
							  <span class="subIndexEdit">수정</span>
							</button>
							
						</ul>

					</div>
				</div>

				<!-- 비밀번호 div 시작 -->
				<div class="userPwd">
					<div class="userPwd_title_div">
						<h2 class="userPwd_title_h2">비밀번호 재설정</h2>
					</div>
					<div class="userPwd_block">
						<span class="item_text">비밀번호</span>

						<!-- Button trigger modal -->
						<button type="button" class="btn_edit"
							data-bs-toggle="modal" data-bs-target="#exampleModal2" style="float: right;">
							<span class="subIndexEdit">수정</span>
						</button>
				</div>

				<div class="accountDelete" style="margin-top: 50px;">
					<a href="" class="btn_accountDelete">
						<div class="span">
							<a href="accountwithdrawlform.woori">
								<span class="exit_text">회원 탈퇴 ></span>
							</a>
						</div>
					</a>
				</div>

			</div>
			<!-- 비밀번호 div 끝 -->

		</div>

	</div>
	<!-- 오른쪽 div 끝 -->
	
	
	<!-- 계정정보 수정 모달 -->
		<!-- Button trigger modal -->
		<!-- <button type="button" class="btn_edit" data-bs-toggle="modal" data-bs-target="#exampleModal1">
		  수정
		</button> -->
		
		<!-- Modal -->
		<div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered">   
		    <div class="modal-content" style="width: 600px; height: 700px;">
		      <div class="modal-header">
	
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		        
		        
		      <div class="PlatformAccountUpdateContainer">
	
				<div class="PAUContent">
					
					<div class="ContentHeader">
						<h2 style="color: #ff8a3d;">계정정보 수정</h2>
						<p>우리만의 대표 프로필사진과 닉네임을 수정하실 수 있습니다.</p>
					</div>
						
					<form action="platformaccountupdate.woori" method="POST" id="PlatformAccountUpdateForm">
						
						<div class="tableDiv" style="border-radius: 20px;">
							<table class="tbl_PAU">
								<colgroup>
									<col style="width:22%;">
								</colgroup>					
								
								<tbody>
									<tr>
										<th scope="row">
											<div class="thcell"><i class="bi bi-person" style="font-size: 30px;"></i></div>						
										</th>
										
											<td>
												<div class="tdcell_Profile" style="height: 130px; margin-left: 30px;">
													<div class="PAU_profileImg">
														<img alt="대체 이미지" src="image/img_user.jpg" style="width: 70px; height: 70px; border-radius: 50%; margin-top: 10px;
														margin-left: 30px;">
													</div>
													<div class="PAU_profileImgBtn">
														<button type="button"  class="ImgBtn" id="PAU_profileImgBtn_button">
															<span class="buttonText" style="font-size: 12px;">이미지 선택</span>  
														</button>
													</div>
												</div>
											</td>
									</tr>
									<!-- ==================================== -->
								
									
									<!-- ====================================== -->
									
				
									<tr>
										<th scope="row">
											<div class="thcell"><i class="bi bi-envelope-open" style="font-size: 25px;"></i></div>						
										</th>
											<td>
												<div class="tdcell_Email" style="display: flex;">
													<p class="PAU_nickName">
														<input type="text" style="width: 178px; height: 29px; margin-top: 5px;" name="us_Email1" id="us_Email1" value="${email1 }">
														<%-- <%= request.getAttribute("us_tel") %> --%>
														@
					  									<!-- <input type="text" id="selboxDirect" name="selboxDirect"> -->
														<select name="us_Email2" id="us_Email2" style="height: 29px; width: 160px; margin-top: 5px; float: right;">
															<!-- <option selected="selected" value="naver">naver.com</option> -->
															<option value="naver">naver.com</option>
															<option value="daum">daum.net</option>
															<option value="hanmail">hanmail.net</option>
															<option value="nate">nate.com</option>
															<option value="gmail">gmail.com</option>
														</select>
													</p>
													<!-- <div class="PAU_profileImgBtn">
														<button type="button"  class="ImgBtn" id="PAU_profileImgBtn_button">닉네임 변경</button>
													</div> -->
												</div>
											</td>
									</tr>
									
									<!-- ====================================== -->
									<tr>
										<th scope="row">
											<div class="thcell"><i class="bi bi-phone" style="font-size: 30px;"></i></div>						
										</th>
											<td>
												<div class="tdcell_Tel" style="height: 85px;">
													<p class="PAU_Tel">
														<select id="tel_Agency" style="width: 110px; height: 29px; margin-right: 5px;">
															<option selected="selected" value="SKT">SKT</option>
															<option>KT</option>
															<option>LG U+</option>
															<option>SKT 알뜰폰</option>
															<option>KT 알뜰폰</option>
															<option>LG U+ 알뜰폰</option>
														</select>
														<select id="tel_First" name="tel_First" style="height: 29px; width: 60px; margin-top: 5px;">
															<option selected="selected" value="010">010</option>
															<option>011</option>
															<option>016</option>
															<option>017</option>
															<option>018</option>
															<option>019</option>
														</select>
														-
														<input type="text" style="width: 60px; height: 29px;"  name ="us_Tel2" id="us_Tel2"  value="${tel2}">
														-
														<input type="text" style="width: 60px; height: 29px;" name ="us_Tel3" id="us_Tel3" value="${tel3 }">
													</p>
													<!-- <div class="PAU_TelBtn">
														<button type="button"  class="ImgBtn" id="PAU_profileImgBtn_button">핸드폰 번호 변경</button>
													</div> -->
												</div>
											</td>
									</tr>
									<!-- ======================================================== -->
									<tr>
										<th scope="row">
											<div class="thcell" style="height: 50px;"><i class="bi bi-house" style="font-size: 30px;"></i></div>						
										</th>
										
											<td>
												<!-- <div class="txt_1">
													<button type="button" value="address"
														style="width: 80px; height: 25px; margin-left: 10px;">주소찾기</button>
													<input type="text" style="width: 120px;" name="us_Addr1" id="us_Addr1">
												</div>
				
												<div class="txt_2"
													style="margin-top: 5px; width: 400px; height: 30px;">
													<span class="addr_txt">도로 명 주소</span> <br> <input
														type="text" readonly="readonly" style="width: 400px;" name="us_Addr2" id="us_Addr2">
												</div>
				
												<div class="txt_3"
													style="margin-top: 5px; width: 400px; height: 30px;">
													<span class="addr_txt">상세 주소</span> <br> <input
														type="text" readonly="readonly" style="width: 400px;" name="us_Addr3" id="us_Addr3">
												</div>
												
												 -->
												 <div class="addr" style="margin: 10px 0 10px 8px;">
												 	<div class="zipcode" style="display: flex;">
														
														<input type="text" id="sample6_postcode" style="float: left;" placeholder="우편번호" name="us_zipCode" id="us_zipCode" value="${zipCode }">
														
														<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"
														style="margin-top: 5px; margin-left: 10px; float: right;"><br>
													</div>
													<input type="text" id="sample6_address" placeholder="도로명 주소" name="us_addr1" id="us_addr1" value="${addr1 }"><br>
													<input type="text" id="sample6_detailAddress" placeholder="상세주소" name="us_addr2" id="us_addr2" value="${addr2 }" style="width: 300px;">
												</div>
											</td>
									</tr>
								</tbody>
							</table>
						</div>
							
				<!-- 			<div class="UpdateBtn_div" style="text-align: center; margin-top: 50px;">
								<button type="submit" class="UpdateBtn" >수정</button>				
								<button type="reset" class="UpdateBtn" style="width: 55px; height: 30px;"
								onclick="">취소</button>				
							</div>
				 -->			
														
							<div class="btnArea_new">
								<button class="submit">
									<span class="btn_text">수정</span>
								</button>
							
								<button class="reset">
									<span class="btn_text">취소</span>
								</button>
							</div>
			</form>
					</div>
			   </div>
		        
 			 </div>
		      <!-- <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
		        <button type="button" class="btn btn-primary">Save changes</button>
		      </div> -->
		    </div>
		  </div>
		</div>
								
								
												
		<!-- 비밀번호 변경 모달 -->								
		<!-- <button type="button" class="btn_edit" id="mymodal" data-bs-toggle="modal" data-bs-target="#exampleModal2">
			<span class="subIndexEdit">수정</span>
		</button> -->

		<!-- Modal -->
		<div class="modal fade" id="exampleModal2" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content" style="height: 550px; width: 480px;">
 						   <div class="modal-header">
  				         <!-- <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1> -->
		       		 <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
				
			<div class="modal-Div" style="height: 450px;">
				
				<div class="PwdBanner">
					<h2 style="color: #ff6020; font-weight: bold;" >우리만!</h2>
				</div>
				
					<div class="PwdForm_header">
						<h2 class="modal-title fs-5" id="exampleModalLabel">비밀번호 변경</h2>
						<p class="PwdForm_header_p">
							<em>영문 대소문자, 숫자, 특수문자() 포함 8글자 ~ 16글자입니다.</em>
						</p>
						<p class="PwdForm_header_p">
							<em>이전에 사용한 적 없는 비밀번호가 안전합니다.</em>
						</p>
					</div>

					<div class="PwdForm_update">
						
						<form action="platformpwdupdate.woori" method="POST" id="PaltformPwdUpdateForm">
							<p class="update_row1">
								<input type="password" name="now_pwd" id="now_pwd"
									placeholder="현재 비밀번호"
									style="height: 19px; width: 80%; outline: none;">
							</p>

							<p class="update_row1">
								<input type="password" name="new_pwd1" id="new_pwd1"
									placeholder="새 비밀번호"
									style="height: 19px; width: 80%; outline: none;">
							</p>

							<p class="update_row1">
								<input type="password" name="new_pwd2" id="new_pwd2"
									placeholder="새 비밀번호 확인"
									style="height: 19px; width: 80%; outline: none;">
							</p>
							
							<div class="btnArea_new">
								
								<!-- <a href="" class="btn_item1">
									<span class="btn_text">취소</span>
								</a>
								
									<button class="submit">
									<span class="btn_text">변경</span>
									</button> -->
									
								<button class="reset">
									<span class="btn_text">취소</span>
								</button>
													
								<button class="submit">
									<span class="btn_text">변경</span>
								</button>
							</div>
						</form>
					</div>
				</div>
				
				</div>
				
			</div>
		</div>
		
		
		
	</div>
	<jsp:include page="MemberFooter.jsp" />

</body>
</html>