/*==================================
	GroupController01.java 
	- 사용자 정의 컨트롤러 클래스
===================================*/

package com.woori.controller;

import java.sql.SQLException;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.woori.dao.GroupListDAO;
import com.woori.dto.GroupDTO;
import com.woori.dto.UserDTO;



// ※ Spring 의 『Controller』인터페이스를 구현하는 방법을 통해
//    사용자 정의 컨트롤러 클래스를 구성한다.
//    cf. Controller Annotaion 활용

@Controller
public class GroupController01 
{
	
	//나의 그룹 리스트
		@RequestMapping(value = "/group.woori")
		public String GroupList(Model model, HttpSession session) throws ClassNotFoundException, SQLException
		{
			GroupListDAO dao = new GroupListDAO();
			
			UserDTO dto = (UserDTO) session.getAttribute("userDTO");
			
			
			ArrayList<GroupDTO> myGroupList = new ArrayList<GroupDTO>();		// 나의 가입그룹 리스트
			ArrayList<GroupDTO> waitingGroupList = new ArrayList<GroupDTO>();   // 나의 대기그룹 리스트
			ArrayList<GroupDTO> inviteGroupList = new ArrayList<GroupDTO>();    // 초대 그룹 리스트
			ArrayList<GroupDTO> blockedGroupList = new ArrayList<GroupDTO>();   // 차단 그룹 리스트
			
			//GroupDTO leaderName = new GroupDTO();								// 그룹장 닉네임

			//GroupDTO recentDate = new GroupDTO();
			
			String us_code = dto.getUs_code();
			//System.out.println(us_code);
			//int us_code = 3859105;
			//int cg_code = 5;
			
			try
			{
				myGroupList = dao.myGrouplist(us_code);
				waitingGroupList = dao.waitingGroupList(us_code);
				inviteGroupList = dao.inviteGroupList(us_code);
				blockedGroupList = dao.blockedGroupList(us_code);
				
				//leaderName = dao.groupLeader(cg_code);
				//recentDate = dao.recentDate();
				
			} catch (Exception e)
			{
				System.out.println(e.toString());
			}
			
			//System.out.println(inviteGroupList.size());
			
			model.addAttribute("myGroupList" , myGroupList);			// 가입 그룹 리스트 
			model.addAttribute("waitingGroupList", waitingGroupList);   // 대기 그룹 리스트 
			model.addAttribute("inviteGroupList", inviteGroupList);     // 초대 그룹 리스트 
			model.addAttribute("blockedGroupList", blockedGroupList);	// 차단 그룹 리스트
			
			//model.addAttribute("leaderName", leaderName);     // 그룹장 닉네임 
			
			
			//model.addAttribute("recentDate", recentDate);
			
			
			return "/WEB-INF/view/TotalGroupList2.jsp";
			
		}
	
	
	// 나의 가입 그룹의 최근 활동일 -- 어케 컨트롤러 두 개를 받을지..몰게삼 DAO를 바꿔야하낭
	/*
	@RequestMapping("/group.do")
	public String groupRecentDate(Model model) throws ClassNotFoundException, SQLException
	{
		GroupDAO dao = new GroupDAO();
		GroupDTO recentDate = new GroupDTO();
		
		try
		{
			recentDate = dao.recentDate();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		model.addAttribute("recentDate", recentDate);
		
		return "UserGroupList.jsp";
	}
	*/
	
	
	// 나의 대기그룹 리스트 (초대수락○ 그룹원정보등록X)
	/*
	@RequestMapping("/waitinggroup.do")   
	public String waitingGroupList(Model model)
	{
		
		int us_Code = 1;
		GroupDAO dao = new GroupDAO();
		
		ArrayList<GroupDTO> waitingGroupList = new ArrayList<GroupDTO>();
		
		try
		{
			waitingGroupList = dao.waitingGroupList(us_Code);

		} catch (Exception e)
		{
			System.out.println(e.toString());
		}

		model.addAttribute("waitingGroupList", waitingGroupList);

		return "WaitingUserGroupList.jsp";
		
	}
	*/
	
	
	// 초대받은 그룹 리스트 조회 (차단한 그룹인지 확인 후 조회) 
	/*
	@RequestMapping("/groupinvitation.do")
	public String inviteGroupList(Model model)
	{
		int us_code = 1;
		GroupDAO dao = new GroupDAO();
		
		ArrayList<GroupDTO> inviteGroupList = new ArrayList<GroupDTO>();
		ArrayList<GroupDTO> checkBlocked = new ArrayList<GroupDTO>();
		
		try
		{
			inviteGroupList = dao.inviteGroupList(us_code);
			checkBlocked = dao.checkBlocked(us_code);
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		model.addAttribute("inviteGroupList", inviteGroupList);
		
		return "GroupInvitation.jsp";
	}
	*/
	
	
		// 수락 버튼 클릭 시 (테스트 완료)
		@RequestMapping(value = "/invitationacccept.woori", method = RequestMethod.GET)
		public String invitationAccept(Model model, HttpSession session, String gi_code)
		{
			GroupDTO dto = (GroupDTO) session.getAttribute("GroupDTO");
			//String gi_code = dto.getGi_code(); 
			
			//System.out.println("수락 버튼 클릭시 세션에서 받아온 gi_code : " + gi_code);
			
			GroupListDAO dao = new GroupListDAO();
			
			int accept = 0;
			
			try
			{
				//accept = dao.accept(gi_code);
				
			} catch (Exception e)
			{
				System.out.println(e.toString());
			}
			
			//model.addAttribute("accept", accept);
			
			return "group.woori";
		}
		
		
		// 거절 버튼 클릭 시 (테스트 완료)
		// 초대 거절 → 거절만 할게요 버튼 클릭 시 (그룹 초대 테이블) 업데이트
		@RequestMapping(value = "/invitationrefuse.woori", method = RequestMethod.GET)
		public String invitationRefuse(Model model, HttpSession session, String gi_code)
		{
			GroupDTO dto = (GroupDTO) session.getAttribute("GroupDTO");
			//String gi_code = dto.getGi_code(); 
			
			//System.out.println("거절 버튼 클릭시 세션에서 받아온 gi_code : " + gi_code);
			
			GroupListDAO dao = new GroupListDAO();
			
			int refuse = 0;
			
			try
			{
				refuse = dao.refuse(gi_code);
				
			} catch (Exception e)
			{
				System.out.println(e.toString());
			}
			
			model.addAttribute("refuse", refuse);
			
			return "group.woori";
		}
		
		
		// 차단하시겠습니까? 클릭시
		// 초대 거절 → 차단도 할래요 버튼 클릭시 (그룹 초대 테이블 + 그룹 차단 테이블) 업데이트
		@RequestMapping(value = "/invitationblock.woori", method = RequestMethod.GET)
		public String invitationBlock(Model model, HttpSession session, String gi_code, String cg_code)
		{
			
			UserDTO userDTO = (UserDTO) session.getAttribute("userDTO");
			String us_code = userDTO.getUs_code();
			
			//System.out.println("차단 버튼 클릭시 세션에서 받아온 gi_code : " + gi_code);
			//System.out.println("차단 버튼 클릭시 세션에서 받아온 cg_code : " + cg_code);
			//System.out.println("차단 버튼 클릭시 세션에서 받아온 us_code : " + us_code);
			
			GroupListDAO dao = new GroupListDAO();
			
			int block = 0;
			int refuse = 0;
			
			try
			{
				refuse = dao.refuse(gi_code);				// 초대거절메소드
				block = dao.block(us_code, cg_code);		// 그룹차단메소드	
				
			} catch (Exception e)
			{
				System.out.println(e.toString());
			}
			
			model.addAttribute("refuse", refuse);
			model.addAttribute("block", block);
			
			return "group.woori";
		}
		
		// 차단그룹 목록에서 차단해제 버튼 클릭시 (그룹차단 테이블 삭제)
		@RequestMapping(value = "invitaionUnblock.woori")
		public String invitationUnBlock(Model model, HttpSession session)
		{
			GroupDTO dto = (GroupDTO) session.getAttribute("GroupDTO");
			String cg_code = dto.getCg_code();
			String us_code = dto.getUs_code();
			
			GroupListDAO dao = new GroupListDAO();
			
			int unblock = 0;
			
			try
			{
				unblock = dao.unblock(us_code, cg_code);
			} catch (Exception e)
			{
				System.out.println(e.toString());
			}
			
			return "group.woori";
			
		}
		
		// 그룹원 정보 등록
		@RequestMapping(value = "groupaccept.woori", method = RequestMethod.POST)
		public String groupAccept(String gm_nickname, String gm_intro, String gi_code, String gm_profile) throws ClassNotFoundException, SQLException
		{
			GroupListDAO dao = new GroupListDAO();
			dao.groupMemberInsert(gi_code, gm_nickname, gm_profile, gm_intro);
			
			return "redirect:group.woori";
		}

}
