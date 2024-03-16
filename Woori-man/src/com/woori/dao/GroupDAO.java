package com.woori.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.woori.util.DBConn;
import com.woori.dto.GroupDTO;
import com.woori.dto.GroupMemberDTO;
import com.woori.dto.MeetingDTO;

public class GroupDAO
{
	private Connection conn;
	
	// 데이터베이스 연결
	public void connection() throws ClassNotFoundException, SQLException
	{
		conn = DBConn.getConnection();
	}
	
	// 데이터 베이스 연결 해제
	public void close() throws SQLException
	{
		DBConn.close();
	}
	
		// 선택한 내 그룹에 진입할 때 GroupDTO 를 구성하여 세션으로 넘기기
	   public GroupDTO groupInfo(String us_code, String cg_code) throws SQLException
	   {
	      GroupDTO result = new GroupDTO();
	      
	      String sql = " SELECT MGV.CG_CODE, MGV.GI_CODE, MGV.CG_INTRO, MGV.CG_PROFILE, MGV.CG_NAME, TO_CHAR(MGV.CG_DATE,'YYYY-MM-DD') AS CG_DATE , MGV.BRD_NAME," + 
	      		"(SELECT COUNT(MGV2.CG_CODE) FROM MY_GROUP_VIEW MGV2 WHERE MGV2.CG_CODE = MGV.CG_CODE AND MGV2.GW_CODE IS NULL) AS GM_COUNT, MGV.GM_CODE AS GM_CODE" + 
	      		" FROM MY_GROUP_VIEW MGV WHERE US_CODE2 = ? AND CG_CODE = ?";
	      
	      PreparedStatement pstmt = conn.prepareStatement(sql);
	      pstmt.setString(1, us_code);
	      pstmt.setString(2, cg_code);
	      
	      ResultSet rs = pstmt.executeQuery();
	      while (rs.next())
	      {
	         result.setCg_code(rs.getString(1));
	         result.setGi_code(rs.getString(2));
	         result.setCg_intro(rs.getString(3));
	         result.setCg_profile(rs.getString(4));
	         result.setCg_name(rs.getString(5));
	         result.setCg_date(rs.getString(6));
	         result.setBrd_name(rs.getString(7));
	         result.setGm_count(rs.getString(8));
	         result.setGm_code(rs.getString(9));
	      }
	      
	      rs.close();
	      pstmt.close();
	      
	      return result;
	   }
	   
	   // 선택한 내 그룹에 진입할 때 해당 그룹의 그룹원들 정보GroupMemberDTO 를 구성하여 세션으로 넘기기
	   public ArrayList<GroupMemberDTO> groupMemberList(String cg_code) throws SQLException
	   {
	      ArrayList<GroupMemberDTO> result = new ArrayList<GroupMemberDTO>();
	      
	      String sql = "SELECT CG_CODE, GM_CODE, GM_NICKNAME, GM_PROFILE, GM_INTRO, GM_REGDATE, POS_CODE, NVL(POS_NAME,'그룹원') AS POS_NAME"
	      		+ " FROM GROUP_MEMBER_VIEW WHERE CG_CODE = ? AND GW_CODE IS NULL";
	      PreparedStatement pstmt = conn.prepareStatement(sql);
	      pstmt.setString(1, cg_code);
	      
	      ResultSet rs = pstmt.executeQuery();
	      while (rs.next())
	      {
	         GroupMemberDTO dto = new GroupMemberDTO();
	         
	         dto.setCg_code(rs.getString(1));
	         dto.setGm_code(rs.getString(2));
	         dto.setGm_nickname(rs.getString(3));
	         dto.setGm_intro(rs.getString(4));
	         dto.setGm_profile(rs.getString(5));
	         dto.setGm_regdate(rs.getString(6));
	         dto.setPos_code(rs.getString(7));
	         dto.setPos_name(rs.getString(8));
	         
	         System.out.println(dto.getCg_code());
	         
	         result.add(dto);
	      }
	      
	      rs.close();
	      pstmt.close();
	      
	      return result;
	   }
	   
	   
	// 선택한 내 그룹에 진입할 때 해당 그룹의 그룹원들 정보GroupMemberDTO 를 구성하여 세션으로 넘기기
	   public GroupMemberDTO groupMyInfo(String gm_code) throws SQLException
	   {
	      GroupMemberDTO result = new GroupMemberDTO();
	      
	      String sql = "SELECT CG_CODE, GM_CODE, GM_NICKNAME, GM_PROFILE, GM_INTRO, TO_CHAR(GM_REGDATE,'YYYY-MM-DD'), POS_CODE, POS_NAME FROM GROUP_MEMBER_VIEW WHERE GM_CODE = ?";
	      PreparedStatement pstmt = conn.prepareStatement(sql);
	      pstmt.setString(1, gm_code);
	      
	      ResultSet rs = pstmt.executeQuery();
	      while (rs.next())
	      {
	    	  result.setCg_code(rs.getString(1));
	    	  result.setGm_code(rs.getString(2));
	    	  result.setGm_nickname(rs.getString(3));
	    	  result.setGm_profile(rs.getString(4));
	    	  result.setGm_intro(rs.getString(5));
	    	  result.setGm_regdate(rs.getString(6));
	    	  result.setPos_code(rs.getString(7));
	    	  result.setPos_name(rs.getString(8));
	         
	         //System.out.println(dto.getCg_code());
	         
	      }
	      
	      rs.close();
	      pstmt.close();
	      
	      return result;
	   }
	   
