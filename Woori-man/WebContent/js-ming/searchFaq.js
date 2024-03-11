/*
 검색 기능을 제공하는 jquery 함수
 */

	$(function()
	{
		$("#searchFaq").keyup(function()
		{
			//alert("확인이염");
			// 값을 제대로 받아오는지 확인
			//alert($(this).val());
			
			// 검색어를 담을 변수
			var searchKeyword = $(this).val();
			
			// 서버로 전송하기 전 유효성 검사 ====================================================
			// ① 검색어가 존재할 경우에만 서버로 전송할 수 있도록 처리
			if(searchKeyword.replace(" ","")=="")	
			{
				$("#searchList").css("display","none");
				return;
			}		
			/*	
			// ② 입력된 검색어가 완성형 한글일 경우에만 
			//	  검색 키워드를 전송할 수 있도록 처리
			//    정규표현식 사용
			var regEx = /^[가-힣]{1,}$/;
			
			if(regEx.test(searchKeyword))
			{
				return; 
			}
			// ==================================================== 서버로 전송하기 전 유효성 검사
			 */
			
			
		 	var param = "searchKeyword="+searchKeyword;
					
			$.ajax(
			{ 	
				type:"POST"
				,url: "searchfaqlist.woori"
				,data: param
				,datatype: "xml"
				,success: function(args)
				{
					var searchList = "";
					
					//alert("에러 놉~");
					//alert(args);
					//alert($(args).find("faqList").val());
					$(args).find("faqList").each(function()
					{
						//alert("들어옴");
						
					 	var item = $(this);
						//alert(item.text());
						var fqatitle = item.find("faq_title").text();
						var fqacode = item.find("faq_code").text();
						var fccode = item.find("fc_code").text();
						
						searchList += "<a href='faq.woori?fc_code="+fccode+"#"+fqacode+"'>"+ fqatitle +"</a><br>"
					});
					
					$("#searchList").html(searchList);
					$("#searchList").css("display","block");
				}
				,beforesend: function()
				{
					return true;
				}
				,error: function(e)
				{
					alert(e.responseText);
				}
				
			});
				
						
		});
		
	});