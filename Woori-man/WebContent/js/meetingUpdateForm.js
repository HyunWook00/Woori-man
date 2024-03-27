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
	
	// 방문장소 추가 버튼 클릭
	$(".visited-add-btn").click(function()
	{
		var element = "<div class=\"visited-content\">";
		element += "<input type=\"text\" class=\"visited-form-element visited-form-zipcode\" name=\"vp_zipcode\" placeholder=\"우편번호\" readonly=\"readonly\">";
		element += "<input type=\"button\" onclick=\"findPostcode(this)\" value=\"우편번호 찾기\"><br>";
		element += "<input type=\"text\" class=\"visited-form-element visited-form-addr1\" name=\"vp_addr1\" placeholder=\"도로명주소\" readonly=\"readonly\"><br>";
		element += "<input type=\"text\" class=\"visited-form-element visited-form-addr2\" name=\"vp_addr2\" placeholder=\"상세주소\">";
		element += "</div>";
		$(this).before(element);
		
	});
	
	// 방문장소 삭제 버튼 클릭
	$(".visited-remove-btn").click(function()
	{
		if (($(".visited-content").length) <= 1)
		{
			alert("방문장소는 1개 이상 입력 가능합니다.");
			return;
		}
		$(".visited-content").last().remove();
		
	});
	
});

function findPostcode(obj)
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
	     
	     $(obj).prev().val(data.zonecode);
	     $(obj).next().next().val(roadAddr);
	     $(obj).next().next().next().next().val("");
	     
	     }
	 }).open();
}