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
<title>PlatformMypageMain.jsp</title>

<link rel="stylesheet" type="text/css" href="css/main.css">

<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> --> 

<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<!-- 부트스트랩 버전 변경해서 모달 가져오기 -->

<style type="text/css">
.myPageMain {
	width: 100%;
	height: 800px;
	/* background-color: #FFF8F1; */
	background-color: white;
}

.leftArea {
	/* background-color: yellow; */
	float: left;
	height: 870px;
	width: 395px;
	margin-left: 20%;
	box-shadow: 5px 1px 8px 0 rgba(0, 0, 0, .06);
	border-left: 1px solid rgba(0, 0, 0, .08);
	margin-top: 20px;
}

.rightArea {
	float: right;
	background-color: #F9FBFC;
	height: 870px;
	width: 920px;
	margin-left: 0;
	margin-right: 10%;
	margin-top: 20px;
}

.profileImg_div {
	width: 400px;;
	height: 250px;
	/* border-style: solid; */
	margin: auto;
}

.profile_img {
	display: flex;
	justify-content: center;
	margin-top: 17px;
}

.photo_img {
	margin-top: 20px;
	width: 112px;
	height: 112px;
	border-radius: 50%;
}

.profileName_div {
	text-align: center;
	font-size: 26px;
	font-weight: 700;
	line-height: 32px;
	letter-spacing: -.67px;
	word-break: break-all;
}

.profileName_div .userNickName {
	font-size: 15px;
	line-height: 19px;
	color: #929294;
	word-break: break-all;
}

.profileList_div {
	width: 400px;
	height: 250px;
	/* border-style: solid; */
	margin: auto;
}

.profileList_ul {
	font-size: 19px;
	font-weight: 700;
	margin: 0;
	padding: 0;
	-webkit-text-size-adjust: none;
	list-style: none;
	display: block;
	margin-block-start: 1em;
	margin-block-end: 1em;
	margin-inline-start: 5px;
	margin-inline-end: 0px;
	padding-inline-start: 40px;
}

.profileList_li {
	text-align: left;
	font-size: 19px;
	line-height: 26px;
	font-weight: 400;
	letter-spacing: -1.18px;
	color: #303038;
	margin-top: 20px;
	font-weight: 700;
	color: #1e1e23;
}

.profileList_ul2 {
	font-size: 19px;
	font-weight: 700;
	line-height: 20px;
	letter-spacing: -.4px;
	/* color: #7b8994; */
	list-style: none;
	margin-block-start: 1em;
	margin-block-end: 1em;
	margin-inline-start: 5px;
	margin-inline-end: 0px;
	padding-inline-start: 40px;
}

.profileList_li2 {
	text-align: left;
	font-size: 19px;
	line-height: 26px;
	font-weight: 400;
	letter-spacing: -1.18px;
	color: #303038;
	margin-top: 20px;
	font-weight: 700;
	color: #1e1e23;
}

.userInfo {
	padding: 16px 17px 0;
	border-radius: 12px;
	box-shadow: 2px 2px 14px 0 rgba(0, 164, 73, .08);
	border: solid 1px rgb(243 118 45/ 80%);
	background-color: #fff;
	box-sizing: border-box;
	width: 650px;
	height: 240px;
	margin-bottom: 30px;
	margin-top: 5px;
}

.userPwd_title_h2 {
	display: inline;
	font-size: 18px;
	font-weight: 700;
	line-height: 24px;
	letter-spacing: -.2px;
	color: #303038;
}

.userPwd_block {
	margin-top: 5px;
	padding: 16px 17px 0;
	border-radius: 12px;
	box-shadow: 2px 2px 14px 0 rgba(0, 164, 73, .08);
	border: solid 1.5px rgb(243 118 45/ 80%);
	background-color: #fff;
	box-sizing: border-box;
	width: 650px;
	height: 66px;
}

.myProfile_photo {
	width: 100px;
	height: 30px;
}

.myProfile_account {
	font-size: 16px;
	line-height: 19px;
	color: #929294;
	margin-top: 5px;
}

.myProfile_account_name {
	font-size: 24px;
	font-weight: 700;
	line-height: 29px;
	letter-spacing: -.63px;
	color: #1e1e23;
	word-break: break-all;
}

.myProfile_ul {
	list-style: none;
	position: relative;
	display: table;
	table-layout: fixed;
	width: 100%;
	padding: 12px 0;
	margin-top: 0;
	margin-left: 13px;
}

