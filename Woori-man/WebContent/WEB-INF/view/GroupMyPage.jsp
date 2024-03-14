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
<title>마이페이지</title>
<!-- 
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
 -->
<!-- 다음 주소 js -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/font.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/groupMypage.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/footer.css">

<!-- 1. 부트스트랩 js -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<!-- 2. 부트스트랩 css -->
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
<!-- 3. jquery -->
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<!-- 4. 부트스트랩 아이콘 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<style type="text/css">


	
</style>
<script type="text/javascript">
	
	// 내 정보 변경을 눌렀을 때 호출되는 함수 (display 변경)
	function updateFormMyInfo()
	{
	 	var myInfo =  document.getElementById("myInfo");
	 	var updateInfo = document.getElementById("updateMyInfo");
	 	
	 	myInfo.className = "myPage_MyInfo";
	 	updateInfo.className = "myPage_MyInfo active";
	}
	
	// 계정 정보 변경을 눌렀을 때 호출되는 함수 (display 변경)
	function updateAccoountFormInfo()
	{
	 	var myAccoountInfo =  document.getElementById("myAccoountInfo");
	 	var updateAccoountInfo = document.getElementById("updateMyAccoountInfo");
	 	
	 	myAccoountInfo.className = "myPage_AccountInfo";
	 	updateAccoountInfo.className = "myPage_AccountInfo active";
	}
		
	// 우편번호 및 주소를 입력해주는 함수
	function execDaumPostcode()
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
                if(data.userSelectedType === 'R')
                {
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
                    if(extraAddr !== '')
                    {
                        extraAddr = ' (' + extraAddr + ')';
                    }
                } 
                else 
                {
                	extraAddr = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById("postcode").value = data.zonecode;
                document.getElementById("address").value = addr + extraAddr;
                
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailAddress").value="";
                document.getElementById("detailAddress").focus();
            }
        }).open();
	}
	
		$(function()
			{
				$("#updateMyInfo").click(function()
				{
					//alert($("#iqc_code").val());
				});
				
			});
	
	
</script>
</head>
<body>
<c:import url="MemberHeader.jsp"></c:import>
<c:import url="GroupHeader.jsp"></c:import>
<div>

<div class="sideBar">
	 <c:import url="GroupSideBar.jsp" ></c:import>
