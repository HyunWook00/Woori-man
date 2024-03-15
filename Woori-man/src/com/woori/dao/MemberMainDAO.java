
package com.woori.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.woori.dto.FriendsDTO;
import com.woori.dto.GroupDTO;
import com.woori.dto.GroupMemberDTO;
import com.woori.dto.MeetingDTO;
import com.woori.util.DBConn;

public class MemberMainDAO 
{
	
	private Connection conn;
	
	// 데이터베이스 연결
	public void connection() throws ClassNotFoundException, SQLException
	{
		conn = DBConn.getConnection();
	}
	
	// 데이터베이스 연결 해제
	public void close() throws SQLException
	{
		DBConn.close();
	}
	
	// 아이디 중복 체크 여부 확인 메소드
	public int checkId(String us_id) throws SQLException
	{
		int result = 0;
		
		String sql = "SELECT COUNT(US_ID) AS COUNT FROM USERS WHERE US_ID = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, us_id);
		
		ResultSet rs = pstmt.executeQuery();
		while (rs.next())
			result = rs.getInt("COUNT");
		
		rs.close();
		pstmt.close();
		
		return result;
	}
	
	


	// 그룹 개설을 위한 메소드
	public int createGroup(GroupDTO group) throws SQLException
	{
		int result = 0;
		
		
		String sql = "{call PRC_CREATE_GROUP(?, ?, ?, ?, ?, ?)}";
		
		CallableStatement cstmt = conn.prepareCall(sql);
		
		cstmt.setString(1, group.getCg_name());
		cstmt.setString(2, group.getGc_code());
		cstmt.setString(3, group.getCg_intro());
		cstmt.setString(4, group.getBrd_name());
		cstmt.setString(5, group.getCg_profile());
		cstmt.setString(6, group.getUs_code());
		
		result = cstmt.executeUpdate();
		
		cstmt.close();
		
		return result;
	}
	
	// 그룹 정보 수정 메소드
	public int updateGroupInfo(GroupDTO dto) throws SQLException
	{
		int result = 0;

		String sql = "UPDATE CREATE_GROUP SET CG_INTRO = ?, BRD_NAME = ?, CG_PROFILE = ? WHERE CG_CODE = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, dto.getCg_intro());
		pstmt.setString(2, dto.getBrd_name());
		pstmt.setString(3, dto.getCg_profile());
		pstmt.setString(4, dto.getCg_code());
		
		result = pstmt.executeUpdate();
		
		pstmt.close();
		
		return result;
	}
	
	
	// 그룹 수정을 위해 이전 정보 불러오는 메소드
	public GroupDTO searchGroup(String cg_code) throws SQLException
	{
		GroupDTO result = new GroupDTO();
		
		String sql = "SELECT CG_NAME, GC_CODE, CG_INTRO, BRD_NAME, 	NVL(CG_PROFILE, '기본프로필') AS CG_PROFILE"
				+ " FROM CREATE_GROUP WHERE CG_CODE = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, cg_code);
		
		ResultSet rs = pstmt.executeQuery();
		while (rs.next())
		{
			result.setCg_name(rs.getString("CG_NAME"));
			result.setGc_code(rs.getString("GC_CODE"));
			result.setCg_intro(rs.getString("CG_INTRO"));
			result.setBrd_name(rs.getString("BRD_NAME"));
			result.setCg_profile(rs.getString("CG_PROFILE"));
		}
		
		rs.close();
		pstmt.close();
		
		return result;	
	}
	
	
	
	
	
	
	


	
	// 선택한 내 그룹에 진입할 때 GroupDTO 를 구성하여 세션으로 넘기기
	public GroupDTO groupInfo(String us_code, String cg_code) throws SQLException
	{
		GroupDTO result = new GroupDTO();
		
		String sql = "SELECT MGV.CG_CODE, MGV.GI_CODE, MGV.CG_INTRO, MGV.CG_PROFILE, MGV.CG_NAME, MGV.CG_DATE, MGV.BRD_NAME"
				+ ", (SELECT COUNT(MGV2.CG_CODE) FROM MY_GROUP_VIEW MGV2 WHERE MGV2.CG_CODE = MGV.CG_CODE) AS GM_COUNT"
				+ " FROM MY_GROUP_VIEW MGV WHERE US_CODE2 = ? AND CG_CODE = ?";
		
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
			
		}
		
		rs.close();
		pstmt.close();
		
