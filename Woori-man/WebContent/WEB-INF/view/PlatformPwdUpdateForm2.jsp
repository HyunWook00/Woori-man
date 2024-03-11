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
<title>PlatformPwdUpdateForm.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">


<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<style type="text/css">

#PPU_Container{
    /* position: relative; */
    z-index: 20;
    width: 100%;
    height: 817px;
    margin: 0 auto;
    background-color: #fafafa;
}

#PPU_Content{
	width: 80%;
	height: 80%;
	margin: 0 auto;
	margin-top: 50px;
	padding: 32px 51px 95px 50px;
	/* background-color: blue; */
}

.PwdForm{
	line-height: 14px;
    width: 356px;
    margin: 0 auto;
    padding: 32px 29px 32px;
    border: 1px solid #dadada;
    background: #fff;
    height: 500px;
}

.PwdForm_header{
	width: 356px;
	height: 105px;
	/* background-color: yellow; */
}

.PwdForm_header h2{
	font-size: 20px;
	line-height: 22px;
}

.PwdForm_header_p{
	margin-top: 8px;
	padding-left: 5px;
	color: #666;
	font-size: 12px;
}

.PwdForm_header_p em{
	color: #ff6020;
	font-style: normal;
}

.PwdForm_update{
	width: 356px;
	height: 470px;
	margin-top: 20px;
}




.PwdForm_update [class^=update_row1] {
    position: relative;
    height: 43px;
    border: 1px solid #ccc;
}

.PwdForm_update [class^=update_row1] input[type=password]{
    font-size: 14px;
    font-weight: 700;
    line-height: 16px;
    height: 16px;
    margin: 15px 9px 0;
    vertical-align: top;
    color: #333;
    border: 0;
}

.PwdForm_update .btn_area{
	margin-top: 31px;
	padding: 0;
}

.PwdForm_update .btn_area button{
	width: 100px;
	height: 40px;
    margin-top: 0;
    color: #fff;
    border: none;
    /* background: #ff8a3d; */
}



</style>

</head>
<body>

<div>
	<h1>플랫폼 비밀번호 변경</h1>
	<hr>
</div>

<!-- 
<div id="PPU_Container">
	
	<div id="PPU_Content">
 -->		
	 <div class="PwdForm">
	 	
	 	
	 	<!-- Button trigger modal -->
				
				<!-- Modal -->
				<div class="modal fade" id="exampleModal" tabindex="-1"
					aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							
							<div class="modal-header">
								<h1 class="modal-title fs-5" id="exampleModalLabel">비밀번호 변경</h1>
								<p class="PwdForm_header_p">
					 				<em>대소문자 몇 개 어쩌구 사용하세요.</em>
					 			</p>
					 			<p class="PwdForm_header_p">
					 				<em>이전에 사용한 적 없는 비밀번호가 안전합니다.</em>
					 			</p>
							</div>

							<div class="PwdForm_update">
							
								<form action="platformpwdupdate.woori" method="POST" id="PaltformPwdUpdateForm">
								
									<p class="update_row1">
										<input type="password" name="now_pwd" id="now_pwd"
											placeholder="현재 비밀번호"
											style="height: 19px; width: 80%; outline: none;">
									</p>

									<p class="update_row1">
										<input type="password" name="new_pwd1" id="new_pwd1"
											placeholder="새 비밀번호"
											style="height: 19px; width: 80%; outline: none;">
									</p>

									<p class="update_row1">
										<input type="password" name="new_pwd2" id="new_pwd2"
											placeholder="새 비밀번호 확인"
											style="height: 19px; width: 80%; outline: none;">
									</p>

									<p class="btn_area">
										<button type="submit" style="background: #ff8a3d;">확인</button>
										<button type="button"
											style="background: #fff; color: black; border: 1px solid #bfbfbf;">취소</button>
									</p>
								</form>
							</div>


								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							<div class="modal-body">...</div>
							
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">수정</button>
								<button type="button" class="btn btn-primary">취소</button>
							</div>
							
						</div>
					</div>
				</div>
				

<!-- ======================================= -->
<!-- 
				<div class="PwdForm_header">
	 		<h2>비밀번호 변경</h2>
	 		<p class="PwdForm_header_p">
	 			<em>대소문자 몇 개 어쩌구 사용하세요.</em>
	 		</p>
	 		<p class="PwdForm_header_p">
	 			<em>이전에 사용한 적 없는 비밀번호가 안전합니다.</em>
	 		</p>
	 	</div>
	 	
	 	
	 	<div class="PwdForm_update">
	 		<form action="platformpwdupdate.do" method="POST" id="PaltformPwdUpdateForm">
	 			<p class="update_row1" ">
 	 				<input type="password" name="now_pwd" id="now_pwd" placeholder="현재 비밀번호"  
 						style="height: 19px; width: 80%; outline: none;" >
	 			</p>
	 			
	 			<p class="update_row1">
	 				<input type="password" name="new_pwd1" id="new_pwd1" placeholder="새 비밀번호" 
 						style="height: 19px; width: 80%; outline: none;" >
	 			</p>
	 			
	 			<p class="update_row1">
	 				<input type="password" name="new_pwd2" id="new_pwd2" placeholder="새 비밀번호 확인" 
 						style="height: 19px; width: 80%; outline: none;" >
	 			</p>
	 			
	 			<p class="btn_area">
	 				<button type="submit" style="background: #ff8a3d";>확인</button>
	 				<button type="button" style="background: #fff; color: black; border: 1px solid #bfbfbf;">취소</button>
	 			</p>
	 		
	 		
	 		</form>
	 	</div>
	 	
	 
	 </div>	
	
	</div>

 -->

</div>

</body>
</html>