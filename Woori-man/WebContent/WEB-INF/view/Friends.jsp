<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>친구관리 - 우리만!</title>
    
<!-- 부트스트랩 적용 CSS -->
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">

<!-- 부트스트랩 관련 스크립트 적용 JS -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- 제이쿼리 적용 JS -->
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>	

<!-- 부트스트랩 아이콘 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
	
<link rel="stylesheet" href="css/footer.css">
<link rel="stylesheet" href="css/friends.css">
    
    <script>
    	
    	$(function()
		{
    		$("#modal-btn").css("display", "none");
			$("#search").click(function()
			{
				var type = $("#type").val();
				var value = $("#value").val();
				
				if (value == "") 
				{
		            alert("검색어를 입력해주세요.");
		            return;
		        } 
				
				else
				{
					$("#modal-btn").click();
					
				}
				
				var param = "type=" + type + "&value=" + value; 
				//alert(type + ", " + value);
				
				$.ajax(
				{
					type: "GET"
					, url: "usersearch.woori"
					, data: param
					, success: function(args)
					{
						//alert("다녀옴");
						//alert(args);
						$("#modal-search-result").html(args);
						$("#messageModal1").modal("show");
					}
					
					, error: function(e)
					{
						alert(e.responseText);
					}
				});
				
			});
			
			
			$(".delete_btn").click(function()
			{
				//alert($(this).val());
				
				if(confirm("정말 삭제하시겠습니까?"))
				{
					$(location).attr("href", "frienddelete.woori?fr_code=" + $(this).val());
				}
			});
			
		});
    	
	</script>
</head>
<body>
<header>
	<c:import url="MemberHeader.jsp"></c:import>
</header>

<div><h1 class="nav justify-content-center" style="padding-top: 20px;">친구 관리</h1></div><br><hr>
<div class="container">
    <div class="row">
        <div class="col-md-4">
            <div class="friend-list">
                <div class="profile">
                	<div class="profile-title">내 프로필 <a class="profile-edit" href="user.woori"><i class="bi bi-gear"></i></a></div>
                	<div class="profile-info">
	                	<div class="profile-picture">
		                	<img src="${userDTO.us_profile == null ? 'images/basic-profile.png' : us_profile }">
	                	</div>
	                    <div class="profile-detail">
	                    	<div class="profile-user"><span id="profile-name">${userDTO.us_name }</span><span id="profile-id">(${userDTO.us_id })</span>
	                    	<span id="profile-code">#${userDTO.us_code }</span></div>
		                    <div class="profile-signup">가입일 : ${userDTO.us_signup }</div>
	                    </div>
                	</div>
                	<%-- 
                    <img src="${userDTO.us_profile }" alt="profile picture">
                     --%>
                   	<%-- 
                    <h3 class="myName">이름 : ${myProfile.us_name }</h3>
                    <h3 class="myName">ID : ${myProfile.us_id }</h3>
                    <h3 class="myName">가입일 : ${myProfile.us_signup }</h3>
                     --%>
                </div>
            </div>
        </div>
        
        <div class="col-md-8">
            <div class="search-container">
            	<select name="type" id="type">
            		<option selected="selected" value="1">아이디</option>
            		<option value="2">실명</option>
            		<option value="3">회원코드</option>
            	</select>
                <input type="text" class="search-input" placeholder="아이디, 실명, 회원코드로 친구를 검색하세요"
                id="value" name="value">
                <button type="button" class="bi bi-search" id="search"></button>
                <button type="button" id="modal-btn" data-toggle="modal" data-target="#messageModal1"></button>
                
            </div>
            <div class="friends">
                <h2>친구 목록 (${count } 명)</h2>
                <ul class="lists">
                	<c:forEach var="friend" items="${friendsList }">
                	<li>
                		<div class="friend-profile">
                			<div class="friend-picture">
		                		<img src="${friend.us_profile == null ? 'images/basic-profile.png' : friend.us_profile}" alt="profile picture">
                			</div>
                			<div class="friend-user">
                				<span class="friend-name">${friend.us_name }</span><span class="friend-id">(${friend.us_id })</span> <span class="friend-code">#${friend.us_code2 }</span> 
                			</div>
	                       </div>
	                    <div class="btns">
	                    	<div class="btns-btn">
			                    <button type="button" class="message_btn" 
			                    onclick="location.href='friendnotewriteform.woori?us_code2=${friend.us_code2}&fr_code=${friend.fr_code }&us_id=${friend.us_id }&us_name=${friend.us_name }'"><i class="bi bi-envelope"></i></button>
			                    <div class="friend-hover-text">쪽지전송</div>
	                    	</div>
	                    	<div class="btns-btn">
			                    <button type="button" class="delete_btn" value="${friend.fr_code }"><i class="bi bi-x-circle"></i></button>
			                    <div class="friend-hover-text">친구삭제</div>
	                    	</div>
                    	</div>
                	</li>
                	</c:forEach>
                    
                </ul>
            </div>
        </div>
    </div>
</div>

<div class="footer">
	<c:import url="MemberFooter.jsp"></c:import>
</div>


<div class="modal fade" id="messageModal1" tabindex="-1" aria-labelledby="messageModalLabel1" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title fs-5" id="messageModalLabel1">검색 결과</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                    </button>
                </div>
                <div class="modal-body">
                    <div class="card">
	            
	            <div class="card-body" id="modal-search-result">
	                
	                 <!-- <button type="button" class="btn plus_btn"
	                 onclick="location.href='friendadd.action'">친구추가</button> -->
	                <!-- <p class="card-text">보낸 날짜: 2024-02-06 10:30</p>
	                <p class="card-text">내용: ㅎㅇㅎㅇ</p> -->
	            </div>
	        </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>