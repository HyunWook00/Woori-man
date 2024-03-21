$(function()
{
	// 목록으로 돌아가기
	$(".article-list").click(function()
	{
		var mt_code = $(this).val();
		$(location).attr("href", "meetingarticle.woori?mt_code=" + mt_code);
	});
	
	// 수정하기 버튼 클릭
	$(".meeting-update-bt").click(function()
	{
		$("#meeting-update-form").submit();
		
	});
	
});

function findPostcode(num)
{
	 new daum.Postcode({
	 oncomplete: function(data) {
	     var roadAddr = data.roadAddress; // 도로명 주소 변수
	     var extraRoadAddr = ''; // 참고 항목 변수
	
	     if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	         extraRoadAddr += data.bname;
	     }
	     if(data.buildingName !== '' && data.apartment === 'Y'){
	        extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	     }
	     if(extraRoadAddr !== ''){
	         extraRoadAddr = ' (' + extraRoadAddr + ')';
	     }
	
	     document.getElementById("zipcode-"+num).value = data.zonecode;
	     document.getElementById("addr1-"+num).value = roadAddr;
	     $(".visited-form-addr2").val("");
	     
	     }
	 }).open();
}