.myProfile_li {
	float: left;
	display: table-cell;
	vertical-align: middle;
	margin-left: 20px;
}

.myInfo_ul {
	list-style: none;
}

.phone {
	width: 650px;
	height: 50px;
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
}

.subIndexEdit {
	font-size: 14px;
	font-weight: 500;
	line-height: 17px;
	letter-spacing: -.47px;
	color: #7b8994;
}

.pwdEdit {
	font-size: 15px;
	font-weight: bold;
}

.userPwd_block .item_text {
	font-size: 16px;
	font-weight: 500;
	line-height: 24px;
	letter-spacing: -.8px;
	color: #303038;
	word-break: break-all;
}

.myInfo_ul.subIndex_row {
	padding: 12px 0 12px 30px;
}

.exit_text {
	position: relative;
	display: inline-block;
	font-size: 15px;
	line-height: 24px;
	letter-spacing: normal;
	color: #767678;
}

a {
	text-decoration-line: none;
}

a:visited {
	text-decoration: none;
	color: black;
}

a:hover {
	text-decoration: none;
	color: #ff8a3d;
}

.guide_link li {
	display: inline-block;
	margin: 0;
	padding: 0;
}

.footer .guide_link .footer_text {
	font-size: 15px;
	line-height: 16px;
	letter-spacing: -.46px;
	color: #929294;
	vertical-align: top;
}

.dropdown {
	position: relative;
}

/* 비밀번호 모달 css */
.PwdForm {
	line-height: 14px;
	width: 356px;
	margin: 0 auto;
	padding: 32px 29px 32px;
	border: 1px solid #dadada;
	background: #fff;
	height: 500px;
}

.PwdForm_header {
	width: 356px;
	height: 105px;
	/* background-color: yellow; */
}

.PwdForm_header h2 {
	font-size: 20px;
	line-height: 22px;
}

.PwdForm_header_p {
	margin-top: 8px;
	padding-left: 5px;
	color: #666;
	font-size: 12px;
	margin-bottom: -3px;
}

.PwdForm_header_p em {
	color: #ff6020;
	font-style: normal;
}

.PwdForm_update {
	width: 356px;
	height: 175px;
	margin-top: -7px;
}

.PwdForm_update [class^=update_row1] {
	position: relative;
	height: 43px;
	border: 1px solid #ccc;
}

.PwdForm_update [class^=update_row1] input[type=password] {
	font-size: 14px;
	font-weight: 700;
	line-height: 16px;
	height: 16px;
	margin: 15px 9px 0;
	vertical-align: top;
	color: #333;
	border: 0;
}

.PwdForm_update .btn_area {
	margin-top: 31px;
	padding: 0;
}

.PwdForm_update .btn_area button {
	width: 100px;
	height: 40px;
	margin-top: 0;
	color: #fff;
	border: none;
	/* background: #ff8a3d; */
}

/* 모달 적용 css */

.modal-content {
	height: 800px;
	width: 600px;
}

.modal-Div {
	text-align: left;
	padding-left: 40px;
	padding-right: 40px;
	padding-top: 30px;
}

.PwdBanner{
	width: 400px;
	height: 50px;
}

.btnArea_new {
	display: block;
	text-align: center;
	height: 61px;
	width: 100%;
	height: 143px;
	margin-top: 30px;
}

.btn_item1 {
    width: 60px;
    height: 40px;
    float: left;
    text-align: center;
    /* border-radius: 20px; */
    /* vertical-align: middle; */
    padding: 19px 0 18px;
    border-radius: 5px;
    background-color: #959eae;
    margin-left: 110px;

}

.submit {
	width: 60px;
    height: 40px;
    float: right;
    text-align: center;
    /* border-radius: 20px; */
    /* vertical-align: middle; */
    padding: 19px 0 18px;
    border-radius: 5px;
    background-color: #ff8a3d;
    margin-right: 110px;
    border: none;

}

