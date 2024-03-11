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
<title>신고접수 - 우리만</title>
<!-- 
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
 -->
<link rel="stylesheet" href="<%=cp%>/css/font.css">
<link rel="stylesheet" href="<%=cp%>/css/memberHeader.css">
<link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">

<!-- 1. 부트스트랩 js -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<!-- 2. 부트스트랩 css -->
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
<!-- 3. jquery -->
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<!-- 4. 부트스트랩 아이콘 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">



<style type="text/css">

	*
	{
		font-family: 라인Seed;
		font-weight: bold;
		text-align: center;
	}
	
	
	.table-bordered
	{
		width: 70%;
	}
	
	.form-control, .form-select
	{
		padding: 10px;
	}
	
	hr
	{
		margin-left: auto;
		margin-right: auto;
		width: 70%;
		height: 30%;
	}
	
	textarea
	{
		resize: none;
	}
	
	.aaa
	{
		margin-left: 15%;
		text-align: left;
	}
	
	.btn
	{
		font-size: 15pt;
		padding: 10px;
		width: 100pt;
	}

	.btnSubmit
	{
		background-color:  #ff8000;
		color: white;
	}
	
	.btnSubmit:hover
	{
		background-color: #e97501;
		color: white;
	}
	

	
	.bbb
	{
		background-color: #f3f3f1;
		border: solid 1px #f3f3f1;
		border-radius: 10px;
		width: 70%;
		padding: 20px;
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
		width: 30pt;
	}
	
	
</style>

</head>
<body>

<!-- 임시 헤더 영역 -->
<div>
	<br>
	<c:import url="MemberHeader.jsp"></c:import>
	<hr />
	<br>
</div>

<div>
	<h3 class="aaa">신고 접수</h3>
	<hr />
	<form action="reportinsert.action" method="post">
		<table class="aaa table table-bordered" >
			<tr>
				<th>신고 유형 * </th>
				<td>
					<select class="form-select" name="report_category">
					    <option>신고 유형을 선택해주세요.</option>
						<option value="">그룹</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>신고 제목 *</th>
				<td>
					<input class="form-control" name="iq_title" type="text" placeholder="제목을 작성해주세요"/>
				</td>
			</tr>
			<tr>
				<th>신고 내용 *</th>
				<td>
					<textarea class="form-control" name="iq_content" rows="10" cols="100" placeholder="신고 내용을 작성해주세요"></textarea>
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
		<button type="submit" class="btn btnSubmit">신고하기</button>
		<button type="button" class="btn btn-secondary" onclick="location.href='cs.action'">취소하기</button>
		</div>
	</form>
</div>

<br><br>

<div class="aaa bbb">
신고 사항 답변 안내<br><br>
신고 사항은 담당자가 확인한 후 우리만 이용약관 및 운영원칙에 따라 적절한 조치를 취하고 있습니다.<br>
신고된 게시글, 댓글, 대댓글은 신고 즉시 블라인드 처리 되며, 추후 결과에 따라 블라인드 해제가 될 수 있습니다. <br>
당일 17시 이후 신고건과 공휴일 신고는 신고 유형과 신고 내용 확인 후 운영시간에 통지해 드립니다.<br>
정상근무일 기준이며, 통지예정일이 휴일인 경우 다음 정상 근무일에 진행 됩니다.<br>
설/추석 연휴 기간 동안은 고객센터 휴무로 인해 신고 처리 답변이 불가 합니다.<br>
설/추석 연후 끝난 이후부터 순차적으로 답변드릴 예정이니 양해 부탁드립니다.<br>
</div>






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