	   // 그룹 포인트 받는 메소드
	   public int groupPoint(String cg_code) 
	   {
		   int result = 0;
		   
			try
			{
				   String sql = "SELECT TO_NUMBER(누적포인트) - TO_NUMBER(사용포인트) AS GROUP_POINT"
				   			 + " FROM (SELECT (SELECT SUM(GP_SCORE)FROM GROUP_POINT WHERE PS_CODE = 2) AS 누적포인트"
				   			 + ", (SELECT SUM(GP_SCORE) FROM GROUP_POINT WHERE PS_CODE = 1) AS 사용포인트"
				   			 + " FROM CREATE_GROUP WHERE CG_CODE = ?)";
				   
				   PreparedStatement pstmt = conn.prepareStatement(sql);
				   pstmt.setString(1, cg_code);
				   
				   ResultSet rs = pstmt.executeQuery();
				   
				   if(rs.next())
					   result = rs.getInt("GROUP_POINT");
				   
				   rs.close();
				   pstmt.close();
				   
			} catch (Exception e)
			{
				System.out.println(e.toString());
			}
			   
		   return result;
	   }
	   
	   
	   // 그룹 포지션 받는 메소드
	   public ArrayList<GroupMemberDTO> groupPosition(String cg_code)
	   {
		   ArrayList<GroupMemberDTO> postitionList = new ArrayList<GroupMemberDTO>();
		   String sql = "";
		   
		   try
		   {
			   sql = "SELECT P.POS_NAME AS POS_NAME, M.GM_NICKNAME AS GM_NICKNAME"
			   		+ " FROM POSITION_APPOINT A JOIN POSITION P ON A.POS_CODE = P.POS_CODE"
			   		+ " JOIN GROUP_MEMBER M ON A.GM_CODE1 = M.GM_CODE JOIN GROUP_INVITE I ON M.GI_CODE = I.GI_CODE"
			   		+ " WHERE I.CG_CODE = ? AND P.POS_CODE IN (1,2)";
			   
			   PreparedStatement pstmt = conn.prepareStatement(sql);
			   pstmt.setString(1, cg_code);
			   ResultSet rs = pstmt.executeQuery();
			   
			   while (rs.next())
			   {
				   GroupMemberDTO dto = new GroupMemberDTO();
				   dto.setPos_name(rs.getString("POS_NAME"));
				   dto.setGm_nickname(rs.getString("GM_NICKNAME"));
				   
				   postitionList.add(dto);
			   }
			  
			   rs.close();
			   pstmt.close();
			   
		   } catch (Exception e)
		   {
			   System.out.println(e.toString());
		   }

		   return postitionList;
	   }
	   
	   
	   // 그룹 모임 날짜 받는 메소드 (사이드 캘린더)
	   public ArrayList<MeetingDTO> Groupmetting(String cg_code)
	   {
		   ArrayList<MeetingDTO> result = new ArrayList<MeetingDTO>(); 
		   
		   try
		   {	
			   String sql = "SELECT MT_MEET, MT_TITLE, MT_ETC, CT_NAME, RG_NAME, MC_NAME FROM GROUP_MEETINGLIST_VIEW WHERE CG_CODE = ?";
			   PreparedStatement pstmt = conn.prepareStatement(sql);
			   pstmt.setInt(1, Integer.parseInt(cg_code));
			   
			   //System.out.println("들어옴");
			   
			   ResultSet rs = pstmt.executeQuery();
			   while (rs.next())
			   {
				   MeetingDTO dto = new MeetingDTO();
				   
				   //System.out.println("들어옴2");

				   dto.setMt_meet(rs.getString("MT_MEET"));
				   dto.setMt_title(rs.getString("MT_TITLE"));
				   dto.setMt_etc(rs.getString("MT_ETC"));
				   dto.setCt_name(rs.getString("CT_NAME"));
				   dto.setMc_name(rs.getString("MC_NAME"));
				   dto.setRg_name(rs.getString("RG_NAME"));
				  // System.out.println(dto.getMt_meet());
				  // System.out.println(dto.getMt_title());
				  // System.out.println(dto.getMt_etc());
				  // System.out.println(dto.getCt_name());
				   
				   result.add(dto);
			   }

			   //System.out.println("나옴");
			   
			   
		   } catch (Exception e)
		   {
			   System.out.println(e.toString());
		   }
		   
		  // System.out.println("나옴2");
		   
		   return result;
	   }
	   
