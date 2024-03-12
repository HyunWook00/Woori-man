
package com.woori.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.woori.util.DBConn;



public class AdminLoginDAO 
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
	
	// 관리자 로그인 
	public int checkAdmin(String ad_code, String ad_pwd) throws SQLException
	{
		int result = 0;
		
		String sql = "SELECT COUNT(*) AS COUNT FROM ADMIN WHERE AD_CODE = ? AND AD_PWD = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, ad_code);
		pstmt.setString(2, ad_pwd);
		
		ResultSet rs = pstmt.executeQuery();
		while (rs.next())
		{
			result = rs.getInt("COUNT");
		}
			
		
		rs.close();
		pstmt.close();
		
		return result;
	}
	
	// 초기 생년월일로 설정된 비밀번호 변경을 위한 해당 관리자 조회
	public int pwdInfo(String ad_code) throws SQLException
	{
		int result = 0;
		
		String sql = "SELECT COUNT(*) AS COUNT FROM ADMIN_VIEW WHERE AD_PWD = AD_SSN1 AND AD_CODE = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, ad_code);
		
		ResultSet rs = pstmt.executeQuery();
		while (rs.next())
			result = rs.getInt("COUNT");
		
		
		rs.close();
		pstmt.close();
		
		return result;
	}
	
	
	
	// 관리자 비밀번호 변경
	public int updatePwd(String ad_pwd, String ad_code) throws SQLException
	{
		int result = 0;
		
		String sql = "UPDATE ADMIN SET AD_PWD = ? WHERE AD_CODE = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, ad_pwd);
		pstmt.setString(2, ad_code);
		
		result = pstmt.executeUpdate();
		
		pstmt.close();
		
		return result;
	}
	
	
}
