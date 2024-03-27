/*====================
	AdminDAO.java 
====================*/
  
package com.woori.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.woori.dto.InquiryDTO;
import com.woori.util.DBConn;



public class AdminInquiryDAO
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
	
	// 문의사항 카테고리 출력 메소드
	public ArrayList<InquiryDTO> inquiryCategory() throws SQLException
	{
		ArrayList<InquiryDTO> result = new ArrayList<InquiryDTO>();
		
		String sql = "SELECT IQC_CODE, IQC_NAME FROM INQUIRY_CATEGORY";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		ResultSet rs = pstmt.executeQuery();
		
		InquiryDTO dto = null;
		
		while(rs.next())
		{
			dto = new InquiryDTO();
						
			dto.setIqc_code(rs.getString("IQC_CODE"));
			dto.setIqc_name(rs.getString("IQC_NAME"));
			
			result.add(dto);
		}
		
		rs.close();
		pstmt.close();				
		
		return result;
	}
	
	// 문의사항 리스트 출력 메소드
	public ArrayList<InquiryDTO> inquiryList() throws SQLException
	{
		ArrayList<InquiryDTO> result = new ArrayList<InquiryDTO>();
		
		String sql = "SELECT IQ_CODE, IQC_CODE, IQC_NAME, IQ_TITLE, US_ID, IQ_DATE, AD_CODE, IQ_STATUS"
				+ " FROM ADMIN_INQUIRY_VIEW ORDER BY IQ_DATE DESC";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		ResultSet rs = pstmt.executeQuery();
		
		InquiryDTO dto = null;
		
		while(rs.next())
		{
			dto = new InquiryDTO();
						
			dto.setIq_code(rs.getString("IQ_CODE"));
			dto.setIqc_code(rs.getString("IQC_CODE"));
			dto.setIqc_name(rs.getString("IQC_NAME"));
			dto.setIq_title(rs.getString("IQ_TITLE"));
			dto.setUs_id(rs.getString("US_ID"));
			dto.setIq_date(rs.getString("IQ_DATE"));
			dto.setAd_code(rs.getString("AD_CODE"));
			dto.setIq_status(rs.getString("IQ_STATUS"));
			
			result.add(dto);
		}
		
		rs.close();
		pstmt.close();				
		
		return result;
	}
		
	
	// 문의사항 리스트(접수완료/검토중/처리완료 상태별 분기)
	public ArrayList<InquiryDTO> inquiryList(String iq_status) throws SQLException
	{
		ArrayList<InquiryDTO> result = new ArrayList<InquiryDTO>();
		
		String sql = "SELECT IQ_CODE, IQC_CODE, IQC_NAME, IQ_TITLE, US_ID, IQ_DATE, AD_CODE, IQ_STATUS"
				+ " FROM ADMIN_INQUIRY_VIEW WHERE IQ_STATUS = ? ORDER BY IQ_DATE DESC";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, iq_status);
		
		ResultSet rs = pstmt.executeQuery();
		
		InquiryDTO dto = null;
		
		while(rs.next())
		{
			dto = new InquiryDTO();
						
			dto.setIq_code(rs.getString("IQ_CODE"));
			dto.setIqc_code(rs.getString("IQC_CODE"));
			dto.setIqc_name(rs.getString("IQC_NAME"));
			dto.setIq_title(rs.getString("IQ_TITLE"));
			dto.setUs_id(rs.getString("US_ID"));
			dto.setIq_date(rs.getString("IQ_DATE"));
			dto.setAd_code(rs.getString("AD_CODE"));
			dto.setIq_status(rs.getString("IQ_STATUS"));
			
			result.add(dto);
		}
		
		rs.close();
		pstmt.close();				
		
		return result;
	}
	
	// 문의사항 리스트(카테고리별 분기)
	public ArrayList<InquiryDTO> inquiryList2(String category) throws SQLException
	{
		ArrayList<InquiryDTO> result = new ArrayList<InquiryDTO>();
		
		String sql = "SELECT IQ_CODE, IQC_CODE, IQC_NAME, IQ_TITLE, US_ID, IQ_DATE, AD_CODE, IQ_STATUS"
				+ " FROM ADMIN_INQUIRY_VIEW WHERE IQC_CODE = ? ORDER BY IQ_DATE DESC";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, category);
		
		ResultSet rs = pstmt.executeQuery();
		
		InquiryDTO dto = null;
		
		while(rs.next())
		{
			dto = new InquiryDTO();
						
			dto.setIq_code(rs.getString("IQ_CODE"));
			dto.setIqc_code(rs.getString("IQC_CODE"));
			dto.setIqc_name(rs.getString("IQC_NAME"));
			dto.setIq_title(rs.getString("IQ_TITLE"));
			dto.setUs_id(rs.getString("US_ID"));
			dto.setIq_date(rs.getString("IQ_DATE"));
			dto.setAd_code(rs.getString("AD_CODE"));
			dto.setIq_status(rs.getString("IQ_STATUS"));
			
			result.add(dto);
		}
		
		rs.close();
		pstmt.close();				
		
		return result;
	}
	
	 
	// 문의사항 갯수
	public int inquiryCount() throws SQLException 
	{
		int result = 0;
		
		String sql = "SELECT COUNT(*) AS COUNT FROM ADMIN_INQUIRY_VIEW";
		
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
	
	// 문의사항 상태별 갯수
	public int inquiryCount(String status) throws SQLException 
	{
		int result = 0;
		
		String sql = "SELECT COUNT(*) AS COUNT FROM ADMIN_INQUIRY_VIEW WHERE IQ_STATUS = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, status);
		
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next())
		{
			result = rs.getInt("COUNT");
		}
		
		rs.close();
		pstmt.close();
		
		return result;
	}
	
	// 문의사항 카테고리별 갯수
	public int inquiryCount2(String category) throws SQLException 
	{
		int result = 0;
		
		String sql = "SELECT COUNT(*) AS COUNT FROM ADMIN_INQUIRY_VIEW WHERE IQC_CODE = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, category);
		
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next())
		{
			result = rs.getInt("COUNT");
		}
		
		rs.close();
		pstmt.close();
		
		return result;
	}
	
	// 문의사항 게시글 상세
	public InquiryDTO inquiryArticle(String iq_code) throws SQLException
	{
		InquiryDTO result = new InquiryDTO();
		
		String sql = "SELECT IQ_CODE, IQC_CODE, IQC_NAME, IQ_TITLE, US_ID, IQ_DATE, IQ_CONTENT, AS_CONTENT, AD_CODE, AS_DATE"
				+ " FROM ADMIN_INQUIRY_VIEW WHERE IQ_CODE = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, Integer.parseInt(iq_code));
		
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			result.setIq_code(rs.getString("IQ_CODE"));
			result.setIqc_code(rs.getString("IQC_CODE"));
			result.setIqc_name(rs.getString("IQC_NAME"));
			result.setIq_title(rs.getString("IQ_TITLE"));
			result.setUs_id(rs.getString("US_ID"));
			result.setIq_date(rs.getString("IQ_DATE"));
			result.setIq_content(rs.getString("IQ_CONTENT"));
			result.setAs_content(rs.getString("AS_CONTENT"));
			result.setAd_code(rs.getString("AD_CODE"));
			result.setAs_date(rs.getString("AS_DATE"));
		}
		
		rs.close();
		pstmt.close();				
		
		return result;
	}
	
	// 문의사항 첨부파일
	public InquiryDTO inquiryAttach(String iq_code) throws SQLException
	{
		InquiryDTO result = new InquiryDTO();
		
		String sql = "SELECT IQA_CODE, IQA_NAME FROM INQUIRY_ATTACH WHERE IQ_CODE = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, Integer.parseInt(iq_code));
		
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			result.setIqa_code(rs.getString("IQA_CODE"));
			result.setIqa_name(rs.getString("IQA_NAME"));			
		}
		
		rs.close();
		pstmt.close();				
		
		return result;
	}
	
	// 문의사항 게시글 상세 들어갔을 때 열람일, 담당자 업데이트
	public int inquiryUpdate(String ad_code, String iq_code) throws SQLException
	{
		int result = 0;
		
		String sql = "UPDATE INQUIRY SET IQ_READ = SYSDATE, AD_CODE = ? WHERE IQ_CODE = ?";
		
		//ad_code = "224726";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, Integer.parseInt(ad_code));
		pstmt.setInt(2, Integer.parseInt(iq_code));
				
		result = pstmt.executeUpdate();
		
		pstmt.close();				
		
		return result;
	}
	
	// 문의사항 게시글 상세 (답변) 입력
	public int inquiryAnswer(String iq_code, String as_content, String ad_code) throws SQLException
	{
		int result = 0;
		
		String sql = "INSERT INTO ANSWER(AS_CODE, AS_CONTENT, IQ_CODE, AD_CODE, AS_DATE)"
				+ " VALUES(SEQ_ANSWER.NEXTVAL, ?, ?, ?, SYSDATE)";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, as_content);
		pstmt.setInt(2, Integer.parseInt(iq_code));
		pstmt.setInt(3, Integer.parseInt(ad_code));
		
		result = pstmt.executeUpdate();
		
		pstmt.close();				
		
		return result;
			
	}
	
	
	
	
}
