/* ======================
  	CsController.java
  	- 컨트롤러 객체
 =======================*/

package com.woori.controller;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.woori.dao.ICsDAO;
import com.woori.dao.IReportDAO;
import com.woori.dto.CsDTO;

@Controller
public class CsController
{	
	@Autowired
	private SqlSession sqlsession;
	
	// 고객센터 메인 접속 시 사용되는 컨트롤러
	@RequestMapping(value="/cs.woori", method=RequestMethod.GET)
	public String CsMain(ModelMap model, String fc_code)
	{	
		// 처음 접속 시 기본 값으로 자주 묻는 질문 회원 카테고리를 보여줌
		if (fc_code == null)
		{
			fc_code = "1";
		}	
		
		ICsDAO dao = sqlsession.getMapper(ICsDAO.class);
		
		// 공지사항 제목 조회 DAO
		model.addAttribute("noticesTitle", dao.noticesList());
		
		// 자주묻는 질문 제목 조회 DAO
		model.addAttribute("faqList",dao.faqList(fc_code));

		return "Cs.jsp";
	}
	
	// 자주 묻는 질문 페이지 접속시 사용되는 컨트롤러
	@RequestMapping(value = "/faq.woori", method = RequestMethod.GET)
	public String faqList(ModelMap model, String fc_code)
	{
		// 처음 접속 시 기본 값으로 자주 묻는 질문 회원 카테고리를 보여줌
		if (fc_code == null)
		{
			fc_code = "1";
		}	

		ICsDAO dao = sqlsession.getMapper(ICsDAO.class);
		
		// 자주 묻는 질문 리스트 조회 DAO
		model.addAttribute("faqList", dao.faqList(fc_code));
		
		return "Faq.jsp";
	}
	
	// 1:1 문의사항 접수 페이지 접속시 사용되는 컨트롤러
	@RequestMapping(value = "/inquiryinsertform.woori", method = RequestMethod.GET)
	public String inquiryForm(ModelMap model)
	{
		ICsDAO dao = sqlsession.getMapper(ICsDAO.class);
		
		// 문의사항 카테고리 조회 DAO
		model.addAttribute("inquiryCategory",dao.inquiryCategory());
		
		return "InquiryInsertForm.jsp";
	}
	
	// 1:1 문의사항 접수(INSERT)시 사용 되는 컨트롤러
	@RequestMapping(value = "/inquiryinsert.woori", method = RequestMethod.POST)
	public String iquiryInsert(ModelMap model, CsDTO dto, HttpSession session)
	{
		String us_code = (String) session.getAttribute("us_code");
		
		System.out.println(us_code);
		
		ICsDAO dao = sqlsession.getMapper(ICsDAO.class);
		dto.setIq_content(dto.getIq_content().replaceAll("\n", "<br>"));
		
		dto.setUs_code(us_code);

		System.out.println(us_code);
		
		// 문의사항 INSERT DAO
		dao.inquiryInsert(dto);
		
		return "redirect:inquirylist.woori";
				
	}
	
	// 문의사항 내역 페이지 접속 시 사용되는 컨트롤러
	@RequestMapping(value = "/inquirylist.woori", method = RequestMethod.GET)
	public String iquiryList(ModelMap model, HttpSession session)
	{
		ICsDAO dao = sqlsession.getMapper(ICsDAO.class);
		
		String us_code = (String)session.getAttribute("us_code");
		
		// 문의사항 내역 조회 DAO
		model.addAttribute("inquiryList",dao.inquiryList(us_code));	
		
		return "InquiryList.jsp";
	}
	
	
	// 신고내역 페이지 접속 시 사용되는 컨트롤러
	@RequestMapping(value = "/reportlist.woori", method = RequestMethod.GET)
	public String reportList(ModelMap model, HttpSession session)
	{
		IReportDAO dao = sqlsession.getMapper(IReportDAO.class);
		String us_code = (String)session.getAttribute("us_code");
		
		// 신고 내역 조회 DAO
		model.addAttribute("allReportList", dao.allReportList(us_code));
		model.addAttribute("boardportList", dao.boardportList(us_code));
		model.addAttribute("groupReportList", dao.groupReportList(us_code));
		model.addAttribute("meetingReportList", dao.meetingReportList(us_code));
		model.addAttribute("historyReportList", dao.historyReportList(us_code));
		
		return "ReportList.jsp";
	}
	
	
	// 검색시 자주 묻는 질문 조회 컨트롤러
	@RequestMapping(value = "/searchfaqlist.woori", method = RequestMethod.POST)
	public String searchFaqList(ModelMap model, String searchKeyword)
	{
		ICsDAO dao = sqlsession.getMapper(ICsDAO.class);
		
		model.addAttribute("searchFaqList",dao.searchFaqList(searchKeyword));
		
		return "SearchFaqList.jsp";
	}
	
	// 문의사항 게시글 조회 컨트롤러
	@RequestMapping(value = "/inquirypost.woori", method = RequestMethod.GET)
	public String inquiryBoard(ModelMap model, String iq_code)
	{
		ICsDAO dao = sqlsession.getMapper(ICsDAO.class);
		
		model.addAttribute("inquirypost", dao.inquiryPost(iq_code));
		
		return "InquiryPost.jsp";
	}
	
	// 공지사항 게시판 컨트롤러
	@RequestMapping(value="/noticeslist.woori" ,method = RequestMethod.GET)
	public String noticesList(ModelMap model)
	{
		ICsDAO dao = sqlsession.getMapper(ICsDAO.class);
		
		model.addAttribute("noticesList", dao.noticesList());
		
		
		return "NoticesList.jsp";
	}
	
	@RequestMapping(value = "/noticespost.woori" ,method = RequestMethod.GET)
	public String noticesListBoard(ModelMap model , String nf_code)
	{
		ICsDAO dao = sqlsession.getMapper(ICsDAO.class);
		
		model.addAttribute("noticespost", dao.noticesListPost(nf_code));
		
		return "NoticesPost.jsp";
	}
	
}

