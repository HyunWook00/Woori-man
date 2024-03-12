/*==========================================================================
	NoteController.java
	- 사용자 정의 컨트롤러 클래스
	
	
==========================================================================*/

package com.woori.controller;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.bind.annotation.RequestParam;

import com.woori.dao.NoteDAO;
import com.woori.dto.NoteDTO;

@Controller
public class NoteController
{	
	// 받은 쪽지 리스트를 읽어오는 액션 처리
	@RequestMapping("/notelist.woori")
	public String receiveNote(Model model) throws SQLException, ClassNotFoundException
	{
		String result = "";
					
		ArrayList<NoteDTO> receiveNote = new ArrayList<NoteDTO>();		
		ArrayList<NoteDTO> receiveAdminNote = new ArrayList<NoteDTO>();		
		ArrayList<NoteDTO> receiveFriendNote = new ArrayList<NoteDTO>();		
		ArrayList<NoteDTO> sendNote = new ArrayList<NoteDTO>();		
		
		NoteDAO dao = new NoteDAO();
		
		String receiver = "6843881";
		String sender = "6843881";
		
		try
		{
			dao.connection();
			receiveNote = dao.receiveNote(receiver);
			receiveAdminNote = dao.receiveAdminNote(receiver);
			receiveFriendNote = dao.receiveFriendNote(receiver);
			sendNote = dao.sendNote(sender);
			
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
		model.addAttribute("sendNote", sendNote);
		
		result = "/WEB-INF/view/NoteList.jsp";
		
		return result;
	}
	
	
	// 쪽지 상세 페이지 불러오는 액션 처리
	@RequestMapping("/notearticle.woori")
	public String friendNoteArticle(Model model, @RequestParam("note_code") String note_code) throws SQLException, ClassNotFoundException
	{
		String result = "";
		String type = note_code.substring(0, 2);
		//System.out.println("type : " + type);
		String receiver = "6843881";
		
		NoteDTO dto = null;
		NoteDAO dao = new NoteDAO();
		
		String temp = null;				
		
		String code = note_code.substring(2);
		
		//System.out.println(note_code);
		//System.out.println(code);
		
		try
		{
			dao.connection();
			//System.out.println("try ~ catch 들어왔고~");
			dto = dao.noteArticle(note_code);
			//System.out.println("dao 메소드 실행하고 잘 돌아옴~");
			//System.out.println(dto.getNote_title());
			// 받은 쪽지면
			//System.out.println(dto.getReceiver());
			if (dto.getReceiver().equals(receiver))
			{
				//System.out.println("수신인지 확인하는 if~");
				temp = "check";
				//System.out.println(temp);
			}
			
			if (temp != null)
			{
				//System.out.println("수신한 쪽지입니당");
				if (type.equals("AD"))
				{
					dao.adminRead(code);
					temp = null;
				}
				else
					dao.friendRead(code);
			}
			
			/*if (type.equals("AD"))
			{
				System.out.println("관리자 쪽지~");
				
			}
			else if (type.equals("FR"))
			{
				System.out.println("친구 쪽지~");
			}*/
			
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
		
		/*
		if (note_code.substring(0, 2))
		{
			
		}
		*/
		/*
		NoteDTO receiveNote = null;
		NoteDTO receiveFriendNote = null;
		NoteDTO sendNote = null;
		
		String[] delList = del_code.split("/");
		
		
		try
		{
			dao.connection();
			
			
				String note_code = del_code.substring(2);
				// 관리자 쪽지면
				if (delList[i].substring(0,2).equals("AD"))
				{
					// 관리자 수신 쪽지 상세
					// 쪽지 읽음 상태로 업데이트
				}
				// 친구 쪽지면
				else
				{
					// 전체 수신 쪽지 상세
					receiveNote = dao.receiveNoteArticle(receiver, note_code);
					// 친구 수신 쪽지 상세
					receiveFriendNote = dao.receiveFriendNoteArticle(receiver, note_code);
					// 쪽지 읽음 상태로 업데이트
					dao.friendRead(note_code);
				}
			
			
			
			// 보낸 쪽지 상세
			sendNote = dao.sendNoteArticle(sender, note_code);
			
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
		model.addAttribute("receiveFriendNote", receiveFriendNote);
		model.addAttribute("receiveAdminNote", receiveAdminNote);
		model.addAttribute("sendNote", sendNote);
		
		*/
		
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
				//System.out.println(note_code);
				if (delList[i].substring(0,2).equals("AD"))
				{
					dao.adminDelete(note_code);
					//System.out.println("어드민 삭제 메소드 호출~");
				}
				else
					dao.friendDelete(note_code);
					//System.out.println("친구 쪽지 삭제 메소드 호출~");
			}
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		finally
		{
			try
			{
				//dao.close();
				
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
				//System.out.println(note_code);
				//System.out.println("발신 쪽지 삭제 메소드 호출~");
				
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
		
		//System.out.println("발신 삭제 컨트롤러~!~~!~!");
		
		result = "redirect:notelist.woori";
		
		return result;
	}

	// 쪽지 작성(입력) 폼 불러오는 액션 처리
	@RequestMapping("/notewriteform.woori")
	public String noteWriteForm(Model model) throws SQLException, ClassNotFoundException
	{
		String result = "";
		
		result = "/WEB-INF/view/NoteWrite.jsp";
		
		return result;
	}

	// 쪽지 작성(입력) 액션
	@RequestMapping("/notewrite.woori")
	public String noteWrite(Model model) throws SQLException, ClassNotFoundException
	{
		String result = "";
		
		
		
		result = "redirect:sendnote.woori";
		
		return result;
	}
	
	
	
	
	
	
}
