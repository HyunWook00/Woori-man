package com.woori.controller;


import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;		//-- check~!!!
import org.springframework.web.bind.annotation.RequestParam;

import com.woori.dao.MemberMainDAO;
import com.woori.dto.GroupDTO;
import com.woori.dto.GroupMemberDTO;
import com.woori.dto.MeetingDTO;
import com.woori.dto.UserDTO;

@Controller
public class MemberMainController
{
	
	// 로그아웃 클릭 시 세션을 제거하고 로그인 창으로 복귀
	@RequestMapping(value = "/logout.woori")
	public String logout(HttpSession session)
	{
		session.invalidate();	// 담고 있던 모든 세션 정보 삭제
		
		return "loginform.woori";
	}
	
	
	
	
	
	
	
	
	// 그룹 개설 폼으로 이동 메소드
	@RequestMapping(value = "/creategroupform.woori")
	public String createGroupForm()
	{
		
		return "/WEB-INF/view/CreateGroupForm.jsp";
	}
	
	// 그룹 개설 액션 메소드
	@RequestMapping(value = "/creategroup.woori")
	public String createGroup(Model model, HttpSession session, @RequestParam("cg_name") String cg_name
										 					  , @RequestParam("cg_intro") String cg_intro
										 					  , @RequestParam("gc_code") String gc_code
										 					  , @RequestParam("cg_profile") String cg_profile
										 					  , @RequestParam("brd_name") String brd_name) throws SQLException, ClassNotFoundException
	{
		// 액션 코드
		MemberMainDAO dao = new MemberMainDAO();
		MemberMainDTO member = new MemberMainDTO();
		
		String us_code = (String) session.getAttribute("us_code");
		
		System.out.println(us_code);
		
		dao.connection();		
		if (cg_profile == null || cg_profile == "")
		{
			cg_profile = "기본프로필";
		}
		
		if (brd_name == "" || brd_name == null)
		{
			brd_name = "자유 게시판";
		}
		
		
			member.setUs_code(us_code);
			member.setCg_name(cg_name);
			member.setCg_intro(cg_intro);
			member.setGc_code(gc_code);
			member.setCg_profile(cg_profile);
			member.setBrd_name(brd_name);
			
			dao.createGroup(member);
				
			
		return "membermain.woori";
	}
	
