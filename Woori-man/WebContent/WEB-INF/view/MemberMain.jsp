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
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/footer.css">
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<style type="text/css">




 
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
	
	var delCount = '${delCount}';
	var addCount = '${addCount}';
	
	if (delCount == 1 || addCount == 1)
	{
		$(".modal").modal("show");	
	}
	
	
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

//  즐겨찾기
function bookmark(gm_code, gb_code)
{
	$(location).attr("href", "bookmark.woori?gb_code=" + gb_code + "&gm_code=" + gm_code);
}


// 친구 삭제
function deleteFriends(fr_code, us_id)
{
	if (confirm(us_id + "님을 삭제 하시겠습니까?"))
	{
		$(location).attr("href", "deletefriend.woori?fr_code="+fr_code);
	}
}

// 친구 추가
function addFriends(us_code2)
{
	var us_id = $("#id").val();
	
	//alert(us_code2);
	//alert(us_id);
	
	if (confirm(us_id + "님을 친구추가 하시겠습니까?"))
	{
		$(location).attr("href", "addfriend.woori?us_code2="+us_code2);
	}
}



</script>


</head>
<body>
   


   
<div class="header">
	<c:import url="MemberHeader.jsp"></c:import>
</div>
<div class="top_bar">
	<div class="bar-item">
		<a href="">그룹</a>
	</div>
	<div class="bar-item">
		<a href="">히스토리</a>
	</div>
	<div class="bar-item">
		<a href="">친구</a>
	</div>
	<div class="bar-item">
		<a href="">쪽지</a>
	</div>
</div>
<div class="container top-con" >
	<div class=" row">
		<div class="left col-12 col-xl-1 col-xxl-1">
			<!-- 사이드바  -->	
			<c:import url="MemberMainSidebar.jsp"></c:import>
		</div>
			
		<div class="mid col-12 col-xl-7 col-xxl-7">
			<div class="friend">
				<h2>친구 검색</h2>
				<input type="text" id="friend" class="fr_txt txt" data-bs-toggle="modal" data-bs-target="#exampleModal"  data-bs-whatever="@mdo"  placeholder="아이디 / 닉네임 / 이름 " >
				<button type="button" class="fr_btn"  data-bs-toggle="modal" data-bs-target="#exampleModal"  data-bs-whatever="@mdo" ><i class="bi bi-search"></i></button>
			</div>
			<hr>
			
			
			<!-- 친구 찾기 모달 -->
			<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  	<div class="modal-dialog modal-lg">
			    	<div class="modal-content">
			      		<div class="modal-header">
			        		<h1 class="modal-title fs-5" id="exampleModalLabel">친구</h1>
			        		<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      		</div>
				      	<div class="modal-body">
				        	<form>
				        		<div class="msg_div">
				        			<span class="friend_msg">※친구 상태인 회원은 검색 결과에 반영되지 않습니다. </span>
				        		</div>
				        		<div>
			        				<label for="recipient-name" class="col-form-label modal-option">친구 검색</label>
			        			</div>
				          		<div class="mb-3 txt_top">
				            		<input type="text" class="form-control" id="shearchValue" name="shearchValue">
				            		<button type="button" class=" btn btn-primary findBtn"> 검색</button>
				          		</div>
				        	</form>
			        		<!-- 검색 결과 -->
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
					            	<div class="friend-title modal-option">친구 목록</div>
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
					            				<button type="button" class="deleteBtn" onclick="deleteFriends(${friends.fr_code}, '${friends.us_id }')"><i class="bi bi-trash"></i></button>
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
					<div class="group col-6 col-md-4 col-xl-3">
						<div class="gr_option">
							<div class="make_gr">
								<button class="createBtn" onclick="location.href='creategroupform.woori'"><i class="bi bi-plus-circle-fill"></i></button>
								<br>
								만들기
							</div>
						</div>
					</div>
						<c:forEach var="list" items="${groupList }">
							<div class="group col-6 col-md-4 col-xl-3">
								<form action="membermain.woori" method="post">  
									<div  class="gr_option" >
										<div class="gr_img">
											<img onclick="enterGroup(${list.cg_code})" src="https://mblogthumb-phinf.pstatic.net/MjAyMjAxMjVfMjAy/MDAxNjQzMTAyOTk2NjE0.gw_H_jjBM64svaftcnheR6-mHHlmGOyrr6htAuxPETsg.8JJSQNEA5HX2WmrshjZ-VjmJWqhmgE40Qm5csIud9VUg.JPEG.minziminzi128/IMG_7374.JPG?type=w800">
										</div>
										<div class="gr_name">
											<div class="explain" onclick="enterGroup(${list.cg_code})">							
												<span>그룹명 : ${list.cg_name }</span>
												<span class="group_count" >그룹원 : ${list.g_count }명</span>
											</div>
											<div class="bookmark_zone">
												<c:choose>
													<c:when test="${list.gb_code == 0 }">
														<span class="book-mark" onclick="bookmark(${list.gm_code}, ${list.gb_code})">
															<i  class="bookmark${list.cg_code} bi bi-bookmark-heart-fill"></i>
														</span>
													</c:when>
													<c:otherwise>
														<span class="book-markon" onclick="bookmark(${list.gm_code}, ${list.gb_code})">
															<i class="bookmark${list.cg_code} bi bi-bookmark-heart-fill"></i>
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
    		
    	<div class="right col-12 col-xl-3 col-xxl-3">
    		<div class="memProfile_zone">
        		<c:import url="MemberProfile.jsp"></c:import>
    		</div>
        	<div class="cal_zone" >
	    		<div class="wrapper calendar-wrapper" >
	    			<c:import url="MainCalendar.jsp"></c:import>
		    	</div>
	    	</div>
    	</div>
    </div>  
</div>
   
<div class="footer">
	<c:import url="MemberFooter.jsp"></c:import>
</div>   
   
    

</body>
</html>
    