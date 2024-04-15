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
<title>PlatformAccountUpdateForm.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">


<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<link rel="stylesheet" href="/Woori-man/css/PlatformMyPageMain2.css">

<script type="text/javascript">

	/* function go()
	{
		 alert("확인");

		var form = document.getElementById("PlatformAccountUpdateForm");
		
		form.submit();
		
	}
	*/
	
	
	$(function(){
	    //직접입력 인풋박스 기존에는 숨어있다가
	    $("#selboxDirect").hide();

	    $("#us_Email2").change(function() {
	        //직접입력을 누를 때 나타남
	        if($("#us_Email2").val() == "direct") {
	        $("#selboxDirect").show();
	        }  else {
	        $("#selboxDirect").hide();
	        }
	    }) 
	});
 
</script>
</head>



<body>

<header>
	<h1>플랫폼 계정정보 수정</h1>
</header>

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

</body>
</html>