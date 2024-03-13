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
<title>자주 묻는 질문(FAQ) - 우리만</title>
<link rel="stylesheet" href="<%=cp%>/css/font.css">
<link rel="stylesheet" href="<%=cp%>/css/memberHeader.css">
<!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://getbootstrap.com/docs/5.3/assets/css/docs.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
 -->
 
<!-- 1. 부트스트랩 js -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<!-- 2. 부트스트랩 css -->
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
<!-- 3. jquery -->
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<!-- 4. 부트스트랩 아이콘 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<style type="text/css">

	* {
		text-align: center;
		font-family: 라인Seed;
		font-weight: bold;
		font-size: 15pt;
	}
	
	input {
		width: 50%;
		height: 40pt;
		border-radius: 15px;
		border: solid 2px #ff8a3d;
		font-size: 15pt;
	}
	
	.search {
		position: relative;
	}
	
	.search button {
		position: absolute;
		color: #ff8a3d;
		left: 72%;
		top: 9px;
		background: none;
		border: none;
	}
	
	.accordion
	{
		margin-left: auto;
		margin-right: auto;
		width: 70%;
	}

	.answer
	{
		text-align: left;
		font-family: 맑은 고딕;
		font-weight: bold;
		font-size: 11pt;
		background-color: #d5d5d540;
	}


	.accordion-button:not(.collapsed)
	{
		background-color: #ff8000;
		color: white;
	}
		/* 검색어 css */
	#searchList
	{	
		border: 2px solid #ff8000;
	    width: 50%;
	    position: absolute;
	    font-weight: bold;
	    color: #343;
	    display: none;
	    background-color: white;
	    margin-left: 25%;
	    z-index: 1;
	}
 	#searchList a	
 	{
		padding: 2px;
	    text-decoration: none;
	    color: #343;
	    font-size: 20px;
	} 
	#searchList #footer
	{
		height: 14px;
		background-color: #DDD;
		text-align: right;
		padding: 5px;
		font-size: small;
	}
		

.bi-search 
{
	font-size: 20pt;
}

hr 
{
	margin-left: auto;
	margin-right: auto;
	width: 70%;
	height: 30%;
}


.g-col-2 
{
	font-size: 15pt;
}

.more 
{
	color: black;
	text-decoration: none;
	text-align: right;
	margin-right: 16%;
}

/* footer CSS */
.footer
 {
	width: 100%;
	text-align: center;
}

.footer a 
{
	padding: 20px;
	margin: 10px;
}
</style>
<script type="text/javascript">

	function faqSelect(fc_code)
	{
		window.location.href="faq.woori?fc_code="+fc_code;
	}

</script>
<script type="text/javascript" src="js/searchFaq.js"></script>

</head>
<body>

<!-- 임시 헤더 영역 -->
<div>
	<br>
	<c:import url="MemberHeader.jsp"></c:import>
	<hr />
</div>