	   // 내가 참석하는 그룹 모임 날짜를 받는 메소드 (마이페이지 캘린더)
	   public ArrayList<MeetingDTO> myMetting(String gm_code)
	   {
		   ArrayList<MeetingDTO> result = new ArrayList<MeetingDTO>();
		   
		   try
		   {
			   String sql = "SELECT MT_MEET, MT_TITLE, MT_ETC, CT_NAME, RG_NAME, MC_NAME FROM GROUP_MYMEETING_VIEW WHERE GM_CODE = ?";
			   PreparedStatement pstmt = conn.prepareStatement(sql);
			   pstmt.setInt(1, Integer.parseInt(gm_code));
			   
			   System.out.println(gm_code);
			   
			   ResultSet rs = pstmt.executeQuery();
			   while (rs.next())
			   {
				   MeetingDTO dto = new MeetingDTO();
				   dto.setMt_meet(rs.getString("MT_MEET"));
				   dto.setMt_title(rs.getString("MT_TITLE"));
				   dto.setMt_etc(rs.getString("MT_ETC"));
				   dto.setCt_name(rs.getString("CT_NAME"));
				   dto.setMc_name(rs.getString("MC_NAME"));
				   dto.setRg_name(rs.getString("RG_NAME"));
				   
				   result.add(dto);
			   }
			   
		   } catch (Exception e)
		   {
			   System.out.println(e.toString());
		   }
		   
		   return result;
	   }
	   
	   // 직위 여부 확인
	   public int positionCount(String gm_code)
	   {
		   int result = 0;
		  
		   try
		   {
			   String sql = "SELECT COUNT(*) AS COUNT FROM FRIENDS FR, GROUP_INVITE GI, GROUP_MEMBER GM, POSITION_APPOINT PA"
			   		+ " WHERE FR.FR_CODE = GI.GI_CODE AND GI.GI_CODE = GM.GI_CODE AND"
			   		+ " GM.GM_CODE = PA.GM_CODE2 AND GM.GM_CODE = ?";
			   PreparedStatement pstmt = conn.prepareStatement(sql);
			   pstmt.setInt(1, Integer.parseInt(gm_code));
			   
			   ResultSet rs = pstmt.executeQuery();
			   if(rs.next())
				   result = rs.getInt("COUNT");
			   
			   rs.close();
			   pstmt.close();
			   
		   } catch (Exception e)
		   {
			   System.out.println(e.toString());
		   }
		   
		   return result;
	   }
	   
	   // 그룹 탈퇴 
	   public int groupWthdr(String gm_code)
	   {
		   int result = 0;
		   
		   try
		   {
			   String sql = "INSERT INTO GROUP_WTHDR (GW_CODE, GM_CODE, GW_DATE) VALUES (SEQ_GROUP_WTHDR.NEXTVAL, ?, SYSDATE)";
			   PreparedStatement pstmt = conn.prepareStatement(sql);
			   pstmt.setInt(1, Integer.parseInt(gm_code));
			   
			   result = pstmt.executeUpdate();
			   pstmt.close();
			   
		   } catch (Exception e)
		   {
			   System.out.println(e.toString());
		   }
		   return result;
	   }
	   
	  
}
