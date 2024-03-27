package com.woori.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.woori.util.DBConn;

public class AdminMainDAO
{
	private Connection conn;
	
	public AdminMainDAO()
	{
		conn = DBConn.getConnection();
	}
	
	// 플랫폼 회원가입 추이 조회
	public ArrayList<String> userCount()
	{
		ArrayList<String> result = new ArrayList<String>();
		
		try
		{
			String sql = "SELECT NVL((SELECT COUNT(*) FROM USERS WHERE TRUNC(US_SIGNUP) = TRUNC(SYSDATE)),0) AS NUM1"
					+ ", NVL((SELECT COUNT(*) FROM USERS WHERE TRUNC(US_SIGNUP) = TRUNC(SYSDATE-1)),0) AS NUM2"
					+ ", NVL((SELECT COUNT(*) FROM USERS WHERE TRUNC(US_SIGNUP) = TRUNC(SYSDATE-2)),0) AS NUM3"
					+ ", NVL((SELECT COUNT(*) FROM USERS WHERE TRUNC(US_SIGNUP) = TRUNC(SYSDATE-3)),0) AS NUM4"
					+ ", NVL((SELECT COUNT(*) FROM USERS WHERE TRUNC(US_SIGNUP) = TRUNC(SYSDATE-4)),0) AS NUM5"
					+ ", NVL((SELECT COUNT(*) FROM USERS WHERE TRUNC(US_SIGNUP) = TRUNC(SYSDATE-5)),0) AS NUM6"
					+ " FROM USERS";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next())
			{
				result.add(rs.getString("NUM1"));
				result.add(rs.getString("NUM2"));
				result.add(rs.getString("NUM3"));
				result.add(rs.getString("NUM4"));
				result.add(rs.getString("NUM5"));
				result.add(rs.getString("NUM6"));
			}
			rs.close();
			pstmt.close();
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
	}
	
	// 플랫폼 회원 탈퇴 추이
	public ArrayList<String> userWthdr()
	{
		ArrayList<String> result = new ArrayList<String>();
		
		try
		{
			String sql = "SELECT NVL((SELECT COUNT(*) FROM USER_WTHDR WHERE TRUNC(UW_DATE) = TRUNC(SYSDATE)),0) AS NUM1"
					+ ", NVL((SELECT COUNT(*) FROM USER_WTHDR WHERE TRUNC(UW_DATE) = TRUNC(SYSDATE-1)),0) AS NUM2"
					+ ", NVL((SELECT COUNT(*) FROM USER_WTHDR WHERE TRUNC(UW_DATE) = TRUNC(SYSDATE-2)),0) AS NUM3"
					+ ", NVL((SELECT COUNT(*) FROM USER_WTHDR WHERE TRUNC(UW_DATE) = TRUNC(SYSDATE-3)),0) AS NUM4"
					+ ", NVL((SELECT COUNT(*) FROM USER_WTHDR WHERE TRUNC(UW_DATE) = TRUNC(SYSDATE-4)),0) AS NUM5"
					+ ", NVL((SELECT COUNT(*) FROM USER_WTHDR WHERE TRUNC(UW_DATE) = TRUNC(SYSDATE-5)),0) AS NUM6"
					+ " FROM USER_WTHDR";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next())
			{
				result.add(rs.getString("NUM1"));
				result.add(rs.getString("NUM2"));
				result.add(rs.getString("NUM3"));
				result.add(rs.getString("NUM4"));
				result.add(rs.getString("NUM5"));
				result.add(rs.getString("NUM6"));
			}
			rs.close();
			pstmt.close();
			System.out.println("dao size : " + result.size());
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
	}
	
	public void close()
	{
		DBConn.close();
	}
}
