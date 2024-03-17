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
<title>AdminLogin.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/login.css">
<!-- 1. 부트스트랩 js -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<!-- 2. 부트스트랩 css -->
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
<!-- 4. 부트스트랩 아이콘 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<!-- 제이쿼리 적용 JS -->
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="js/adminLogin.js"></script>

</head>

<body>

<div class="container">
  <div class="screen">
    <div class="screen__content">
    
      <form action="adminlogin.woori" class="login" method="post" id="loginForm">
        <div class="login__field">
          <i class="login__icon fas fa-user"></i>
          
          <input type="text" id="ad_code" name="ad_code" class="login__input" placeholder="User Id">
          
        </div>
        <div class="login__field">
          <i class="login__icon fas fa-lock"></i>
          
          <input type="password" id="ad_pwd" name="ad_pwd" class="login__input" placeholder="Password">
          
        </div>
        <button type="button" class="button adminLogin" id="loginBtn">
          <span class="button__text">LogIn</span>
          <i class="button__icon fas fa-chevron-right"></i>
        </button>  
        
        <div class="find">
          <a href="pwdfindform.woori" class="">Password</a>  
      	</div>
             
      </form>
      
      
      <div class="social-admin">
      	 <h5>Admin</h5>
      </div>
      <div class="social-login">
        <h3>Only Our</h3>
      </div>
    </div>
    <div class="screen__background">
      <span class="screen__background__shape screen__background__shape11"></span>
    </div>    
  </div>
</div>

</body>
</html>
























































