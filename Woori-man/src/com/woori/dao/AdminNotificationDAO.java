
package com.woori.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.test.mvc.AdminNotificationDTO;
import com.woori.dto.AdminDTO;
import com.woori.util.DBConn;





public class AdminNotificationDAO 
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
	
	
	// 공지사항 리스트 메소드
		public ArrayList<AdminNotificationDTO> noticeList() throws SQLException
		{
			ArrayList<AdminNotificationDTO> result = new ArrayList<AdminNotificationDTO>();		
			
			String sql = "SELECT NF_CODE, NF_TITLE, NF_DATE FROM NOTIFICATION";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next())
			{
				AdminNotificationDTO dto = new AdminNotificationDTO();
				
				dto.setNf_code(rs.getString("NF_CODE"));
				dto.setNf_title(rs.getString("NF_TITLE"));
				dto.setNf_date(rs.getString("NF_DATE"));
			
				result.add(dto);
			}
			
			rs.close();
			pstmt.close();
			
			return result;
		}
		
		
		
		// 공지사항 입력을 위한 DAO 
		// 첨부파일 유무에 따라 NOTIFICATION 테이블과 NOTIFICATION_ATTACH 테이블에
		// 나눠서 INSERT 되어야 하므로 PROCEDURE 를 사용였기 때문에
		// CallableStatment 사용.
		//-- (제목, 내용, 작성자 번호, 파일명)
		public int addNotice(AdminNotificationDTO dto) throws SQLException
		{
			int result = 0;

			String sql = "{call PRC_NOTIFICATION_INSERT(?, ?, ?, ?)}";
			CallableStatement cstmt = conn.prepareCall(sql);
			
			cstmt.setString(1, dto.getNf_title());
			cstmt.setString(2, dto.getNf_content());
			cstmt.setString(3, dto.getAd_code());
			cstmt.setString(4, dto.getNa_name());
			
			result = cstmt.executeUpdate();
			
			cstmt.close();
			
			return result;
		}
		
		
		public AdminNotificationDTO searchNotice(String nf_code) throws SQLException
		{
			AdminNotificationDTO ad = new AdminNotificationDTO();
			
			
			String sql = "SELECT NF_CODE, NF_TITLE, NF_CONTENT, NF_DATE, AD_CODE, NA_CODE, NA_NAME FROM NOTIFICATION_VIEW WHERE NF_CODE = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, nf_code);
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next())
			{
				ad.setNf_code(rs.getString("NF_CODE"));
				ad.setNf_title(rs.getString("NF_TITLE"));
				ad.setNf_content(rs.getString("NF_CONTENT"));
				ad.setNf_date(rs.getString("NF_DATE"));
				ad.setAd_code(rs.getString("AD_CODE"));
				ad.setNa_code(rs.getString("NA_CODE"));
				ad.setNa_name(rs.getString("NA_NAME"));
			}
			
			return ad;
		}
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
