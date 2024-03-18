/**
membership.js
*/

// 아이디 중복확인 ajax 처리 부분
var idSameCheck = false;
var telSameCheck = false;

$(document).ready(function()
{
	
	
	$(".checkBtn").click(function()
	{
		
		
		var us_id = $("#us_id").val();
		var params = "us_id="+us_id;
		
		
		 $.ajax({
	            type: "GET"
	            , url: "idcheck.woori"
	            , data: params
	            , success: function(args)
				{
	            	
	            	if (args == 0)
					{
	            		Swal.fire({
		            		  title: "Good job!",
		            		  text: "사용 가능한 아이디입니다. ",
		            		  icon: "success"
		            		});
	            		idSameCheck = true;
	            		return idSameCheck;
	            		
					}
	            	else if (args == 1)
	            	{
	            		Swal.fire({
	            			  icon: "error",
	            			  title: "Oops...",
	            			  text: "이미 사용중인 아이디 입니다.",
	            			});
	            	}
				}
		 		, beforeSend: checkId
		 		, error: function(e)
				{
					alert(e.responseText);
				}
	           
	        });		
	});
	
	
	$(".telBtn").click(function()
	{
		var us_tel1 = $("#us_tel1").val();
		var us_tel2 = $("#us_tel2").val();
		var params = "us_tel1=" + us_tel1 + "&us_tel2=" + us_tel2;
		
		
		 $.ajax({
	            type: "GET"
	            , url: "telcheck.woori"
	            , data: params
	            , success: function(args)
				{
	            	if (args == 0)
					{
	            		Swal.fire({
		            		  title: "Good job!",
		            		  text: "본인인증이 완료되었습니다. ",
		            		  icon: "success"
		            		});
	            		
	            		telSameCheck = true;
	            		return telSameCheck;
					}
	            	else if (args == 1)
	            	{
	            		Swal.fire({
	            			  icon: "error",
	            			  title: "Oops...",
	            			  text: "이미 가입된 전화번호 입니다.",
	            			});
	            		
	            	}
				}
		 		, beforeSend: checkTel
		 		, error: function(e)
				{
					alert(e.responseText);
				}
	           
	        });		
	});
	
});



function checkId()
{
	var flag = true;
	
	if ($.trim($("#us_id").val()).length < 6 || $.trim($("#us_id").val()).length > 20)
	{
		alert("6 ~ 20 자리 아이디를 입력 해주세요.");
		flag = false;
		$("#us_id").focus();
		return flag;
	}
}


// 전화번호 확인 ajax 처리 이전 체크사항
function checkTel()
{
	var flag = true;
	
	// 입력한 중간, 뒤 번호의 길이가 각각 4가 아니라면 flase 반환 
	if ($.trim($("#us_tel1").val()).length != 4 || $.trim($("#us_tel2").val()).length != 4)
	{
		Swal.fire(
		{
			  title: "정확이 입력하셨나요?",
			  text: "올바른 전화번호를 입력해주세요.",
			  icon: "info"
		});
		flag = false;
	}
	return flag;
	
}

// 우편번호 스크립단
function sample6_execDaumPostcode() 
{
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
            
            } else {
                document.getElementById("sample6_extraAddress").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById("us_zipcode").value = data.zonecode;
            document.getElementById("us_addr1").value = addr + extraAddr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("us_addr2").focus();
        }
    }).open();
}


function checkInfo()
{
	
	
	if ($.trim($("#us_id").val()).length < 6 || $.trim($("#us_id").val()).length > 20)
	{
		alert("6 ~ 20 자리 아이디를 입력 해주세요.");
		$("#us_id").focus();
		return;
	}
	else if($.trim($("#us_pwd").val()).length < 8 || $.trim($("#us_pwd").val()).length >= 20)
	{
		alert("8 ~ 20 자리 비밀번호를 입력 해주세요.");
		$("#us_pwd").focus();
		return;
	}
	else if($.trim($("#us_pwd").val()) != $.trim($("#pwd2").val())) 
	{
		alert("비밀번호가 서로 일치하지 않습니다.");
		$("#pwd2").focus();
		return;
	}
	else if(!$.trim($("#us_name").val()))
	{
		alert("이름을 입력 해주세요.");
		$("#us_name").focus();
		return;
	}
	else if($.trim($("#us_birthday").val()).length != 6 )
	{
		alert("주민번호 앞 6자리 형식으로 입력 해주세요.");
		$("#us_birthday").focus();
		return;
	}
	else if($.trim($("#us_birthday2").val()).length != 1 )
	{
		alert("주민번호 뒷 1자리를 입력해주세요.");
		$("#us_birthday2").focus();
		return;
	}
	else if(!$('#us_lunar1').is(':checked') && !$('#us_lunar2').is(':checked')) 
	{
		alert("양/음력을 선택해주세요.");
		$("#us_lunar1").focus();
		return;
	}
	else if ($.trim($("#us_tel1").val()).length != 4 || $.trim($("#us_tel2").val()).length != 4)
	{
		alert("올바른 전화번호를 입력해주세요.");
		$("#us_tel1").focus();
		return;
	}
	else if(!$.trim($("#us_email").val()))
	{
		alert("이메일을 선택해주세요.");
		$("#us_email").focus();
		return;
	}
	else if(!$.trim($("#us_zipcode").val()))
	{
		alert("주소를 입력해주세요.");
		$(".addrBtn").focus();
		return;
	}
	else if(!$.trim($("#us_addr2").val()))
	{
		alert("상세주소를 입력해주세요.");
		$("#us_addr2").focus();
		return;
	}
	else if(!$('#agree').is(':checked'))
	{
		alert("이용약관 동의를 해주세요.");
		$("#agree").focus();
		return;
	}
	else if (idSameCheck != true)
	{
		alert("아이디 중복 확인을 해주세요.");
		return;
	}
	else if (telSameCheck != true)
	{
		alert("전화번호 중복 확인을 해주세요.");
		return;
	}
	
	$("#userForm").submit();
	alert("회원가입이 완료되었습니다.");
}
	