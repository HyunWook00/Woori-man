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
<title>Login.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/login.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/bootstrap.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<!-- 제이쿼리 적용 JS -->
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="js/login.js"></script>
</head>

<body>

<div class="container">
  <div class="screen">
    <div class="screen__content">
    
      <form action="login.woori" class="login" method="post" id="loginForm">
        <div class="login__field">
          <i class="login__icon fas fa-user"></i>
          
          <input type="text" id="id" name="id" class="login__input" placeholder="User Id">
          
        </div>
        <div class="login__field">
          <i class="login__icon fas fa-lock"></i>
          
          <input type="password" id="pwd" name="pwd" class="login__input" placeholder="Password">
          
        </div>
        <button type="button" class="button login__submit" id="loginBtn">
          <span class="button__text">LogIn</span>
          <i class="button__icon fas fa-chevron-right"></i>
        </button>  
        
        <div class="find">
      	  <a href="idfindform.woori" class="">ID</a> 
          <a href="pwdfindform.woori" class="">Password</a>  
          <a href="membershipform.woori" class="">Sign up</a>
      	</div>
             
      </form>
      
      
      
      <div class="social-login">
        <h3>Only Our</h3>
      </div>
    </div>
    <div class="screen__background">
      <span class="screen__background__shape screen__background__shape1"></span>
    </div>    
  </div>
</div>

</body>
</html>
























































