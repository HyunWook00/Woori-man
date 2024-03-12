/*==========================================================================
	AdminReportController.java
	- 사용자 정의 컨트롤러 클래스
==========================================================================*/

package com.woori.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestParam;

import com.woori.dao.AdminReportDAO;

@Controller
public class AdminReportController
{			
	public static HashMap<String, String> hashmap()
	{
		HashMap<String, String> reportType = new HashMap<String, String>(); 
		reportType.put("1", "그룹 신고");
		reportType.put("2", "자유게시글 신고");
		reportType.put("3", "자유게시판 댓글 신고");
		reportType.put("4", "자유게시판 대댓글 신고");
		reportType.put("5", "모임글 신고");
		reportType.put("6", "모임 댓글 신고");
		reportType.put("7", "모임 대댓글 신고");
		reportType.put("8", "히스토리글 신고");
		reportType.put("9", "히스토리 댓글 신고");
		reportType.put("10", "히스토리 대댓글 신고");
		
		return reportType;
	}
	
	
	// 신고내역 리스트
	@RequestMapping(value = "/adminreportlist.woori", method = RequestMethod.GET)
	public String ReportList(Model model) throws SQLException, ClassNotFoundException
	{
		String result = "";
		
		ArrayList<ReportDTO> Report = new ArrayList<ReportDTO>();
		
		AdminReportDAO dao = new AdminReportDAO();
		
		try
		{
			dao.connection();
			Report = dao.adminReportList();
			
			
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
		// 왜 안 나오냐면? hashmap 메소드를 실행하지 않았어요~ 그래서 hashmap에 들어있는게 하나도 없기 떄문에
		// 안 나오는 것입니다~.
		model.addAttribute("Report", Report);
		model.addAttribute("reportType", hashmap());
		
		result = "/WEB-INF/view/AdminReportList.jsp";
		
		return result;
	}
	
	
	// 신고 내역 게시글 상세
	@RequestMapping(value = "/adminreportarticle.woori", method = RequestMethod.GET)
	public String GroupReport(Model model) throws SQLException, ClassNotFoundException
	{
		String result = "";
		
		ReportDTO reportArticle = null;
		
		AdminReportDAO dao = new AdminReportDAO();
		
		try
		{
			dao.connection();
			//reportArticle = dao.adminReport();
			
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
		
		model.addAttribute("reportArticle", reportArticle);
		
		result = "WEB-INF/view/AdminReportArticle.jsp";
		
		return result;
	}
	
	// 
	
	
}
