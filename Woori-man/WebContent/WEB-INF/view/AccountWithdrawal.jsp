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
<title>AccountWithdrawal.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">

<style type="text/css">
#container {
	position: relative;
	z-index: 20;
	max-width: 954px;
	height: 100%;
	margin: 0 auto;
}

#content {
	padding: 32px 51px 95px;
}

.c_header {
    padding-bottom: 0;
}



h2 {
	display: block;
	margin-block-start: 0.83em;
	margin-block-end: 0.83em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
	font-weight: bold;
}

p {
	display: block;
	margin-block-start: 1em;
	margin-block-end: 1em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
}

.h_dropout {
	font-size: 12px;
	margin-top: 30px;
	margin-bottom: 0 !important;
	padding-left: 13px;
	color: #333;
	background: url(https://static.nid.naver.com/images/web/user/sp_ico.png)
		no-repeat 0 3px;
}

h3 {
	display: block;
	font-size: 1.17em;
	margin-block-start: 1em;
	margin-block-end: 1em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
	font-weight: bold;
}

table {
	display: table;
	box-sizing: border-box;
	text-indent: initial;
}

tbody {
	display: table-row-group;
	vertical-align: middle;
	border-color: inherit;
}

.tbl_type {
    font-size: 12px;
    position: relative;
    width: 100%;
    margin: 11px auto 0;
    table-layout: fixed;
    border-spacing: 0;
    border-collapse: collapse;
    color: #333;
    border: 0;
    border-top: 1px solid #ededed;
}

.tbl_type th {
	font-size: 12px;
	font-weight: 400;
	padding-left: 21px;
	text-align: left;
	letter-spacing: -1px;
	border-right: 1px solid #ededed;
}

.tbl_type td, .tbl_type th {
	padding: 10px 0 5px;
	color: #777;
	border: 0;
	border-bottom: 1px solid #ededed;
}

th {
	display: table-cell;
	vertical-align: inherit;
}

tr {
    display: table-row;
    vertical-align: inherit;
    border-color: inherit;
}

td{
	font-size: 12px;
}

col {
    display: table-column;
}

strong {
    font-weight: bold;
    font-size: 14px;
}

.dropout_agree_area:after {
    display: block;
    clear: both;
    content: '';
}
.dropout_agree_area .contxt {
    line-height: 19px;
    margin-bottom: 11px;
    color: #ff6000;
}

.dropout_agree_area input {
    float: left;
    width: 13px;
    height: 13px;
    vertical-align: middle;
}

.dropout_agree_area label {
    font-size: 12px;
    line-height: 16px;
    float: left;
    margin-top: -1px;
    padding-left: 9px;
    vertical-align: middle;
    color: #333;
}

.dropout_dsc {
	font-size: 12px;
	line-height: 19px;
	padding: 10px 0 0 12px;
	color: #666;
}

.btn_area_w{
	margin-top: 40px;
	text-align: center;
	
}

.btn_area_w .btn_area {
    display: inline-block;
    overflow: hidden;
    zoom: 1;
    margin-left: -8px;
    text-align: center;
    vertical-align: top;
}

.btn_area {
    text-align: center;
    font-size: 15px;
}

.btn_model[href] .btn3 {
    color: #ff8a3d;
}

.btn_model .btn3 {
    min-width: 52px;
    min-height: 21px;
    line-height: 15px;
    padding: 8px 18px;
    color: #a3a3a3;
    box-sizing: border-box;
    
    border: 2px solid #bfbfbf;
    background: #fff;

</style>
<script type="text/javascript">



<%-- 	function temp()
	{
		var count = <%= request.getAttribute("userPos")%>;
		
		//alert("확인  : " + count);
		if (count > 0)
		{
			alert("안 됨~!!");
		}
		else if (count <= 0)
		{
			document.getElementById("accountWithdrawl").submit();
		} 
	}
 --%>	

</script>

</head>
<body onload="temp()">

	<div id="header"></div>

	<div id=container style="height: 1552px;">
		<div id="content">
			<div class="c_header">
				<h2>탈퇴 안내</h2>
				<p class="contxt">회원탈퇴를 신청하기 전에 안내 사항을 꼭 확인해주세요.</p>
			</div>

			<div class="section_delete">
				<h3 class="h_dropout">
					사용하고 계신 아이디(<em>${userId.us_Id }</em>)는 탈퇴할 경우 재사용 및 복구가 불가능합니다.
				</h3>
				<p class="dropout_dsc">
					<em>탈퇴한 아이디는 본인과 타인 모두 재사용 및 복구가 불가</em>하오니 신중하게 선택하시기 바랍니다.
				</p>
				<h3 class="h_dropout">탈퇴 후 회원정보 및 서비스 이용기록은 모두 삭제됩니다.</h3>
				<!-- <p class="dropout_dsc">
					회원정보 및 그룹 이용기록과 관련한 히스토리는 삭제되며, 삭제된 데이터는 복구되지 않습니다.<br>삭제되는
					내용을 확인하시고 필요한 데이터는 미리 백업을 해주세요.
				</p> -->
				<p class="dropout_dsc">
					회원정보 및 그룹 이용기록과 모임 관련 데이터는 모두 저장되며, 저장 데이터는 개인 회원에게 제공하지 않습니다.<br>이용기록을 
					확인하시고 필요한 데이터는 미리 백업을 해주세요.
				</p>
				<table cellspacing="0" border="1"
					summary="탈퇴 후 회원정보삭제 안내" class="tbl_type">
					<colgroup>
						<col width="145">
						<col width="*">
					</colgroup>
					<tbody id="tblBullet1">
						<tr style="display: table-row;">
							<th scope="row">회원 개인정보</th>
							<td>회원 번호(일련번호), 회원 이름, 생년월일, 양음력, 주소, 회원 연락처, 이메일</td>
						</tr>
					</tbody>
				</table>
				
				<h3 class="h_dropout">탈퇴 후에도 게시판형 서비스에 등록한 게시물은 그대로 남아 있습니다.</h3>
				<p class="dropout_dsc">
					자유게시판 등에 올린 게시글 및 댓글은 탈퇴 시 자동 삭제되지 않고 그대로 남아 있습니다. <br>
					삭제를 원하는 게시글이 있다면 <em>반드시 탈퇴 전 삭제하시기 바랍니다.</em> <br>
					탈퇴 후에는 게시글을 임의로 삭제해드릴 수 없습니다. <br>

				</p>
				<table cellspacing="0" border="1"
					summary="탈퇴 후 게시판형 서비스에 등록한 게시물 유지 안내" class="tbl_type">
					<colgroup>
						<col width="145">
						<col width="*">
					</colgroup>
					<tbody id="tblBullet2">
						<tr style="display: table-row;">
							<th scope="row">자유게시판</th>
							<td>게시글, 댓글, 대댓글, 좋아요 등 ( 단, 대댓글의 경우 질문자 / 답변자 아이디가 비공개
								처리됨 )</td>
						</tr>
						<tr style="display: table-row;">
							<th scope="row">히스토리</th>
							<td>게시글, 댓글, 대댓글, 좋아요 등 ( 단, 대댓글의 경우 질문자 / 답변자 아이디가 비공개
								처리됨 )</td>
						</tr>
						<tr style="display: table-row;">
							<th scope="row">쪽지</th>
							<td>쪽지 내용, 쪽지 수신·발신 기록</td>
						</tr>
					</tbody>
				</table>


				<form name="accountWithdrawl" id="accountWithdrawl" method="post" action="accountwithdrawl.woori">
					<input type="hidden" name="token_help" value="xWEGbvPbehmQDB52">
					<input type="hidden" name="lang" value="ko_KR">
					<div class="dropout_agree_area">
						<p class="contxt">
							<strong> 탈퇴 후에는 아이디 <em>${userId.us_Id }</em> 로 다시 가입할 수 없으며
								아이디와 데이터는 복구할 수 없습니다. <br> 게시판형 서비스에 남아 있는 게시글은 탈퇴 후 삭제할 수
								없습니다.<br>
							</strong>
						</p>
						<input type="checkbox" id="dropoutAgree" name="dropoutAgree"
							onclick="clickcr(this,'otn.guideagree','','',event);"> <label
							for="dropoutAgree"><strong>안내 사항을 모두 확인하였으며, 이에
								동의합니다.</strong></label>
					</div>
					<div class="btn_area_w">
						<p class="btn_area">
							<a href="#99" id="btnNext" class="btn_model"
								style="cursor: pointer; text-decoration-line: none;">
								<button type="submit" ${userPos > 0 ? "disabled=\"disabled\"" : "" }>확인</button>	
								<!-- <button type="button" onclick="temp()" >확인</button> -->	
							</a>
						</p>
					</div>
				</form>
			</div>
			<div class="resize-triggers">
				<div class="expand-trigger">
					<div style="width: 601px; height: 1680px;"></div>
				</div>
				<div class="contract-trigger"></div>
			</div>
		</div>
	</div>
</body>
</html>