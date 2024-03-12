package com.woori.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.support.DaoSupport;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.woori.dao.ICsDAO;
import com.woori.dao.IGroupDAO;
import com.woori.dao.IGroupMyPageDAO;
import com.woori.dao.MyInfoDAO;
import com.woori.dto.GroupDTO;
import com.woori.dto.GroupMemberDTO;
import com.woori.dto.MeetingDTO;
import com.woori.dto.UserDTO;

@Controller
public class GroupMainController
{
	@Autowired
	private SqlSession sqlSession; 
	
	// 선택 그룹 들어갈 때 찾아야 하는 정보들 (GroupDTO, GroupMemberDTO)
	@RequestMapping("/entergroup.woori")
	public String enterGroup(HttpSession session, ModelMap model, String cg_code)
	{
		GroupDAO groupDAO = new GroupDAO();				// GroupDAO 인스턴스 생성 (세션에 담기는 메소드)
		GroupDTO groupDTO = null;						// GroupDTO 변수 생성
		GroupMemberDTO groupMemberDTO = null;			// GroupMemberDTO 변수 생성
		ArrayList<MeetingDTO> groupMeetingDTO = null;	// ArrayList<MeetingDTO> 변수 생성
		ArrayList<GroupMemberDTO> groupPostition = null;
		String us_codeTemp = "8872984";				// 로그인 연결 전 임시 데이터
		session.setAttribute("us_code", us_codeTemp);
		String us_code = (String)session.getAttribute("us_code");
		
		try
		{
			 // 로그인 세션 정보가 없을 시 로그인 페이지 실행
	         if (us_code == null)
	         {
	            return "loginform.action";
	         }
	         
	         // 데이터 베이스 연결 (DBConn)
	         groupDAO.connection();
	         
	         //System.out.println(us_code);
	         
	         // 그룹 정보 DTO에 데이터 넣기
	         groupDTO = groupDAO.groupInfo(us_code, cg_code);	
	         // 출력 정보 (cg_code, gi_code, cg_intro, cg_profile, cg_name, cg_date
	         //            brd_name, gm_count(멤버 수), gm_code)
	         String gm_code = groupDTO.getGm_code(); 
	         
	         //System.out.println(gm_code);
	         
	         // 그룹 포인트 데이터 넣기
	         groupDTO.setGroup_point(groupDAO.groupPoint(cg_code));
	         
	         //System.out.println(groupDTO.getGroup_point());
	         
	         // 그룹 멤버 DTO에 데이터 넣기 (그룹 마이정보)
	         groupMemberDTO = groupDAO.groupMyInfo(gm_code);
	         groupPostition = groupDAO.groupPosition(cg_code);
	         // 출력 정보 (cg_code, gm_code, gm_nickname, gm_profile, gm_intro, pos_code, pos_name)
	         
	         // 그룹 모임 정보 넣기
	         groupMeetingDTO = groupDAO.Groupmetting(cg_code);
	         
	         //System.out.println(gm_code);
	         
	         // 데이터 베이스 연결 해제
	         groupDAO.close();
	         
	         // 그룹 정보 DTO, 그룹 멤버 DTO, 그룹 직위(그룹장, 부그룹장) 세션 생성 
	         session.setAttribute("groupDTO", groupDTO);
	         session.setAttribute("groupMemberDTO", groupMemberDTO);
	         session.setAttribute("groupPosition", groupPostition);
	         session.setAttribute("groupMeetingDTO", groupMeetingDTO);
	         
		} catch (Exception e)
		{
			System.out.println(e.toString());
			
		}
		
		return "groupmain.woori";
	}
	