		return result;
	}

	// 선택한 내 그룹에 진입할 때 해당 그룹의 그룹원들 정보GroupMemberDTO 를 구성하여 세션으로 넘기기
	public ArrayList<GroupMemberDTO>  groupMemberInfo(String cg_code) throws SQLException
	{
		ArrayList<GroupMemberDTO> result = new ArrayList<GroupMemberDTO>();
		
		String sql = "SELECT CG_CODE, GM_CODE, GM_NICKNAME, GM_PROFILE, GM_INTRO, GM_REGDATE, POS_CODE, POS_NAME"
				+ " FROM GROUP_MEMBER_VIEW WHERE CG_CODE = ?";
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
			
			result.add(dto);
		}
		
		rs.close();
		pstmt.close();
		
		return result;
	}
		
		
		

	

	// 친구 찾기 
	public ArrayList<FriendsDTO> findFriends(String us_code, String shearchValue) throws SQLException
	{
		ArrayList<FriendsDTO> result = new ArrayList<FriendsDTO>();
		
		String sql = "SELECT US_CODE, US_ID, US_NAME "
				+ " FROM USER_VIEW WHERE US_CODE = ? OR US_ID = ? OR US_NAME = ?"
				+ " AND US_CODE NOT IN (SELECT US_CODE2 FROM FRIENDS_LIST_VIEW WHERE US_CODE1 = ? AND US_CODE2 != ?)"
				+ " AND US_CODE != ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		if (!shearchValue.matches("[+-]?\\d*(\\.\\d+)?"))
		{
			String val = "0";
			pstmt.setString(1, val);
			pstmt.setString(2, shearchValue);
			pstmt.setString(3, shearchValue);
			pstmt.setString(4, us_code);
			pstmt.setString(5, us_code);
			pstmt.setString(6, us_code);
		}
		else
		{
			pstmt.setString(1, shearchValue);
			pstmt.setString(2, shearchValue);
			pstmt.setString(3, shearchValue);
			pstmt.setString(4, us_code);
			pstmt.setString(5, us_code);
			pstmt.setString(6, us_code);
		}
		
		
		ResultSet rs = pstmt.executeQuery();
		while (rs.next())
		{
			FriendsDTO dto = new FriendsDTO();
			dto.setUs_code(rs.getString("US_CODE"));
			dto.setUs_id(rs.getString("US_ID"));
			dto.setUs_name(rs.getString("US_NAME"));
			
			result.add(dto);
		}
		
		rs.close();
		pstmt.close();
		
		return result;
	}
	
	
	// 자신이 참여의사를 밝힌 모임 찾기
		public ArrayList<MeetingDTO> findMeeting(String us_code) throws SQLException
		{
			ArrayList<MeetingDTO> result =  new ArrayList<MeetingDTO>();
			
			String sql = "SELECT AO_CODE, MT_CODE, GM_CODE, TO_CHAR(AO_DATE, 'YYYY-MM-DD'), AOC_CODE,MT_TITLE, CT_CODE, CG_CODE, TO_CHAR(MT_MEET, 'YYYY-MM-DD')"
					+ ", MT_ETC, MC_NAME, CG_NAME FROM MEETING_CHECK_VIEW WHERE US_CODE = ? AND AOC_CODE = 1";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, us_code);
			
			ResultSet rs = pstmt.executeQuery();
			while (rs.next())
			{
				MeetingDTO dto = new MeetingDTO();
				
				dto.setAo_code(rs.getString(1));
				dto.setMt_code(rs.getString(2));
				dto.setGm_code(rs.getString(3));
				dto.setAo_date(rs.getString(4));
				dto.setAoc_code(rs.getString(5));
				dto.setMt_title(rs.getString(6));
				dto.setCt_code(rs.getString(7));
				dto.setCg_code(rs.getString(8));
				dto.setMt_meet(rs.getString(9));
				dto.setMt_etc(rs.getString(10));
				dto.setMc_name(rs.getString(11));
				dto.setCg_name(rs.getString(12));
				result.add(dto);
			}
				
			rs.close();
			pstmt.close();
			
			return result;
		}
	
	
	// 즐겨찾기 insert 메소드
	public int addBookMark(String gm_code) throws SQLException
	{
		int result = 0;
		
		String sql = "INSERT INTO GROUP_BOOKMARK(GB_CODE, GM_CODE, GB_DATE) VALUES(SEQ_GROUP_BOOKMARK.NEXTVAL, ?, SYSDATE)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, gm_code);
		
		result = pstmt.executeUpdate();
		
		pstmt.close();

		return result;
	}
	
	
	// 즐겨찾기 delete 메소드
	public int deleteBookMark(String gb_code) throws SQLException
	{
		int result = 0;
		
		String sql = "DELETE FROM GROUP_BOOKMARK WHERE GB_CODE = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, gb_code);
		
		result = pstmt.executeUpdate();
		
		pstmt.close();

		return result;
	}
	
	
	


	
	




	

	
	
	
}
