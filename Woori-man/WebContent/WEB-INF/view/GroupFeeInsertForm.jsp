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
<title>회비 등록 - 우리만</title>
<link rel="stylesheet" href="<%=cp%>/css/font.css">
<link rel="stylesheet" href="<%=cp%>/css/memberHeader.css">
<link rel="stylesheet" href="<%=cp%>/css/insertForm.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/footer.css">
<!-- 
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
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
<link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
<script type="text/javascript">

	$(function()
	{
		$(".btnSubmit").click(function()
		{
			//alert($("#iqc_code").val());
			
			if($.trim($("#gf_amount").val())=="")
			{
				alert("회비 금액을 설정해주세요");
				$("#gf_amount").focus();
				return;
			}
			else if($.trim($("#gf_start").val())=="")
			{
				alert("납부 개시일을 선택해주세요");
				$("#gf_start").focus();
				return;
			}
			
			$("#groupFee").submit();
			
		});
		
	});

</script>
</head>
<body>

<!-- 임시 헤더 영역 -->
<div>
	<br>
	<c:import url="MemberHeader.jsp"></c:import>
	<c:import url="GroupHeader.jsp"></c:import>
	<br>
</div>

<div class="groupMain_side" >
	<c:import url="GroupSideBar.jsp"></c:import>
</div>	

<div>
	<h3 class="aaa">회비 등록</h3>
	<hr />
	<form action="groupFeeinsert.woori" method="post" id="groupFee">
		<table class="aaa table table-bordered" >
			<tr>
				<th>회비 금액 * </th>
				<td>
					<input class="form-control" name="gf_amount" id="gf_amount" type="text" placeholder="회비 금액을 정해주세요"/>
				</td>
			</tr>
			<tr>
				<th>납부 개시일 * </th>
				<td>
					<input class="form-control" name="gf_start" id="gf_start" type="date" placeholder="납부 개시일을 선택해주세요"/>
				</td>
			</tr>
		</table>
		<hr><br>
		
		<div class="">
		<button type="button" class="btn btnSubmit">회비 금액 설정</button>
		<button type="button" class="btn btn-secondary" onclick="location.href='groupmain.woori'">취소하기</button>
		</div>
	</form>
</div>




<br><br>

<!-- 푸터 영역 -->
<div class="footer">
<c:import url="MemberFooter.jsp"></c:import>
</div>


</body>
</html>