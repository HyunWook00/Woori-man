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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<link rel="stylesheet" href="css/sweetalert2.min.css">
<!-- 정규표현식  -->
<script src="js/util.js"></script>
<!-- 카카오 우편 js -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- sweetalert -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<!-- 제이쿼리 적용 JS -->
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="js/membership.js"></script>

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
          <input type="checkbox" id="agree" name="checkbox" value="1" /> 이용약관 개인정보 수집 및 이용, 마케팅 활용
          선택에 모두 동의합니다.
        </div>
        <div class="btn">
          <button type="button" onclick="checkInfo()">가입하기</button>
        </div>
      </div>
      
    </div>

</body>
</html>
























