</div>
<div class="myPage">
<div class="d-flex align-items-start">
		<div class="myPage_side">
			<div class="nav flex-column nav-pills me-3" id="v-pills-tab" role="tablist" aria-orientation="vertical">
				<p><img src="<%=cp %>/images/cat3.jpg" alt="프로필 사진" /></p>
				<p>${groupMyInfo.gm_nickname }</p>
				    <button class="nav-link groupMyNav active" id="myPageMain-tab" data-bs-toggle="tab" data-bs-target="#myPageMain" 
				    type="button" role="tab" aria-controls="myPageMain" aria-selected="true" tabindex="-1">내 정보</button>
				    <button class="nav-link groupMyNav" id="myPageContent-tab" data-bs-toggle="tab" data-bs-target="#myContent" 
				    type="button" role="tab" aria-controls="myContent" aria-selected="false" tabindex="-1">내가 쓴 글</button>
				  
				    <button class="nav-link groupMyNav" id="myMetting-tab" data-bs-toggle="tab" data-bs-target="#myMetting" 
				    type="button" role="tab" aria-controls="myMetting" aria-selected="false" tabindex="-1">모임 일정</button>
				  <span><a href="">로그아웃</a><a href="cs.woori">고객센터</a></span>
			</div>
		</div>
		<div class="tab-content">
		<div class="tab-pane fade in active show mytab" id="myPageMain" role="tabpanel" aria-labelledby="myPageMain-tab" tabindex="0">
			<h3>내 정보</h3>
			<div class="myPage_MyInfo active" id="myInfo">
				<div>
					<p> <span class="header">프로필 사진 </span>
						<img alt="프로필 사진" src="<%=cp %>/images/cat3.jpg">
					</p>
				</div>
				<div>
					<p><span class="header">닉네임</span> <span class="body">${groupMemberDTO.gm_nickname }</span></p>
				</div>
				<div>
					<p><span class="header">상태메세지</span> <span class="body">${groupMemberDTO.gm_intro } </span></p>
				</div>
				<div>
					<p>
						<span class="header">그룹가입일</span> <span class="body">${groupMemberDTO.gm_regdate }</span>
						<button type="button" class="mybtn" onclick="updateFormMyInfo()">정보 변경</button>				
					</p>
				</div>
			</div>
			<div class="myPage_MyInfo" id="updateMyInfo">
			<form action="mypageupdate.woori" method="GET" id="updateMyForm">
				<div>
					<p> <span class="header">프로필 사진 </span>
						<img alt="프로필 사진" src="<%=cp %>/images/${groupMemberDTO.gm_profile }">
						<input type="file" name="gm_profile"/>
					</p>
				</div>
				<div>
					<p><span class="header">닉네임</span><span class="body"><input type="text" name="gm_nickname" value="${groupMemberDTO.gm_nickname }" placeholder="닉네임을 변경하세요!"/></span></p>
				</div>
				<div>
					<p><span class="header">상태메세지</span> <span class="body"><input type="text" name="gm_intro" value="${groupMemberDTO.gm_intro }" placeholder="상태메세지를 변경하세요" /> </span></p>
				</div>
				<div>
					<p>
						<span class="header">그룹가입일</span> <span class="body">${groupMemberDTO.gm_regdate }</span>
						<button type="submit" class="mybtn" id="updateMyInfo" >변경하기</button>				
						<button type="button" class="mybtn" onclick="location.href='groupmypage.woori'">취소</button>				
					</p>
				</div>
			</form>
			</div>
			<hr />						
				<h3>계정 정보</h3>
				<div class="myPage_AccountInfo active" id="myAccoountInfo">
				<div>
					<p> <span class="header">프로필 사진 </span>
						<img alt="프로필 사진" src="<%=cp %>/images/${myInfo.us_profile }">
					</p>
				</div>
				<div>
					<p><span class="header">아이디</span><span class="body">${myInfo.us_id }</span></p>
				</div>
				<div>
					<p><span class="header">이름</span><span class="body">${myInfo.us_name }</span></p>
				</div>
				<div>
					<p><span class="header">이메일</span><span class="body">${myInfo.us_email }</span></p>
				</div>
				<div>
					 <p><span class="header">전화번호</span><span class="body">${myInfo.us_tel }</span></p>
				</div>
				<div>
					 <p><span class="header">주소</span><span class="body">[${myInfo.us_zipcode}] ${myInfo.us_addr1} ${myInfo.us_addr2}</span></p>
				</div>
				<div>
				<p>
					<span class="header">비밀번호</span>	
					<button class="mybtn pwdbtn">변경</button>
					<button class="mybtn" onclick="updateAccoountFormInfo()">정보 변경</button>			
				</p>
				</div>
				</div>
				<div class="myPage_AccountInfo" id="updateMyAccoountInfo">
				<form action="userprofileupdate.woori">
				<div>
					<p> <span class="header">프로필 사진 </span>
						<img alt="프로필 사진" src="img/${myInfo.us_profile }">
						<input type="file" name="us_profile"/>
					</p>
				</div>
				<div>
					<p><span class="header">아이디</span><span class="body">${myInfo.us_id }</span></p>
				</div>
				<div>
					<p><span class="header">이름</span><span class="body">${myInfo.us_name }</span></p>
				</div>
				<div>
					<p><span class="header">이메일</span><span class="body"><input type="text" name="us_email" value="${myInfo.us_email }" 
					    placeholder="이메일을 입력해주세요"/></span></p>
				</div>
				<div>
					 <p><span class="header">전화번호</span><span class="body"><input type="text" name="us_tel" value="${myInfo.us_tel }"
					 placeholder="전화번호를 입력해주세요(- 제외)"/></span></p>
				</div>
				<div>
					 <p><span class="header">주소</span><span class="body">
						 <input type="text" id="postcode" name="us_zipcode" placeholder="우편번호" value="${myInfo.us_zipcode}">
						 <input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
					 <div id="addr">
						 <input type="text" id="address" name="us_addr" placeholder="주소" value="${myInfo.us_addr1}"><br>
						 <input type="text" id="detailAddress" name="us_addr2" placeholder="상세주소" value="${myInfo.us_addr2 }">
					 </div>
					 </span>
					 </p>
				</div>
				<div>
				<p>
					<span class="header">비밀번호</span>	
					<button class="mybtn pwdbtn">변경</button>
					<button type="submit" class="mybtn" id="updateAccoountInfo">변경하기</button>		
					<button type="button" class="mybtn" onclick="location.href='groupmypage.woori'">취소</button>	
				</p>
				</div>
				</form>
				</div>
			</div>
	    <div class="tab-pane fade in mytab" id="myContent" role="tabpanel" aria-labelledby="myPageContent-tab"" tabindex="0">
		<div class="Mycontent">
		<div>
    		<nav class="nav nav-tabs reporttab" role="tablist">
    			<div class="nav nav-tabs reporttab" id="nav-tab" role="tablist">
				    <button class="nav-link active" id="nav-allBodrd" data-bs-toggle="tab" data-bs-target="#allBoard" 
				    type="button" role="tab" aria-controls="allBoard" aria-selected="true">전체</button>
				    <button class="nav-link" id="nav-regularBoard" data-bs-toggle="tab" data-bs-target="#regularBoard" 
				    type="button" role="tab" aria-controls="regularBoard" aria-selected="false">정기모임</button>
				    <button class="nav-link" id="nav-impromptuBoard" data-bs-toggle="tab" data-bs-target="#impromptuBoard" 
				    type="button" role="tab" aria-controls="impromptuBoard" aria-selected="false">번개모임</button>
				    <button class="nav-link" id="nav-history" data-bs-toggle="tab" data-bs-target="#historyBorad" 
				    type="button" role="tab" aria-controls="historyBorad" aria-selected="false">히스토리</button>
				    <button class="nav-link" id="nav-board" data-bs-toggle="tab" data-bs-target="#board" 
				    type="button" role="tab" aria-controls="board" aria-selected="false">자유게시판</button>
				</div>
			</nav>	
			  <div class="tab-content" id="nav-tabContent">
				  <div class="tab-pane fade show active" id="allBoard" role="tabpanel" aria-labelledby="nav-allBodrd">
					<table class="table table-hover">
	  					<tr>
	  						<th>글번호</th>
	  						<th>제목</th>
	  						<th>조회수</th>
	  						<th>작성일</th>
	  					</tr>
	  					<c:forEach var="regularBoard" items="${regularBoard }">
		  					<tr>
		  						<td>${regularBoard.mt_code }</td>
		  						<td>${regularBoard.mt_title }</td>
		  						<td> - </td>
		  						<td>${regularBoard.mt_date }</td>
		  					</tr>
		  				</c:forEach>
	  				</table>
				  </div>
				  <div class="tab-pane fade" id="regularBoard" role="tabpanel" aria-labelledby="nav-regularBoard">
					<table class="table table-hover">
	  					<tr>
	  						<th>글번호</th>
	  						<th>제목</th>
	  						<th>조회수</th>
	  						<th>작성일</th>
	  					</tr>
	  					<c:forEach var="regularBoard" items="${regularBoard }">
		  					<tr>
		  						<td>${regularBoard.mt_code }</td>
		  						<td>${regularBoard.mt_title }</td>
		  						<td> - </td>
		  						<td>${regularBoard.mt_date }</td>
		  					</tr>
		  				</c:forEach>
	  				</table>
				  </div>
				  <div class="tab-pane fade" id="impromptuBoard" role="tabpanel" aria-labelledby="nav-impromptuBoard">
					<table class="table table-hover">
	  					<tr>
	  						<th>글번호</th>
	  						<th>제목</th>
	  						<th>조회수</th>
	  						<th>작성일</th>
	  					</tr>
	  					<c:forEach var="impromptuBoard" items="${impromptuBoard }">
		  					<tr>
		  						<td>${impromptuBoard.mt_code }</td>
		  						<td>${impromptuBoard.mt_title }</td>
		  						<td> - </td>
		  						<td>${impromptuBoard.mt_date }</td>
		  					</tr>
	  					</c:forEach>
	  				</table>
				  </div>
				  <div class="tab-pane fade" id="historyBorad" role="tabpanel" aria-labelledby="nav-history">
					<table class="table table-hover">
	  					<tr>
	  						<th>글번호</th>
	  						<th>제목</th>
	  						<th>조회수</th>
	  						<th>작성일</th>
	  					</tr>
	  					<c:forEach var="historyBorad" items="${historyBorad }">
		  					<tr>
		  						<td>${historyBorad.his_code }</td>
		  						<td>[ ${historyBorad.mt_title } ] 모임의 ${historyBorad.gm_nickname }님이 작성한 히스토리입니다.</td>
		  						<td>${historyBorad.his_view } </td>
		  						<td>${historyBorad.his_date }</td>
		  					</tr>
	  					</c:forEach>
	  				</table>
				  </div>
				  <div class="tab-pane fade" id="board" role="tabpanel" aria-labelledby="nav-board">
					<table class="table table-hover">
							<tr>
		  						<th>글번호</th>
		  						<th>제목</th>
		  						<th>조회수</th>
		  						<th>작성일</th>
		  					</tr>
	  					<c:forEach var="board" items="${board }">
		  					<tr>
		  						<td>${board.brd_code } </td>
		  						<td> ${board.brd_subject }</td>
		  						<td> ${board.brd_view } </td>
		  						<td>${board.brd_date }</td>
		  					</tr>
	  					</c:forEach>
	  				</table>
				  </div>
			</div>
		</div> <!-- reportContent -->
	</div> <!-- Mycontent -->	
			
		</div>
	    <div class="tab-pane fade in mytab" id="myMetting" role="tabpanel" aria-labelledby="myMetting-tab" tabindex="0">
	    	<div class="MeetingCalender">
	    		<c:import url="MyPageCalendar.jsp"></c:import>   	
		    </div>
		</div>
	</div>
</div>

</div>

<!-- 푸터 영역 -->
<div class="footer">
<c:import url="MemberFooter.jsp"></c:import>
</div>


</body>
</html>