<div>
	<br>
	<h1>자주 묻는 질문</h1>
	<br>
	<div class="search">
		<input type="search" id="searchFaq" placeholder="궁금하신 내용을 검색해주세요." />
		<button type="button"><i class="bi bi-search"></i></button>
		<br><br><br>
	</div>
	<div id="searchList">
	</div>
	<hr />
	<div class="grid text-center">
		<div class="g-col-2 g-start-3 faqselect1" onclick="faqSelect(1)">회원</div>
		<div class="g-col-2 faqselect2"  onclick="faqSelect(2)">친구</div>
		<div class="g-col-2 faqselect3"  onclick="faqSelect(3)">그룹</div>
		<div class="g-col-2 faqselect4"  onclick="faqSelect(4)">모임</div>
		<div class="g-w-100"></div>
		<div class="g-col-2 g-start-3 faqselect5" onclick="faqSelect(5)">경고</div>
		<div class="g-col-2 faqselect6" onclick="faqSelect(6)">신고</div>
		<div class="g-col-2 faqselect7" onclick="faqSelect(7)">포인트</div>
		<div class="g-col-2 faqselect8" onclick="faqSelect(8)">기타</div>
	</div>
	<hr />

	<div class="accordion" id="accordionExample">
      <div class="accordion-item">
        <h2 class="accordion-header">
        <c:forEach var="faqList" items="${faqList }">
       		<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#${faqList.faq_code }" aria-expanded="false" aria-controls="${faqList.faq_code }">
         		${faqList.faq_title }
         	</button>
	        </h2>
	        <div id="${faqList.faq_code }" class="accordion-collapse collapse" data-bs-parent="#accordionExample" style="">
	          <div class="accordion-body answer">
	            ${faqList.faq_content }
	          </div>
	        </div>
        </c:forEach>
        </div>
     </div>
        <!-- 
          <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
           Q. 회원 탈퇴 후 재가입이 가능한가요?
          </button>
         
      <div class="accordion-item">
        <h2 class="accordion-header">
          <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
          Q. 회원 정보를 수정하고 싶어요.
          </button>
        </h2>
        <div id="collapseTwo" class="accordion-collapse collapse" 
        data-bs-parent="#accordionExample">
          <div class="accordion-body answer">
            <strong>A. 마이페이지에서 수정하세요.</strong><br>
			회원정보를 수정하고 싶으세요? 어쩌구 저쩌구를 통해서 수정해보세요.
			수정하러 바로가기
          </div>
        </div>
      </div>
      <div class="accordion-item">
        <h2 class="accordion-header">
          <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" 
          data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
           Q. 로그인이 안돼요.
          </button>
        </h2>
        <div id="collapseThree" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
          <div class="accordion-body answer">
            <strong>A. 아이디/비밀번호 확인 고~ 회원가입도 했니?</strong><br>
			회원가입이 안될때는 어쩌구 저쩌구를 확인하고 이러쿵 저러쿵 한번 해보세요.
          </div>
        </div>
      </div>
      <div class="accordion-item">
        <h2 class="accordion-header">
          <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" 
          data-bs-target="#collapse4" aria-expanded="false" aria-controls="collapse4">
           Q. 질문 내용이 또 뭐가 있을까...
          </button>
        </h2>
        <div id="collapse4" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
          <div class="accordion-body answer">
            <strong>A. 주요 답변</strong><br>
			답변 설명
          </div>
        </div>
      </div>
      <div class="accordion-item">
        <h2 class="accordion-header">
          <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" 
          data-bs-target="#collapse5" aria-expanded="false" aria-controls="collapse5">
           Q. 지금 핫도그 먹는중 감자 핫도그도 먹고 싶다.
          </button>
        </h2>
        <div id="collapse5" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
          <div class="accordion-body answer">
            <strong>A. 주요 답변</strong><br>
			답변 설명
          </div>
        </div>
      </div>
      <div class="accordion-item">
        <h2 class="accordion-header">
          <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" 
          data-bs-target="#collapse6" aria-expanded="false" aria-controls="collapse6">
           Q. 회원 탈퇴 시 개인정보는 모두 삭제되나요?
          </button>
        </h2>
        <div id="collapse6" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
          <div class="accordion-body answer">
            <strong>A. 회원탈퇴 시점에 고객님의 개인정보는 완전 삭제되어 재가입 하여도 확인이 불가합니다. </strong><br>
			답변 설명 <br>
			<br>
			단, 상법 및 전자상거래 등에서의 소비자 보호에 관한 법률 등 관련법령에 의하여 아래와 같이 거래 관련 권리 의무 관계의 확인 등을 이유로 일정기간 보유하여야 할 필요가 있을 경우에는 정해진 기간 동안 보유 후 파기합니다.
			<br><br>
			<strong>거래 관련 보유 기간</strong><br>
			• 계약 또는 청약철회 등에 관한 기록: 5년 <br>
			• 대금 결제 및 재화 등의 공급에 관한 기록: 5년 <br>
			• 소비자의 불만 또는 분쟁에 관한 기록: 3년 <br>
			 <br>
			<strong> 회원탈퇴 시 유의사항 </strong>
			<br>
			- 회원탈퇴 시 모든 회원정보와 할인쿠폰, 통합포인트, 마일리지, 교환권, 교보캐시, 이벤트 교보 e캐시, 구매내역이 자동으로 삭제 처리되며, 복구가 불가합니다.
			<br>
			- 자동 삭제 항목(복구 불가능)
			<br>
			  : 회원정보, 상품구매, eBook 콘텐츠, 할인쿠폰, 마일리지, 통합포인트, 예치금, 교보e캐시 등의 모든 내역
			<br>
			- 회원 아이디에 대해서는 서비스 이용의 혼선 방지, 법령에서 규정하는 회원 거래 정보의 보존 기간 동안의 보관 의무의 이행, 기타 안정적인 서비스 제공을 위하여 필요한 정보이므로 탈퇴 후 동일 아이디로의 재가입은 허용되지 않습니다.
          </div>
        </div>
      </div>
      <div class="accordion-item">
        <h2 class="accordion-header">
          <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" 
          data-bs-target="#collapse7" aria-expanded="false" aria-controls="collapse7">
           Q. 10개씩 페이지 생각중입니다.
          </button>
        </h2>
        <div id="collapse7" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
          <div class="accordion-body answer">
            <strong>A. 주요 답변</strong><br>
			같은게 반복이라 일단 여기서는 여기까지
        -->
      <br>
      <a>◀ 1 2 3 ▶</a>
    </div>



<br>
<br>
<br>
<br>


<br>
<br>
<br>

	<!-- footer 영역 추후 임포트 -->
	<div class="footer col-xs-12 col-sm-12 col-md-12">
		<footer>
			<br> <a>이용약관</a> <a>개인정보처리방침</a> <a>우리만 정책</a> <a>고객센터</a> <a>
				ⓒ 우리만</a>
		</footer>
	</div>
	<br>

</body>
</html>