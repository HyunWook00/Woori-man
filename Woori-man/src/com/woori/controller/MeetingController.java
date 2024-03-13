package com.woori.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.woori.dao.CityDAO;
import com.woori.dao.GroupDAO;
import com.woori.dao.ICommentDAO;
import com.woori.dao.IGroupDAO;
import com.woori.dao.MeetingDAO;
import com.woori.dto.CancelReasonDTO;
import com.woori.dto.CityDTO;
import com.woori.dto.CommentDTO;
import com.woori.dto.GroupDTO;
import com.woori.dto.GroupMemberDTO;
import com.woori.dto.MeetingDTO;
import com.woori.dto.RecommentDTO;
import com.woori.dto.RegionDTO;
import com.woori.dto.UserDTO;

// 모임 페이지 관련 컨트롤러 클래스

@Controller
public class MeetingController
{
	@Autowired
	private SqlSession sqlSession;
	
	//모임 리스트 페이지 요청
	//meetinglist.woori 라는 요청이 들어오면 연결되는 컨트롤러
	@RequestMapping(value = "/meetinglist.woori")
	public String meetingList(Model model, HttpSession session)
	{
		MeetingDAO dao = new MeetingDAO();
		GroupDAO groupDAO = new GroupDAO();
		
		GroupDTO groupDTO = null;
		GroupMemberDTO groupMemberDTO = null;
		ArrayList<MeetingDTO> meetingList = null;	// 등록된 모임 정보 리스트
		ArrayList<GroupMemberDTO> groupPostition = null;
		int articleCount = 0;						// 새글수 정보
		
		try
		{
			groupDAO.connection();
			groupDTO = groupDAO.groupInfo("1", "1");
			groupMemberDTO = groupDAO.groupMyInfo(groupDTO.getGm_code());
			groupPostition = groupDAO.groupPosition(groupDTO.getCg_code());
			meetingList = dao.getMeetingList(groupDTO.getCg_code());
			articleCount = dao.getArticleCount(groupDTO.getCg_code());
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		finally
		{
			try
			{
				groupDAO.close();
				dao.close();
				
			} catch (Exception e)
			{
				System.out.println(e.toString());
			}
		}
		
		// 테스트용 세션 구성
		session.setAttribute("groupDTO", groupDTO);
		session.setAttribute("groupMemberDTO", groupMemberDTO);
		session.setAttribute("groupPosition", groupPostition);
		
		// 모델에 객체 담아 뷰로 보내기
		model.addAttribute("meetingList", meetingList);
		model.addAttribute("articleCount", articleCount);
		
		// 연결시켜줄 뷰 호출
		return "/WEB-INF/view/MeetingList.jsp";
	}
	
	//모임 게시글 상세정보 페이지 요청
	//meetingarticle.woori 라는 요청이 들어오면 연결되는 컨트롤러
	@RequestMapping(value = "/meetingarticle.woori", method = RequestMethod.GET)
	public String meetingArticle(Model model, @RequestParam("mt_code") String mt_code, HttpSession session)
	{
		GroupMemberDTO member = (GroupMemberDTO)session.getAttribute("member");
		MeetingDAO dao = new MeetingDAO();
		
		MeetingDTO meetingArticle = null;																		// 모임 상세정보
		ArrayList<CommentDTO> comments = null;																	// 모임에 달린 댓글들
		HashMap<String, ArrayList<RecommentDTO>> recomments = new HashMap<String, ArrayList<RecommentDTO>>();	// 댓글별 달린 대댓글
		int totalCommentCount = 0;																				// 댓글과 대댓글 합산
		
		//HashMap<String, String> commentLike = new HashMap<String, String>();									// 댓글별 좋아요 눌렀는지 안 눌렀는지
		//HashMap<String, String> recommentLike = new HashMap<String, String>();									// 대댓글별 좋아요 눌렀는지 안 눌렀는지
		
		int totalMemberCount = 0;																				// 그룹원 인원수
		int attendMemberCount = 0;																				// 참석자 인원수
		//ArrayList<GroupMemberDTO> attendMemberList = new ArrayList<GroupMemberDTO>();							// 참석자 그룹원코드 목록
		int notAttendMemberCount = 0;																			// 불참자 인원수
		
		// 철회 사유 목록
		ArrayList<CancelReasonDTO> cancelReason = null;
		
		String attendStatus = null;
		
		try
		{
			// 철회 사유
			cancelReason = dao.getCancelReasonList();
			
			// 그룹원 총 인원수
			//totalMemberCount = gDao.countGroupMember(member.getCg_code());
			
			// 모임 참여 인원수
			//attendMemberCount = gDao.countAttendMember(mt_code);
			
			// 모임 불참 인원수
			//notAttendMemberCount = gDao.countNotAttendMember(mt_code);
			
			// 모임 참여 인원 목록
			//attendMemberList = gDao.searchAttendMemberList(mt_code);
			
			// 나의 모임 참여 상태
			attendStatus = dao.getAttend(mt_code, member.getGm_code());
			
			// 모임 게시글
			meetingArticle = dao.getMeetingArticle(mt_code);
			
			// 해당 모임 댓글
			comments = dao.getComments(mt_code, member.getGm_code());
			
			// 총 댓글수 더하기
			totalCommentCount += comments.size();
			
			for(int i=0; i<comments.size(); i++)
			{
				// 댓글 하나하나 코드값을 key 로 설정
				String key = comments.get(i).getCommentCode();
				
				// 내가 댓글 좋아요를 눌렀는지 안 눌렀는지 확인
				//commentLike.put(key, dao.getCommentLike(key, member.getGm_code()));
				
				// 해당 댓글의 대댓글 얻어오기
				recomments.put(key, dao.getRecomments(key, member.getGm_code()));
				
				/*
				for(RecommentDTO dto : recomments.get(key))
				{
					// 대댓글 하나하나의 코드값을 key 로 설정
					String key2 = dto.getRecommentCode();
					
					// 내가 대댓글 좋아요를 눌럿는지 안 눌렀는지 확인
					recommentLike.put(key2, dao.getRecommentLike(key2, member.getGm_code()));
				}
				*/
				
				// 대댓글 수 더하기
				totalCommentCount += recomments.get(key).size();
				
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
		
		// 모델에 객체 담아서 보내기
		model.addAttribute("meetingArticle", meetingArticle);
		model.addAttribute("comments", comments);
		model.addAttribute("recomments", recomments);
		model.addAttribute("totalCommentCount", totalCommentCount);
		//model.addAttribute("commentLike", commentLike);
		//model.addAttribute("recommentLike", recommentLike);
		model.addAttribute("totalMemberCount", totalMemberCount);
		model.addAttribute("attendMemberCount", attendMemberCount);
		model.addAttribute("notAttendMemberCount", notAttendMemberCount);
		//model.addAttribute("attendMemberList", attendMemberList);
		model.addAttribute("attendStatus", attendStatus);
		model.addAttribute("cancelReason", cancelReason);
		
		// 뷰 호출
		return "/WEB-INF/view/MeetingArticle.jsp";
	}
	
	//모임 댓글 입력 요청
	//meetingcommentinsert.woori 라는 요청이 들어오면 연결되는 컨트롤러
	@RequestMapping(value = "/meetingcommentinsert.woori", method = RequestMethod.POST)
	public String meetingCommentInsert(Model model, @RequestParam("mt_code") String articleCode, @RequestParam("gm_code") String commentWriterCode, @RequestParam("mcm_content") String commentContent )
	{
		try
		{
			ICommentDAO dao = sqlSession.getMapper(ICommentDAO.class);
			CommentDTO dto = new CommentDTO();

			dto.setArticleCode(articleCode);
			dto.setCommentWriterCode(commentWriterCode);
			dto.setCommentContent(commentContent);
			
			dao.insertComment(dto);
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return "redirect:meetingarticle.woori?meeting=" + articleCode;
	}
	
	//모임 대댓글 입력 요청
	//meetingrecommentinsert.woori 라는 요청이 들어오면 연결되는 컨트롤러
	@RequestMapping(value = "/meetingrecommentinsert.woori", method = RequestMethod.POST)
	public String meetingRecommentInsert(Model model, @RequestParam("mcm_code") String commentCode, @RequestParam("gm_code") String recommentWriterCode, @RequestParam("mrc_content") String recommentContent, @RequestParam("mt_code") String articleCode)
	{
		try
		{
			ICommentDAO dao = sqlSession.getMapper(ICommentDAO.class);
			RecommentDTO dto = new RecommentDTO();
			
			dto.setCommentCode(commentCode);
			dto.setRecommentWriterCode(recommentWriterCode);
			dto.setRecommentContent(recommentContent);
			
			dao.insertRecomment(dto);
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return "redirect:meetingarticle.woori?meeting=" + articleCode;
	}
	
	//모임 댓글 수정 요청
	//meetingcommentupdate.woori 라는 요청이 들어오면 연결되는 컨트롤러
	@RequestMapping(value = "/meetingcommentupdate.woori", method = RequestMethod.POST)
	public String meetingCommentUpdate(Model model, @RequestParam("mcm_code") String commentCode, @RequestParam("gm_code") String commentWriterCode, @RequestParam("mt_code") String articleCode, @RequestParam("mcm_content") String commentContent)
	{
		try
		{
			ICommentDAO dao = sqlSession.getMapper(ICommentDAO.class);
			CommentDTO dto = new CommentDTO();
			
			dto.setCommentCode(commentCode);
			dto.setCommentWriterCode(commentWriterCode);
			dto.setArticleCode(articleCode);
			dto.setCommentContent(commentContent);
			
			dao.updateComment(dto);
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return "redirect:meetingarticle.woori?meeting=" + articleCode;
	}
	
	//모임대 대댓글 수정 요청
	//meetingrecommentupdate.woori 라는 요청이 들어오면 연결되는 컨트롤러
	@RequestMapping(value = "/meetingrecommentupdate.woori", method = RequestMethod.POST)
	public String meetingRecommentUpdate(Model model, @RequestParam("mrc_code") String recommentCode, @RequestParam("gm_code") String recommentWriterCode, @RequestParam("mcm_code") String commentCode, @RequestParam("mt_code") String articleCode, @RequestParam("mrc_content") String recommentContent)
	{
		try
		{
			ICommentDAO dao = sqlSession.getMapper(ICommentDAO.class);
			RecommentDTO dto = new RecommentDTO();
			
			dto.setRecommentCode(recommentCode);
			dto.setRecommentWriterCode(recommentWriterCode);
			dto.setCommentCode(commentCode);
			dto.setRecommentContent(recommentContent);
			
			dao.updateRecomment(dto);
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return "redirect:meetingarticle.woori?meeting=" + articleCode;
	}
	
	//모임 댓글 삭제 요청
	//meetingcommentdelete.woori 라는 요청이 들어오면 연결되는 컨트롤러
	@RequestMapping(value = "/meetingcommentdelete.woori", method = RequestMethod.GET)
	public String meetingCommentDelete(Model model, @RequestParam("articleCode") String articleCode, @RequestParam("commentCode") String commentCode)
	{
		try
		{
			ICommentDAO dao = sqlSession.getMapper(ICommentDAO.class);
			dao.deleteComment(commentCode);
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return "redirect:meetingarticle.woori?meeting=" + articleCode;
	}
	
	//모임 대댓글 삭제 요청
	//meetingrecommentdelete.woori 라는 요청이 들어오면 연결되는 컨트롤러
	@RequestMapping(value = "/meetingrecommentdelete.woori", method = RequestMethod.GET)
	public String meetingRecommentDelete(Model model, @RequestParam("recommentCode") String recommentCode, @RequestParam("articleCode") String articleCode)
	{
		try
		{
			ICommentDAO dao = sqlSession.getMapper(ICommentDAO.class);
			dao.deleteRecomment(recommentCode);
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return "redirect:meetingarticle.woori?meeting=" + articleCode;
		
	}
	
	// 모임 댓글 좋아요 클릭 ajax
	// meetingcommentlike.woori 라는 요청이 들어오면 연결되는 컨트롤러
	@RequestMapping(value = "/meetingcommentlike.woori", method = RequestMethod.GET)
	public String insertCommentLike(Model model, @RequestParam("commentCode") String commentCode, HttpSession session)
	{
		MeetingDAO dao = new MeetingDAO();
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
		
		return "/WEB-INF/view/CommentLikeAjax.jsp";
	}
	
	// 모임 대댓글 좋아요 클릭 ajax
	// recommentlikeajax.woori 라는 요청이 들어오면 연결되는 컨트롤러
	@RequestMapping(value = "recommentlikeajax.woori", method = RequestMethod.GET)
	public String recommentLikeAjax(Model model, @RequestParam("mrcmCode") String mrcm_code, @RequestParam("gmCode") String gm_code)
	{
		int commentCount = 0;
		MeetingDAO mDao = new MeetingDAO();
		
		try
		{
			ICommentDAO dao = sqlSession.getMapper(ICommentDAO.class);
			mDao.insertRecommentLike(mrcm_code, gm_code);
			commentCount = dao.countRecommentLike(mrcm_code);
			
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
		
		model.addAttribute("commentCount", commentCount);
		model.addAttribute("type", "insert");
		
		return "/WEB-INF/view/CommentLikeAjax.jsp";
	}
	
	// 모임 댓글 좋아요 취소 ajax
	// meetingcommentunlike.woori 라는 요청이 들어오면 연결되는 컨트롤러
	@RequestMapping(value = "/meetingcommentunlike.woori", method = RequestMethod.GET)
	public String deleteCommentLike(Model model, @RequestParam("commentCode") String commentCode, HttpSession session)
	{
		MeetingDAO dao = new MeetingDAO();
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
		
		return "/WEB-INF/view/CommentLikeAjax.jsp";
	}
	
	// 모임 대댓글 좋아요 취소 ajax
	// recommentlikeajax.woori 라는 요청이 들어오면 연결되는 컨트롤러
	@RequestMapping(value = "/recommentunlikeajax.woori", method = RequestMethod.GET)
	public String recommentUnlikeAjax(Model model, @RequestParam("mrcmCode") String mrcm_code, @RequestParam("gmCode") String gm_code)
	{
		int commentCount = 0;
		String recommentLikeCode = "";
		MeetingDAO mdao = new MeetingDAO();
		
		try
		{
			ICommentDAO dao = sqlSession.getMapper(ICommentDAO.class);
			recommentLikeCode = mdao.searchRecommentLikeCode(mrcm_code, gm_code);
			mdao.deleteRecommentLike(recommentLikeCode);
			commentCount = dao.countRecommentLike(mrcm_code);
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		model.addAttribute("commentCount", commentCount);
		model.addAttribute("type", "delete");
		
		return "/WEB-INF/view/CommentLikeAjax.jsp";
	}
	
	
	// 신고용 모임 댓글 정보 불러오기 ajax
	// reportcommentajax.woori 라는 요청이 들어오면 연결되는 컨트롤러
	@RequestMapping(value = "/reportcommentajax.woori", method = RequestMethod.GET)
	public String commentReportAjax(Model model, @RequestParam("commentCode") String commentCode, @RequestParam("gm_code") String gm_code)
	{
		CommentDTO comment = new CommentDTO();
		
		try
		{
			ICommentDAO dao = sqlSession.getMapper(ICommentDAO.class);
			comment = dao.searchComment(commentCode); 
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		model.addAttribute("comment", comment);
		model.addAttribute("repoter", gm_code);
		
		return "/WEB-INF/view/CommentReportAjax.jsp";
	}
	
	// 댓글 신고 처리
	// meetingcommentreport.woori 라는 요청이 들어오면 연결되는 컨트롤러
	@RequestMapping(value = "/meetingcommentreport.woori", method = RequestMethod.GET)
	public String commentReport(Model model, @RequestParam("commentCode") String commentCode, @RequestParam("gm_code") String gm_code, @RequestParam("mt_code") String articleCode)
	{
		MeetingDAO dao = new MeetingDAO();
		
		try
		{
			dao.insertCommentReport(commentCode, gm_code);
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		finally
		{
			try
			{
				
			} catch (Exception e)
			{
				System.out.println(e.toString());
			}
		}
		
		return "redirect:meetingarticle.woori?meeting=" + articleCode;
	}
	
	// 모임 발의 폼
	// meetinginsertform.woori 라는 요청이 들어오면 연결되는 컨트롤러
	@RequestMapping(value = "/meetinginsertform.woori", method = RequestMethod.GET)
	// 파라미터로 받아야 하는 것 : 그룹원 코드 ,그룹 코드, 번개 or 정기
	public String meetingInsertForm(Model model ,@RequestParam("mc_code") String mc_code)
	{
		CityDAO dao = new CityDAO();
		ArrayList<RegionDTO> regionList = null;
		HashMap<String, ArrayList<CityDTO>> cityList = new HashMap<String, ArrayList<CityDTO>>();
		
		try
		{
			regionList = dao.getRegionList();
			for(RegionDTO dto : regionList)
				cityList.put(dto.getRg_code(), dao.getCityList(dto.getRg_code()));
			
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
		
		model.addAttribute("mc_code", mc_code);
		model.addAttribute("regionList", regionList);
		model.addAttribute("cityList", cityList);
		
		return "/WEB-INF/view/MeetingInsertForm.jsp";
	}
	
	
	// 모임 발의 insert 액션
	// meetinginsert.woori 라는 요청이 들어오면 연결되는 컨트롤러
	@RequestMapping(value = "/meetinginsert.woori", method = RequestMethod.POST)
	public String meetingInsert(Model model, MeetingDTO dto, HttpSession session)
	{
		MeetingDAO dao = new MeetingDAO();
		dto.setGm_code(((GroupMemberDTO)session.getAttribute("member")).getGm_code());
		dto.setCg_code(((GroupMemberDTO)session.getAttribute("member")).getCg_code());
		try
		{
			dao.insertMeeting(dto);
			
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
		
		return "meetinglist.woori";
	}
	
	
	// 모임 참석 여부 확인 insert 액션
	// meetingvoteinsert.woori 라는 요청이 들어오면 연결되는 컨트롤러
	@RequestMapping(value = "/meetingvoteinsert.woori", method = RequestMethod.GET)
	public String meetingVoteInsert(Model model, HttpSession session, @RequestParam("mt_code") String mt_code, @RequestParam("aoc_code") String aoc_code)
	{
		MeetingDAO dao = new MeetingDAO();
		String gm_code = ((GroupMemberDTO)session.getAttribute("member")).getGm_code();
		try
		{
			dao.insertAttend(mt_code, gm_code, aoc_code);
			
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
		
		return "redirect:meetingarticle.woori?mt_code=" + mt_code;
	}
	
	// 모임 철회 컨트롤러
	// deletemeeting.woori 라는 요청이 들어오면 연결되는 컨트롤러
	@RequestMapping(value = "/deletemeeting.woori", method = RequestMethod.GET)
	public String deleteMeeting(Model model, HttpSession session, @RequestParam("mt_code") String mt_code, @RequestParam("crc_code") String crc_code)
	{
		MeetingDAO dao = new MeetingDAO();
		try
		{
			dao.deleteMeeting(crc_code, mt_code);
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return "meetinglist.woori";
	}
	
	
}
