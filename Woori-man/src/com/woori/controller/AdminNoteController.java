/*==========================================================================
	AdminController.java
	- 사용자 정의 컨트롤러 클래스
	
	- 데이터베이스의 리스트를 읽어오는 액션 처리
	- 『inquirylist.action』 → 요청 → inquiryList() 처리
	
	- 데이터 입력(회원 등록)폼 요청 관련 액션 처리
	- 『memberinsertform.action』 → 요청 → memberInsertForm() 처리
	
	- 데이터 입력(회원 등록) 액션 처리
	- 『memberinsert.action』 → 요청 → memberInsert() 처리
==========================================================================*/

package com.woori.controller;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.woori.AdminNoteDAO;
import com.project.woori.AdminNoteDTO;

@Controller
public class AdminNoteController
{			
	
	// 관리자 쪽지 리스트
	@RequestMapping(value = "/adminnotelist.woori", method = RequestMethod.GET)
	public String AdminNote(Model model) throws SQLException, ClassNotFoundException
	{
		String result = "";
		
		ArrayList<AdminNoteDTO> adminNote = null;
		
		AdminNoteDAO dao = new AdminNoteDAO();
		
		try
		{
			dao.connection();
			adminNote = dao.adminNote();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		finally
		{
			try
			{
				dao.close();
				
			} catch (Exception e)
			{
				System.out.println(e.toString());
			}
		}
		
		model.addAttribute("adminNote", adminNote);
		
		result = "/WEB-INF/view/AdminNoteList.jsp";
		
		return result;
	}
	
	// 관리자 쪽지 작성 폼
	@RequestMapping(value = "/adminnotewriteform.woori", method = RequestMethod.GET)
	public String AdminNoteWriteForm(Model model) throws SQLException, ClassNotFoundException
	{
		String result = "";
		
		result = "/WEB-INF/view/AdminNoteWrite.jsp";
		
		return result;
	}
	
	// 관리자 쪽지 작성 액션
	@RequestMapping(value = "/adminnotewrite.woori", method = RequestMethod.POST)
	public String AdminNoteWrite(Model model, AdminNoteDTO dto)
	{
		String result = "";
		
		AdminNoteDAO dao = new AdminNoteDAO();
		
		try
		{
			dao.connection();
			dao.adminNoteWrite(dto);
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		finally
		{
			try
			{
				dao.close();
				
			} catch (Exception e)
			{
				System.out.println(e.toString());
			}
		}
		
		result = "redirect:adminnote.woori";
		
		return result;
	}
	
	// 관리자 쪽지 상세
	@RequestMapping(value = "/adminnotearticle.woori", method = RequestMethod.GET)
	public String AdminNoteArticle(Model model, @RequestParam("an_code") String an_code) throws SQLException, ClassNotFoundException
	{
		String result = "";
		
		AdminNoteDTO adminNoteArticle = null;
		
		AdminDAO dao = new AdminDAO();
								
		try
		{
			dao.connection();
			adminNoteArticle = dao.adminNoteArticle(an_code);
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		finally
		{
			try
			{
				dao.close();
				
			} catch (Exception e)
			{
				System.out.println(e.toString());
			}
		}
		
		model.addAttribute("adminNoteArticle", adminNoteArticle);
		
		result = "/WEB-INF/view/AdminNoteArticle.jsp";
		
		return result;
	}

	
}
