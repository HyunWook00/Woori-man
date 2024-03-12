package com.woori.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.woori.dao.IHistoryDAO;
import com.woori.dao.MeetingDAO;
import com.woori.dto.HistoryDTO;
import com.woori.dto.MeetingDTO;

// 히스토리 페이지 관련 컨트롤러

@Controller
public class HistoryController
{
	@Autowired
	private SqlSession sqlSession;
	
	// 히스토리 리스트 페이지 요청
	// historylist.woori 라는 요청이 들어오면 연결되는 컨트롤러
	@RequestMapping(value = "/historylist.woori")
	public String historyList(Model model, HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		session.setAttribute("cg_code", "1");
		session.setAttribute("gm_code", "1");
		session.setAttribute("pos_code", "1");
		String cg_code = (String)session.getAttribute("cg_code");
		
		ArrayList<MeetingDTO> meetingList = null;
		HashMap<String, ArrayList<HistoryDTO>> historyList = new HashMap<String, ArrayList<HistoryDTO>>();
		try
		{
			IHistoryDAO dao = sqlSession.getMapper(IHistoryDAO.class);
			meetingList = dao.getMeetingList(cg_code);
			for(MeetingDTO dto : meetingList)
				historyList.put(dto.getMt_code(), dao.getHistoryList(dto.getMt_code()));
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		model.addAttribute("meetingList", meetingList);
		model.addAttribute("historyList", historyList);
		
		return "HistoryList.jsp";
	}
	
	// 히스토리 게시글 페이지 요청
	// historyarticle.woori 라는 요청이 들어오면 연결되는 컨트롤러
	@RequestMapping(value = "/historyarticle.woori", method = RequestMethod.GET)
	public String historyArticle(Model model, HttpServletRequest request, HttpServletResponse response,@RequestParam("his_code") String his_code, @RequestParam("mt_code") String mt_code, HttpSession session)
	{
		HistoryDTO historyArticle = null;
		MeetingDTO meetingArticle = null;
		MeetingDAO mDao = new MeetingDAO();
		int checkArticleLike = 0;
		
		String articleCookie = "historyArticle" + his_code;
		
		try
		{
			IHistoryDAO hDao = sqlSession.getMapper(IHistoryDAO.class);
			
			meetingArticle = mDao.getMeetingArticle(mt_code);
			checkArticleLike = hDao.getArticleLike(his_code, (String)session.getAttribute("gm_code"));
			
			// 조회수 처리용 쿠키 작업
			Cookie[] cookie = request.getCookies();
			if (cookie.length == 0)
			{
				hDao.updateArticleView(his_code);
				Cookie c = new Cookie(articleCookie, articleCookie);
				response.addCookie(c);
			}
			else
			{
				for (int i = 0; i < cookie.length; i++)
				{
					if (cookie[i].getName().equals(articleCookie))
						break;
					if (i == (cookie.length-1))
					{
						hDao.updateArticleView(his_code);
						Cookie c = new Cookie(articleCookie, articleCookie);
						response.addCookie(c);
					}
				}
			}
			historyArticle = hDao.getHistoryArticle(his_code);
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		finally
		{
			try
			{
				mDao.close();
				
			} catch (Exception e)
			{
				System.out.println(e.toString());
			}
		}
		
		model.addAttribute("historyArticle", historyArticle);
		model.addAttribute("meetingArticle", meetingArticle);
		model.addAttribute("checkArticleLike", checkArticleLike);
		
		return "HistoryArticle.jsp";
	}
	
	// 히스토리 게시글 좋아요 입력
	// historyarticlelikejax.woori 라는 요청이 들어오면 연결되는 컨트롤러
	@RequestMapping(value = "/historyarticlelikejax.woori", method = RequestMethod.GET)
	public String insertArticleLike(Model model, @RequestParam("his_code") String his_code, HttpSession session)
	{
		String articleLike = null;
		try
		{
			IHistoryDAO hDao = sqlSession.getMapper(IHistoryDAO.class);
			hDao.insertArticleLike(his_code, (String)session.getAttribute("gm_code"));
			HistoryDTO dto = hDao.getHistoryArticle(his_code);
			articleLike = dto.getHis_like();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		model.addAttribute("articleLike", articleLike);
		
		return "ArticleLikeAjax.jsp";
		
	}
	
	// 히스토리 게시글 좋아요 삭제
	// historyarticleunlikejax.woori 라는 요청이 들어오면 연결되는 컨트롤러
	@RequestMapping(value = "/historyarticleunlikejax.woori", method = RequestMethod.GET)
	public String deleteArticleLike(Model model, @RequestParam("his_code") String his_code, HttpSession session)
	{
		String articleLike = null;
		try
		{
			IHistoryDAO hDao = sqlSession.getMapper(IHistoryDAO.class);
			hDao.deleteArticleLike(his_code, (String)session.getAttribute("gm_code"));
			HistoryDTO dto = hDao.getHistoryArticle(his_code);
			articleLike = dto.getHis_like();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		model.addAttribute("articleLike", articleLike);
		
		return "ArticleLikeAjax.jsp";
	}
	
	// 히스토리 게시글 댓글 입력
	// historycommentinsert.woori 라는 요청이 들어오면 연결되는 컨트롤러
	@RequestMapping(value = "/historycommentinsert.woori")
	public String insertComment(Model model)
	{
		return "";
	}
	
}