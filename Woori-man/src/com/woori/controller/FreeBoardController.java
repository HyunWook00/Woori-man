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

// 2024-03-04 노은하
// 자유게시판 관련 컨트롤러
@Controller
public class FreeBoardController
{
	@Autowired
	private SqlSession sqlSession;
	
	// 자유게시판 리스트 페이지 요청
	// freeboardlist.woori 라는 요청이 들오면 연결되는 컨트롤러
	@RequestMapping(value = "/freeboardlist.woori")
	public String freeBoardList(Model model, HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		session.setAttribute("cg_code", "1");
		session.setAttribute("gm_code", "1");
		session.setAttribute("pos_code", "1");
		String cg_code = (String)session.getAttribute("cg_code");
		
		ArrayList<BoardDTO> boardList = null;
		int newArticle = 0;
		
		try
		{
			IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);
			boardList = dao.getBoardList(cg_code);
			newArticle = dao.getNewArticle(cg_code);
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		// 모델에 객체 담아 뷰로 보내기
		model.addAttribute("boardList", boardList);
		model.addAttribute("newArticle", newArticle);
		
		return "FreeBoardList.jsp";
	}
	
	// 자유게시판 작성 폼 페이지 요청
	// freeboardinsertform.woori 라는 요청이 들어오면 연결되는 컨트롤러
	@RequestMapping(value = "/freeboardinsertform.woori")
	public String freeBoardInsertForm(Model model)
	{
		
		return "FreeBoardInsertForm.jsp";
	}
	
	// 자유게시판 작성 요청
	// freeboardinsert.woori 라는 요청이 들어오면 연결되는 컨트롤러
	@RequestMapping(value = "/freeboardinsert.woori", method = RequestMethod.POST)
	public String freeBoardInsert(Model model, BoardDTO dto)
	{
		try
		{
			IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);
			dto.setBrd_content(dto.getBrd_content().replaceAll("\n", "<br>"));
			dao.insertArticle(dto);
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return "freeboardlist.woori";
	}
	
	// 자유게시판 상세정보 페이지
	// freeboardarticle.woori 라는 요청이 들어오면 연결되는 컨트롤러
	@RequestMapping(value = "/freeboardarticle.woori", method = RequestMethod.GET)
	public String freeBoardArticle(Model model, @RequestParam("article") String brd_code, HttpServletResponse response, HttpServletRequest request, HttpSession session)
	{
		BoardDTO boardArticle = new BoardDTO();
		BoardDAO dao = new BoardDAO();
		IBoardDAO iDao = sqlSession.getMapper(IBoardDAO.class);
		ArrayList<CommentDTO> comments = null;
		HashMap<String, Integer> checkCommentLike = new HashMap<String, Integer>();
 		int commentCount = 0;
 		int checkArticleLike = 0;
		
		String articleCookie = "boardArticle" + brd_code;
		int articleLike = 0;
		try
		{
			comments = dao.getCommentList(brd_code);
			commentCount += comments.size();
			
			for(CommentDTO dto : comments)
			{
				int check = dao.checkCommentLike(dto.getCommentCode(), (String)session.getAttribute("gm_code"));
				checkCommentLike.put(dto.getCommentCode(), check);
			}
			
			
			// 조회수 처리용 쿠키 작업
			Cookie[] cookie = request.getCookies();
			if (cookie.length == 0)
			{
				iDao.updateArticleView(brd_code);
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
						iDao.updateArticleView(brd_code);
						Cookie c = new Cookie(articleCookie, articleCookie);
						response.addCookie(c);
					}
				}
			}
			
			articleLike = dao.getArticleLike(brd_code, (String)session.getAttribute("gm_code"));
			boardArticle = iDao.getBoardArticle(brd_code);
			checkArticleLike = dao.checkArticleLike(brd_code, (String)session.getAttribute("gm_code"));
			
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
		
		model.addAttribute("boardArticle", boardArticle);
		model.addAttribute("articleLike", articleLike);
		model.addAttribute("comments", comments);
		model.addAttribute("commentCount", commentCount);
		model.addAttribute("checkArticleLike", checkArticleLike);
		model.addAttribute("checkCommentLike", checkCommentLike);
		
