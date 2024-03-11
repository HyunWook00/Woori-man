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
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/membership.css">
<link rel="stylesheet" href="css/sweetalert2.min.css">
<style type="text/css">


</style>
<!-- 정규표현식  -->
<script src="js/util.js"></script>
<!-- 카카오 우편 js -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- sweetalert -->
<script src="js/sweetalert2.min.js"></script> 
<!-- 제이쿼리 적용 JS -->
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">


	// 아이디 중복확인 ajax 처리 부분
	$(document).ready(function()
	{
		
		$(".checkBtn").click(function()
		{
			
			
			var us_id = $("#us_id").val();
			var params = "us_id="+us_id;
			
			
			 $.ajax({
		            type: "GET"
		            , url: "idcheck.woori"
		            , data: params
		            , success: function(args)
					{
		            	if (args == 0)
						{
		            		Swal.fire({
			            		  title: "Good job!",
			            		  text: "사용 가능한 아이디입니다. ",
			            		  icon: "success"
			            		});
						}
		            	else if (args == 1)
		            	{
		            		Swal.fire({
		            			  icon: "error",
		            			  title: "Oops...",
		            			  text: "이미 사용중인 아이디 입니다.",
		            			});
		            	}
					}
			 		, beforeSend: checkId
			 		, error: function(e)
					{
						alert(e.responseText);
					}
		           
		        });		
		});
		
		
		$(".telBtn").click(function()
		{
			var us_tel1 = $("#us_tel1").val();
			var us_tel2 = $("#us_tel2").val();
			var params = "us_tel1=" + us_tel1 + "&us_tel2=" + us_tel2;
			
			
			 $.ajax({
		            type: "GET"
		            , url: "telcheck.woori"
		            , data: params
		            , success: function(args)
					{
		            	if (args == 0)
						{
		            		Swal.fire({
			            		  title: "Good job!",
			            		  text: "본인인증이 완료되었습니다. ",
			            		  icon: "success"
			            		});
						}
		            	else if (args == 1)
		            	{
		            		Swal.fire({
		            			  icon: "error",
		            			  title: "Oops...",
		            			  text: "이미 가입된 전화번호 입니다.",
		            			});
		            	}
					}
			 		, beforeSend: checkTel
			 		, error: function(e)
					{
						alert(e.responseText);
					}
		           
		        });		
		});

		
		
		
	});
	
	
	// 전화번호 확인 ajax 처리 이전 체크사항
	function checkTel()
	{
		var flag = true;
		
		// 입력한 중간, 뒤 번호의 길이가 각각 4가 아니라면 flase 반환 
		if ($.trim($("#us_tel1").val()).length != 4 || $.trim($("#us_tel2").val()).length != 4)
		{
			Swal.fire(
			{
				  title: "정확이 입력하셨나요?",
				  text: "올바른 전화번호를 입력해주세요.",
				  icon: "info"
			});
			flag = false;
		}
		return flag;
		
	}
	
	// 우편번호 스크립단
	function sample6_execDaumPostcode() 
	{
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById("us_zipcode").value = data.zonecode;
                document.getElementById("us_addr1").value = addr + extraAddr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("us_addr2").focus();
            }
        }).open();
    }
	
	
 	function checkInfo()
	{
		
		$("#userForm").submit();
	}
		
	
	
	
	

</script>


</head>
<body>

<div class="container">
      <div class="member-container">
        <div class="header">
          <div>회원 가입을 위해</div>
          <div>정보를 입력해주세요</div>
        </div>
        
        <div class="user-info">
        <form action="membership.woori" method="post" id="userForm">
          <div class="user-info-id ">
            	<div class="idtxt">* 아이디</div>
            <div>	
            <input type="text" id="us_id" name="us_id" value=""  class="idtext">
            <button type="button" class="checkBtn" >중복확인</button>
            </div>
          </div>
          <div class="user-info-pw">
            <div>* 비밀번호</div>
            <input type="password" id="us_pwd" name="us_pwd">
          </div>
          <div class="user-info-pw-check">
            <div>* 비밀번호 확인</div>
            <input type="password" id="pwd2" name="pwd2">
          </div>
          <div class="user-info-name">
            <div>* 이름</div>
            <input type="text" id="us_name" name="us_name" />
          </div>
          <div class="user-info-birthday">
          	<div>* 생년월일</div>
          	<div class="teldiv">
          	<input class="txtbirth1" type="text" id="us_birthday" name="us_birthday"> 
          	- <input class="txtbirth2" type="text"  id="us_birthday2"> &nbsp; * &nbsp; * &nbsp; * &nbsp; * &nbsp; * &nbsp; *
          	</div>  
          </div>
          <div class="user-info-lunar">
          	<div>* 양·음력</div>
          	<input type="radio" value="0" class="lunar"  id="us_lunar1" name="us_lunar">양력 
          	<input type="radio" value="1" class="lunar" id="us_lunar2" name="us_lunar">음력
          </div>
          
          
           <div class="user-info-tel">
          	<div>* 전화번호</div>
          	<input class="teltxt1" type="text" value="010" readonly="readonly"> -
          	  <input class="teltxt" type="text" id="us_tel1" name="us_tel1"> -
          	  <input class="teltxt" type="text" id="us_tel2" name="us_tel2"> 
          	  <button type="button" class="telBtn">본인인증</button>
          </div>
          <div class="user-info-email">
            	<div>* 이메일</div>
           		<input type="email" id="us_email" name="us_email">
          </div>
          <div class="user-info-addr">
           		<div>* 주소</div>
       	 		<!-- <input type="text" id="us_addr" name="us_addr"> -->
       	 		<input type="text" class="zipcodetxt" id="us_zipcode" name="us_zipcode" placeholder="우편번호">
				<input type="button" class="addrBtn"  onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
				<input type="text" id="us_addr1" name="us_addr1" placeholder="주소"><br>
				<input type="text" id="us_addr2" name="us_addr2" placeholder="상세주소">
          </div>
          
          </form>
        </div>
        
        
        <div class="agree-check">
          <input type="checkbox" name="checkbox" value="1" /> 이용약관 개인정보 수집 및 이용, 마케팅 활용
          선택에 모두 동의합니다.
        </div>
        <div class="btn">
          <button type="button" onclick="checkInfo()">가입하기</button>
        </div>
      </div>
      
    </div>

</body>
</html>
























































