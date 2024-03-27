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
	/*
	if ($.trim($("#us_id").val()).length < 6 || $.trim($("#us_id").val()).length > 20)
	{
		alert("6 ~ 20 자리 아이디를 입력 해주세요.");
		flag = false;
		$("#us_id").focus();
		return flag;
	}
	*/
	
	var us_id = $('#us_id').val();
	var regId = /^(?=.*\d)(?=.*[a-zA-Z])[a-zA-Z0-9]{6,20}$/;
    if (!regId.test(us_id))
    {
    	alert('아이디는 영소문자,숫자로 구성된 6 ~ 20 글자 이상으로 조합하시오.');
        $('#us_id').focus();
        return false;
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
	
	var regId = /^(?=.*\d)(?=.*[a-zA-Z])[a-zA-Z0-9]{6,20}$/; 		 								 // 아이디 정규표현식 (영문,숫자 조합 6 ~ 20 자리)
	var regPwd = /^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#$%^&*()_+])[A-Za-z\d!@#$%^&*()_+]{8,20}$/; // 비밀번호 정규표현식 (영문 대/소문자 + 숫자 특수 문자 조합 8 ~ 20)
	var regBirth = /([0-9]{2}(0[1-9]|1[0-2])(0[1-9]|[1,2][0-9]|3[0,1]))/;							 // 주민번호 앞 6 정규표현식
	var regBirth2 =/^[1234]$/;																		 // 주빈번호 뒤 1 정규표현식
	var regEmail = /^[\w.-]+@[a-zA-Z\d.-]+\.[a-zA-Z]{2,}$/;											 // 이메일 정규표현식
	var regName = /^[가-힣]{2,4}$/;																	 // 이름 정규표현식
	var regTel = /^\d{4}$/;																			 // 전화번호 정규표현식
	
	
    if (!regId.test($("#us_id").val()))
    {
    	alert('올바른 조건의 아이디를 입력해주세요.');
        $('#id-err').hover();
        return;
    }
	else if(!regPwd.test($("#us_pwd").val()))
	{
		alert("올바른 조건의 비밀번호를 입력해주세요.");
		$("#us_pwd").focus();
		return;
	}
	else if($.trim($("#us_pwd").val()) != $.trim($("#pwd2").val())) 
	{
		alert("비밀번호가 서로 일치하지 않습니다.");
		$("#pwd2").focus();
		return;
	}
	else if(!regName.test($("#us_name").val()))
	{
		alert("정확한 이름을 입력 해주세요.");
		$("#us_name").focus();
		return;
	}
	else if(!regBirth.test($("#us_birthday").val()))
	{
		alert("정확한 생년월일 6자리를 입력해주세요.");
		$("#us_birthday").focus();
		return;
	}
	else if(!regBirth2.test($("#us_birthday2").val()))
	{
		alert("정확한 주민번호 뒤 1자리를 입력해주세요.");
		$("#us_birthday2").focus();
		return;
	}
	else if(!$('#us_lunar1').is(':checked') && !$('#us_lunar2').is(':checked')) 
	{
		alert("양/음력을 선택해주세요.");
		$("#us_lunar1").focus();
		return;
	}
	else if (!regTel.test($("#us_tel1").val()) || !regTel.test($("#us_tel2").val()))
	{
		alert("정확한 전화번호를 입력해주세요.");
		$("#us_tel1").focus();
		return;
	}
	else if(!regEmail.test($("#us_email").val()))
	{
		alert("정확한 이메일 형식을 맞춰 입력해주세요.");
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
	