.btn_text {
	font-size: 17px;
	font-weight: 600;
	letter-spacing: -.5px;
	color: #fff;
} 
</style>


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

	<div>
		<h1>플랫폼 마이페이지 메인 헤더</h1>
		<hr>
	</div>

	<div class="myPageMain">


		<div class="leftArea">

			<div class="profileImg_div">
				<div class="profile_img">
					<a href="#" onclick="changeImage()" class="photo"> <img
						alt="대체이미지" src="image/img_user.jpg" class="photo_img"> <span
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

					<li class="profileList_li">
						<!-- <a href="group.do">나의 그룹 관리</a> -->
					</li>

					<li class="profileList_li">
						<a href="">나의 모임일정</a>
					</li>
					
					<li class="profileList_li">
						<a href="">친구 검색</a>
					</li>
					
				</ul>

				<ul class="profileList_ul2">
					
					<!-- 				
					<li class="profileList_li"
						style="border-top: 1px solid rgba(146, 146, 148, .3); padding-top: 20px; border-length: 100px;"><a
						href="platformaccountupdateform.do">계정관리/비밀번호변경</a>
					</li>
				    -->
					<li class="profileList_li2"
					style="border-top: 1px solid rgba(146, 146, 148, .3); padding-top: 20px; border-length: 100px;"
					>나의 문의내역<a href=""></a></li>
					<li class="profileList_li2">나의 신고내역<a href=""></a></li>
				</ul>
			</div>

			<footer class="footer" style="text-align: center;">
				<div class="footer_home"
					style="padding: 30px 0 40px; box-sizing: border-box;">
					<ul class="guide_link" style="list-style: none; display: block;">
						<li><a href=""> <span class="footer_text">로그아웃 ㅣ</span>
						</a></li>

						<li><a href=""> <span class="footer_text">고객센터 ㅣ</span>
						</a></li>

						<li><a href=""> <span class="footer_text">이용가이드</span>
						</a></li>
					</ul>

				</div>
			</footer>

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
									<img alt="대체이미지" src="image/img_user.jpg" class="photo_img"
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
							<li style="width: 650px; height: 30px;">
								<div class="subIndex_row phone" style="margin-bottom: 3px;">
									<span class="phoneNumber" name="us_tel" id="us_tel">${myProfile.us_tel }</span>
							</li>
							<li style="height: 30px;">
								<div class="subIndex_row email">
									<span class="myInfo_email" name="us_email" id="us_email">${myProfile.us_email }</span>
								</div>
							</li>
							<li>
								<div class="subIndex_row address">
									<span class="myInfo_addr" name="us_zipCode" id="us_zipCode">${myProfile.us_zipCode }</span><br>
									<span class="myInfo_addr" name="us_addr1" id="us_addr1">${myProfile.us_addr1 }</span>
									<span class="myInfo_addr" name="us_addr2" id="us_addr2">${myProfile.us_addr2 }</span>
									
									<button type="button" class="btn_edit" data-bs-toggle="modal" data-bs-target="#exampleModal1" style="float: right;">
									  <span class="subIndexEdit">수정</span>
									</button>
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
						</ul>

					</div>
					<%-- </c:forEach> --%>
					<ul class="myIndex"></ul>
				</div>
				<!-- 	</form> -->


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
						<div class="span"">
							<a href="">
								<span class="exit_text">회원 탈퇴 ></span>
							</a>
						</div>
					</a>
				</div>

			</div>

		</div>

	</div>
						<!-- 계정정보 수정 모달 -->
						<!-- Button trigger modal -->
						<!-- <button type="button" class="btn_edit" data-bs-toggle="modal" data-bs-target="#exampleModal1">
						  수정
						</button> -->
						
						<!-- Modal -->
						<div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
						  <div class="modal-dialog">
						    <div class="modal-content">
						      <div class="modal-header">
						        <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
						        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						      </div>
						      <div class="modal-body">
						        
						        
						        <!--  -->
						        
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
							<div class="thcell">프로필 사진</div>						
						</th>
						
							<td>
								<div class="tdcell">
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
					
					<!-- 
					<tr>
						<th scope="row">
							<div class="thcell">이메일</div>						
						</th>
							<td>
								<div class="tdcell">
									<p class="PAU_nickName">
										<input type="text" style="width: 178px;" name="us_Email1" id="us_Email1">
										@
	  									<input type="text" id="selboxDirect" name="selboxDirect">
										<select name="us_Email2" id="us_Email2" style="height: 29px; width: 160px;">
											<option selected="selected" value="naver">naver.com</option>
											<option value="daum">daum.net</option>
											<option value="hanmail">hanmail.net</option>
											<option value="nate">nate.com</option>
											<option value="gmail">gmail.com</option>
											<option value="direct">직접입력</option>
										</select>
									</p>
									<div class="PAU_profileImgBtn">
										<button type="button"  class="ImgBtn" id="PAU_profileImgBtn_button">닉네임 변경</button>
									</div>
								</div>
							</td>
					</tr>
					 -->
					
					<tr>
						<th scope="row">
							<div class="thcell">이메일</div>						
						</th>
							<td>
								<div class="tdcell">
									<p class="PAU_nickName">
										<input type="text" style="width: 178px;" name="us_Email1" id="us_Email1" value="${email }">
										<%-- <%= request.getAttribute("us_tel") %> --%>
										@
	  									<input type="text" id="selboxDirect" name="selboxDirect">
										<select name="us_Email2" id="us_Email2" style="height: 29px; width: 160px; margin-top: 5px;">
											<option selected="selected" value="naver">naver.com</option>
											<option value="daum">daum.net</option>
											<option value="hanmail">hanmail.net</option>
											<option value="nate">nate.com</option>
											<option value="gmail">gmail.com</option>
											<option value="direct">직접입력</option>
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
							<div class="thcell">핸드폰 번호</div>						
						</th>
							<td>
								<div class="tdcell">
									<p class="PAU_Tel">
										<select id="tel_Agency" style="width: 110px; height: 24px; margin-left: 19px; margin-right: 5px;">
											<option selected="selected" value="SKT">SKT</option>
											<option>KT</option>
											<option>LG U+</option>
											<option>SKT 알뜰폰</option>
											<option>KT 알뜰폰</option>
											<option>LG U+ 알뜰폰</option>
										</select>
										<select id="tel_First" name="tel_First" style="height: 24px; width: 60px; margin-top: 5px;">
											<option selected="selected" value="010">010</option>
											<option>011</option>
											<option>016</option>
											<option>017</option>
											<option>018</option>
											<option>019</option>
										</select>
										-
										<input type="text" style="width: 60px; height: 21px;"  name ="us_Tel1" id="us_Tel1"  value="${tel2 }">
										-
										<input type="text" style="width: 60px; height: 21px;" name ="us_Tel2" id="us_Tel2" value="${tel3 }">
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
							<div class="thcell" style="height: 50px;">주소</div>						
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
									<input type="text" id="sample6_postcode" placeholder="우편번호" name="us_zipCode" id="us_zipCode" value="${zipCode }">
									<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"
									style="margin-top: 5px; margin-left: 10px;"><br>
									<input type="text" id="sample6_address" placeholder="도로명 주소" name="us_addr1" id="us_addr1" value="${addr1 }"><br>
									<input type="text" id="sample6_detailAddress" placeholder="상세주소" name="us_addr2" id="us_addr2" value="${addr2 }" style="width: 300px;">
								</div>
								
							</td>
					</tr>
					
					<!--========  -->



					
					<!--========  -->
					
				</tbody>
			</table>
			
			
			</div>
			
			<div class="UpdateBtn_div" style="text-align: center; margin-top: 50px;">
				<button type="submit" class="UpdateBtn" >수정</button>				
				<button type="reset" class="UpdateBtn" style="width: 55px; height: 30px;"
				onclick="">취소</button>				
			</div>
		
		</form>
		
		
	
	
	</div>


</div>
						        
						        
						        
						        <!--  -->
						        
						      </div>
						      <div class="modal-footer">
						        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
						        <button type="button" class="btn btn-primary">Save changes</button>
						      </div>
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
							<div class="modal-dialog">
								<div class="modal-content" style="height: 500px; width: 480px;">
								
								<div class="modal-Div" style="height: 450px;">
								
								<div class="PwdBanner">
									<h2 style="color: #ff6020; font-weight: bold;" >우리만!</h2>
								</div>
								
									<div class="PwdForm_header">
										<h2 class="modal-title fs-5" id="exampleModalLabel">비밀번호 변경</h2>
										<p class="PwdForm_header_p">
											<em>대소문자 몇 개 어쩌구 사용하세요.</em>
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
												<a href="" class="btn_item1">
													<span class="btn_text">취소</span>
												</a>
												
													<button class="submit">
													<span class="btn_text">변경</span>
													</button>
											
											</div>

										</form>
									</div>
<!-- 
-->								</div>
								
								</div>
								
							</div>
						</div>
					</div>

</body>
</html>