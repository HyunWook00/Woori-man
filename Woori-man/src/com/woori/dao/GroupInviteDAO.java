/*====================
	GroupInviteDAO.java
====================*/

package com.woori.dao;

import com.woori.util.DBConn;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import com.woori.dto.FriendsDTO;
import com.woori.dto.GroupInviteDTO;


public class GroupInviteDAO
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
	
	// 친구 목록
	public ArrayList<FriendsDTO> list(String us_code, String cg_code) throws SQLException
	{
		ArrayList<FriendsDTO> result = new ArrayList<FriendsDTO>();

		String sql = "SELECT F.FR_CODE AS FR_CODE, F.US_CODE2 AS US_CODE2, UI.US_NAME AS US_NAME"
				+ ", U.US_ID AS US_ID, UI.US_PROFILE AS US_PROFILE FROM FRIENDS F LEFT JOIN USER_INFO UI ON F.US_CODE2 = UI.US_CODE"
				+ " LEFT JOIN (SELECT * FROM FRIENDS F LEFT JOIN USER_INFO UI ON F.US_CODE2 = UI.US_CODE"
				+ " WHERE F.US_CODE2 = ? AND F.FR_CODE NOT IN (SELECT FR_CODE FROM FRIEND_DELETE)) TEMP"
				+ " ON UI.US_CODE = TEMP.US_CODE2 LEFT JOIN USERS U ON F.US_CODE2 = U.US_CODE"
				+ " WHERE F.US_CODE1 = ? AND F.US_CODE2 != ? AND F.FR_CODE NOT IN (SELECT FR_CODE FROM FRIEND_DELETE)"
				+ " AND F.FR_CODE NOT IN (SELECT FR_CODE FROM GROUP_INVITE"
				+ " WHERE GI_CODE IN (SELECT GI_CODE FROM GROUP_MEMBER WHERE GM_CODE NOT IN (SELECT GM_CODE FROM GROUP_WTHDR))"
				+ " AND RS_CODE = 1 OR RS_CODE IS NULL AND CG_CODE = ?)"; 
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, Integer.parseInt(us_code));
		pstmt.setInt(2, Integer.parseInt(us_code));
		pstmt.setInt(3, Integer.parseInt(us_code));
		pstmt.setInt(4, Integer.parseInt(cg_code));
		
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next())
		{
			FriendsDTO dto = new FriendsDTO();
			
			dto.setFr_code(rs.getString("FR_CODE"));
			dto.setUs_code2(rs.getString("US_CODE2"));
			dto.setUs_name(rs.getString("US_NAME"));
			dto.setUs_id(rs.getString("US_ID"));
			dto.setUs_profile(rs.getString("US_PROFILE"));
			
			result.add(dto);
		}
		
		rs.close();
		pstmt.close();
		
		return result;
	}
	
	// 친구 인원수
	public int count(String us_code, String cg_code) throws SQLException 
	{
		int result = 0;
		
		String sql = "SELECT COUNT(*) AS COUNT FROM FRIENDS F LEFT JOIN USER_INFO UI ON F.US_CODE2 = UI.US_CODE"
				+ " LEFT JOIN (SELECT * FROM FRIENDS F LEFT JOIN USER_INFO UI ON F.US_CODE2 = UI.US_CODE"
				+ " WHERE F.US_CODE2 = ? AND F.FR_CODE NOT IN (SELECT FR_CODE FROM FRIEND_DELETE)) TEMP"
				+ " ON UI.US_CODE = TEMP.US_CODE2 LEFT JOIN USERS U ON F.US_CODE2 = U.US_CODE"
				+ " WHERE F.US_CODE1 = ? AND F.US_CODE2 != ? AND F.FR_CODE NOT IN (SELECT FR_CODE FROM FRIEND_DELETE)"
				+ " AND F.FR_CODE NOT IN (SELECT FR_CODE FROM GROUP_INVITE"
				+ " WHERE GI_CODE IN (SELECT GI_CODE FROM GROUP_MEMBER WHERE GM_CODE NOT IN (SELECT GM_CODE FROM GROUP_WTHDR))"
				+ " AND RS_CODE = 1 OR RS_CODE IS NULL AND CG_CODE = ?)";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, Integer.parseInt(us_code));
		pstmt.setInt(2, Integer.parseInt(us_code));
		pstmt.setInt(3, Integer.parseInt(us_code));
		pstmt.setInt(4, Integer.parseInt(cg_code));
		
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next())
		{
			result = rs.getInt("COUNT");
		}
		
		rs.close();
		pstmt.close();
		
		return result;
	}
	
	
	
	// 그룹 초대 보내기
	public int GroupInvite(GroupInviteDTO dto) throws SQLException
	{
		int result = 0;
		
		String sql = "INSERT INTO GROUP_INVITE(GI_CODE, FR_CODE, CG_CODE, GI_REQUEST)"
				+ " VALUES(SEQ_GROUP_INVITE.NEXTVAL, ?, ?, SYSDATE)";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);		
		pstmt.setString(1, dto.getFr_code());
		pstmt.setString(2, dto.getCg_code());
		
		result = pstmt.executeUpdate();
		
		pstmt.close();
		
		return result;
		
	}
	
	
	
	
}
