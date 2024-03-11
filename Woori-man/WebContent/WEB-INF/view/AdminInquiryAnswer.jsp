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
<title>AdminInquiryArticle.jsp</title>

<!-- 부트스트랩 적용 CSS -->
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">

<!-- 제이쿼리 적용 JS -->
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>

<!-- 부트스트랩 관련 스크립트 적용 JS -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- 부트스트랩 아이콘 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

<link rel="stylesheet" type="text/css" href="<%=cp%>/css/adminHeader.css">

<style type="text/css">

    <style>
    	@font-face 
	    {
		    font-family: '라인Seed';
		    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/LINESeedKR-Bd.woff2') format('woff2');
		    font-weight: 700;
		    font-style: normal;
		}
    
        th {
            font-family: '라인Seed';
        }
        
        h1 {
            color: #4367ad;
            font-weight: bold;
            text-align: center;
            margin-top: 30px;
        }
        
        .container {
            margin-top: 30px;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        
        .table-wrap {
            margin-top: 50px;
        }
        
        table {
            width: 100%;
            border-collapse: collapse;
            border: 1px solid #dee2e6;
            font-size: 15pt;
        }
        
        
        th, td {
            border: 1px solid #dee2e6;
            padding: 8px;
            text-align: center;
        }
        
        .table-Inquiry th
        {
		    width: 30%;
		    font-weight: bold;
		}
		
		th {background-color: #f8f9fa;}
        
        .list-btn,
        .submit-btn {
            border: none;
            font-size: 15pt;
            background-color: #4367ad;
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }
        
        .list-btn:hover,
        .submit-btn:hover {
            background-color: #395791;
        }

        
        .btns {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }
        
        @media (max-width: 576px) {
            .btns {
                flex-direction: column;
            }
        }
        
        .submit-btn {margin-left: 10px;}
        .list-btn {margin-right: 10px;}
        
    </style>
    
    <!-- <script type="text/javascript">
    
    	$(document).ready(function()
		{
			$(".submit-btn").click(function()
			{
				$("#inquiryAnswerForm").submit();
			});
		});
    
    </script> -->

</head>
<body>

<div class="header-menu row">

	<nav class="navbar">
		<ul class="nav justify-content-center">
		
			<!-- 관리자 계정관리 메뉴 -->
			<li class="nav-item">
				<div class="icon"><a href=""><i class="bi bi-person-badge"></i><span class="menu-title">관리자 계정관리</span></a></div>
				<div class="hover-text">관리자 계정관리</div>
			</li>
			
			<!-- 회원 계정관리 메뉴 -->
			<li class="nav-item">
				<div class="icon"><a href=""><i class="bi bi-people-fill"></i><span class="menu-title">회원 계정관리</span></a></div>
				<div class="hover-text">회원 계정관리</div>
			</li>
			
			<!-- 플랫폼 로고 -->
			<li class="nav-item">
				<div class="icon"><a href=""><i class="bi bi-house-fill"></i><span class="menu-title">우리만 Admin</span></a></div>
				<div class="hover-text">관리자 메인으로 이동</div>
			</li>
			
			<!-- 신고내역 관리 메뉴 -->
			<li class="nav-item">
				<div class="icon"><a href=""><i class="bi bi-shield-fill-exclamation"></i><span class="menu-title">신고내역 관리</span></a></div>
				<div class="hover-text">신고내역 관리</div>
			</li>
			
			<!-- 공지사항 관리 메뉴 -->
			<li class="nav-item">
				<div class="icon"><a href=""><i class="bi bi-card-text"></i><span class="menu-title">공지사항 관리</span></a></div>
				<div class="hover-text">공지사항 관리</div>
			</li>
			
			<!-- 문의사항 관리 메뉴 -->
			<li class="nav-item">
				<div class="icon"><a href=""><i class="bi bi-question-octagon-fill"></i><span class="menu-title">문의사항 관리</span></a></div>
				<div class="hover-text">문의사항 관리</div>
			</li>
			
			<!-- 로그아웃 버튼 -->
			<li class="nav-item">
				<div class="icon"><a href=""><i class="bi bi-unlock-fill"></i><span class="menu-title">로그아웃</span></a></div>
				<div class="hover-text">로그아웃</div>
			</li>
		</ul>
	</nav>
</div>



<div class="container">

	<h1>문의사항</h1><hr>
	<div class="table-wrap">
	<form action="admininquiryanswer.woori" method="get" id="inquiryAnswerForm">
	<table class="table-Inquiry">
		    <tr>
		    	<th>문의유형</th>
		    	<td>${inquiryArticle.iqc_name }</td>
	    	</tr>
	    	<tr>
	            <th>제목</th>
	            <td>${inquiryArticle.iq_title }</td>
            </tr>
            <tr>
	            <th>문의자</th>
	            <td>${inquiryArticle.us_id }</td>
            </tr>
            <tr>
	            <th>문의일</th>
	            <td>${inquiryArticle.iq_date }</td>
	        </tr>
            <tr>
	            <th>문의내용</th>
	            <td>${inquiryArticle.iq_content }<br>
	            <%-- <img src="${inquiryAttach.iqa_name }"> --%>
	            <%-- <c:forEach var="attach" items="${inquiryAttach }">
	            <img src="images/${attach.iqa_name }">
	            </c:forEach> --%>
	            </td>
	            
	        </tr>
            <tr>
	            <th>답변내용</th>
	            <td>
					<div class="form-group">
	                    <textarea rows="5" class="form-control" id="as_content" name="as_content"></textarea>
                    </div>
				</td>
	        </tr>
            <tr><th>답변 전송 방법</th>
            <td>
	            <div class="row justify-content-center">
            <div class="col-auto">
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                    <label class="form-check-label" for="flexCheckDefault">SMS 전송</label>
                </div>
            </div>
            <div class="col-auto">
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked">
                    <label class="form-check-label" for="flexCheckChecked">E-mail 전송</label>
                </div>
            </div>
        </div>
			</td>
	        </tr>
	
	</table>
	
	<div class="btns">
		<button type="button" class="list-btn" onclick="location.href='admininquirylist.woori'">목록으로</button>
		<button type="submit" class="submit-btn">작성완료</button>
	</div>
	<input type="hidden" name="iq_code" value="${inquiryArticle.iq_code }">
	<input type="hidden" name="ad_code" value="${inquiryArticle.ad_code }">
	</form>
	</div>

	

	
	
</div>


<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>