	// 그룹 메인 페이지 접속시 실행되는 컨트롤러
	@RequestMapping(value = "/groupmain.woori", method = RequestMethod.GET)
	public String groupMain(ModelMap model, HttpSession session)
	{
		// 세션에서 필요한 값 받아오기
		GroupDTO groupInfo = (GroupDTO)session.getAttribute("groupDTO");
		GroupMemberDTO groupMyInfo = (GroupMemberDTO)session.getAttribute("groupMemberDTO");
		ArrayList<GroupMemberDTO> groupPostition = (ArrayList<GroupMemberDTO>) session.getAttribute("groupPosition");
		
		String cg_code = groupInfo.getCg_code();
		
		System.out.println(cg_code);
		System.out.println(groupInfo.getGm_code());
		
		try
		{
			// 필요한 DAO 호출 자유게시판, 모임, 히스토리, 공지사항 DAO
			IGroupDAO dao = sqlSession.getMapper(IGroupDAO.class);
			ICsDAO csDao = sqlSession.getMapper(ICsDAO.class);
			
			// 정기모임, 번개모임 (현재 참석 여부 확인 중)
			model.addAttribute("impromptuMeeting", dao.impromptuMeeting(cg_code));
			model.addAttribute("regularMeeting", dao.regularMeeting(cg_code));
			
			// 자유게시판, 히스토리 최신글
			model.addAttribute("newBorad", dao.newBorad(cg_code));
			model.addAttribute("newHistory", dao.newHistory(cg_code));
			
			// 공지사항 최신글
			model.addAttribute("noticesList", csDao.noticesList());
			
			// 그룹정보(groupInfo), 그룹 마이정보(groupMyInfo)
			model.addAttribute("groupInfo", groupInfo);
			model.addAttribute("groupMyInfo", groupMyInfo);
			model.addAttribute("groupPosition", groupPostition);
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return "GroupMain.jsp";
	}
	
	// 그룹 마이페이지 접속 시 실행되는 컨트롤러
	@RequestMapping(value = "/groupmypage.woori" , method = RequestMethod.GET)
	public String groupMyPage(ModelMap model, HttpSession session)
	{
		// 세션에서 필요한 값 받아오기
		GroupDTO groupInfo = (GroupDTO)session.getAttribute("groupDTO");
		GroupMemberDTO groupMyInfo = (GroupMemberDTO)session.getAttribute("groupMemberDTO");
		ArrayList<GroupMemberDTO> groupPostition = (ArrayList<GroupMemberDTO>) session.getAttribute("groupPosition");
		
		String us_code = (String) session.getAttribute("us_code");
		String cg_code = groupInfo.getCg_code();
		String gm_code = groupMyInfo.getGm_code();
		
		// 마이 페이지에서 필요한 내가 참석하는 모임
		ArrayList<MeetingDTO> myMeeting = null; 
		
		// 필요한 DAO 호출
		IGroupMyPageDAO dao = sqlSession.getMapper(IGroupMyPageDAO.class);
		GroupDAO groupDAO = new GroupDAO();									// GroupDAO 인스턴스 생성 (세션에 담기는 메소드)
		
		try
		{
			// 계정 정보 조회
			model.addAttribute("myInfo",dao.myProfileList(us_code));	
			// 그룹 정보 조회
			model.addAttribute("groupInfo", groupInfo);
			// 그룹 마이 정보 조회
			model.addAttribute("groupMyInfo", groupMyInfo);
			// 그룹 포지션 정보 조회
			model.addAttribute("groupPosition", groupPostition);
			
			// 내가 작성한 글 조회
			model.addAttribute("regularBoard", dao.regularBoard(gm_code));
			model.addAttribute("impromptuBoard", dao.impromptuBoard(gm_code));
			model.addAttribute("historyBorad", dao.historyBorad(gm_code));
			model.addAttribute("board", dao.board(gm_code));
			
			// 개인 일정 조회 (2024-03-11 추가완료)
			groupDAO.connection();
			
			myMeeting = groupDAO.myMetting(gm_code);
			System.out.println(myMeeting.get(0).getMt_meet());
			System.out.println(myMeeting.get(0).getCt_name());
			System.out.println(myMeeting.get(0).getMt_title());

			groupDAO.close();
			
			//System.out.println("다시 왔지롱");
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		session.setAttribute("myInfo", dao.myProfileList(us_code));
		
		return "GroupMyPage.jsp";
	}
	
	
	// 그룹 마이 정보 수정 컨트롤러
	@RequestMapping(value = "/mypageupdate.woori")
	public String updateGroupMyInfo(GroupMemberDTO updateDTO , HttpSession session)
	{	
		// 세션에서 필요한 데이터 받기
		GroupMemberDTO groupMyInfo = (GroupMemberDTO)session.getAttribute("groupMemberDTO");
		String gm_code = groupMyInfo.getGm_code();
		updateDTO.setGm_regdate(groupMyInfo.getGm_regdate());
		
		try
		{
			// 필요한 DAO 생성
			MyInfoDAO dao = new MyInfoDAO();
			GroupDAO gDao = new GroupDAO();
			
			// 데이터베이스 연결
			dao.connection();
			
			// 그룹원 코드 넣기
			updateDTO.setGm_code(gm_code);
			
			// 그룹 정보 DAO 호출
			dao.modifyGroupProfile(updateDTO);
			
			// 데이터베이스 해제
			dao.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		session.removeAttribute("groupMemberDTO");
		session.setAttribute("groupMemberDTO", updateDTO);
	
		return "redirect:groupmypage.woori";
	}
	
	// 계정 정보 수정 메소드
	@RequestMapping(value = "/userprofileupdate.woori")
	public String updateMyInfo (UserDTO updateDTO, HttpSession session)
	{
		// 세션에서 필요한 값 받기
		String us_code = (String) session.getAttribute("us_code");
		updateDTO.setUs_code(us_code);
		
		try
		{
			//필요한 DAO 호출
			MyInfoDAO dao = new MyInfoDAO();
			
			// 데이터베이스 연결
			dao.connection();
			
			dao.modifyUserProfile(updateDTO);
			
			// 데이터베이스 연결해제
			dao.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		session.removeAttribute("myInfo");
		session.setAttribute("myInfo", updateDTO);
		
		return "redirect:groupmypage.woori";
	}
	
}
