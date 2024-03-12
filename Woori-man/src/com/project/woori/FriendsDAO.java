/*====================
	FriendsDAO.java
====================*/

package com.project.woori;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.test.mvc.DBConn;

public class FriendsDAO
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
	
	// 친구 페이지에서 내 프로필
	public FriendsDTO myProfile(String us_code) throws SQLException
	{
		FriendsDTO result = new FriendsDTO();
		
		String sql = "SELECT US_CODE, US_PROFILE, US_NAME, US_ID, US_SIGNUP"
				+ " FROM FRIENDS_MYPROFILE_VIEW"
				+ " WHERE US_CODE = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, Integer.parseInt(us_code));
		
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			result.setUs_code(rs.getString("US_CODE"));
			result.setUs_profile(rs.getString("US_PROFILE"));
			result.setUs_name(rs.getString("US_NAME"));
			result.setUs_id(rs.getString("US_ID"));
			result.setUs_signup(rs.getString("US_SIGNUP"));						
		}
		
		rs.close();
		pstmt.close();				
		
		return result;
	}
	
	// 친구 목록
	public ArrayList<FriendsDTO> list(String us_code1) throws SQLException
	{
		ArrayList<FriendsDTO> result = new ArrayList<FriendsDTO>();

		String sql = "SELECT FR_CODE, US_NAME, US_CODE2, US_ID, US_PROFILE FROM FRIENDS_LIST_VIEW WHERE US_CODE1 = ? AND US_CODE2 != ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, Integer.parseInt(us_code1));
		pstmt.setInt(2, Integer.parseInt(us_code1));
		
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
	public int count(String us_code1) throws SQLException 
	{
		int result = 0;
		
		String sql = "SELECT COUNT(*) AS COUNT FROM FRIENDS_LIST_VIEW WHERE US_CODE1 = ? AND US_CODE2 != ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, Integer.parseInt(us_code1));
		pstmt.setInt(2, Integer.parseInt(us_code1));
		
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next())
		{
			result = rs.getInt("COUNT");
		}
		
		rs.close();
		pstmt.close();
		
		return result;
	}
	
	// 회원 검색
	public FriendsDTO userSearch(String type, String value) throws SQLException
	{
		FriendsDTO result = new FriendsDTO();
		
		String sql = "SELECT US_PROFILE, US_ID, US_CODE, US_NAME FROM USER_SEARCH_VIEW";
		
		if (type.equals("1"))
			sql += " WHERE US_ID = ?";
		else if (type.equals("2"))
			sql += " WHERE US_NAME = ?";
		else if (type.equals("3"))
			sql += " WHERE US_CODE = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);		
		pstmt.setString(1, value);
		
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next())
		{
			result.setUs_profile(rs.getString("US_PROFILE"));
			result.setUs_id(rs.getString("US_ID"));
			result.setUs_code2(rs.getString("US_CODE"));
			result.setUs_name(rs.getString("US_NAME"));
		}
		
		return result;
		
	}
	
	// 회원 검색 했을 때 이미 친구인지 아닌지 판별하는 메소드(쿼리문 결과값이 1이면 친구추가 불가능, 0 이면 가능)
	public int friendCheck(String us_code1, String us_code2) throws SQLException
	{
		int result = 0;
		
		String sql = "SELECT COUNT(*) AS COUNT FROM FRIENDS WHERE US_CODE1 = ?"
				+ " AND US_CODE2 = ? AND FR_CODE NOT IN (SELECT FR_CODE FROM FRIEND_DELETE)";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, Integer.parseInt(us_code1));
		pstmt.setInt(2, Integer.parseInt(us_code2));		
		
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next())
		{
			result = rs.getInt("COUNT");
		}
		
		rs.close();
		pstmt.close();
		
		return result;
	}
	
	// 친구 추가
	public int friendAdd(FriendsDTO dto) throws SQLException
	{
		int result = 0;
		
		String sql = "{call PRC_FRIEND_INSERT(?, ?)}";
		
		CallableStatement cstmt = conn.prepareCall(sql);
		cstmt.setString(1, dto.getUs_code1());		
		cstmt.setString(2, dto.getUs_code2());
		
		result = cstmt.executeUpdate();
		
		return result;
		
	}
	
	// 친구 삭제
	public int friendDelete(String fr_code) throws SQLException
	{
		int result = 0;
		
		String sql = "INSERT INTO FRIEND_DELETE(FD_CODE, FR_CODE, FD_DATE)"
				+ " VALUES(SEQ_FRIEND_DELETE.NEXTVAL, ?, SYSDATE)";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, Integer.parseInt(fr_code));		
		
		result = pstmt.executeUpdate();
		
		return result;
		
	}
	
	// 친구 쪽지 보내기
	public int friendNote(NoteDTO dto) throws SQLException
	{
		int result = 0;
		
		String sql = "INSERT INTO NOTE(NOTE_CODE, NOTE_TITLE, NOTE_CONTENT, FR_CODE, NOTE_SEND)"
				+ " VALUES(SEQ_NOTE.NEXTVAL, ?, ?, ?, SYSDATE)";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);		
		pstmt.setString(1, dto.getNote_title());
		pstmt.setString(2, dto.getNote_content());
		pstmt.setString(3, dto.getFr_code());		
		
		result = pstmt.executeUpdate();
		
		return result;
		
	}
	
	
	
	
}
