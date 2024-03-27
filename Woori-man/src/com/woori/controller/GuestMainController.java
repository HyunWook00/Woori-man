/*==========================================================================
	AdminInquiryController.java
	- 사용자 정의 컨트롤러 클래스
==========================================================================*/

package com.woori.controller;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class GuestMainController
{			
	// 비회원 메인 페이지
	@RequestMapping(value = "/guestmain.woori")
	public String guestMain()
	{
		String result = "";
		
		result = "/WEB-INF/view/GuestMain.jsp";
		
		return result;
	}
	
	@RequestMapping(value = "/guestloginform.woori")
	public String login()
	{
		String result = "";
		
		result = "/WEB-INF/view/Login.jsp";
		
		return result;
	}
	
	@RequestMapping(value = "/guestmembershipform.woori")
	public String membership()
	{
		String result = "";
		
		result = "/WEB-INF/view/Membership.jsp";
		
		return result;
	}
	
	

	
}
