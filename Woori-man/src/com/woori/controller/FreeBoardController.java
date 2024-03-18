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

import com.woori.dao.BoardDAO;
import com.woori.dao.IBoardDAO;
import com.woori.dao.ICommentDAO;
import com.woori.dto.BoardDTO;
import com.woori.dto.CommentDTO;
import com.woori.dto.GroupDTO;
import com.woori.dto.GroupMemberDTO;
import com.woori.dto.RecommentDTO;

// 자유게시판 관련 컨트롤러
@Controller
public class FreeBoardController
{
	@Autowired
	private SqlSession sqlSession;
	
	// 자유게시판 리스트 페이지 요청
	// freeboardlist.woori 라는 요청이 들오면 연결되는 컨트롤러
	@RequestMapping(value = "/freeboardlist.woori", method = RequestMethod.GET)
	public String freeBoardList(Model model, HttpServletRequest request, HttpSession session, String num, String pageNum, String key, String value)
	{
		GroupDTO group = (GroupDTO)session.getAttribute("groupDTO");
		
		//ArrayList<BoardDTO> boardList = null;
		int newArticle = 0;
		int allArticle = 0;
		
		try
		{
			IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);
			//boardList = dao.getBoardList(group.getCg_code());
			newArticle = dao.getNewArticle(group.getCg_code());
			allArticle = dao.countArticle(group.getCg_code());
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		// 모델에 객체 담아 뷰로 보내기
		//model.addAttribute("boardList", boardList);
		model.addAttribute("newArticle", newArticle);
		model.addAttribute("allArticle", allArticle);
		model.addAttribute("num", num);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("key", key);
		model.addAttribute("value", value);
		
		return "/WEB-INF/view/FreeBoardList.jsp";
	}
	
	// 자유게시판 작성 폼 페이지 요청
	// freeboardinsertform.woori 라는 요청이 들어오면 연결되는 컨트롤러
	@RequestMapping(value = "/freeboardinsertform.woori")
	public String freeBoardInsertForm(Model model)
	{
		return "/WEB-INF/view/FreeBoardInsertForm.jsp";
	}
	
	// 자유게시판 작성 요청
	// freeboardinsert.woori 라는 요청이 들어오면 연결되는 컨트롤러
	@RequestMapping(value = "/freeboardinsert.woori", method = RequestMethod.POST)
	public String freeBoardInsert(Model model, BoardDTO dto, HttpSession session)
	{
		GroupMemberDTO member = (GroupMemberDTO)session.getAttribute("groupMemberDTO");
		GroupDTO group = (GroupDTO)session.getAttribute("groupDTO");
		dto.setCg_code(group.getCg_code());
		dto.setGm_code(member.getGm_code());
		try
		{
			IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);
			dto.setBrd_content(dto.getBrd_content().replaceAll("\n", "<br>"));
			dao.insertArticle(dto);
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return "redirect:freeboardlist.woori";
	}
	
