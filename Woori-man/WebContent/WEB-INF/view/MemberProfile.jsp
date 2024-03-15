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
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/MemberProfile.css">
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<style type="text/css">



</style>
<!-- 제이쿼리 적용 JS -->
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">



</script>


</head>
<body>
	<div class="card  profile_card" >
		<div class="card-body text-center">
            <div class="mt-3 mb-4 ">
              <img src="https://i.namu.wiki/i/7saHRlH_KjVEOEMwky9mR_mTpdz-u1GUy7jRuwDFmS2kEVJTfoMEOy7X-ciLCrzOqGXdu-TlgaJO_TVMOgXHLg.webp"
                class="rounded-circle img-fluid" style="width: 100px; height: 100px; border: 1px solid #dee2e6;" />
            </div>
            
            <div>
            <h5 class="mb-2">${userDTO.us_name } <img src="https://oopy.lazyrockets.com/api/v2/notion/image?src=https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Ff5d7b9d3-6faa-4fbd-92fb-abc13883f4ac%2Fkakao.png&blockId=845a0760-d543-46ae-965d-018c4289eb32&width=256" 
             class="log_Api kakao_log profile_img"  /></h5>
            </div>
        
            
            <div class="prof_info">
            
	            <div class="prItem userId " >
	            	<i class="bi bi-person-fill bis"></i>
	            <div class="hover-text">회원 아이디</div>
	            	<span class="infoItem">${userDTO.us_id }</span>
				</div>
				            
	            <div class="prItem code">
	           	 	<i class="bi bi-upc-scan bis"></i>
	            <div class="hover-text">회원 코드</div>
	            	<span class="infoItem">${userDTO.us_code }</span>
	            </div>
				
				<div class="prItem joinDay">            
	            	<i class="bi bi-clipboard-check bis"></i>
	             <div class="hover-text">가입일</div>
	            	<span class="infoItem">${userDTO.us_signup }</span>
	            </div>
	            	</div>
	            <br>
            
            <div class="prof_btn row">
            	<div class="p_change col-6"  >
            		<button type="button" class="btn btn-primary btn-rounded btns ">
             		  Profile
           			</button>
            	</div>
            	<div class="logout col-6">
	            	<button type="button" class="btn btn-secondary btn-rounded  btns" onclick="location.href='logout.woori'">
	             	Logout
	            	</button>
            	</div>
            </div>
          </div>
		</div>

</body>
</html>
























