		return "FreeBoardArticle.jsp";
	}
	
	// 자유게시글 좋아요 입력 관련 컨트롤러
	// freeboardarticlelikejax.woori 라는 요청이 들어오면 연결되는 컨트롤러
	@RequestMapping(value = "/freeboardarticlelikejax.woori", method = RequestMethod.GET)
	public String insertArticleLike(Model model, @RequestParam("brd_code") String brd_code, HttpSession session)
	{
		BoardDAO dao = new BoardDAO();
		String articleLike = null;
		try
		{
			IBoardDAO iDao = sqlSession.getMapper(IBoardDAO.class);
			dao.insertArticleLike(brd_code, (String)session.getAttribute("gm_code"));
			BoardDTO dto = iDao.getBoardArticle(brd_code);
			articleLike = dto.getBrd_like();
			
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
		model.addAttribute("articleLike", articleLike);
		return "ArticleLikeAjax.jsp";
	}
	
	// 자유게시판 좋아요 취소 관련 컨트롤러
	// freeboardarticleunlikejax.woori 라는 요청이 들어오면 연결되는 컨트롤러
	@RequestMapping(value = "/freeboardarticleunlikejax.woori", method = RequestMethod.GET)
	public String deleteArticleLike(Model model, @RequestParam("brd_code") String brd_code, HttpSession session)
	{
		BoardDAO dao = new BoardDAO();
		IBoardDAO iDao = sqlSession.getMapper(IBoardDAO.class);
		String articleLike = null;
		try
		{
			dao.deleteArticleLike(brd_code, (String)session.getAttribute("gm_code"));
			BoardDTO dto = iDao.getBoardArticle(brd_code);
			articleLike = dto.getBrd_like();
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
		model.addAttribute("articleLike", articleLike);
		return "ArticleLikeAjax.jsp";
	}
	
	// 2024-03-06 노은하 이어서 작업
	
	// 자유게시판 게시글 수정 폼 요청 관련 컨트롤러
	// freeboardupdateform.woori 라는 요청이 들어오면 연결되는 컨트롤러
	@RequestMapping(value = "/freeboardupdateform.woori", method = RequestMethod.GET)
	public String updateArticleForm(Model model, HttpSession session, @RequestParam("brd_code") String brd_code)
	{
		BoardDTO boardArticle = new BoardDTO();
		try
		{
			IBoardDAO iDao = sqlSession.getMapper(IBoardDAO.class);
			boardArticle = iDao.getBoardArticle(brd_code);
			boardArticle.setBrd_content(boardArticle.getBrd_content().replaceAll("<br>", "\n"));
			
			if (!boardArticle.getGm_code().equals(session.getAttribute("gm_code")))
				return "freeboardlist.woori";
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		model.addAttribute("boardArticle", boardArticle);
		
		return "FreeBoardUpdateForm.jsp";
	}
	
	// 자유게시판 게시글 수정 요청 관련 컨트롤러
	// freeboardupdate.woori 라는 요청이 들어오면 연결되는 컨트롤러
	@RequestMapping(value = "/freeboardupdate.woori", method = RequestMethod.GET)
	public String updateArticle(Model model, BoardDTO dto)
	{
		String brd_code = "";
		try
		{
			IBoardDAO iDao = sqlSession.getMapper(IBoardDAO.class);
			dto.setBrd_content(dto.getBrd_content().replaceAll("\n", "<br>"));
			iDao.updateArticle(dto);
			brd_code = dto.getBrd_code();
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return "freeboardarticle.woori?article=" + brd_code;
	}
	
	// 자유게시판 게시글 삭제 관련 컨트롤러
	// freeboarddelete.woori 라는 요청이 들어오면 연결되는 컨트롤러
	@RequestMapping(value = "/freeboarddelete.woori", method = RequestMethod.GET)
	public String deleteArticle(Model model, @RequestParam("brd_code") String brd_code)
	{
		try
		{
			IBoardDAO iDao = sqlSession.getMapper(IBoardDAO.class);
			iDao.deleteArticle(brd_code);
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return "freeboardlist.woori";
	}
	
	// 자유게시판 댓글 등록 관련 컨트롤러
	// freeboardcommentinsert.woori 라는 요청이 들어오면 연결되는 컨트롤러
	@RequestMapping(value = "/freeboardcommentinsert.woori", method = RequestMethod.POST)
	public String insertArticleComment(Model model, CommentDTO dto)
	{	
		String brd_code = dto.getArticleCode();
		
		try
		{
			ICommentDAO iDao = sqlSession.getMapper(ICommentDAO.class);
			iDao.insertBoardComment(dto);
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return "redirect:/freeboardarticle.woori?article=" + brd_code;
	}
	
	// 2024-03-07 노은하
	// 자유게시판 댓글 좋아요 등록 관련 컨트롤러
	// boardcommentlike.woori 라는 요청이 들어오면 연결되는 컨트롤러
	@RequestMapping(value = "/boardcommentlike.woori", method = RequestMethod.GET)
	public String insertCommentLike(Model model, @RequestParam("commentCode") String commentCode, HttpSession session)
	{
		BoardDAO dao = new BoardDAO();
		int commentCount = 0;
		
		try
		{
			dao.insertCommentLike(commentCode, (String)session.getAttribute("gm_code"));
			commentCount = dao.countCommentLike(commentCode);
			
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
		
		model.addAttribute("type", 1);
		model.addAttribute("commentCount", commentCount);
		
		return "CommentLikeAjax.jsp";
	}
	
	// 자유게시판 댓글 좋아요 취소 관련 컨트롤러
	// boardcommentunlike.woori 라는 요청이 들어오면 연결되는 컨트롤러
	@RequestMapping(value = "/boardcommentunlike.woori", method = RequestMethod.GET)
	public String deleteCommentLike(Model model, @RequestParam("commentCode") String commentCode, HttpSession session)
	{
		BoardDAO dao = new BoardDAO();
		int commentCount = 0;
		
		try
		{
			dao.deleteCommentLike(commentCode, (String)session.getAttribute("gm_code"));
			commentCount = dao.countCommentLike(commentCode);
			
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
		
		model.addAttribute("type", 2);
		model.addAttribute("commentCount", commentCount);
		
		return "CommentLikeAjax.jsp";
	}
}
