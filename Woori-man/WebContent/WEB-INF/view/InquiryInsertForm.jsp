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
<title>1:1 문의사항 등록 - 우리만</title>
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
			
			if($("#iqc_code").val()=="-1")
			{
				alert("문의 유형을 선택해주세요")
				$("#iqc_code").focus();
				return;
			}
			else if($.trim($("#iq_title").val())=="")
			{
				alert("문의 제목을 작성해주세요");
				$("#iq_title").focus();
				return;
			}
			else if($.trim($("#iq_content").val())=="")
			{
				alert("문의 내용을 작성해주세요");
				$("#iq_content").focus();
				return;
			}
			
			$("#inquirySubmit").submit();
			
		});
		
	});
	


</script>
</head>
<body>

<!-- 임시 헤더 영역 -->
<div>
	<br>
	<c:import url="MemberHeader.jsp"></c:import>
	<br>
</div>

<div>
	<h3 class="aaa">1:1 문의 접수</h3>
	<hr />
	<form action="inquiryinsert.woori" method="post" id="inquirySubmit">
		<table class="aaa table table-bordered" >
			<tr>
				<th>문의 유형 * </th>
				<td>
					<select class="form-select" name="iqc_code" id="iqc_code">
					    <option value="-1">문의 유형을 선택해주세요.</option>
						<c:forEach var="inquiryCategory" items="${inquiryCategory }">
							<option value="${inquiryCategory.iqc_code }">${inquiryCategory.iqc_name }</option>
						</c:forEach>
						<!-- 
						<option value="">회원</option>
						<option value="">친구</option>
						<option value="">그룹</option>
						<option value="">신고</option>
						<option value="">포인트</option> 
						-->
					</select>
				</td>
			</tr>
			<tr>
				<th>문의 제목 *</th>
				<td>
					<input class="form-control" name="iq_title" id="iq_title" type="text" placeholder="제목을 작성해주세요"/>
				</td>
			</tr>
			<tr>
				<th>문의 내용 *</th>
				<td>
					<textarea class="form-control" name="iq_content" id="iq_content" rows="10" cols="100" placeholder="문의 내용을 작성해주세요"></textarea>
				</td>
			</tr>
			<tr>
				<th>사진 접수 </th>
				<td>
					<input class="form-control" type="file" />
				</td>
			</tr>
		</table>
		<hr><br>
		
		<div class="">
		<button type="button" class="btn btnSubmit">접수하기</button>
		<button type="button" class="btn btn-secondary" onclick="location.href='cs.woori'">취소하기</button>
		</div>
	</form>
</div>

<br><br>

<div class="aaa bbb">
문의내용 답변 안내<br><br>
답변은 문의사항 내역에서 확인이 가능합니다. (문의내용에 따라 고객센터에서 연락드릴 수 있습니다.)<br>
당일 17시 이후 문의건과 공휴일 1:1 문의는 문의 유형과 문의 내용을 남겨 주시면 확인 후 운영시간에 통지해 드립니다.<br>
정상근무일 기준이며, 통지예정일이 휴일인 경우 다음 정상 근무일에 진행 됩니다.<br>
설/추석 연휴 기간 동안은 고객센터 휴무로 인해 1:1 문의 답변이 불가 합니다.<br>
설/추석 연후 끝난 이후부터 순차적으로 답변드릴 예정이니 양해 부탁드립니다.<br>
연말 및 새해(12월, 1월)에는 문의량이 급증하여 답변이 지연될 수 있습니다.<br>

</div>

<!-- 푸터 영역 -->
<div class="footer">
<c:import url="MemberFooter.jsp"></c:import>
</div>


</body>
</html>