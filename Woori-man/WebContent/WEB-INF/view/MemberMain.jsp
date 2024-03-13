<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	String code = (String)session.getAttribute("code");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멤버 메인</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/MemberMain.css">
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<style type="text/css">


.tbl
{
    width: 100% !important;
    text-align: center;
}

 
</style>

 <!-- 부트스트랩 js -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script> 
<!-- 제이쿼리 적용 JS -->
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

function enterGroup(cg_code)
{
	//alert("확인");
	
	// 그룹 코드를 잘 받아오는지 확인
	//alert(cg_code);
	
	$(location).attr("href", "entergroup.woori?cg_code="+cg_code);
	
	
}


//친구 찾기 ajax 처리
$(document).ready(function()
{
	$(".findBtn").click(function()
	{
		
		var shearchValue = $("#shearchValue").val();
		var params = "shearchValue="+shearchValue;
		
		
		 $.ajax({
	            type: "GET"
	            , url: "findfriends.woori"
	            , data: params
	            , success: function(args)
				{
	            	document.getElementById("searchTable").innerHTML = args;
				}
		 		, error: function(e)
				{
					alert(e.responseText);
				}
	           
	        });		
	});
	
});

function bookmark(gm_code, gb_code)
{
	$(location).attr("href", "bookmark.woori?gb_code=" + gb_code + "&gm_code=" + gm_code);
}



function deleteFriends(fr_code, us_id)
{
	if (confirm(us_id + "님을 삭제하시겠습니까?"))
	{
		$(location).attr("href", "deletefriend.woori?fr_code="+fr_code);
	}

}




</script>


</head>
<body>
   


   
<div class="header">
		<c:import url="MemberHeader.jsp"></c:import>
</div>
<br><br>
<div class="top_bar">
	<div>
		<a href="">그룹</a>
	</div>
	<div>
		<a href="">그룹</a>
	</div>
	<div>
		<a href="">그룹</a>
	</div>
	<div>
		<a href="">그룹</a>
	</div>
	<div>+
		<a href="">그룹</a>
	</div>
</div>
   
  <br><br><br><br>