	// 그룹 수정 메소드 
	@RequestMapping(value = "/groupupdate.woori")
	public String groupUpdate(@RequestParam("cg_code") String cg_code
						    , @RequestParam("brd_name") String brd_name
						    , @RequestParam("cg_intro") String cg_intro
						    , @RequestParam("cg_profile") String cg_profile) throws ClassNotFoundException, SQLException
	{
		MemberMainDAO dao = new MemberMainDAO();
		GroupDTO dto = new GroupDTO();
		dao.connection();
		
		System.out.println(cg_profile);
		
		if (cg_profile == null)
		{
			cg_profile = "기본프로필";
		}
		
		dto.setCg_code(cg_code);
		dto.setCg_intro(cg_intro);
		dto.setBrd_name(brd_name);
		dto.setCg_profile(cg_profile);
		
		dao.updateGroupInfo(dto);
		
		dao.close();
		
		return "redirect:changeGroupTest.jsp";
	}
	
	
	// 수정할 그룹 이전 정보 조회 찾아오기 메소드
	@RequestMapping(value = "/groupupdateform.woori")
	public String groupUpdateForm(Model model, @RequestParam("cg_code") String cg_code) throws ClassNotFoundException, SQLException
	{
		MemberMainDAO dao = new MemberMainDAO();
		GroupDTO group = new GroupDTO();
		dao.connection();
		
		group = dao.searchGroup(cg_code);
		
		model.addAttribute("cg_code", cg_code);
		model.addAttribute("group", group);
		
		dao.close();
		
		return "/WEB-INF/view/ChangeGroupInfo.jsp";
	}
	
	
	
	
	// 선택 그룹 들어갈 때 찾아야 하는 정보들 (GroupDTO, GroupMemberDTO 구성)
	@RequestMapping(value = "/entergroup.woori")
	public String enterGroup(HttpSession session, Model model, @RequestParam("cg_code") String cg_code) throws ClassNotFoundException, SQLException
	{
		ArrayList<GroupMemberDTO> groupMemberDTO = new ArrayList<GroupMemberDTO>();
		MemberMainDAO dao = new MemberMainDAO(); 					// dao 인스턴스 생성
		GroupDTO groupDTO = new GroupDTO();							// dto 인스턴스 생성
		
		dao.connection(); 											// 서버 연결
		
		UserDTO userDTO = (UserDTO) session.getAttribute("userDTO");  // 세션을통해 유저 코드 가져오기 
		
		try
		{
			// 로그인 세션 정보가 없을 시 로그인 페이지 실행
			if (userDTO.getUs_code() == null)
			{
				return "loginform.action";
			}
			
			
			groupDTO = dao.groupInfo(userDTO.getUs_code(), cg_code); 			// groupDTO에 필요한 속성 set
			groupMemberDTO = dao.groupMemberInfo(cg_code);			// groupMemberDTO 에 필요한 속성 set 

			
			session.setAttribute("groupDTO", groupDTO);				// groupDTO(GroupDTO)를 세션에 set
			session.setAttribute("groupMemberDTO", groupMemberDTO);	// groupMemberDTO(GroupMemberDTO)를 세션에 set
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return "newfile.woori";
	}
	
	
	// 설정한 DTO session 테스트
	@RequestMapping(value = "/newfile.woori")
	public String test(HttpSession session, Model model)
	{ 	
		GroupDTO groupDTO = (GroupDTO) session.getAttribute("groupDTO");
		model.addAttribute("groupDTO", groupDTO);
		
		
		@SuppressWarnings("unchecked")
		ArrayList<GroupMemberDTO> groupMemberDTO = (ArrayList<GroupMemberDTO>) session.getAttribute("groupMemberDTO");
		model.addAttribute("groupMemberDTO", groupMemberDTO);
		
		return "/WEB-INF/view/NewFile.jsp";
	}
	
	
	
	// 친구찾기
	@RequestMapping(value = "/findfriends.woori")
	public String findFriends(Model model, @RequestParam("us_id") String us_id) throws ClassNotFoundException, SQLException
	{
		MemberMainDTO friends = new MemberMainDTO();
		MemberMainDAO dao = new MemberMainDAO();
		dao.connection();
		
		friends = dao.findFriends(us_id);
		String us_code = friends.getUs_code();
		String us_name = friends.getUs_name();
		
		model.addAttribute("us_code", us_code);
		model.addAttribute("us_name", us_name);
		model.addAttribute("friends", friends);
		
		return "/WEB-INF/view/friendAjax.jsp";
			
	}
	
	
	@RequestMapping(value = "/cal.woori")
	public String cal(HttpSession session, Model model, @RequestParam("us_code") String us_code) throws ClassNotFoundException, SQLException
	{
		ArrayList<MeetingDTO> dto = null;
		MemberMainDAO dao = new MemberMainDAO();

		dao.connection();
		
		dto = dao.findMeeting(us_code);
		
		session.setAttribute("us_code", us_code);
		model.addAttribute("dto", dto);
		
		return "/WEB-INF/view/cal3.jsp";
	}
	
	
	@RequestMapping(value = "/calreceive.woori")
	public String calReceive(HttpSession session, Model model
										, @RequestParam("year") String year
										, @RequestParam("month") String month) throws ClassNotFoundException, SQLException
	{
		ArrayList<MeetingDTO> dto = null;
		MemberMainDAO dao = new MemberMainDAO();

		dao.connection();
		
		String us_code = (String) session.getAttribute("us_code");
		dto = dao.findMeeting(us_code);
		
		model.addAttribute("dto", dto);
		model.addAttribute("month", month);
		model.addAttribute("year", year);
		
		return "/WEB-INF/view/cal3.jsp";
	}
	
	
	// 즐겨찾기 액션처리 메소드
	@RequestMapping(value = "/bookmark.woori")
	public String bookmark(HttpSession session, @RequestParam("gb_code") String gb_code
						 , @RequestParam("gm_code") String gm_code) throws ClassNotFoundException, SQLException
	{
		MemberMainDAO dao = new MemberMainDAO();
		dao.connection();
		
		if (gb_code.equals("0"))
		{
			dao.addBookMark(gm_code);
		}
		else
		{
			dao.deleteBookMark(gb_code);
		}
		
		
		return "redirect:membermain.woori";
	}
	
	
	
	
	

}











































