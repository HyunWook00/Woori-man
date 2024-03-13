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
<title>고객센터 - 우리만</title>
<%-- <link rel="stylesheet" href="<%=cp%>/css/memberHeader.css">
<!-- <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"> -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<!-- <script type="text/javascript" src="js/bootstrap.min.js"></script> --> --%>

<link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
<link rel="stylesheet" href="<%=cp%>/css/font.css">
<link rel="stylesheet" href="<%=cp%>/css/memberHeader.css">

<!-- 1. 부트스트랩 js -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<!-- 2. 부트스트랩 css -->
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
<!-- 3. jquery -->
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<!-- 4. 부트스트랩 아이콘 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<style type="text/css">



<style type="text/css">

	*
	{
		text-align: center; 
		font-family: 라인Seed;
		font-weight: bold;
	}
	
	input
	{
		width: 50%;
		height: 40pt;
		border-radius: 15px;
		border: solid 2px #ff8000;
		font-size: 15pt;
	}
	
	.search
	{
		position: relative;
		height: 42px;
	}
	
	.search button
	{
		position: absolute;
   		color: #ff8000;
    	left: 72%;
    	top: 9px;
   		background: none;
   		border: none;
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
	
	
	h3
	{
		margin-left: 15%;
		text-align: left;
	}
	

	.simple
	{
		height: 35pt;
		text-align: left;
		padding: 10px;
		margin-left: 27%;
		
	}
	
	#qna h3
	{
		height: 35pt;
		text-align: left;
		margin-left: 28%;
	}
	
	.g-col-2
	{
		font-size: 15pt;
	}

	.inquiry 
	{
		border: solid 1px #F2F2F2;
		border-radius: 5px;
		padding: 20px;
		margin-left: 18%;
		background-color: #F2F2F2;
		
	}

	.inquiry a
	{
		font-size: 15pt;
		text-decoration: none;
		color: gray;
		
	}
	
	.inquiry i
	{
		font-size: 25pt;
		padding: 20px;
		text-align: center;
		color: gray;
	}
	
	.notices, .qnaList
	{
		padding: 15px;
		height: 35pt;
		text-align: left;
		margin-left: 15%;
		width: 70%;
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
		width:100%;
		text-align: center;
		
	}
	
	.footer a
	{
		padding: 20px;
		margin: 10px;
	}
	
	.input-group-addon + .input-group-addon{position:relative;}
	.input-group-addon + .input-group-addon:before{
	    content: '';
	    display: block;
	    width: 1px;
	    height: 70%;
	    background: #939393;
	    position: absolute;
	    top: 22px;
	    left: 0;
	}
	
	.faqselect:focus
	{
		color : #ff8000;
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
		
	.report
	{
	    background-color: #f2f2f2;
	    padding: 21px;
	    width: 170px;
	    margin-left: 72px;
	    border-radius: 5px
	}
	
	.report a 
	{
	    color: gray;
	    text-decoration: none;
	    font-size: 20px;
	}
	
	.report i
	{
		color: gray;
		font-size: 25pt;
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
	
	
	
</style>
<script type="text/javascript" src="<%=cp %>/js/searchFaq.js"></script>
<script type="text/javascript">
	
	// 자주 묻는 질문 카테고리 클릭시 실행되는 함수
	function faqSelect(fc_code)
	{	
		window.location.href="cs.woori?fc_code="+fc_code;
	}
	
	/* js 파일로 분리 완료  */
	/* function searchFaqList()
	{
		
		//alert("함호");
		
		// 검색어를 담을 변수
		var searchKeyword = document.getElementById("searchFaq").value;
		
		//alert(searchKeyword);
		
		
		// 서버로 전송하기 전 유효성 검사 ====================================================
		
		// ① 검색어가 존재할 경우에만 서버로 전송할 수 있도록 처리
		if(searchKeyword.replace(" ","")=="")	
		{
			document.getElementById("searchList").style.display = "none";
			return;
		}	
			
		// ② 입력된 검색어가 완성형 한글일 경우에만 
		//	  검색 키워드를 전송할 수 있도록 처리
		//    정규표현식 사용
		var regEx = /^[가-힣]{1,}$/;
		
		if(regEx.test(searchKeyword))
		{
			return;
		}	
		
		//URL 구성
		var url = "searchfaqlist.woori";
		
		ajax = createAjax();
		
		ajax.open('GET',url,true);
		ajax.onreadystatechange = function()
		{
			if (ajax.readyState == 4 && ajax.status == 200)
			{
				// 수행 업무
				callback();
			}
		};
		
		ajax.send("");			
	}  */
	
	/* // 수행 업무
	function callback()
	{
		
		var doc = responseXML;
		
		// 루트 엘리먼트
		var root = doc.documentElement;
		
		// 루트 하위 엘리먼트
		var faqList = root.getElementByTagName("faqList");
		
		// 뿌려질 장소 초기화
		document.getElementById("searchList").innerHTML = "";
		
		for(var i=0; i<faqList.length; i++)
		{
			var faq = faqList[i].firstChild.nodeValue;
			
			document.getElementById("searchList").innerHTML 
			+= "<div class = 'searchFqaList'>"+ faq +"</div>";
		}	

		document.getElementById("searchList").style.display="inline-block";
		
	}
	 */
</script>

</head>
<body>

<!-- 헤더 영역 -->
<div>
	<br>
	<c:import url="MemberHeader.jsp"></c:import>
	<hr />
</div>

<div>
<br><br>
	<h2>
	<span style="color: #ff8a3d;">우리만</span> 고객센터입니다.<br>
	무엇을 도와드릴까요?
	</h2>
	<br>
</div>
<div class="search">
	<input type="search" id="searchFaq" placeholder="궁금하신 내용을 검색해주세요." />
	<button type="button"><i class="bi bi-search"></i></button>
	<br><br><br>
</div>
<div id="searchList">
</div>

<h3>자주 묻는 질문</h3>
<hr />
<div class="grid text-center" >
		<div class="g-col-2 g-start-3 faqselect" onclick="faqSelect(1)">회원</div>
		<div class="g-col-2 faqselect"  onclick="faqSelect(2)">친구</div>
		<div class="g-col-2 faqselect"  onclick="faqSelect(3)">그룹</div>
		<div class="g-col-2 faqselect"  onclick="faqSelect(4)">모임</div>
		<div class="g-w-100"></div>
		<div class="g-col-2 g-start-3 faqselect" onclick="faqSelect(5)">경고</div>
		<div class="g-col-2 faqselect" onclick="faqSelect(6)">신고</div>
		<div class="g-col-2 faqselect" onclick="faqSelect(7)">포인트</div>
		<div class="g-col-2 faqselect" onclick="faqSelect(8)">기타</div>
</div>
<hr />

<div class="accordion" id="accordionExample">
	<c:forEach var="faqList" items="${faqList }">
		<div class="accordion-item">
        	<h2 class="accordion-header">
	        	<button class="accordion-button collapsed" type="button" data-bs-toggle="${faqList.faq_code }" 
	        	data-bs-target="#${faqList.faq_code }" aria-expanded="false" aria-controls="collapseTwo">
	        	${faqList.faq_title }
	        	</button>
        	</h2>
        	<div id="${faqList.faq_code }" class="accordion-collapse collapse" 
        	data-bs-parent="#accordionExample">
	        	<div class="accordion-body answer">
	        	${faqList.faq_content }
	        	</div>
        	</div>
        </div>
	</c:forEach>
</div>

<br><br> 
<br><br>

<div class="grid text-center">
    <div class="g-col-3 g-start-2">
		<div id="qna">
			<h3>간단하게 해결하기</h3>
			<ul class="list-group">
		 		<li class="list-group-item simple">이용 가이드</li>
		  		<li class="list-group-item simple">아이디 / 비밀번호 찾기</li>
		 		<li class="list-group-item simple">내 회원정보 수정</li>
			</ul>
		</div>
    </div>
    <div class="g-col-3">
    	<div>
		<h3> 1:1 문의 </h3>
			<div class="row row-col-2 input-group">
				<div class="col inquiry input-group-addon">
					<a href="inquiryinsertform.woori">
						<i class="bi bi-chat-left-text"></i>
						<p>1:1 문의 접수</p>
					</a>
				</div>
				<div class="col inquiry input-group-addon">
					<a href="inquirylist.woori"> 
						<i class="bi bi-file-earmark-text"></i>
						<p>1:1 문의 내역</p>
					</a>
				</div>
			</div> <!-- end row row-col-2 -->
		</div>
  </div>
    <div class="g-col-3">
    	<div>
		<h3> 신고 </h3>
				<div class="col report">
					<a href="reportlist.woori"> 
						<i class="bi bi-megaphone"></i>
						<p>신고 내역</p>
					</a>
				</div>
		</div>
  </div>
  
  
  
</div>

<br><br>
<br><br>


<div>
	<h3>공지사항</h3>
	<hr>
	<ol class="list-group list-group-numbered">
	<a class="more" href="noticeslist.woori">더보기 > </a>
	<c:forEach var="noticesTitle" items="${noticesTitle }">
		<li class="list-group-item notices">${noticesTitle.nf_title }</li>
	</c:forEach>
	<!--   	
	<li class="list-group-item notices">개인정보 관련 정책</li>
  	<li class="list-group-item notices">플랫폼 규칙</li>
  	<li class="list-group-item notices">그 외 공지 등등</li>
  	 -->
	</ol>
</div>

<br><br><br>

<!-- footer 영역 추후 임포트 -->
<div class="footer col-xs-12 col-sm-12 col-md-12">
	<footer>
		<br> 
		<a>이용약관</a> <a>개인정보처리방침</a> <a>우리만 정책</a> <a>고객센터</a> <a> ⓒ 우리만</a>
	</footer>
</div>
<br>

</body>
</html>