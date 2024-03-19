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
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/groupFee.css">
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
			
			$("#groupFeeInsertForm").submit();
			
		});
		
		
		$("#groupFeeUpdateBtn").click(function()
		{
			if($.trim($("#gf_amount2").val())=="")
			{
				alert("회비를 입력해주세요!");
				$("#gf_amount2").focus();
				return 
			}
			else if($.trim($("#gf_start2").val())=="")
			{
				alert("납부 개시일을 선택해주세요!");
				$("#gf_start2").focus();
				return 
			}
			
			$("#groupFeeUpdateForm").submit();
			
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
			<div> <h4>💰 회비 정보 </h4>
			 <c:if test="${groupMemberDTO.pos_code == 3 || groupMemberDTO.pos_code == 1 && not empty groupFeeList.gf_start}">
				<button class="groupFeebtn" data-bs-toggle="modal" data-bs-target="#groupFeeUpdate">회비 수정</button>
			</c:if> 
			</div> 
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
     	 <div class="groupFeeMember">
     	 <form action="">
	        <ul class="list-group list-group-flush">
	 		<h4> 💰 회비 납부 내역 </h4>
			<table class="groupFeetable table table-hover">
				<tr>
					<th>그룹원</th>
					<th>납부일</th>
					<th>납부금액</th>
					<th>납부처리</th>
				</tr>
			<c:forEach var="groupFeeInsertList" items="${groupFeeInsertList}">
				<tr>
					<td>${groupFeeInsertList.gm_nickname }</td>
					<td>${groupFeeInsertList.gfi_date eq null ? ' - ' : groupFeeInsertList.gfi_date}</td>
					<td>${groupFeeInsertList.gfi_amount eq null ? ' - ' : groupFeeInsertList.gfi_amount}</td>
					<c:choose>
					<c:when test="${not empty groupFeeInsertList.gfi_code }">
						<td><button disabled="disabled">납부 처리</button></td>
					</c:when>
					<c:when test="${groupMemberDTO.pos_code != 3 }">
						<td><button disabled="disabled">납부 처리</button></td>
					</c:when>
					<c:otherwise>
						<td><button onclick="">납부처리</button></td>
					</c:otherwise>
					</c:choose>
				</tr>
			</c:forEach> 
			</table> 
			</ul>
     	 </form>
     	 </div>
		</div> <!-- groupMain_main -->
</div> <!-- groupBody -->

<!-- 회비 설정 모달 내용 및 처리 -->
<div class="modal fade" id="groupFeeInsert" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog .modal-dialog-scrollable">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="staticBackdropLabel">회비 설정</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      <div class="groupFee">회비를 설정하세요</div><br>
      <form action="groupfeeinsert.woori" method="get" id="groupFeeInsertForm">
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
<!-- 회비 수정 모달 내용 및 처리 -->
<div class="modal fade" id="groupFeeUpdate" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog .modal-dialog-scrollable">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="staticBackdropLabel">회비 설정</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      <div class="groupFee">회비를 수정하세요</div><br>
      <form action="groupfeeupdate.woori" method="get" id="groupFeeUpdateForm">
			<div>회비 금액 : 
				<input class="form-control" name="gf_amount" id="gf_amount2" type="text" value="${groupFeeList.gf_amount }"/>
			</div>
			<div> 납부 개시일 : 
				<input class="form-control" name="gf_start" id="gf_start2" type="date" value="${groupFeeList.gf_start }"/>
				<span>납입 개시일 선택 후 한달 간격으로 회비를 납부할 수 있습니다.</span>
				<input type="hidden" id="gf_code" name="gf_code" value="${groupFeeList.gf_code }">
			</div>
      </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
        <button type="button" class="btn groupFeeBtn" id="groupFeeUpdateBtn">회비 수정</button>
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