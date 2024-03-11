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
<title>AdminMain</title>

<link rel="stylesheet" type="text/css" href="<%=cp %>/css/bootstrap.css">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

<script type="text/javascript" src="<%=cp%>/js/bootstrap.bundle.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<style type="text/css">
	div.header {margin-top: 10px;}
	.container {vertical-align: top; margin-top: 30px; text-align: center;}
	div.profile {display: inline-block; border: 1px solid gray; border-radius: 30px; padding: 10px 20px; vertical-align: top;}
	div.task, div.task-item {display: inline-block; text-align: center; }
	div.task-item {margin: 10px 5px; border-radius: 30px 30px 10px 10px;}
	div.task-item.graph {display: block;}
	.btn:hover {border: none !important;}
	.btn-primary:hover {background-color: #395791 !important;}
	.profile-item {padding: 2px 5px;}
	.btn {border: none;}
	.btn-primary {background-color: #4367ad;}
	.btn-div {margin: 5px 0px; text-align: center;}
	div.task-item-title {text-align: center; margin: 3px 0px; background-color: #4367ad; border-radius: 20px 20px 0px 0px; padding: 5px 30px; color: white;
	font-size: 16pt; font-weight: bold;}
	.bg-danger {font-size: 10pt;}
	thead, tbody {text-align: center;}
	div.chart-div {width: inherit;}
	#myChart {padding-bottom: 10px;}
	@media screen and (min-width: 1400px)
	{
		div.graph {width: auto;}
	}
	@media screen and (max-width: 1400px)
	{
		div.profile {display: block; text-align: center;}
		div.task {padding: 10px 0px; margin: 10px 0px;}
	}
</style>

</head>
<body>

<!-- 2024-02-10 노은하 -->
<!-- 관리자 메인 페이지 -->

<div class="header">
	<c:import url="AdminHeader.jsp"></c:import>
</div>

<div class="container">

	<div class="profile">
	
		<!-- 사원번호 div -->
		<div class="profile-item profile-adminId">
			<span class="profile-title adminId-title">사원번호 : </span><span class="profile-content adminId-content">AD000</span>
		</div>
		
		<!-- 사원명 div -->
		<div class="profile-item  profile-name">
			<span class="profile-title name-title">사원명 : </span><span class="profile-content name-content">누구게</span>
		</div>
		
		<!-- 계정 생성일 div -->
		<div class="profile-item  profile-date">
			<span class="profile-title date-title">계정 생성일 : </span><span class="profile-content date-content">2022-04-08</span>
		</div>
		
		<!-- 담당 신고내역 div -->
		<div class="profile-item profile-report">
			<span class="profile-title report-title">검토중인 신고내역 : </span><span class="profile-content report-content">5</span>개
		</div>
		
		<!-- 담당 문의내역 div -->
		<div class="profile-item profile-question">
			<span class="profile-title question-title">검토중인 문의내역 : </span><span class="profile-content question-content">7</span>개
		</div>
		
		<!-- 로그아웃, 정보수정 버튼 -->
		<div class="btn-div">
			<button type="button" class="btn btn-secondary">로그아웃</button>
			<button type="button" class="btn btn-primary">정보수정</button>
		</div>
	</div>
	
	<!-- 업무 관련 요약보기 구역 -->
	<div class="task">
	
		<!-- 미처리 신고내역 구역 -->
		<div class="task-item reportList shadow">
			
			<!-- 타이틀 -->
			<div class="task-item-title reportList-title position-relative">
				미처리 신고내역
					<span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
						17
					</span>
			</div>
			
			<!-- 신고내역 글목록 간략보기 -->
			<div class="reportList-content">
				<table class="table">
					<thead>
						<tr>
							<th>신고번호</th>
							<th>콘텐츠코드</th>
							<th>작성자코드</th>
							<th>신고자코드</th>
							<th>신고일</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>0001</td>
							<td>C0001</td>
							<td>M0001</td>
							<td>M0002</td>
							<td>2024-02-10</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>

		
		<!-- 미처리 문의내역 구역 -->		
		<div class="task-item questionList shadow">
		
			<!-- 타이틀 -->
			<div class="task-item-title questionList-title position-relative">
				미처리 문의내역
					<span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
						5
					</span>
			</div>
			
			<!-- 문의내역 글목록 간략보기 -->
			<div class="questionList-content">
				<table class="table">
					<thead>
						<tr>
							<th>문의번호</th>
							<th>카테고리</th>
							<th>제목</th>
							<th>작성자코드</th>
							<th>문의일</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>Q0001</td>
							<td>QC001</td>
							<td>그룹장 시켜주세염</td>
							<td>M0003</td>
							<td>2024-02-09</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		
		<!-- 신규가입 추이 그래프 구역 -->
		<div class="task-item shadow graph">
		
			<!-- 타이틀 -->
			<div class="task-item-title graph-title">
				신규가입자 추이
			</div>
			
			<div class="chart-div">
			<canvas id="myChart"></canvas>
			<script>
				var chart = document.getElementById('myChart').getContext('2d');
				var myChart = new Chart(chart,
					{type: 'line',data:{
						labels: ['2024-02-05', '2024-02-06', '2024-02-07', '2024-02-08', '2024-02-09', '2024-02-10'],
					    datasets: [{
					    	label: '신규 가입자',
					        data: [5, 0, 2, 19, 1, 0],
					        backgroundColor:'#ff8000',
					        borderColor:'#ff8000',
					        borderWidth: 2
					        }
					    ]}, options: {
					    		scales: {
					            	yAxes: [{
					                	ticks: {beginAtZero: true}
					            			}
					            		]}
					    			}
					});
			</script>
			</div>
		</div>

	</div>
	

</div>

</body>
</html>