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
<title>회비 납부 내역 - 우리만 </title>
<!-- 
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"> 
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
캐러샐 추가
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> 

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
-->
 
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/font.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/groupMain.css">
<link rel="stylesheet" href="<%=cp %>/css/footer.css" />

<!-- 1. 부트스트랩 js -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<!-- 2. 부트스트랩 css -->
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
<!-- 3. jquery -->
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<!-- 4. 부트스트랩 아이콘 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
<script type="text/javascript">

	$(function()
	{
		$("#groupFeeInsertBtn").click(function()
		{
			
			//alert($("#gf_start").val());
			
			if($.trim($("#gf_amount").val())=="")
			{
				alert("회비를 입력해주세요!");
				$("#gf_amount").focus();
				return 
			}
			else if($.trim($("#gf_start").val())=="")
			{
				alert("납부 개시일을 선택해주세요!");
				$("#gf_start").focus();
				return 
			}
			
			$("#groupFeeForm").submit();
			
		});
		
	});

</script>

</head>
<body>
	<c:import url="MemberHeader.jsp"></c:import>
	<c:import url="GroupHeader.jsp"></c:import>
		<!-- 사이즈 커질 때 양쪽 공백 -->
<div class="groupBody">
		<div class="groupMain_side" >
			<c:import url="GroupSideBar.jsp"></c:import>
		</div>	
		<div class="groupMain_main">
		<div class="groupFee" >
			<h4> 💰 회비 정보 </h4>
			<c:choose>
			<c:when test="${empty groupFeeList.gf_start }">
			<div class="groupFeelist">
				<div> 현재 설정한 회비가 없습니다. </div>
     	 		<div>
					<!-- 모달을 실행할 버튼 -->
					<button type="button" class="groupFee" data-bs-toggle="modal" data-bs-target="#groupFeeInsert">
						회비 설정
					</button>
     	 		</div>
			</div>
			</c:when>
			<c:otherwise>
			<div class="groupFeelist">
					<div> 회비 금액 : ${groupFeeList.gf_amount }</div>
					<div> 회비 납부일 : ${groupFeeList.gf_start }</div>
					<div> 관련 총무 : ${groupFeeList.gm_nickname } </div>
			</div>
			</c:otherwise>
			</c:choose>
     	 </div>
     	 <div class="groupFee">
	        <ul class="list-group list-group-flush">
	 		<h4> 💰 회비 납부 내역 </h4>
			<table class="groupFeetable">
				<tr>
					<th>그룹원 </th>
					<th>납부 여부</th>
					<th>처리</th>
				</tr>
				<tr>
					<td>밍</td>
					<td>납부완료</td>
					<td><button>납부</button></td>
				</tr>
			</table> 
			</ul>
     	 </div>
		</div> <!-- groupMain_main -->
</div> <!-- groupBody -->

<!-- 모달 내용 및 처리 -->
<div class="modal fade" id="groupFeeInsert" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog .modal-dialog-scrollable">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="staticBackdropLabel">회비 설정</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      <div class="groupFee">회비를 설정하세요</div><br>
      <form action="groupfeeinsert.woori" method="get" id="groupFeeForm">
			<div>회비 금액 : 
				<input class="form-control" name="gf_amount" id="gf_amount" type="text" placeholder="회비 금액을 정해주세요"/>
			</div>
			<div> 납부 개시일 : 
				<input class="form-control" name="gf_start" id="gf_start" type="date" placeholder="납부 개시일을 선택해주세요"/>
				<span>납입 개시일 선택 후 한달 간격으로 회비를 납부할 수 있습니다.</span>
			</div>
      </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
        <button type="button" class="btn groupFeeBtn" id="groupFeeInsertBtn">회비 설정</button>
      </div>
    </div>
  </div>
</div> <!-- 모달 끝  -->



<!-- 푸터 영역 -->
<div class="footer">
	<c:import url="MemberFooter.jsp"></c:import>
</div>
</body>
</html>