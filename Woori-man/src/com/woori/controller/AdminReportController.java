/*==========================================================================
	AdminReportController.java
	- 사용자 정의 컨트롤러 클래스
==========================================================================*/

package com.woori.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestParam;

import com.woori.dao.AdminReportDAO;
import com.woori.dto.ReportDTO;

@Controller
public class AdminReportController
{			
	public static HashMap<String, String> hashmap()
	{
		HashMap<String, String> reportType = new HashMap<String, String>(); 
		reportType.put("1", "그룹 신고");
		reportType.put("2", "자유게시글 신고");
		reportType.put("3", "자유게시글 댓글 신고");
		reportType.put("4", "자유게시글 대댓글 신고");
		reportType.put("5", "모임 글 신고");
		reportType.put("6", "모임 댓글 신고");
		reportType.put("7", "모임 대댓글 신고");
		reportType.put("8", "히스토리 글 신고");
		reportType.put("9", "히스토리 댓글 신고");
		reportType.put("10", "히스토리 대댓글 신고");
		
		return reportType;
	}
	
	
	// 신고내역 리스트
	@RequestMapping(value = "/adminreportlist.woori", method = RequestMethod.GET)
	public String AdminReportList(Model model) throws SQLException, ClassNotFoundException
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
	public String AdminReportArticleForm(Model model
			, @RequestParam("report_code") String report_code, @RequestParam("report_type") String report_type
			, HttpSession session) throws SQLException, ClassNotFoundException
	{
		String result = "";
		
		AdminReportDAO dao = new AdminReportDAO();
		
		ReportDTO reportArticle = null;
		
		String ad_code = (String)session.getAttribute("ad_code");
		
		try
		{
			dao.connection();						
			
			switch (report_type)
			{
				case "1":
					// 그룹 신고 상세 열람 시 
					dao.groupReportUpdate(ad_code, report_code);
					reportArticle = dao.GroupReportArticle(report_code);
					break;
				case "2":
					// 자유게시글 신고 상세 열람 시 
					dao.boardReportUpdate(ad_code, report_code);
			    	reportArticle = dao.BoardReportArticle(report_code); 
					break;
				case "3":
					// 자유게시글 댓글 신고 상세 열람 시 
					dao.boardCommentReportUpdate(ad_code, report_code); 
			    	reportArticle = dao.boardCommentReportArticle(report_code); 
					break;						
				case "4":
					// 자유게시글 대댓글 신고 상세 열람 시 
					dao.boardRecommentReportUpdate(ad_code, report_code); 
			    	reportArticle = dao.boardRecommentReportArticle(report_code); 
					break;
				case "5":
					// 모임 글 신고 상세 열람 시
					dao.MeetingReportUpdate(ad_code, report_code); 
			    	reportArticle = dao.meetingReportArticle(report_code);
					break;
				case "6":
					// 모임 댓글 신고 상세 열람 시
					dao.MeetingCommentReportUpdate(ad_code, report_code); 
			    	reportArticle = dao.meetingCommentReportArticle(report_code);
					break;
				case "7":
					// 모임 대댓글 신고 상세 열람 시
					dao.MeetingRecommentReportUpdate(ad_code, report_code); 
			    	reportArticle = dao.meetingRecommentReportArticle(report_code);
					break;
				case "8":
					// 히스토리 글 신고 상세 열람 시
					dao.HistoryReportUpdate(ad_code, report_code); 
			    	reportArticle = dao.historyReportArticle(report_code);
					break;
				case "9":
					// 히스토리 댓글 신고 상세 열람 시
					dao.HistoryCommentReportUpdate(ad_code, report_code);
			    	reportArticle = dao.historyCommentReportArticle(report_code);
					break;
				case "10":
					// 히스토리 대댓글 신고 상세 열람 시
					dao.HistoryRecommentReportUpdate(ad_code, report_code); 
			    	reportArticle = dao.historyRecommentReportArticle(report_code);
					break;
				
			}
			
			/*
			// 그룹 신고 상세 열람 시
			if (report_type.equals("1"))
			{
				dao.groupReportUpdate(ad_code, report_code);
				reportArticle = dao.GroupReportArticle(report_code);						
			} 
		    // 자유게시글 신고 상세 열람 시 
		    if (report_type.equals("2")) 
		    { 
		    	dao.boardReportUpdate(ad_code, report_code);
		    	reportArticle = dao.BoardReportArticle(report_code); 
	    	}
		    // 자유게시글 댓글 신고 상세 열람 시
		    else if (report_type.equals("3")) 
		    { 
		    	dao.boardCommentReportUpdate(ad_code, report_code); 
		    	reportArticle = dao.boardCommentReportArticle(report_code); 
	    	} 
		    // 자유게시글 대댓글 신고 상세 열람 시 
		    else if (report_type.equals("4")) 
		    { 
		    	dao.boardRecommentReportUpdate(ad_code, report_code); 
		    	reportArticle = dao.boardRecommentReportArticle(report_code); 
	    	} 
		    // 모임 글 신고 상세 열람 시 
		    else if (report_type.equals("5")) 
		    { 
		    	dao.MeetingReportUpdate(ad_code, report_code); 
		    	reportArticle = dao.meetingReportArticle(report_code); 
	    	} 
		    // 모임 댓글 신고 상세 열람 시 
		    else if (report_type.equals("6")) 
		    { 
		    	dao.MeetingCommentReportUpdate(ad_code, report_code); 
		    	reportArticle = dao.meetingCommentReportArticle(report_code); 
	    	} 
		    // 모임 대댓글 신고 상세 열람 시 
		    else if (report_type.equals("7")) 
		    { 
		    	dao.MeetingRecommentReportUpdate(ad_code, report_code); 
		    	reportArticle = dao.meetingRecommentReportArticle(report_code); 
	    	} 
		    // 히스토리 글 신고 상세 열람 시 
		    else if (report_type.equals("8")) 
		    { 
		    	dao.HistoryReportUpdate(ad_code, report_code); 
		    	reportArticle = dao.historyReportArticle(report_code); 
	    	} 
		    // 히스토리 댓글 신고 상세 열람 시 
		    else if (report_type.equals("9")) 
		    {
		    	dao.HistoryCommentReportUpdate(ad_code, report_code);
		    	reportArticle = dao.historyCommentReportArticle(report_code); 
	    	}
		    // 히스토리 대댓글 신고 상세 열람 시 
		    else if (report_type.equals("10")) 
		    {
		    	dao.HistoryRecommentReportUpdate(ad_code, report_code); 
		    	reportArticle = dao.historyRecommentReportArticle(report_code); 
	    	}
	    	*/
				 
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
		
		result = "/WEB-INF/view/AdminReportArticle.jsp";
		
		return result;
	}
	
	// 신고 처리 페이지
	@RequestMapping(value = "/adminreportresultform.woori", method = RequestMethod.GET)
	public String AdminReportResultForm(Model model, @RequestParam("report_code") String report_code
			, @RequestParam("report_type") String report_type) throws SQLException, ClassNotFoundException
	{
		String result = "";
		
		ReportDTO reportArticle = null;
		ArrayList<ReportDTO> reportResult = null;
		
		AdminReportDAO dao = new AdminReportDAO();
		
		try
		{
			dao.connection();

			switch (report_type)
			{
				case "1":
					// 그룹 신고 상세 열람 시 
					reportArticle = dao.GroupReportArticle(report_code);
					break;
				case "2":
					// 자유게시글 신고 상세 열람 시 
			    	reportArticle = dao.BoardReportArticle(report_code); 
					break;
				case "3":
					// 자유게시글 댓글 신고 상세 열람 시 
			    	reportArticle = dao.boardCommentReportArticle(report_code); 
					break;						
				case "4":
					// 자유게시글 대댓글 신고 상세 열람 시 
			    	reportArticle = dao.boardRecommentReportArticle(report_code); 
					break;
				case "5":
					// 모임 글 신고 상세 열람 시
			    	reportArticle = dao.meetingReportArticle(report_code);
					break;
				case "6":
					// 모임 댓글 신고 상세 열람 시
			    	reportArticle = dao.meetingCommentReportArticle(report_code);
					break;
				case "7":
					// 모임 대댓글 신고 상세 열람 시
			    	reportArticle = dao.meetingRecommentReportArticle(report_code);
					break;
				case "8":
					// 히스토리 글 신고 상세 열람 시
			    	reportArticle = dao.historyReportArticle(report_code);
					break;
				case "9":
					// 히스토리 댓글 신고 상세 열람 시
			    	reportArticle = dao.historyCommentReportArticle(report_code);
					break;
				case "10":
					// 히스토리 대댓글 신고 상세 열람 시
			    	reportArticle = dao.historyRecommentReportArticle(report_code);
					break;
				
			}
			
			/*
			// 그룹 신고 상세 열람 시
			if (report_type.equals("1"))
			{
				reportArticle = dao.GroupReportArticle(report_code);						
			} 
		    // 자유게시글 신고 상세 열람 시 
		    if (report_type.equals("2")) 
		    { 
		    	reportArticle = dao.BoardReportArticle(report_code); 
	    	}
		    // 자유게시글 댓글 신고 상세 열람 시
		    else if (report_type.equals("3")) 
		    { 
		    	reportArticle = dao.boardCommentReportArticle(report_code); 
	    	} 
		    // 자유게시글 대댓글 신고 상세 열람 시 
		    else if (report_type.equals("4")) 
		    { 
		    	reportArticle = dao.boardRecommentReportArticle(report_code); 
	    	} 
		    // 모임 글 신고 상세 열람 시 
		    else if (report_type.equals("5")) 
		    { 
		    	reportArticle = dao.meetingReportArticle(report_code); 
	    	} 
		    // 모임 댓글 신고 상세 열람 시 
		    else if (report_type.equals("6")) 
		    { 
		    	reportArticle = dao.meetingCommentReportArticle(report_code); 
	    	} 
		    // 모임 대댓글 신고 상세 열람 시 
		    else if (report_type.equals("7")) 
		    { 
		    	reportArticle = dao.meetingRecommentReportArticle(report_code); 
	    	} 
		    // 히스토리 글 신고 상세 열람 시 
		    else if (report_type.equals("8")) 
		    { 
		    	reportArticle = dao.historyReportArticle(report_code); 
	    	} 
		    // 히스토리 댓글 신고 상세 열람 시 
		    else if (report_type.equals("9")) 
		    {
		    	reportArticle = dao.historyCommentReportArticle(report_code); 
	    	}
		    // 히스토리 대댓글 신고 상세 열람 시 
		    else if (report_type.equals("10")) 
		    {
		    	reportArticle = dao.historyRecommentReportArticle(report_code); 
	    	}
	    	*/
		    
		    reportResult = dao.ReportResult();
				 
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
		model.addAttribute("reportResult", reportResult);
		
		result = "/WEB-INF/view/AdminReportResult.jsp";
		
		return result;
	}
	
	// 신고 처리 액션
	@RequestMapping(value = "/adminreportresult.woori", method = RequestMethod.GET)
	public String AdminReportResult(Model model, @RequestParam("rr_code") String rr_code
			, @RequestParam("report_code") String report_code, @RequestParam("report_type") String report_type
			, HttpSession session) throws SQLException, ClassNotFoundException
	{
		String result = "";
		
		AdminReportDAO dao = new AdminReportDAO();
		
		String ad_code = (String)session.getAttribute("ad_code");
		
		try
		{
			dao.connection();
			
			// 신고 처리 액션 메소드
			
			switch (report_type)
			{
				case "1":
					// 그룹 신고 결과 처리 
					dao.GroupReportResult(rr_code, report_code);
					break;
				case "2":
					// 자유게시글 신고 결과 처리 
					dao.BoardReportResult(rr_code, report_code); 
					break;
				case "3":
					// 자유게시글 댓글 신고 결과 처리 
					dao.BoardCommentReportResult(rr_code, report_code); 
					break;						
				case "4":
					// 자유게시글 대댓글 신고 상세 열람 시 
					dao.BoardRecommentReportResult(rr_code, report_code); 
					break;
				case "5":
					// 모임 글 신고 결과 처리
					dao.MeetingReportResult(rr_code, report_code);
					break;
				case "6":
					// 모임 댓글 신고 결과 처리
					dao.MeetingCommentReportResult(rr_code, report_code);
					break;
				case "7":
					// 모임 대댓글 신고 결과 처리
					dao.MeetingRecommentReportResult(rr_code, report_code);
					break;
				case "8":
					// 히스토리 글 신고 결과 처리
					dao.HistoryReportResult(rr_code, report_code);
					break;
				case "9":
					// 히스토리 댓글 신고 결과 처리
					dao.HistoryCommentReportResult(rr_code, report_code);
					break;
				case "10":
					// 히스토리 대댓글 신고 결과 처리
					dao.HistoryRecommentReportResult(rr_code, report_code);
					break;
				
			}
			
			
			/*
			// 그룹 신고 결과 처리
			if (report_type.equals("1"))
			{
				dao.GroupReportResult(rr_code, report_code);
			}
			// 자유게시글 신고 결과 처리
			else if (report_type.equals("2"))
			{
				dao.BoardReportResult(rr_code, report_code);
			}
			// 자유게시글 댓글 신고 결과 처리
			else if (report_type.equals("3"))
			{
				dao.BoardCommentReportResult(rr_code, report_code);
			}
			// 자유게시글 대댓글 신고 결과 처리
			else if (report_type.equals("4"))
			{
				dao.BoardRecommentReportResult(rr_code, report_code);
			}
			// 모임 글 신고 결과 처리
			else if (report_type.equals("5"))
			{
				dao.MeetingReportResult(rr_code, report_code);
			}
			// 모임 댓글 신고 결과 처리
			else if (report_type.equals("6"))
			{
				dao.MeetingCommentReportResult(rr_code, report_code);
			}
			// 모임 대댓글 신고 결과 처리
			else if (report_type.equals("7"))
			{
				dao.MeetingRecommentReportResult(rr_code, report_code);
			}
			// 히스토리 글 신고 결과 처리
			else if (report_type.equals("8"))
			{
				dao.HistoryReportResult(rr_code, report_code);
			}
			// 히스토리 댓글 신고 결과 처리
			else if (report_type.equals("9"))
			{
				dao.HistoryCommentReportResult(rr_code, report_code);
			}
			// 히스토리 대댓글 신고 결과 처리
			else if (report_type.equals("10"))
			{
				dao.HistoryRecommentReportResult(rr_code, report_code);
			}
			*/
			
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
		
		result = "redirect:adminreportarticle.woori?report_code=" + report_code + "&ad_code=" + ad_code + "&report_type=" + report_type;
		
		return result;
	}
	
	
}
