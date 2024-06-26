package com.woori.controller;


import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;		//-- check~!!!
import org.springframework.web.bind.annotation.RequestParam;

import com.woori.dao.FriendsDAO;
import com.woori.dao.LoginDAO;
import com.woori.dao.MemberMainDAO;
import com.woori.dto.FriendsDTO;
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
											 					  , @RequestParam("brd_name") String brd_name
											 					  , @RequestParam("basicImg") String basicImg) throws SQLException, ClassNotFoundException
		{
			// 액션 코드
			MemberMainDAO dao = new MemberMainDAO();
			GroupDTO dto = new GroupDTO();
			
			UserDTO userDTO = (UserDTO) session.getAttribute("userDTO");
			String us_code = userDTO.getUs_code();
			cg_profile = "images/" + cg_profile;
			
			dao.connection();	
			
			if (brd_name == "" || brd_name == null)
			{
				brd_name = "자유 게시판";
			}			
			if (basicImg == "" || basicImg == null) // 기본 제공 프로필 사진 선택이 아닐 시
			{
				dto.setUs_code(us_code);
				dto.setCg_name(cg_name);
				dto.setCg_intro(cg_intro);
				dto.setGc_code(gc_code);
				dto.setCg_profile(cg_profile);
				dto.setBrd_name(brd_name);
				
				dao.createGroup(dto);
				
				return "redirect:membermain.woori";
			}
			else 
			{
				
				dto.setUs_code(us_code);
				dto.setCg_name(cg_name);
				dto.setCg_intro(cg_intro);
				dto.setGc_code(gc_code);
				dto.setCg_profile(basicImg);
				dto.setBrd_name(brd_name);
				
				dao.createGroup(dto);
				return "redirect:membermain.woori";
			}
			
	}
	
	// 그룹 수정 메소드 
	@RequestMapping(value = "/groupupdate.woori")
	public String groupUpdate(Model model, @RequestParam("cg_code") String cg_code
						    		     , @RequestParam("brd_name") String brd_name
						    		     , @RequestParam("cg_intro") String cg_intro
						    		     , @RequestParam("cg_profile") String cg_profile) throws ClassNotFoundException, SQLException
	{
		MemberMainDAO dao = new MemberMainDAO();
		GroupDTO dto = new GroupDTO();
		dao.connection();
		
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
		
		model.addAttribute("cg_code", cg_code);
		
		return "entergroup.woori";
	}
	
	
	// 수정할 그룹 이전 정보 조회 찾아오기 메소드
	// 그룹 수정 폼으로 이동
	@RequestMapping(value = "/groupupdateform.woori")
	public String groupUpdateForm(HttpSession session, Model model, @RequestParam("cg_code") String cg_code) throws ClassNotFoundException, SQLException
	{
		MemberMainDAO dao = new MemberMainDAO();
		GroupDTO group = new GroupDTO();
		dao.connection();
		UserDTO userDTO = (UserDTO) session.getAttribute("userDTO");
		String us_code = userDTO.getUs_code();
		
		group = dao.searchGroup(cg_code, us_code);
		
		model.addAttribute("cg_code", cg_code);
		model.addAttribute("us_code", us_code);
		model.addAttribute("group", group);
		
		
		dao.close();
		
		return "/WEB-INF/view/ChangeGroupInfo.jsp";
	}
	
	
	// 그룹 폐쇄 메소드 
	@RequestMapping(value = "/dropgroup.woori")
	public String droupGroup(Model model, @RequestParam("cg_code") String cg_code
								 , @RequestParam("gm_code") String gm_code ) throws ClassNotFoundException, SQLException
	{
		MemberMainDAO dao = new MemberMainDAO();
		dao.connection();
		
		dao.dropGroup(gm_code, cg_code);
		
		return "redirect:membermain.woori";
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
		public String findFriends(HttpSession session, Model model, @RequestParam("shearchValue") String shearchValue) throws ClassNotFoundException, SQLException
		{
			
			ArrayList<FriendsDTO> friends = new ArrayList<FriendsDTO>();
			MemberMainDAO dao = new MemberMainDAO();
			UserDTO userDTO = (UserDTO) session.getAttribute("userDTO");
			String us_code = userDTO.getUs_code();
			dao.connection();
			
			
			friends = dao.findFriends(us_code, shearchValue);
			
			model.addAttribute("friends", friends);
			
			return "/WEB-INF/view/friendAjax.jsp";
				
		}
		// 친구 삭제
		@RequestMapping("/deletefriend.woori")
		public String friendDelete(HttpSession session, Model model, @RequestParam("fr_code") String fr_code) throws SQLException, ClassNotFoundException
		{
			ArrayList<FriendsDTO> friendsList = new ArrayList<FriendsDTO>();
			FriendsDAO dao = new FriendsDAO();
			UserDTO userDTO = (UserDTO) session.getAttribute("userDTO");
			String us_code1 = userDTO.getUs_code();
			
			dao.connection();	
			
			dao.friendDelete(fr_code);
			friendsList = dao.list(us_code1);
			
			model.addAttribute("friendsList", friendsList);
			
			return "/WEB-INF/view/FriendsListAjax.jsp";
		}
		
		// 친구 추가
		@RequestMapping("/addfriend.woori")
		public String friendAdd(HttpSession session, Model model, @RequestParam("us_code2") String us_code2) throws ClassNotFoundException, SQLException
		{
			ArrayList<FriendsDTO> friendsList = new ArrayList<FriendsDTO>();
			FriendsDAO dao = new FriendsDAO();
			UserDTO userDTO = (UserDTO) session.getAttribute("userDTO");
			String us_code1 = userDTO.getUs_code();
			
			dao.connection();
			
			dao.friendAdd2(us_code1, us_code2);
			friendsList = dao.list(us_code1);
			
			model.addAttribute("friendsList", friendsList);
			
			return "/WEB-INF/view/FriendsListAjax.jsp";
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
						 , Model model, @RequestParam("gm_code") String gm_code) throws ClassNotFoundException, SQLException
	{
		ArrayList<GroupDTO> groupList = new ArrayList<GroupDTO>();
		MemberMainDAO dao = new MemberMainDAO();
		LoginDAO loginDAO = new LoginDAO();
		
		UserDTO userDTO = (UserDTO) session.getAttribute("userDTO");
		String us_code = userDTO.getUs_code();
		
		dao.connection();
		loginDAO.connection();
		
		if (gb_code.equals("0"))
		{
			dao.addBookMark(gm_code);
		}
		else
		{
			dao.deleteBookMark(gb_code);
		}
		
		groupList = loginDAO.groupList(us_code);
		model.addAttribute("groupList", groupList);
		
		
		return "WEB-INF/view/bookmarkAjax.jsp";
	}
	
	
	
	
	

}











































