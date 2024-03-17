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
<title>CreateGroupForm.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/createGroup.css">
<!-- 1. 부트스트랩 js -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<!-- 2. 부트스트랩 css -->
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
<!-- 제이쿼리 적용 JS -->
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<!-- 4. 부트스트랩 아이콘 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<!-- 제이쿼리 적용 JS -->
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="changeGroupInfo.js"></script>

</head>
<body>


<div class="header">
	<c:import url="MemberHeader.jsp"></c:import>
	
</div>
	<hr>

<!-- container -->
<div class="container content">
	<form id="createForm" action="groupupdate.woori" method="post">
	
	
		<!-- 그룹 이름 및 한 줄 소개 -->
		
		<div class="create_group">
			<p>우리만 그룹 수정</p>
		</div>
		
		
		<div class="make_title title">
			<label for="groupName">그룹 이름</label>
		</div>
		<div class="gp_name">
			<input type="text" id="cg_name" name="cg_name" class="txt Nametxt" value="${group.cg_name }" readonly="readonly"> 
		</div>
		
		<!-- 그룹 카테고리 (대) -->
		<div class="selectCoverDiv ">
			<div class="main_cover ">
				<span class="cover">
					<img src="https://coresos-phinf.pstatic.net/a/34g07i/1_9a3Ud018admxy2dv8suzge7_5ksoqj.png?type=cover_a640" 
					class="MainCover coverImg" 
					width="300" height="225" alt="">
				</span>
			</div>
			
			<div class="select_img" >
				<span style="font-size: small;"><br><br></span>
				
				<ul class="list">
					<li class="img_list_m">
						<span class="changeCover">
                    		<label for="cg_profile" class="labelAddPhoto">
                    		<i class="bi bi-camera-fill"></i><br>사진 추가
                    		<input type="file" class="imageUpload" id="cg_profile" name="cg_profile"  value="${group.cg_profile}">
                    		</label>
                    		
                   		 </span>
					</li>
					<li class="img_list">
						<button type="button" class="img_btn">
                                <img class="coverImg" src="https://cdn.pixabay.com/photo/2023/11/04/15/01/maple-8365123_1280.jpg" 
                                width="120" height="90" >
                                <span class="mask"></span>
                        </button>
					</li>
					<li class="img_list">
						<button type="button" class="img_btn">
                                <img class="coverImg" src="https://img.freepik.com/free-photo/interior-design-with-decorative-plant_23-2149551359.jpg?w=1380&t=st=1707835361~exp=1707835961~hmac=09b7fb0d3309e2e7f41030359a47a0d7ffb4f6382b7a1d37cbd8f90d541f4146" 
                                width="120" height="90" >
                                <span class="mask"></span>
                        </button>
					</li>
					<li class="img_list">
						<button type="button" class="img_btn">
                                <img class="coverImg" src="https://img.freepik.com/free-photo/still-life-of-minimalist-lifestyle_23-2149743899.jpg?w=1380&t=st=1707835409~exp=1707836009~hmac=a8c29057c32dea0ac2f396e92e161dea5b2474745b113ed73364d7383ae7aa33" 
                                width="120" height="90" >
                                <span class="mask"></span>
                        </button>
					</li>
					<li class="img_list">
						<button type="button" class="img_btn">
                                <img class="coverImg" src="https://img.freepik.com/free-photo/cyclist-riding-bicycle-in-nature_23-2150815947.jpg?w=1380&t=st=1707835450~exp=1707836050~hmac=e525e674c328a110ff7772c129a63749872490bff9514a390dccd8a792d406d9" 
                                width="120" height="90" >
                                <span class="mask"></span>
                        </button>
					</li>
					<li class="img_list">
						<button type="button" class="img_btn">
                                <img class="coverImg" src="https://img.freepik.com/free-photo/suitcase-luggage-baggage-for-summer-travel-and-vacation_185193-109605.jpg?w=1380&t=st=1707835510~exp=1707836110~hmac=50b1cd1666c6f5816c02671b42526a216c831b9389abf0ccce41e96dad8bd3f9" 
                                width="120" height="90" >
                                <span class="mask"></span>
                        </button>
					</li>
				</ul>
			</div>
		</div>
		
		
		<br><br>
		<div class="board_title title">
			<label for="brd_name">그룹 자유게시판 명</label>
		</div>
		<div class="board-div">
			<input type="text" id="brd_name" name="brd_name" class="txt boardtxt" 
			value="${group.brd_name }" required="required"> 
			
		</div>
		
		
		
		<div class="title_explain title">
			<label for="explain">그룹 한 줄 소개</label>
		</div>
		<div class="gp_explain">
			<input type="text" id="cg_intro" name="cg_intro" class="txt explaintxt" value="${group.cg_intro }"
			required="required"> 
		</div>
		
		
		
		<div class="container items">
			<div class="category_title">
				<h5 style="font-weight: bold;">그룹 카테고리를 선택해주세요.</h5>
			</div>
			<div class="select_category">
				<ul class="c_list">
				
					<li class="caseItem case1">
						<label for="gc_name1">
						<span class="iconUscase">
						<img src="https://coresos-phinf.pstatic.net/a/34g706/4_43aUd018adm1adsevax76pcx_5ksoqj.png" class="category_img hobby">
						</span>
						<input type="radio" id="gc_name1" name="gc_code" value="1" class="rdo">
						<em class="uscaseName">취미, 동호회</em>
						</label>
					</li>
					
					
					<li class="caseItem case2" >
						<label for="gc_name2">
						<span class="iconUscase">
						<img src="https://coresos-phinf.pstatic.net/a/34g7e5/i_435Ud018adm7w8aaporin40_5ksoqj.png" class="category_img family">
						</span>
						<input type="radio" id="gc_name2" name="gc_code" value="2" class="rdo">
						<em class="uscaseName">가족</em>
						</label>
					</li>
					
					
					<li class="caseItem case3">
						<label for="gc_name3">
						<span class="iconUscase">
						<img src="https://coresos-phinf.pstatic.net/a/34g792/3_134Ud018adm1l8521wdh493v_5ksoqj.png" class="category_img study">
						</span>
						<input type="radio" id="gc_name3" name="gc_code" value="3" class="rdo">
						<em class="uscaseName">스터디</em>
						</label>
					</li>
					
					<li class="caseItem case4">
						<label for="gc_name4">
						<span class="iconUscase">
						<img src="https://coresos-phinf.pstatic.net/a/34g715/a_435Ud018adm69t1lm36gsx2_5ksoqj.png" class="category_img shcool">
						</span>
						<input type="radio" id="gc_name4" name="gc_code" value="4" class="rdo">
						<em class="uscaseName">학교, 동아리</em>
						</label>
					</li>
					
					<li class="caseItem case5">
						<label for="gc_name5">
						<span class="iconUscase">
						<img src="https://coresos-phinf.pstatic.net/a/34g7c2/2_b39Ud018adm10byl2d02j8yt_5ksoqj.png" class="category_img team">
						</span>
						<input type="radio" id="gc_name5" name="gc_code" value="5" class="rdo">
						<em class="uscaseName">회사, 팀</em>
						</label>
					</li>
					
					<li class="caseItem case6">
						<label for="gc_name6">
						<span class="iconUscase">
						<img src="images/partnership.png" class="category_img friend">
						</span>
						<input type="radio" id="gc_name6" name="gc_code" value="6" class="rdo">
						<em class="uscaseName">취미, 동호회</em>
						</label>
					</li>
				</ul>
			</div>
		
		</div>
		
		<div class="G0_Create">
			<button type="button" class="create in" id="submitBtn" onclick="updateGroup()">변경하기</button>
			<button type="button" class="create out" onclick="location.href='entergroup.woori?cg_code=${cg_code}'">돌아가기</button>
		</div>
		
		<input type="hidden" id="cg_code" name="cg_code" value="${cg_code }">
		
	</form>
</div>


	


</body>
</html>


















