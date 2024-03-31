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
<%-- <link rel="stylesheet" type="text/css" href="<%=cp %>/css/MemberMain.css"> --%>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/createGroup.css">
 
<!-- 1. 부트스트랩 js -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<!-- 2. 부트스트랩 css -->
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
<!-- 제이쿼리 적용 JS -->
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<!-- 4. 부트스트랩 아이콘 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<script type="text/javascript" src="js/createGroupForm.js"></script>
<script type="text/javascript">

$(function()
{
	var photo;
	var allowedTypes = ['image/jpeg', 'image/png', 'image/gif']; // 허용된 이미지 파일 형식들
	
	$("#cg_profile").change(function()
	{
		photo = this.files[0];
		if (!photo)
		{
		   $('.MainCover').attr('src', photo_path);
          	return;
		}
		
		if (allowedTypes.indexOf(photo.type) === -1) {
            alert('이미지 파일만 업로드 가능합니다.');
            // 파일 선택 초기화
            $('#cg_profile').val('');
            return;
        }
		
		 //이미지 미리보기 처리
        var reader = new FileReader();
        reader.readAsDataURL(photo);

        reader.onload = function(){
            $('.MainCover').attr('src', reader.result);
        };
		
	});
	
	
	$(".coverImg").click(function()
	{
		//alert(this.getAttribute("src")); // images 명 확인
		selImg = this.getAttribute("src"); // 바꾼 이미지의 src
		//alert(selImg);
		
		// selImg로 번경
		$('.MainCover').attr('src', selImg);
		$('#cg_profile').val(selImg);
		
		alert($('#cg_profile').val());
	});
	
	
	
});

</script>




</head>
<body>


<div class="header">
	<c:import url="MemberHeader.jsp"></c:import>
	
</div>
	<hr>

<!-- container -->
<div class="container content">
	<form id="createForm" action="creategroup.woori" method="post">
	
	
		<!-- 그룹 이름 및 한 줄 소개 -->
		
		<div class="create_group">
			<p>우리만 그룹 개설</p>
		</div>
		
		
		<div class="make_title title">
			<label for="groupName">그룹 이름</label>
		</div>
		<div class="gp_name">
			<input type="text" id="cg_name" name="cg_name" class="txt Nametxt" placeholder="그룹 이름 입력" required="required"> 
		</div>
		
		<!-- 그룹 카테고리 (대) -->
		<div class="selectCoverDiv ">
			<div class="main_cover ">
				<span class="cover">
					<img src="images/cg_woori.png" 
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
                    		<input type="file" class="imageUpload" id="cg_profile" name="cg_profile" >
                    		</label>
                    		
                   		 </span>
					</li>
					<li class="img_list">
						<button type="button" class="img_btn">
                                <img class="coverImg" src="images/cg_car.jpg" 
                                width="120" height="90" >
                                <span class="mask"></span>
                        </button>
					</li>
					<li class="img_list">
						<button type="button" class="img_btn">
                                <img class="coverImg" src="images/cg_fall.jpg" 
                                width="120" height="90" >
                                <span class="mask"></span>
                        </button>
					</li>
					<li class="img_list">
						<button type="button" class="img_btn">
                                <img class="coverImg" src="images/cg_health.jpg" 
                                width="120" height="90" >
                                <span class="mask"></span>
                        </button>
					</li>
					<li class="img_list">
						<button type="button" class="img_btn">
                                <img class="coverImg" src="images/cg_trip.jpg" 
                                width="120" height="90" >
                                <span class="mask"></span>
                        </button>
					</li>
					<li class="img_list">
						<button type="button" class="img_btn">
                                <img class="coverImg" src="images/cg_sea.jpg" 
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
			placeholder="공백 시 '자유 게시판'으로 등록됩니다.(추후 수정 가능)" > 
			
		</div>
		
		
		
		<div class="title_explain title">
			<label for="explain">그룹 한 줄 소개</label>
		</div>
		<div class="gp_explain">
			<input type="text" id="cg_intro" name="cg_intro" class="txt explaintxt" placeholder="그룹 소개 글을 입력해주세요."
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
						<img src="https://coresos-phinf.pstatic.net/a/34g74c/6_i33Ud018admmxp6bu88rerd_5ksoqj.png" alt="" class="category_img friend">
						</span>
						<input type="radio" id="gc_name6" name="gc_code" value="6" class="rdo">
						<em class="uscaseName">학부모</em>
						</label>
					</li>
				</ul>
			</div>
			
		
		</div>
		
		<div class="G0_Create">
			<button type="button" class="create in" id="submitBtn">그룹개설</button>
			<button type="button" class="create out" onclick="location.href='membermain.woori'">돌아가기</button>
		</div>
		
		
		
	</form>
</div>


	


</body>
</html>
























































