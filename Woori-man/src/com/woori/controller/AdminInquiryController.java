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
//import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestParam;

import com.woori.dao.AdminInquiryDAO;
import com.woori.dto.InquiryDTO;

@Controller
public class AdminInquiryController
{			
	// 문의사항 리스트를 읽어오는 액션 처리
	@RequestMapping(value = "/admininquirylist.woori", method = RequestMethod.GET)
	public String inquiryList(Model model, HttpSession session) throws SQLException, ClassNotFoundException
	{
		String result = "";
		
		int count = 0;
		ArrayList<InquiryDTO> inquiryList = new ArrayList<InquiryDTO>();
		ArrayList<InquiryDTO> inquiryCategory = new ArrayList<InquiryDTO>();
		
		AdminInquiryDAO dao = new AdminInquiryDAO();
		
		try
		{
			dao.connection();
			
			count = dao.inquiryCount();
			inquiryList = dao.inquiryList();
			inquiryCategory = dao.inquiryCategory();
			
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
		
		model.addAttribute("count", count);
		model.addAttribute("inquiryList", inquiryList);
		model.addAttribute("inquiryCategory", inquiryCategory);
		
		result = "/WEB-INF/view/AdminInquiryList.jsp";
		
		return result;
	}
	
	// 문의사항 리스트 상태별 분기(접수완료/검토중/처리완료)
	@RequestMapping(value = "/admininquirystatuslist.woori", method = RequestMethod.GET)
	public String inquiryStatusList(Model model, @RequestParam("iq_status") String iq_status) throws SQLException, ClassNotFoundException
	{
		String result = "";
		
		int count = 0;
		ArrayList<InquiryDTO> inquiryList = new ArrayList<InquiryDTO>();
		
		AdminInquiryDAO dao = new AdminInquiryDAO();
		
		try
		{
			dao.connection();
			
			
		    if (!iq_status.equals("")) 
		    { 
		    	inquiryList = dao.inquiryList(iq_status); 
		    	count = dao.inquiryCount(iq_status); 
	    	} 
		    else if (iq_status=="")  
		    { 
		    	inquiryList = dao.inquiryList(); count = dao.inquiryCount(); 
	    	}
			
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
		
		model.addAttribute("count", count);
		model.addAttribute("inquiryList", inquiryList);
		
		result = "/WEB-INF/view/AdminInquiryList.jsp";
		
		return result;
	}
	
	// 카테고리별 분기
	@RequestMapping(value = "/admininquirycategorylist.woori", method = RequestMethod.GET)
	public String inquiryCategoryList(Model model, @RequestParam("category") String category) throws SQLException, ClassNotFoundException
	{
		String result = "";
		
		int count = 0;
		ArrayList<InquiryDTO> inquiryList = new ArrayList<InquiryDTO>();
		
		AdminInquiryDAO dao = new AdminInquiryDAO();
		
		try
		{
			dao.connection();
			
			if (!category.equals(""))
			{
				inquiryList = dao.inquiryList2(category);
				count = dao.inquiryCount2(category);
			}
			else if (category=="") 
			{	
				inquiryList = dao.inquiryList();
				count = dao.inquiryCount();
			}
			
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
		
		model.addAttribute("count", count);
		model.addAttribute("inquiryList", inquiryList);
		
		result = "/WEB-INF/view/AdminInquiryList.jsp";
		
		return result;
	}
	
	
	
	// 문의사항 상세
	@RequestMapping(value = "/admininquiryarticle.woori", method = RequestMethod.GET)
	public String inquiryArticle(Model model, InquiryDTO inquiry, @RequestParam("iq_code") String iq_code
			, HttpSession session) throws SQLException
	{
	    
		String result = "";
	    InquiryDTO inquiryArticle = null;
	    InquiryDTO inquiryAttach = null;
	    
	    AdminInquiryDAO dao = new AdminInquiryDAO();	    	    
	    
	    String ad_code = (String)session.getAttribute("ad_code");
	    
	    try 
	    {
	        dao.connection();	        	        	        	     
	        
	        if (inquiry.getAd_code() == null || inquiry.getAd_code().equals(""))
	        {	        	
	        	dao.inquiryUpdate(ad_code, iq_code);
	        	inquiryArticle = dao.inquiryArticle(iq_code);
	        	inquiryAttach = dao.inquiryAttach(iq_code);
	        }
	        else
	        {
	        	inquiryArticle = dao.inquiryArticle(iq_code);
	        	inquiryAttach = dao.inquiryAttach(iq_code);
	        }
	        
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
	    
	    model.addAttribute("inquiryArticle", inquiryArticle); 
	    model.addAttribute("inquiryAttach", inquiryAttach); 
	    
	    result = "/WEB-INF/view/AdminInquiryArticle.jsp"; 
	    
	    return result;
	}
	
	
	
	// 문의사항 답변 폼
	@RequestMapping(value = "/admininquiryanswerform.woori", method = RequestMethod.GET)
	public String inquiryAnswerForm(Model model, @RequestParam("iq_code") String iq_code) throws SQLException, ClassNotFoundException 
	{
	    
		String result = "";
	    InquiryDTO inquiryArticle = null;
	    InquiryDTO inquiryAttach = null;
	    
	    AdminInquiryDAO dao = new AdminInquiryDAO();
	    
	    try 
	    {
	        dao.connection();
	        inquiryArticle = dao.inquiryArticle(iq_code);
	        inquiryAttach = dao.inquiryAttach(iq_code);
	        
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
	    
	    model.addAttribute("inquiryArticle", inquiryArticle); 
	    model.addAttribute("inquiryAttach", inquiryAttach); 
	    
	    result = "/WEB-INF/view/AdminInquiryAnswer.jsp"; 
	    
	    return result;
	}
	
	// 문의사항 답변 입력
	@RequestMapping(value = "/admininquiryanswer.woori", method = RequestMethod.GET)
	public String inquiryAnswer(Model model, @RequestParam("iq_code") String iq_code, HttpSession session 
			, @RequestParam("as_content") String as_content) throws SQLException, ClassNotFoundException 
	{
	    String result = "";		
	    
	    AdminInquiryDAO dao = new AdminInquiryDAO();	    	    	    	    
	    
	    String ad_code = (String)session.getAttribute("ad_code");
	    
	    try
		{
			dao.connection();
			dao.inquiryAnswer(iq_code, as_content, ad_code);
	    	
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
	    
	    result = "redirect:admininquiryarticle.woori?iq_code=" + iq_code;
	    
	    return result;
	}
	
	
	

	
}
