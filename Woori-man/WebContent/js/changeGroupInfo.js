/**
 changeGroupInfo.js
 */

$(document).ready(function()
{
	// 받아온 값을 비교하기위한 변수 조합
	var gc_name = "#gc_name"+'${group.gc_code}';
	var caseItem = ".case"+'${group.gc_code}';
	
	// 이전에 받아온 그룹 카테고리 체크박스에 checked 속성 부여
	// checked 속성이 부여된 li에 미체크 옵션들과 다른 색상 부여
	$(gc_name).attr("checked", true);
	$(caseItem).css("background-color", "#495057ba");	
	
}); 


function updateGroup()
{
	$("#createForm").submit();
}