/*==========================================================================
	FriendsController.java
	- 사용자 정의 컨트롤러 클래스
	
	- 데이터베이스의 리스트를 읽어오는 액션 처리
	- 『inquirylist.action』 → 요청 → inquiryList() 처리
	
	
==========================================================================*/

package com.woori.controller;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.bind.annotation.RequestParam;

import com.woori.dao.FriendsDAO;
import com.woori.dto.FriendsDTO;
import com.woori.dto.NoteDTO;
import com.woori.dto.UserDTO;

@Controller
public class FriendsController
{	
	// 친구 페이지 읽어오는 액션 처리
	@RequestMapping("/friends.woori")
	public String friends(Model model, HttpSession session) throws SQLException, ClassNotFoundException
	{
		String result = "";
		
		int count = 0;
		FriendsDTO myprofile = null;
		ArrayList<FriendsDTO> friendsList = new ArrayList<FriendsDTO>();		
		
		FriendsDAO dao = new FriendsDAO();
		
		UserDTO userDTO = (UserDTO)session.getAttribute("userDTO");
		
		String us_code = userDTO.getUs_code();
		
		try
		{
			dao.connection();
			count = dao.count(us_code);
			myprofile = dao.myProfile(us_code);
			friendsList = dao.list(us_code);
			
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
		
		model.addAttribute("count", count);
		model.addAttribute("myProfile", myprofile);
		model.addAttribute("friendsList", friendsList);
		
		result = "/WEB-INF/view/Friends.jsp";
		
		return result;
	}
	
	// 회원 검색
	@RequestMapping("/usersearch.woori")
	public String userSearch(HttpSession session, Model model, @RequestParam("type") String type, @RequestParam("value") String value) throws SQLException, ClassNotFoundException
	{
		String result = "";
		
		FriendsDTO userSearch = null;
		int count = 0;
		
		FriendsDAO dao = new FriendsDAO();
		
		// 세션의 담긴 유저 코드 가져오기
		UserDTO userDTO = (UserDTO) session.getAttribute("userDTO");
		String us_code = userDTO.getUs_code();
		
		try
		{
			dao.connection();
			userSearch = dao.userSearch(type, value);		
			count = dao.friendCheck(us_code, userSearch.getUs_code2());
			
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
		
		model.addAttribute("userSearch", userSearch);
		model.addAttribute("count", count);
		
		
		result = "/WEB-INF/view/friendModal.jsp";
		
		return result;
	}
	
	
	// 친구 추가
	@RequestMapping("/friendadd.woori")
	public String friendAdd(Model model, FriendsDTO dto) throws SQLException, ClassNotFoundException
	{
		String result = "";
		
		FriendsDAO dao = new FriendsDAO();
		
		try
		{
			dao.connection();					
			
			dao.friendAdd(dto);
			
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
		
		result = "redirect:friends.woori";
		
		return result;
	}
	
	// 친구 삭제
	@RequestMapping("/frienddelete.woori")
	public String friendDelete(Model model, @RequestParam("fr_code") String fr_code) throws SQLException, ClassNotFoundException
	{
		String result = "";
		
		FriendsDAO dao = new FriendsDAO();
		
		try
		{
			dao.connection();					
			
			dao.friendDelete(fr_code);
			
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
		
		result = "redirect:friends.woori";
		
		return result;
	}
	
	// 친구 쪽지 폼
	@RequestMapping("/friendnotewriteform.woori")
	public String friendNoteWriteForm(Model model, @RequestParam("us_code2") String us_code2

	  ,@RequestParam("us_id") String us_id, @RequestParam("us_name") String us_name

			, @RequestParam("fr_code") String fr_code ) throws SQLException, ClassNotFoundException
	{
		String result = "";
		
		FriendsDAO dao = new FriendsDAO();
		//String code = "#" + us_code2 + us_name + ;
		String code = "#" + us_code2 + " " + us_name + "(" + us_id + ")" ;
		String friend_code = fr_code;
		
		/*
		 * String id = us_id; String name = us_name;
		 */
		
		try
		{
			dao.connection();	
			
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
		
		//model.addAttribute("receiver", receiver);
		model.addAttribute("code", code);
		model.addAttribute("fr_code", friend_code);
		/*
		 * model.addAttribute("id", id); model.addAttribute("name", name);
		 */
		
		result = "/WEB-INF/view/NoteWrite.jsp";
		
		return result;
	}
	
	// 친구 쪽지 보내기
	@RequestMapping(value = "/friendnotewrite.woori", method = RequestMethod.GET)
	public String friendNoteWrite(Model model, NoteDTO dto) throws SQLException, ClassNotFoundException
	{
		String result = "";
		
		FriendsDAO dao = new FriendsDAO();
		//NoteDTO dto = new NoteDTO();
		// 이거는 지금 새로운 dto 객체를 생성한거잖아?
		// 새로운 dto 객체를 생성하면 그 안에 ㅇㅇ
		
		try
		{
			dao.connection();					
			dao.friendNote(dto);
			
			
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
		
		result = "redirect:notelist.woori";
		
		return result;
	}

	
}
