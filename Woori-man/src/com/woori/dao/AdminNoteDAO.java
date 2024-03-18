/*======================
	AdminNoteDAO.java
======================*/

package com.woori.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.woori.dto.AdminNoteDTO;
import com.woori.util.DBConn;



public class AdminNoteDAO
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
	
	
	// 관리자 쪽지 내역
	public ArrayList<AdminNoteDTO> adminNote() throws SQLException
	{
		ArrayList<AdminNoteDTO> result = new ArrayList<AdminNoteDTO>();
		
		String sql = "SELECT AN_CODE, AN_TITLE, AD_CODE, TO_CHAR(AN_SEND, 'YYYY-MM-DD') AS AN_SEND"
				+ " FROM ADMIN_NOTE ORDER BY AN_SEND DESC";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next())
		{
			AdminNoteDTO dto = new AdminNoteDTO();
			
			dto.setAn_code(rs.getString("AN_CODE"));
			dto.setAn_title(rs.getString("AN_TITLE"));
			dto.setAd_code(rs.getString("AD_CODE"));
			dto.setAn_send(rs.getString("AN_SEND"));
			
			result.add(dto);
		}
				
		
		rs.close();
		pstmt.close();
		
		return result;
	}
	
	// 관리자 쪽지 갯수
	public int count() throws SQLException 
	{
		int result = 0;
		
		String sql = "SELECT COUNT(*) AS COUNT FROM ADMIN_NOTE";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next())
		{
			result = rs.getInt("COUNT");
		}
		
		rs.close();
		pstmt.close();
		
		return result;
	}
	
	// 관리자 쪽지 작성
	public int adminNoteWrite(AdminNoteDTO dto) throws SQLException
	{
		int result = 0;
		
		String sql = "{call PRC_ADMIN_NOTE(?, ?, ?)}";
		
		CallableStatement cstmt = conn.prepareCall(sql);
		cstmt.setString(1, dto.getAn_title());
		cstmt.setString(2, dto.getAn_content());
		cstmt.setString(3, dto.getAd_code());
		
		result = cstmt.executeUpdate();
		
		cstmt.close();
		
		
		return result;
		
	}
	
	// 관리자 쪽지 상세
	public AdminNoteDTO adminNoteArticle(String an_code) throws SQLException
	{
		AdminNoteDTO result = new AdminNoteDTO();
		
		String sql = "SELECT AN_CODE, AN_TITLE, AN_CONTENT FROM ADMIN_NOTE WHERE AN_CODE = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, Integer.parseInt(an_code));
		
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next())
		{
			result.setAn_code(rs.getString("AN_CODE"));
			result.setAn_title(rs.getString("AN_TITLE"));
			result.setAn_content(rs.getString("AN_CONTENT"));
		}
		
		rs.close();
		pstmt.close();
		
		return result;
	}
	
	
}
