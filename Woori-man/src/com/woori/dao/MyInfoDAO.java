package com.woori.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.test.util.DBConn;
import com.woori.dto.GroupMemberDTO;
import com.woori.dto.UserDTO;

public class MyInfoDAO
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
	
	// 그룹 정보 수정 메소드
	public int modifyGroupProfile(GroupMemberDTO dto) 
	{
		int result = 0;
		String sql = "";
		
		System.out.println(dto.getGm_nickname());
		System.out.println(dto.getGm_intro());
		System.out.println(dto.getGm_code());
		System.out.println(dto.getGm_profile());
		
		try
		{
			if (dto.getGm_profile().equals(""))
			{
				System.out.println("널");
				sql = "{call PRC_GROUP_MEMBER_UPDATE(?,NULL,?,?)}";
				CallableStatement cstmt = conn.prepareCall(sql);
				System.out.println("프로시저 지나가요~~~");
				
				cstmt.setString(1, dto.getGm_nickname());
				cstmt.setString(2, dto.getGm_intro());
				cstmt.setInt(3, Integer.parseInt(dto.getGm_code()));
				
				System.out.println("셋 했어요 지나가요~~~");
				
				result = cstmt.executeUpdate();
				
				System.out.println(result);
				
				cstmt.close();
			}
			else 
			{
				//System.out.println("낫널");
				sql = "{call PRC_GROUP_MEMBER_UPDATE(?,?,?,?)}";
				CallableStatement cstmt = conn.prepareCall(sql);
				
				cstmt.setString(1, dto.getGm_nickname());
				cstmt.setString(2, dto.getGm_profile());
				cstmt.setString(3, dto.getGm_intro());
				cstmt.setInt(4, Integer.parseInt(dto.getGm_code()));
				
				result = cstmt.executeUpdate();
				cstmt.close();
			}
			
			System.out.println("if문 나왔어용");
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		System.out.println("try 나왔어요");
		
		return result;
		
	}
	
	// 계정 정보 수정 메소드
	public int modifyUserProfile(UserDTO dto)
	{
		int result = 0;
		
		try
		{
			if(dto.getUs_profile().equals(""))
			{
				String sql = "UPDATE USER_INFO SET US_ZIPCODE = ? , US_ADDR1 = ?"
						+ ", US_ADDR2 = ? , US_PROFILE = NULL "
						+ ", US_TEL = ? WHERE US_CODE = ?";
				
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, dto.getUs_zipcode());
				pstmt.setString(2, dto.getUs_addr());
				pstmt.setString(3, dto.getUs_addr2());
				pstmt.setString(4, dto.getUs_tel());
				pstmt.setInt(5, Integer.parseInt(dto.getUs_code()));
				
				result = pstmt.executeUpdate();
				
				pstmt.close();
			}
			else 
			{
				String sql = "UPDATE USER_INFO SET US_ZIPCODE = ? , US_ADDR1 = ?"
						+ ", US_ADDR2 = ? , US_PROFILE = ? "
						+ ", US_TEL = ? WHERE US_CODE = ?";
			
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, dto.getUs_zipcode());
				pstmt.setString(2, dto.getUs_addr());
				pstmt.setString(3, dto.getUs_addr2());
				pstmt.setString(4, dto.getUs_profile());
				pstmt.setString(5, dto.getUs_tel());
				pstmt.setInt(6, Integer.parseInt(dto.getUs_code()));
				
				result = pstmt.executeUpdate();
				
				pstmt.close();
			}
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
	}
	
	
}	