	// 자유게시판 상세정보 페이지
	// freeboardarticle.woori 라는 요청이 들어오면 연결되는 컨트롤러
	@RequestMapping(value = "/freeboardarticle.woori", method = RequestMethod.GET)
	public String freeBoardArticle(Model model, @RequestParam("article") String brd_code, HttpServletResponse response, HttpServletRequest request, HttpSession session, String pageNum)
	{
		BoardDTO boardArticle = new BoardDTO();
		BoardDAO dao = new BoardDAO();
		IBoardDAO iDao = sqlSession.getMapper(IBoardDAO.class);
		ArrayList<CommentDTO> comments = null;
		HashMap<String, ArrayList<RecommentDTO>> recomments = new HashMap<String, ArrayList<RecommentDTO>>();
 		int commentCount = 0;
 		int checkArticleLike = 0;
		
		String articleCookie = "boardArticle" + brd_code;
		int articleLike = 0;
		try
		{
			comments = dao.getCommentList(brd_code, ((GroupMemberDTO)session.getAttribute("groupMemberDTO")).getGm_code());
			commentCount += comments.size();
			
			for(CommentDTO dto : comments)
			{
				recomments.put(dto.getCommentCode(), dao.getRecommentList(dto.getCommentCode(), ((GroupMemberDTO)session.getAttribute("groupMemberDTO")).getGm_code()));
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
			
			articleLike = dao.getArticleLike(brd_code,((GroupMemberDTO)session.getAttribute("groupMemberDTO")).getGm_code());
			boardArticle = iDao.getBoardArticle(brd_code);
			checkArticleLike = dao.checkArticleLike(brd_code, ((GroupMemberDTO)session.getAttribute("groupMemberDTO")).getGm_code());
			
			
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
		model.addAttribute("recomments", recomments);
		model.addAttribute("commentCount", commentCount);
		model.addAttribute("checkArticleLike", checkArticleLike);
		model.addAttribute("pageNum", pageNum);
		
		
		return "/WEB-INF/view/FreeBoardArticle.jsp";
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
			dao.insertArticleLike(brd_code, ((GroupMemberDTO)session.getAttribute("groupMemberDTO")).getGm_code());
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
		return "/WEB-INF/view/ArticleLikeAjax.jsp";
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
			dao.deleteArticleLike(brd_code, ((GroupMemberDTO)session.getAttribute("groupMemberDTO")).getGm_code());
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
		return "/WEB-INF/view/ArticleLikeAjax.jsp";
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
			
			if (!boardArticle.getGm_code().equals(((GroupMemberDTO)session.getAttribute("groupMemberDTO")).getGm_code()))
				return "freeboardlist.woori";
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		model.addAttribute("boardArticle", boardArticle);
		
		return "/WEB-INF/view/FreeBoardUpdateForm.jsp";
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
	public String insertArticleComment(Model model, CommentDTO dto, HttpSession session)
	{	
		String brd_code = dto.getArticleCode();
		dto.setCommentWriterCode(((GroupMemberDTO)session.getAttribute("groupMemberDTO")).getGm_code());
		BoardDAO dao = new BoardDAO();
		
		try
		{
			dao.insertComment(dto);
			
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
			dao.insertCommentLike(commentCode, ((GroupMemberDTO)session.getAttribute("groupMemberDTO")).getGm_code());
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
		
		return "/WEB-INF/view/CommentLikeAjax.jsp";
	}
	
	// 자유게시판 대댓글 좋아요
	// boardrecommentlike.woori 라는 요청이 들어오면 연결되는 컨트롤러
	@RequestMapping(value = "boardrecommentlike.woori", method = RequestMethod.GET)
	public String insertRecommentLike(Model model, String recommentCode, HttpSession session)
	{
		BoardDAO dao = new BoardDAO();
		GroupMemberDTO member = (GroupMemberDTO)session.getAttribute("groupMemberDTO");
		int commentCount = 0;
		
		try
		{
			dao.insertRecommentLike(recommentCode, member.getGm_code());
			commentCount = dao.countRecommentLike(recommentCode);
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		model.addAttribute("type", 1);
		model.addAttribute("commentCount", commentCount);
		
		return "/WEB-INF/view/CommentLikeAjax.jsp";
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
			dao.deleteCommentLike(commentCode, ((GroupMemberDTO)session.getAttribute("groupMemberDTO")).getGm_code());
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
		
		return "/WEB-INF/view/CommentLikeAjax.jsp";
	}
	
	// 자유게시판 대댓글 좋아요 취소 관련 컨트롤러
	// boardrecommentunlike.woori 라는 요청이 들어오면 연결되는 컨트롤러
	@RequestMapping(value = "boardrecommentunlike.woori", method = RequestMethod.GET)
	public String deleteRecommentLike(Model model, String recommentCode, HttpSession session)
	{
		BoardDAO dao = new BoardDAO();
		int commentCount = 0;
		
		try
		{
			dao.deleteRecommentLike(recommentCode, ((GroupMemberDTO)session.getAttribute("groupMemberDTO")).getGm_code());
			commentCount = dao.countRecommentLike(recommentCode);
			
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
		
		return "/WEB-INF/view/CommentLikeAjax.jsp";
	}
	
	// 자유게시판 댓글 수정
	// boardcommentupdate.woori 라는 요청이 들어오면 연결되는 컨트롤러
	@RequestMapping(value = "boardcommentupdate.woori", method = RequestMethod.GET)
	public String updateComment(HttpSession session, CommentDTO dto)
	{
		GroupMemberDTO member = (GroupMemberDTO)session.getAttribute("groupMemberDTO");
		dto.setCommentWriterCode(member.getGm_code());
		BoardDAO dao = new BoardDAO();
		try
		{
			dao.updateComment(dto);
			
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
		
		return "redirect:freeboardarticle.woori?article=" + dto.getArticleCode();
	}
	
	// 자유게시판 대댓글 수정
	// boardrecommentupdate.woori 라는 요청이 들어오면 연결되는 컨트롤러
	@RequestMapping(value = "boardrecommentupdate.woori", method = RequestMethod.GET)
	public String updateRecomment(HttpSession session, RecommentDTO dto, String brd_code)
	{
		GroupMemberDTO member = (GroupMemberDTO)session.getAttribute("groupMemberDTO");
		dto.setRecommentWriterCode(member.getGm_code());
		BoardDAO dao = new BoardDAO();
		try
		{
			dao.updateRecomment(dto);
			
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
		
		return "redirect:freeboardarticle.woori?article=" + brd_code;
		
	}
	
	// 자유게시판 댓글 삭제
	// boardcommentdelete.woori 라는 요청이 들어오면 연결되는 컨트롤러
	@RequestMapping(value = "boardcommentdelete.woori", method = RequestMethod.GET)
	public String deleteComment(String bc_code, String brd_code)
	{
		BoardDAO dao = new BoardDAO();
		
		try
		{
			dao.deleteComment(bc_code);
			
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
		
		return "redirect:freeboardarticle.woori?article=" + brd_code;
	}
	
	// 자유게시판 대댓글 입력
	// boardrecommentinsert.woori 라는 요청이 들어오면 연결되는 컨트롤러
	@RequestMapping(value = "boardrecommentinsert.woori", method = RequestMethod.POST)
	public String insertRecomment(RecommentDTO dto, HttpSession session, String articleCode)
	{
		BoardDAO dao = new BoardDAO();
		GroupMemberDTO member = (GroupMemberDTO)session.getAttribute("groupMemberDTO");
		dto.setRecommentWriterCode(member.getGm_code());
		
		try
		{
			dao.insertRecomment(dto);
			
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
		
		return "redirect:freeboardarticle.woori?article=" + articleCode;
	}
	
	// 자유게시판 게시글 신고
	// reportboardarticle.woori 라는 요청이 들어오면 연결되는 컨트롤러
	@RequestMapping(value = "reportboardarticle.woori", method = RequestMethod.GET)
	public String reportArticle(String brd_code, HttpSession session)
	{
		BoardDAO dao = new BoardDAO();
		GroupMemberDTO member = (GroupMemberDTO)session.getAttribute("groupMemberDTO");
		
		try
		{
			dao.insertBoardReport(brd_code, member.getGm_code());
			
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
		
		return "redirect:freeboardlist.woori";
		
	}
	
}
