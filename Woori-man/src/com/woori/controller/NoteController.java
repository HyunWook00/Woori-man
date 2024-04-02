/*==========================================================================
	NoteController.java
	- 사용자 정의 컨트롤러 클래스
	
	
==========================================================================*/

package com.woori.controller;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.bind.annotation.RequestParam;

import com.woori.dao.FriendsDAO;
import com.woori.dao.NoteDAO;
import com.woori.dto.FriendsDTO;
import com.woori.dto.NoteDTO;
import com.woori.dto.UserDTO;

@Controller
public class NoteController
{	
	// 받은 쪽지 리스트를 읽어오는 액션 처리
	@RequestMapping("/notelist.woori")
	public String receiveNote(Model model, HttpSession session) throws SQLException, ClassNotFoundException
	{
		String result = "";
					
		ArrayList<NoteDTO> receiveNote = new ArrayList<NoteDTO>();		
		ArrayList<NoteDTO> receiveAdminNote = new ArrayList<NoteDTO>();		
		ArrayList<NoteDTO> receiveFriendNote = new ArrayList<NoteDTO>();		
		//ArrayList<NoteDTO> sendNote = new ArrayList<NoteDTO>();
		int allSendNote = 0;
		
		NoteDAO dao = new NoteDAO();
		
		UserDTO userDTO = (UserDTO)session.getAttribute("userDTO");
		
		String receiver =  userDTO.getUs_code();
		String sender = userDTO.getUs_code();
		
		try
		{
			dao.connection();
			receiveNote = dao.receiveNote(receiver);
			receiveAdminNote = dao.receiveAdminNote(receiver);
			receiveFriendNote = dao.receiveFriendNote(receiver);
			//sendNote = dao.sendNote(sender);
			allSendNote = dao.sendNoteCount(sender);
			
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
		
		model.addAttribute("receiveNote", receiveNote);
		model.addAttribute("receiveAdminNote", receiveAdminNote);
		model.addAttribute("receiveFriendNote", receiveFriendNote);
		//model.addAttribute("sendNote", sendNote);
		model.addAttribute("allSendNote", allSendNote);
		
		result = "/WEB-INF/view/NoteList.jsp";
		
		return result;
	}
	
	
	// 쪽지 상세 페이지 불러오는 액션 처리
	@RequestMapping("/notearticle.woori")
	public String friendNoteArticle(Model model, @RequestParam("note_code") String note_code, HttpSession session) throws SQLException, ClassNotFoundException
	{
		String result = "";
		String type = note_code.substring(0, 2);
		
		UserDTO userDTO = (UserDTO)session.getAttribute("userDTO");
		
		String receiver =  userDTO.getUs_code();
		
		NoteDTO dto = null;
		NoteDAO dao = new NoteDAO();
		
		String temp = null;				
		
		String code = note_code.substring(2);
		
		
		try
		{
			dao.connection();
			dto = dao.noteArticle(note_code);
			// 받은 쪽지면
			if (dto.getReceiver().equals(receiver))
			{
				temp = "check";
			}
			
			if (temp != null)
			{
				if (type.equals("AD"))
				{
					dao.adminRead(code);
					temp = null;
				}
				else
					dao.friendRead(code);
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
		
		
		
		model.addAttribute("dto", dto);
		model.addAttribute("temp", temp);
		
		result = "/WEB-INF/view/NoteModal.jsp";
		
		
		return result;
	}
	
	// 수신 쪽지 삭제
	@RequestMapping("/receivenotedelete.woori")
	public String noteDelete(Model model,@RequestParam("del_code") String del_code) throws SQLException, ClassNotFoundException
	{
		String result = "";
		
		NoteDAO dao = new NoteDAO();
		String[] delList = del_code.split("/");
		try
		{
			dao.connection();
			for (int i = 0; i < delList.length; i++)
			{
				String note_code = delList[i].substring(2);
				if (delList[i].substring(0,2).equals("AD"))
				{
					dao.adminDelete(note_code);
				}
				else
					dao.friendDelete(note_code);
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
		
		result = "redirect:notelist.woori";
		
		return result;
	}

	// 발신 쪽지 삭제
	@RequestMapping(value = "/sendnotedelete.woori")
	public String sendNoteDelete(Model model,@RequestParam("del_code") String del_code)
	{
		String result = "";
		
		System.out.println(del_code);
		
		NoteDAO dao = new NoteDAO();
		String[] delList = del_code.split("/");
		
		try
		{
			dao.connection();
			for (int i = 0; i < delList.length; i++)
			{
				String note_code = delList[i].substring(2);
				System.out.println(note_code);
				dao.sendDelete(note_code);
				
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
		
		
		result = "redirect:notelist.woori";
		
		return result;
	}

	// 쪽지 작성(입력) 폼 불러오는 액션 처리
    @RequestMapping("/notewriteform.woori") 
    public String noteWriteForm(Model model, HttpSession session//, @RequestParam("us_code2") String us_code2
    		//, @RequestParam("us_id") String us_id, @RequestParam("us_name") String us_name
			//, @RequestParam("fr_code") String fr_code
    		) throws SQLException, ClassNotFoundException 
    { 
    	String result = "";
    	
    	//String code = "#" + us_code2 + " " + us_name + "(" + us_id + ")" ;
		//String friend_code = fr_code;
    	
		FriendsDAO dao = new FriendsDAO();
		
		dao.connection();
		
		dao.close();
		
		//model.addAttribute("code", code);
		//model.addAttribute("fr_code", friend_code);
		
	    result = "/WEB-INF/view/NoteWrite.jsp";
	 
	    return result; 
    }
    
    // 쪽지 작성 페이지에서 검색을 통해 수신자(친구) 선택
    @RequestMapping("/friendlistsearch.woori") 
    public String friendList(Model model, HttpSession session, @RequestParam("searchValue") String searchValue) throws SQLException, ClassNotFoundException 
    { 
    	String result = "";
    	
    	UserDTO userDTO = (UserDTO)session.getAttribute("userDTO");
    	String us_code = userDTO.getUs_code();
    	
    	NoteDAO dao = new NoteDAO();
    	dao.connection();
    	
    	ArrayList<FriendsDTO> searchFriend = new ArrayList<FriendsDTO>();
    	
    	//System.out.println("us-code : " + us_code + " / search : " + searchValue);
    	searchFriend = dao.FriendSearch(us_code, searchValue);
    	//System.out.println(searchFriend.size());
    	
    	model.addAttribute("searchFriend", searchFriend);
	  
	    result = "/WEB-INF/view/FriendNoteModal.jsp";
	 
	    return result; 
    }
    
    // 친구 선택...?(fr_code)
    @RequestMapping("/friendselect.woori") 
    public String friendSelect(Model model, NoteDTO dto, @RequestParam("fr_code") String fr_code) throws SQLException, ClassNotFoundException 
	{ 
		String result = "";
	  
		NoteDAO dao = new NoteDAO();
		
		dao.connection();
		
		dto.setFr_code(fr_code);
		
		dao.close();
		
	    result = "redirect:notewriteform.woori";
	  
		return result; 
	}
	  
    // 쪽지 작성(입력) 액션
	@RequestMapping("/notewrite.woori") 
	public String noteWrite(Model model, NoteDTO dto) throws SQLException, ClassNotFoundException 
	{ 
		String result = "";
	  
		NoteDAO dao = new NoteDAO();
		
		dao.connection();
		
		dao.noteWrite(dto);
		
		dao.close();
		
	    result = "redirect:notelist.woori";
	  
		return result; 
	}
	 
	
	
	
	
	
	
}
