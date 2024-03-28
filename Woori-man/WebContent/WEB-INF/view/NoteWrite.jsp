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
   <title>NoteWrite.jsp</title>
   
   <!-- 부트스트랩 적용 CSS -->
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">

<!-- 제이쿼리 적용 JS -->
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>

<!-- 부트스트랩 관련 스크립트 적용 JS -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- 부트스트랩 아이콘 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

<link rel="stylesheet" href="css/memberHeader.css">

<style type="text/css">

	@font-face {
	   font-family: '라인Seed';
	   src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/LINESeedKR-Bd.woff2') format('woff2');
	   font-weight: 700;
	   font-style: normal;
	}
	
	body
	{
		font-family: 라인Seed;
		font-size: 15pt;  
	}
	.card-header
	{
		background-color: #ff8000;
		color: white;
	}
	.list-btn, .submit-btn
	{
		background-color: #ff8000;
	       color: white;
	       border-radius: 10px;
	       border: none;
	}
	
	.list-btn:hover, .submit-btn:hover
	{
		color: black;
	}
	
	.container
	{
		max-width: 50%;
	       margin: 20px auto;
	       padding: 20px;
	       border-radius: 5px;
	       box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	}
	
	.bi-search 
	{
	   	border: none;
	       font-size: 12pt;
	       background-color: #ff8000;
	       color: white;
	       padding: 10px 20px;
	       border-radius: 5px;
	       cursor: pointer;
	       text-decoration: none;
	       transition: background-color 0.3s ease;
	   }
	   
	   .bi-search:hover 
	   {
	   	background-color: #ff8000;
	   	color: black;
	  	}
	  	
	  	.btns
	  	{
	  		text-align: center;
	  	}
	
	textarea{resize: none;}
	
	.modal-body
	{	overflow-y: auto; /* 수직 스크롤바 설정 */
	       max-height: 400px; /* 최대 높이 설정 */
	   }
	    
	   ::-webkit-scrollbar {
	   width: 10px;
	   height: 10px;
	}
	
	::-webkit-scrollbar-track {
	    background: #f1f1f1;
	}
	
	::-webkit-scrollbar-thumb {
	    background: #888;
	    border-radius: 5px;
	}
	
	::-webkit-scrollbar-thumb:hover {
	    background: #555;
	}
	
	
	.friend-info img {
	   width: 36px !important;
	}
	
	th
	{
		font-family: 라인Seed;
	}
	
	h2
	{
		font-family: 라인Seed;
		border-bottom: 1px solid #ddd;
		padding-bottom: 5px;
	}
	
	
	#modal-btn, .invite-btn
	{
		font-size: 15px;
		font-weight: bold;
	    border: solid 2px #ffffff;
	    border-radius: 5px;
	    color: #ffffff;
	    background-color: #ff8000;	
	}
		
	.friends 
	{
	     /* background-color: #fff;
	    border-radius: 10px;
	    box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
	    padding: 20px;
	    width: 80%;
	    margin-left: 100px; */
	    overflow-y: auto; /* 수직 스크롤바 설정 */
		max-height: 500px; /* 최대 높이 설정 */
	}
	
	.friends h2 {
	    font-size: 24px;
	    color: black;
	    border: 2px solid #ff8000;
	    padding: 10px 20px;
	    border-radius: 10px;
	    margin-bottom: 20px;
	}
	
	.friends .lists li {
	    padding: 15px 0;            
	    border-bottom: 1px solid #ff8000;
	    color: #343a40;
	    font-size: 18px;
	    list-style: none;
	}
	
	.container 
	{
		padding-top: 50px;
		
	}
	
	/* .lists li {
	    display: flex;
	    justify-content: space-between;
	    margin-right: 30px;
	} */
	      
	
	
	img.friend-profile
	{
		width: 40px;
	    height: 40px;
	    border-radius: 50%;
	    border: 1px solid #ff8000;
	}
	
	.friend-profile
	{
		display: flex; 
		justify-content: space-between;
	}
	
	.modal-content
	{
		width: 150%;	
	}


</style>
	
<script type="text/javascript">

	$(function()
	{
		$(".submit-btn").click(function()
		{
			
			if (document.getElementById("note_content").value.trim()=="")
			{
				alert("내용을 입력하세요.");
				$("#note_content").val("");
				$("#note_content").focus();
				return;
			}
			
			$("#noteForm").submit();
		});
		
		
		$("#modal-btn").css("display", "none");
		$("#search").click(function()
		{
			var value = $("#searchValue").val();
			//alert("눌렀따");
			if (value == "") 
			{
	            alert("검색어를 입력해주세요.");
	            return;
	        } 
			
			else
			{
				$("#modal-btn").click();
				
			}
			
		});
		
		$("#modal-btn").click(function()
		{
			param = "searchValue=" + $("#searchValue").val();
			
			$.ajax(
			{
				type: "GET"
				, url: "friendlistsearch.woori"
				, data: param
				, success: function(args)
				{
					//alert("다녀왔다고해");
					//alert(args);
					$(".lists").html(args);
					$("#messageModal1").modal("show");
					$(".invite-btn").attr("onclick", "friendInsert(this)");
				}
				, error: function(e)
				{
					alert(e.responseText);
				}
			});
			
		});
		
		
	});
	
	function friendInsert(obj)
	{
		$("#messageModal1").modal("hide");
		var fr_code = $(obj).val();
		$("#fr_code").val(fr_code);
	}

</script>
	
</head>
<body>
<div class="header">
	<c:import url="MemberHeader.jsp"></c:import>
</div>

    <div class="container">
    <div class="card">
        <div class="card-header">
            <h1 class="card-title text-center">쪽지 작성</h1>
        </div>
        <form action="friendnotewrite.woori" method="get" id="noteForm">
        <div class="card-body">
                <div class="mb-3">
                    <label for="searchValue" class="form-label">받는 사람</label>
                    <div class="input-group col-md-6">
				        <input type="text" class="form-control" id="searchValue" name="searchValue" placeholder="수신자를 입력하세요"
				        value = "${code }">
				        <button type="button" class="btn bi bi-search" id="search" data-toggle="modal" data-target="#messageModal1"></button>
				        <button type="button" id="modal-btn" data-toggle="modal" data-target="#messageModal1"></button>
				    </div>
                </div>
                <div class="mb-3">
                    <label for="note_title" class="form-label">제목</label>
                    <input type="text" class="form-control" id="note_title" name="note_title" placeholder="쪽지 제목을 입력하세요">
                </div>
                <div class="mb-3">
                    <label for="note_content" class="form-label">내용</label>
                    <textarea class="form-control" id="note_content" name="note_content" rows="5" placeholder="쪽지 내용을 입력하세요"></textarea>
                </div>
                
				<input type="hidden" id="fr_code" name="fr_code" value="${fr_code }"> 
				
                <div class="btns">
					<button type="button" class="list-btn" onclick="location.href='notelist.woori'">목록으로</button>
					<button type="button" class="submit-btn">전송하기</button>
				</div>
				
        </div>
            </form>
    </div>
</div>

<div class="modal fade" id="messageModal1" tabindex="-1" aria-labelledby="messageModalLabel1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title fs-5" id="messageModalLabel1"></h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" >
                </button>
            </div>
            <div class="modal-body">
            <div class="card">
         	
            <div class="card-body friends">
            
				<ul class="lists">
				
				
				
				</ul>
				
			</div>
             
            </div>
            </div>
            </div>
        </div>
    </div>


</body>
</html>