<div class="container" >
	
	<div class=" row">
	
		<div class="left col-12 col-md-2">	
			<div class="menus_area sticky">
				<div class="sub_area">
					<div class="menu_option"><img src="images/111.png" class="menu_img" />프로필</div>
					<div class="menu_option"><img src="" class="menu_img" />그룹</div>
					<div class="menu_option"><img src="images/history.png" class="menu_img" />히스토리</div>
					<div class="menu_option"><img src="images/meeting.png" class="menu_img" />모임</div>
					<div class="menu_option"><img src="images/add_user.png" class="menu_img" />친구</div>
					<div class="menu_option"><img src="images/letter.png" class="menu_img" />쪽지</div>
					<div class="menu_option"><img src="images/.png" class="menu_img" />일정</div>
				</div>
			</div>
		</div>
		
		<div class="off">
				<button class="btn btn-primary" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasTop" aria-controls="offcanvasTop">버튼!</button>

				<div class="offcanvas offcanvas-top" tabindex="-1" id="offcanvasTop" aria-labelledby="offcanvasTopLabel">
				  <div class="offcanvas-header">
				    <h5 class="offcanvas-title" id="offcanvasTopLabel"></h5>
				    <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
				  </div>
				  <div class="offcanvas-body">
				   <p class="menu_list" style="color: #ff8000; font-weight: bold; margin-top: 10px;">우리만</p>
				<hr>
				<ul class="" >
					<li><a href="" class="m_menu">프로필</a></li>
					<li><a href="" class="m_menu">그룹</a></li>
					<li><a href="" class="m_menu">히스토리</a></li>
					<li><a href="" class="m_menu">모임</a></li>
					<!-- <li><a href="" class="m_menu">친구</a></li> -->
					<li><a href="" class="m_menu">일정</a></li>
				</ul>
				<p style="font-weight: bold;">플랫폼</p>
				<ul class="" >
					<li><a href="" class="p_menu">공지사항</a></li>
					<li><a href="" class="p_menu">이용약관</a></li>
					<li><a href="" class="p_menu">활동정책</a></li>
					<li><a href="" class="p_menu">문의</a></li>
					<li><a href="" class="p_menu">도움말</a></li>
					<li><a href="" class="p_menu">개발자</a></li>
				</ul>
				<p style="font-weight: bold;">부가기능</p>
				<ul class="" >
					<li><a href="" class="p_menu">친구</a></li>
					<li><a href="" class="p_menu">쪽지</a></li>
					<li><a href="" class="p_menu">1:1 문의</a></li>
					<li><a href="" class="p_menu">신고</a></li>
					<li><a href="" class="p_menu">FAQ</a></li>
				</ul>
			  </div>
			</div>
			</div>
		<div class="mid col-12 col-md-7">
			<div class="friend">
				<h2>친구 검색</h2>
				<hr>
				<input type="text" id="friend" class="fr_txt txt" data-bs-toggle="modal" data-bs-target="#exampleModal"  data-bs-whatever="@mdo"  placeholder="아이디 / 닉네임 / 이름 " >
				<button type="button" class="fr_btn"  data-bs-toggle="modal" data-bs-target="#exampleModal"  data-bs-whatever="@mdo" ><i class="bi bi-search"></i></button>
			</div>
			
			
			<!-- 친구 찾기 모달 -->
			<!-- <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo">친구</button> -->

			<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog modal-lg">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h1 class="modal-title fs-5" id="exampleModalLabel">친구</h1>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <div class="modal-body">
			        <form>
			        	<label for="recipient-name" class="col-form-label">친구 검색:</label>
			          <div class="mb-3 txt_top">
			            <input type="text" class="form-control" id="shearchValue" name="shearchValue">
			            <button type="button" class=" btn btn-primary findBtn"> 검색</button>
			          </div>
			        </form>
			        
			        <!-- <div>검색 결과</div> -->
			        <div id="friendResult">
			        	<table  id="searchTable" class="table tbl"> 
		            		<tr>
		            			<th>회원코드</th>
		            			<th>아이디</th>
		            			<th>이름</th>
		            			<th>친구추가</th>
		            		</tr>
		            		<tr id="searchFriends">
		            			<td colspan="4">
		            				회원코드 또는 아이디 또는 이름으로 검색 해주세요.
		            			</td>
		            		</tr>
		            	</table>
			        </div>
			        
			        
			        <div class="mb-3" >
			            <div class=" result-title ">
			            	<div class="friend-title"><h3>친구 목록</h3></div>
			            	<table class="table tbl"> 
			            		<tr>
			            			<th>회원코드</th>
			            			<th>아이디</th>
			            			<th>이름</th>
			            			<th>삭제</th>
			            		</tr>
			            		<c:forEach var="friends" items="${friendsList }">
			            		<tr id="result-info">
			            			<td>${friends.us_code2 }</td>
			            			<td>${friends.us_id }</td>
			            			<td>${friends.us_name }</td>
			            			<td>
			            				<button type="button" class="deleteBtn" onclick="deleteFriends(${friends.fr_code}, '${friends.us_id }')">
			            					<i class="bi bi-trash"></i></button>
			            			</td>
			            		</tr>
			            		</c:forEach>
			            	</table>
			            </div>
			       </div>
			      </div>
			       
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
			      </div>
			    </div>
			  </div>
			</div>
			
			
			<div class="my_gr">
				<h2>내 그룹</h2>
				<hr>
				
				<div class="group_list row">
				
					<div class="group col-6 col-md-6 col-lg-4">
						<div class="gr_option">
							<div class="make_gr">
								<button onclick="location.href='creategroupform.action'"><i class="bi bi-plus-circle-fill"></i></button>
								<br>
								만들기
							</div>
						</div>
					</div>
					
					
					
					<c:forEach var="list" items="${groupList }">
							<div class="group col-6 col-md-6 col-lg-4">
								<form action="membermain.action">  
									<div  class="gr_option" >
									<div class="gr_img">
										<img onclick="enterGroup(${list.cg_code})" src="https://mblogthumb-phinf.pstatic.net/MjAyMjAxMjVfMjAy/MDAxNjQzMTAyOTk2NjE0.gw_H_jjBM64svaftcnheR6-mHHlmGOyrr6htAuxPETsg.8JJSQNEA5HX2WmrshjZ-VjmJWqhmgE40Qm5csIud9VUg.JPEG.minziminzi128/IMG_7374.JPG?type=w800">
									</div>
									<div class="gr_name">
										<div class="explain" onclick="enterGroup(${list.cg_code})">							
											<span>그룹명 : ${list.cg_name }</span>
										</div>
										<div class="bookmark_zone">
											
											<c:choose>
												<c:when test="${list.gb_code == 0 }">
													<span class="group_count" >그룹원: ${list.g_count }명</span>
													<span class="book-mark" onclick="bookmark(${list.gm_code}, ${list.gb_code})">
													<i  class="bookmark${list.cg_code} bi bi-bookmark-heart-fill"></i>
													</span>
												</c:when>
												<c:otherwise>
													<span class="group_count" >그룹원: ${list.g_count }명</span>
													<span class="book-mark" onclick="bookmark(${list.gm_code}, ${list.gb_code})">
													<i  style= "color: #ff8000 !important; " class="bookmark${list.cg_code} bi bi-bookmark-heart-fill"></i>
													</span>
												</c:otherwise>
												
											</c:choose>
											
										</div>
									</div>
									</div>
								</form>
							</div>
							
							
					</c:forEach>
					
				
				</div>
				
				
			</div>
		
	      
    </div>
    
    <div class="right col-12 col-md-3">
    	<div class="card " >
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
	            <button type="button" class="btn btn-secondary btn-rounded  btns" onclick="location.href='logout.action'">
	             Logout
	            </button>
            	</div>
            	
            </div>
            
          </div>
          
        </div>
        
        
        <div class="cal_zone" style="border-radius: 15px; box-shadow: 0px 0px 2px 1px #70767b inset, 3px 3px 3px 3px #dee2e6;">
	    	<div class="wrapper calendar-wrapper col-12" >
	    		<c:import url="cal.jsp"></c:import>
		    </div>
	    </div>
	    
	    
    </div>
    
    
    </div>  
      
    
    
    	<div>
    	<br />
    	<br />
    	<br />
    	<br />
    	<br />
    	<br />
    	<br />
    	<br />
    	<br />
    	<br />
    	<br />
    	<br />
    	<br />
    	<br />
    	<br />
    	<br />
    	<br />
    	<br />
    	<br />
    	</div>
  </div>  
    
 

  

</body>
</html>
    