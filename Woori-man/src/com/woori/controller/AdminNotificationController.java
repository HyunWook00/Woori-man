package com.woori.controller;


import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;		//-- check~!!!
import org.springframework.web.bind.annotation.RequestParam;

import com.woori.dto.AdminNotificationDTO;
import com.woori.dao.AdminNotificationDAO;


  

@Controller
public class AdminNotificationController
{
	// 공지사항 리스트 
		@RequestMapping(value = "/notification.woori")
		public String noticeList(Model model) throws SQLException, ClassNotFoundException
		{
			ArrayList<AdminNotificationDTO> noticeList = new ArrayList<AdminNotificationDTO>();
			AdminNotificationDAO dao = new AdminNotificationDAO();
			dao.connection();
			
			noticeList = dao.noticeList();
			
			model.addAttribute("noticeList", noticeList);
			
			return "WEB-INF/view/Notification.jsp";
		}
		
		
		// 공지사항 작성폼 이동 메소드
		@RequestMapping(value = "/notificationinsertform.woori")
		public String noticeInsertForm()
		{
			return "WEB-INF/view/NotificationInsertForm.jsp";
		}
		
		
		
		// 공지사항 작성 액션 처리 
		@RequestMapping(value = "/notificationinsert.woori")
		public String noticeInsert(@RequestParam("nf_title") String nf_title
								 , @RequestParam("nf_content") String nf_content
								 , @RequestParam("na_name") String na_name, HttpSession session) throws ClassNotFoundException, SQLException
		{
			AdminNotificationDAO dao = new AdminNotificationDAO();
			dao.connection();
			AdminNotificationDTO ad = new AdminNotificationDTO();
			String ad_code = (String)session.getAttribute("ad_code");
			
			nf_content = nf_content.replaceAll("\r\n", "<br>");
			na_name = "images/" + na_name;
			
			
			ad.setNf_title(nf_title);
			ad.setNf_content(nf_content);
			ad.setAd_code(ad_code);
			ad.setNa_name(na_name);
				
			dao.addNotice(ad);
				
			return "redirect:notification.woori";
		}
		
		


		// 특정 공지사항 내용 조회
		@RequestMapping(value = "/notificationread.woori")
		public String noticeRead(Model model, @RequestParam("nf_code") String nf_code) throws SQLException, ClassNotFoundException
		{
			AdminNotificationDAO dao = new AdminNotificationDAO();
			AdminNotificationDTO notice = new AdminNotificationDTO();
			
			dao.connection();
			notice = dao.searchNotice(nf_code);
			
			model.addAttribute("notice", notice);
			
			return "WEB-INF/view/NotificationRead.jsp";
		}

}











































