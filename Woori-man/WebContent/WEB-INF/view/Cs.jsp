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
<link rel="stylesheet" href="<%=cp%>/css/cs.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/footer.css">

<!-- 1. 부트스트랩 js -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<!-- 2. 부트스트랩 css -->
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
<!-- 3. jquery -->
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<!-- 4. 부트스트랩 아이콘 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

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
<div class = "more" onclick="location.href='faq.woori'">더보기 ▶</div>
<div class="accordion" id="accordionExample">
 <c:forEach var="faqList" items="${faqList }">
  <div class="accordion-item">
    <h2 class="accordion-header">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse_${faqList.faq_code }" aria-expanded="false" aria-controls="${faqList.faq_code }">
        ${faqList.faq_title }
      </button>
    </h2>
    <div id="collapse_${faqList.faq_code }" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        ${faqList.faq_content }
      </div>
    </div>
  </div>
</c:forEach>
</div>



<%-- <div class="accordion" id="accordionExample">
	<c:forEach var="faqList" items="${faqList }">
		<div class="accordion-item">
		    <h2 class="accordion-header">
		      <button class="accordion-button" type="button" data-bs-toggle="${faqList.faq_code }" data-bs-target="#${faqList.faq_code }" aria-expanded="false" aria-controls="${faqList.faq_code }">
		        ${faqList.faq_title }
		      </button>
		    </h2>
		    <div id="${faqList.faq_code }" class="accordion-collapse ${faqList.faq_code }" data-bs-parent="#accordionExample">
		      <div class="accordion-body">
		       ${faqList.faq_content }
		      </div>
		    </div>
	   </div>
	</c:forEach>
</div> --%>
  
<%--   <div class="accordion-item">
    <h2 class="accordion-header">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
        Accordion Item #2
      </button>
    </h2>
    <div id="collapseTwo" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        <strong>This is the second item's accordion body.</strong> It is hidden by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
      </div>
    </div>
  </div>
</div> --%>

<%-- <div class="accordion" id="accordionExample">
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
</div> --%>

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

<!-- 푸터 영역 -->
<div class="footer">
<c:import url="MemberFooter.jsp"></c:import>
</div>

<br>

</body>
</html>