package com.woori.controller;


import java.io.File;
import java.sql.SQLException;
import java.util.ArrayList;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;		//-- check~!!!
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;

import com.woori.dto.AdminNotificationDTO;
import com.woori.dao.AdminNotificationDAO;
import com.woori.dto.AdminDTO;

import sun.nio.fs.DefaultFileTypeDetector;

  

@Controller
public class AdminNotificationController
{
	// 공지사항 리스트 
		@RequestMapping(value = "/notice.woori")
		public String noticeList(Model model) throws SQLException, ClassNotFoundException
		{
			ArrayList<AdminNotificationDTO> noticeList = new ArrayList<AdminNotificationDTO>();
			AdminNotificationDAO dao = new AdminNotificationDAO();
			dao.connection();
			
			noticeList = dao.noticeList();
			
			model.addAttribute("noticeList", noticeList);
			
			return "Notification.jsp";
		}
		
		
		// 공지사항 작성폼 이동 메소드
		@RequestMapping(value = "/noticeinsertform.woori")
		public String noticeInsertForm()
		{
			return "NotificationInsertForm.jsp";
		}
		
		
		
		// 공지사항 작성 액션 처리 
		@RequestMapping(value = "/noticeinsert.woori")
		public String noticeInsert(@RequestParam("nf_title") String nf_title
								 , @RequestParam("nf_content") String nf_content
								 , @RequestParam("ad_code") String ad_code
								 , @RequestParam("na_name") String na_name) throws ClassNotFoundException, SQLException
		{
			AdminNotificationDAO dao = new AdminNotificationDAO();
			dao.connection();
			AdminNotificationDTO ad = new AdminNotificationDTO();

			
			
			
		
			
			System.out.println(nf_title);
			System.out.println(nf_content);
			System.out.println(ad_code);
			System.out.println(na_name);
			
			
			ad.setNf_title(nf_title);
			ad.setNf_content(nf_content);
			ad.setAd_code(ad_code);
			ad.setNa_name(na_name);
				
			dao.addNotice(ad);
				
			return "redirect:notice.woori";
		}
		
		


		// 특정 공지사항 내용 조회
		@RequestMapping(value = "/noticeread.woori")
		public String noticeRead(Model model, @RequestParam("nf_code") String nf_code) throws SQLException, ClassNotFoundException
		{
			AdminNotificationDAO dao = new AdminNotificationDAO();
			AdminNotificationDTO notice = new AdminNotificationDTO();
			
			dao.connection();
			notice = dao.searchNotice(nf_code);
			
			model.addAttribute("notice", notice);
			
			return "NotificationRead.jsp";
		}

}











































