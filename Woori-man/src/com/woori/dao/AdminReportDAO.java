/*=======================
	AdminReportDAO.java
=======================*/

package com.woori.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.woori.dto.ReportDTO;
import com.woori.util.DBConn;

public class AdminReportDAO
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
	
	// 신고내역 리스트(전체)
	public ArrayList<ReportDTO> adminReportList() throws SQLException
	{
		ArrayList<ReportDTO> result = new ArrayList<ReportDTO>();
		
		String sql = "SELECT REPORT_TYPE, REPORT_CODE, REPORT_TITLE, REPORT_DATE, US_CODE1, AD_CODE, REPORT_STATUS"
				+ " FROM ALL_REPORT_VIEW ORDER BY REPORT_DATE DESC";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next())
		{
			ReportDTO dto = new ReportDTO();
			
			dto.setReport_type(rs.getString("REPORT_TYPE"));
			dto.setReport_code(rs.getString("REPORT_CODE"));
			dto.setReport_title(rs.getString("REPORT_TITLE"));
			dto.setReport_date(rs.getString("REPORT_DATE"));
			dto.setUs_code1(rs.getString("US_CODE1"));
			dto.setAd_code(rs.getString("AD_CODE"));
			dto.setReport_status(rs.getString("REPORT_STATUS"));
			
			result.add(dto);
		}
		
		rs.close();
		pstmt.close();
		
		return result;
	}		
	
	// 그룹 신고 상세 페이지
	public ReportDTO GroupReportArticle(String report_code) throws SQLException
	{
		ReportDTO result = new ReportDTO();
		
		String sql = "SELECT REPORT_TYPE, REPORT_CODE, REPORT_TITLE, REPORT_DATE"
				+ ", US_CODE1, REPORT_CONTENT, US_CODE2, WRITE_DATE, AD_CODE"
				+ ", REPORT_READ, RR_CODE, RR_STATUS, REPORT_PROCESS"
				+ " FROM GROUP_REPORT_VIEW WHERE REPORT_CODE = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		ResultSet rs = pstmt.executeQuery();
		pstmt.setString(1, report_code);
		
		while (rs.next())
		{			
			result.setReport_type(rs.getString("REPORT_TYPE"));
			result.setReport_code(rs.getString("REPORT_CODE"));
			result.setReport_title(rs.getString("REPORT_TITLE"));
			result.setReport_date(rs.getString("REPORT_DATE"));
			result.setUs_code1(rs.getString("US_CODE1"));
			result.setReport_content(rs.getString("REPORT_CONTENT"));
			result.setUs_code2(rs.getString("US_CODE2"));
			result.setWrite_date(rs.getString("WRITE_DATE"));
			result.setAd_code(rs.getString("AD_CODE"));
			result.setReport_read(rs.getString("REPORT_READ"));
			result.setRr_code(rs.getString("RR_CODE"));
			result.setRr_status(rs.getString("RR_STATUS"));
			result.setReport_process(rs.getString("REPORT_PROCESS"));
		}
		
		rs.close();
		pstmt.close();
		
		return result;
	}
	
	// 자유게시글 신고 상세 페이지
	public ReportDTO BoardReportArticle(String report_code) throws SQLException
	{
		ReportDTO result = new ReportDTO();
		
		String sql = "SELECT REPORT_TYPE, REPORT_CODE, REPORT_TITLE, REPORT_DATE"
				+ ", US_CODE1, REPORT_CONTENT, US_CODE2, WRITE_DATE, AD_CODE"
				+ ", REPORT_READ, RR_CODE, RR_STATUS, REPORT_PROCESS"
				+ " FROM BOARD_REPORT_VIEW WHERE REPORT_CODE = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		ResultSet rs = pstmt.executeQuery();
		pstmt.setString(1, report_code);
		
		while (rs.next())
		{			
			result.setReport_type(rs.getString("REPORT_TYPE"));
			result.setReport_code(rs.getString("REPORT_CODE"));
			result.setReport_title(rs.getString("REPORT_TITLE"));
			result.setReport_date(rs.getString("REPORT_DATE"));
			result.setUs_code1(rs.getString("US_CODE1"));
			result.setReport_content(rs.getString("REPORT_CONTENT"));
			result.setUs_code2(rs.getString("US_CODE2"));
			result.setWrite_date(rs.getString("WRITE_DATE"));
			result.setAd_code(rs.getString("AD_CODE"));
			result.setReport_read(rs.getString("REPORT_READ"));
			result.setRr_code(rs.getString("RR_CODE"));
			result.setRr_status(rs.getString("RR_STATUS"));
			result.setReport_process(rs.getString("REPORT_PROCESS"));
		}
		
		rs.close();
		pstmt.close();
		
		return result;
	}
	
	// 자유게시글 댓글 신고 상세 페이지
	public ReportDTO boardCommentReportArticle(String report_code) throws SQLException
	{
		ReportDTO result = new ReportDTO();
				
		String sql = "SELECT REPORT_TYPE, REPORT_CODE, REPORT_TITLE, REPORT_DATE"
				+ ", US_CODE1, REPORT_CONTENT, US_CODE2, WRITE_DATE, AD_CODE"
				+ ", REPORT_READ, RR_CODE, RR_STATUS, REPORT_PROCESS"
				+ " FROM BOARD_COMMENT_REPORT_VIEW WHERE REPORT_CODE = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		ResultSet rs = pstmt.executeQuery();
		pstmt.setString(1, report_code);
		
		while (rs.next())
		{			
			result.setReport_type(rs.getString("REPORT_TYPE"));
			result.setReport_code(rs.getString("REPORT_CODE"));
			result.setReport_title(rs.getString("REPORT_TITLE"));
			result.setReport_date(rs.getString("REPORT_DATE"));
			result.setUs_code1(rs.getString("US_CODE1"));
			result.setReport_content(rs.getString("REPORT_CONTENT"));
			result.setUs_code2(rs.getString("US_CODE2"));
			result.setWrite_date(rs.getString("WRITE_DATE"));
			result.setAd_code(rs.getString("AD_CODE"));
			result.setReport_read(rs.getString("REPORT_READ"));
			result.setRr_code(rs.getString("RR_CODE"));
			result.setRr_status(rs.getString("RR_STATUS"));
			result.setReport_process(rs.getString("REPORT_PROCESS"));
		}
		
		rs.close();
		pstmt.close();
		
		return result;
	}
	
	// 자유게시글 대댓글 신고 상세 페이지
	public ReportDTO boardRecommentReportArticle(String report_code) throws SQLException
	{
		ReportDTO result = new ReportDTO();
				
		String sql = "SELECT REPORT_TYPE, REPORT_CODE, REPORT_TITLE, REPORT_DATE"
				+ ", US_CODE1, REPORT_CONTENT, US_CODE2, WRITE_DATE, AD_CODE"
				+ ", REPORT_READ, RR_CODE, RR_STATUS, REPORT_PROCESS"
				+ " FROM BOARD_RECOMMENT_REPORT_VIEW WHERE REPORT_CODE = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		ResultSet rs = pstmt.executeQuery();
		pstmt.setString(1, report_code);
		
		while (rs.next())
		{			
			result.setReport_type(rs.getString("REPORT_TYPE"));
			result.setReport_code(rs.getString("REPORT_CODE"));
			result.setReport_title(rs.getString("REPORT_TITLE"));
			result.setReport_date(rs.getString("REPORT_DATE"));
			result.setUs_code1(rs.getString("US_CODE1"));
			result.setReport_content(rs.getString("REPORT_CONTENT"));
			result.setUs_code2(rs.getString("US_CODE2"));
			result.setWrite_date(rs.getString("WRITE_DATE"));
			result.setAd_code(rs.getString("AD_CODE"));
			result.setReport_read(rs.getString("REPORT_READ"));
			result.setRr_code(rs.getString("RR_CODE"));
			result.setRr_status(rs.getString("RR_STATUS"));
			result.setReport_process(rs.getString("REPORT_PROCESS"));
		}
		
		rs.close();
		pstmt.close();
		
		return result;
	}
	
	// 모임 글 신고 상세 페이지
	public ReportDTO meetingReportArticle(String report_code) throws SQLException
	{
		ReportDTO result = new ReportDTO();
				
		String sql = "SELECT REPORT_TYPE, REPORT_CODE, REPORT_TITLE, REPORT_DATE"
				+ ", US_CODE1, REPORT_CONTENT, US_CODE2, WRITE_DATE, AD_CODE"
				+ ", REPORT_READ, RR_CODE, RR_STATUS, REPORT_PROCESS"
				+ " FROM MEETING_REPORT_VIEW WHERE REPORT_CODE = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		ResultSet rs = pstmt.executeQuery();
		pstmt.setString(1, report_code);
		
		while (rs.next())
		{			
			result.setReport_type(rs.getString("REPORT_TYPE"));
			result.setReport_code(rs.getString("REPORT_CODE"));
			result.setReport_title(rs.getString("REPORT_TITLE"));
			result.setReport_date(rs.getString("REPORT_DATE"));
			result.setUs_code1(rs.getString("US_CODE1"));
			result.setReport_content(rs.getString("REPORT_CONTENT"));
			result.setUs_code2(rs.getString("US_CODE2"));
			result.setWrite_date(rs.getString("WRITE_DATE"));
			result.setAd_code(rs.getString("AD_CODE"));
			result.setReport_read(rs.getString("REPORT_READ"));
			result.setRr_code(rs.getString("RR_CODE"));
			result.setRr_status(rs.getString("RR_STATUS"));
			result.setReport_process(rs.getString("REPORT_PROCESS"));
		}
		
		rs.close();
		pstmt.close();
		
		return result;
	}
	
	// 모임 댓글 신고 상세 페이지
	public ReportDTO meetingCommentReportArticle(String report_code) throws SQLException
	{
		ReportDTO result = new ReportDTO();
				
		String sql = "SELECT REPORT_TYPE, REPORT_CODE, REPORT_TITLE, REPORT_DATE"
				+ ", US_CODE1, REPORT_CONTENT, US_CODE2, WRITE_DATE, AD_CODE"
				+ ", REPORT_READ, RR_CODE, RR_STATUS, REPORT_PROCESS"
				+ " FROM MEETING_COMMENT_REPORT_VIEW WHERE REPORT_CODE = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		ResultSet rs = pstmt.executeQuery();
		pstmt.setString(1, report_code);
		
		while (rs.next())
		{			
			result.setReport_type(rs.getString("REPORT_TYPE"));
			result.setReport_code(rs.getString("REPORT_CODE"));
			result.setReport_title(rs.getString("REPORT_TITLE"));
			result.setReport_date(rs.getString("REPORT_DATE"));
			result.setUs_code1(rs.getString("US_CODE1"));
			result.setReport_content(rs.getString("REPORT_CONTENT"));
			result.setUs_code2(rs.getString("US_CODE2"));
			result.setWrite_date(rs.getString("WRITE_DATE"));
			result.setAd_code(rs.getString("AD_CODE"));
			result.setReport_read(rs.getString("REPORT_READ"));
			result.setRr_code(rs.getString("RR_CODE"));
			result.setRr_status(rs.getString("RR_STATUS"));
			result.setReport_process(rs.getString("REPORT_PROCESS"));
		}
		
		rs.close();
		pstmt.close();
		
		return result;
	}

	// 모임 대댓글 신고 상세 페이지
	public ReportDTO meetingRecommentReportArticle(String report_code) throws SQLException
	{
		ReportDTO result = new ReportDTO();
		
		String sql = "SELECT REPORT_TYPE, REPORT_CODE, REPORT_TITLE, REPORT_DATE"
				+ ", US_CODE1, REPORT_CONTENT, US_CODE2, WRITE_DATE, AD_CODE"
				+ ", REPORT_READ, RR_CODE, RR_STATUS, REPORT_PROCESS"
				+ " FROM MEETING_RECOMMENT_REPORT_VIEW WHERE REPORT_CODE = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		ResultSet rs = pstmt.executeQuery();
		pstmt.setString(1, report_code);
		
		while (rs.next())
		{			
			result.setReport_type(rs.getString("REPORT_TYPE"));
			result.setReport_code(rs.getString("REPORT_CODE"));
			result.setReport_title(rs.getString("REPORT_TITLE"));
			result.setReport_date(rs.getString("REPORT_DATE"));
			result.setUs_code1(rs.getString("US_CODE1"));
			result.setReport_content(rs.getString("REPORT_CONTENT"));
			result.setUs_code2(rs.getString("US_CODE2"));
			result.setWrite_date(rs.getString("WRITE_DATE"));
			result.setAd_code(rs.getString("AD_CODE"));
			result.setReport_read(rs.getString("REPORT_READ"));
			result.setRr_code(rs.getString("RR_CODE"));
			result.setRr_status(rs.getString("RR_STATUS"));
			result.setReport_process(rs.getString("REPORT_PROCESS"));
		}
		
		rs.close();
		pstmt.close();
		
		return result;
	}
	
	// 히스토리 글 신고 상세 페이지
	public ReportDTO historyReportArticle(String report_code) throws SQLException
	{
		ReportDTO result = new ReportDTO();
		
		String sql = "SELECT REPORT_TYPE, REPORT_CODE, REPORT_TITLE, REPORT_DATE"
				+ ", US_CODE1, REPORT_CONTENT, US_CODE2, WRITE_DATE, AD_CODE"
				+ ", REPORT_READ, RR_CODE, RR_STATUS, REPORT_PROCESS"
				+ " FROM HISTORY_REPORT_VIEW WHERE REPORT_CODE = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		ResultSet rs = pstmt.executeQuery();
		pstmt.setString(1, report_code);
		
		while (rs.next())
		{			
			result.setReport_type(rs.getString("REPORT_TYPE"));
			result.setReport_code(rs.getString("REPORT_CODE"));
			result.setReport_title(rs.getString("REPORT_TITLE"));
			result.setReport_date(rs.getString("REPORT_DATE"));
			result.setUs_code1(rs.getString("US_CODE1"));
			result.setReport_content(rs.getString("REPORT_CONTENT"));
			result.setUs_code2(rs.getString("US_CODE2"));
			result.setWrite_date(rs.getString("WRITE_DATE"));
			result.setAd_code(rs.getString("AD_CODE"));
			result.setReport_read(rs.getString("REPORT_READ"));
			result.setRr_code(rs.getString("RR_CODE"));
			result.setRr_status(rs.getString("RR_STATUS"));
			result.setReport_process(rs.getString("REPORT_PROCESS"));
		}
		
		rs.close();
		pstmt.close();
		
		return result;
	} 
	
	// 히스토리 댓글 신고 상세 페이지
	public ReportDTO historyCommentReportArticle(String report_code) throws SQLException
	{
		ReportDTO result = new ReportDTO();
		
		String sql = "SELECT REPORT_TYPE, REPORT_CODE, REPORT_TITLE, REPORT_DATE"
				+ ", US_CODE1, REPORT_CONTENT, US_CODE2, WRITE_DATE, AD_CODE"
				+ ", REPORT_READ, RR_CODE, RR_STATUS, REPORT_PROCESS"
				+ " FROM HISTORY_COMMENT_REPORT_VIEW WHERE REPORT_CODE = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		ResultSet rs = pstmt.executeQuery();
		pstmt.setString(1, report_code);
		
		while (rs.next())
		{			
			result.setReport_type(rs.getString("REPORT_TYPE"));
			result.setReport_code(rs.getString("REPORT_CODE"));
			result.setReport_title(rs.getString("REPORT_TITLE"));
			result.setReport_date(rs.getString("REPORT_DATE"));
			result.setUs_code1(rs.getString("US_CODE1"));
			result.setReport_content(rs.getString("REPORT_CONTENT"));
			result.setUs_code2(rs.getString("US_CODE2"));
			result.setWrite_date(rs.getString("WRITE_DATE"));
			result.setAd_code(rs.getString("AD_CODE"));
			result.setReport_read(rs.getString("REPORT_READ"));
			result.setRr_code(rs.getString("RR_CODE"));
			result.setRr_status(rs.getString("RR_STATUS"));
			result.setReport_process(rs.getString("REPORT_PROCESS"));
		}
		
		rs.close();
		pstmt.close();
		
		return result;
	} 
	
	// 히스토리 대댓글 신고 상세 페이지
	public ReportDTO historyRecommentReportArticle(String report_code) throws SQLException
	{
		ReportDTO result = new ReportDTO();
		
		String sql = "SELECT REPORT_TYPE, REPORT_CODE, REPORT_TITLE, REPORT_DATE"
				+ ", US_CODE1, REPORT_CONTENT, US_CODE2, WRITE_DATE, AD_CODE"
				+ ", REPORT_READ, RR_CODE, RR_STATUS, REPORT_PROCESS"
				+ " FROM HISTORY_RECOMMENT_REPORT_VIEW WHERE REPORT_CODE = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		ResultSet rs = pstmt.executeQuery();
		pstmt.setString(1, report_code);
		
		while (rs.next())
		{			
			result.setReport_type(rs.getString("REPORT_TYPE"));
			result.setReport_code(rs.getString("REPORT_CODE"));
			result.setReport_title(rs.getString("REPORT_TITLE"));
			result.setReport_date(rs.getString("REPORT_DATE"));
			result.setUs_code1(rs.getString("US_CODE1"));
			result.setReport_content(rs.getString("REPORT_CONTENT"));
			result.setUs_code2(rs.getString("US_CODE2"));
			result.setWrite_date(rs.getString("WRITE_DATE"));
			result.setAd_code(rs.getString("AD_CODE"));
			result.setReport_read(rs.getString("REPORT_READ"));
			result.setRr_code(rs.getString("RR_CODE"));
			result.setRr_status(rs.getString("RR_STATUS"));
			result.setReport_process(rs.getString("REPORT_PROCESS"));
		}
		
		rs.close();
		pstmt.close();
		
		return result;
	} 
	
	// 그룹 신고 게시글 상세 페이지 들어갔을 때 담당 관리자 업데이트
	public int groupReportUpdate(String ad_code, String report_code) throws SQLException
	{
		int result = 0;
		
		String sql = "UPDATE GROUP_REPORT SET GR_READ = SYSDATE, AD_CODE = ? WHERE GR_CODE = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, Integer.parseInt(ad_code));
		pstmt.setInt(2, Integer.parseInt(report_code));
				
		result = pstmt.executeUpdate();
		
		pstmt.close();				
		
		return result;
	}
	
	// 자유게시글 신고 게시글 상세 페이지 들어갔을 때 담당 관리자 업데이트
	public int boardReportUpdate(String ad_code, String report_code) throws SQLException
	{
		int result = 0;
		
		String sql = "UPDATE BOARD_REPORT SET BRDR_READ = SYSDATE, AD_CODE = ? WHERE BRDR_CODE = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, Integer.parseInt(ad_code));
		pstmt.setInt(2, Integer.parseInt(report_code));
				
		result = pstmt.executeUpdate();
		
		pstmt.close();				
		
		return result;
	}
	
	// 자유게시글 댓글 신고 게시글 상세 페이지 들어갔을 때 담당 관리자 업데이트
	public int boardCommentReportUpdate(String ad_code, String report_code) throws SQLException
	{
		int result = 0;
		
		String sql = "UPDATE BOARD_COMMENT_REPORT SET BRDCR_READ = SYSDATE, AD_CODE = ? WHERE BRDCR_CODE = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, Integer.parseInt(ad_code));
		pstmt.setInt(2, Integer.parseInt(report_code));
				
		result = pstmt.executeUpdate();
		
		pstmt.close();				
		
		return result;
	}
	
	// 자유게시글 대댓글 신고 게시글 상세 페이지 들어갔을 때 담당 관리자 업데이트
	public int boardRecommentReportUpdate(String ad_code, String report_code) throws SQLException
	{
		int result = 0;
		
		String sql = "UPDATE BOARD_RECOMMENT_REPORT SET BRDRCR_READ = SYSDATE, AD_CODE = ? WHERE BRDRCR_CODE = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, Integer.parseInt(ad_code));
		pstmt.setInt(2, Integer.parseInt(report_code));
				
		result = pstmt.executeUpdate();
		
		pstmt.close();				
		
		return result;
	}

	// 모임 글 신고 게시글 상세 페이지 들어갔을 때 담당 관리자 업데이트
	public int MeetingReportUpdate(String ad_code, String report_code) throws SQLException
	{
		int result = 0;
		
		String sql = "UPDATE MEETING_REPORT SET MR_READ = SYSDATE, AD_CODE = ? WHERE MR_CODE = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, Integer.parseInt(ad_code));
		pstmt.setInt(2, Integer.parseInt(report_code));
		
		result = pstmt.executeUpdate();
		
		pstmt.close();				
		
		return result;
	}
	
	// 모임 댓글 신고 게시글 상세 페이지 들어갔을 때 담당 관리자 업데이트
	public int MeetingCommentReportUpdate(String ad_code, String report_code) throws SQLException
	{
		int result = 0;
		
		String sql = "UPDATE MEETING_COMMENT_REPORT SET MCR_READ = SYSDATE, AD_CODE = ? WHERE MCR_CODE = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, Integer.parseInt(ad_code));
		pstmt.setInt(2, Integer.parseInt(report_code));
		
		result = pstmt.executeUpdate();
		
		pstmt.close();				
		
		return result;
	}

	// 모임 대댓글 신고 게시글 상세 페이지 들어갔을 때 담당 관리자 업데이트
	public int MeetingRecommentReportUpdate(String ad_code, String report_code) throws SQLException
	{
		int result = 0;
		
		String sql = "UPDATE MEETING_RECOMMENT_REPORT SET MRCR_READ = SYSDATE, AD_CODE = ? WHERE MRCR_CODE = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, Integer.parseInt(ad_code));
		pstmt.setInt(2, Integer.parseInt(report_code));
		
		result = pstmt.executeUpdate();
		
		pstmt.close();				
		
		return result;
	}

	// 히스토리 신고 게시글 상세 페이지 들어갔을 때 담당 관리자 업데이트
	public int HistoryReportUpdate(String ad_code, String report_code) throws SQLException
	{
		int result = 0;
		
		String sql = "UPDATE HISTORY_REPORT SET HR_READ = SYSDATE, AD_CODE = ? WHERE HR_CODE = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, Integer.parseInt(ad_code));
		pstmt.setInt(2, Integer.parseInt(report_code));
		
		result = pstmt.executeUpdate();
		
		pstmt.close();				
		
		return result;
	}

	// 히스토리 댓글 신고 게시글 상세 페이지 들어갔을 때 담당 관리자 업데이트
	public int HistoryCommentReportUpdate(String ad_code, String report_code) throws SQLException
	{
		int result = 0;
		
		String sql = "UPDATE HISTORY_COMMENT_REPORT SET HCR_READ = SYSDATE, AD_CODE = ? WHERE HCR_CODE = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, Integer.parseInt(ad_code));
		pstmt.setInt(2, Integer.parseInt(report_code));
		
		result = pstmt.executeUpdate();
		
		pstmt.close();				
		
		return result;
	}

	// 히스토리 대댓글 신고 게시글 상세 페이지 들어갔을 때 담당 관리자 업데이트
	public int HistoryRecommentReportUpdate(String ad_code, String report_code) throws SQLException
	{
		int result = 0;
		
		String sql = "UPDATE HISTORY_RECOMMENT_REPORT SET HRCR_READ = SYSDATE, AD_CODE = ? WHERE HRCR_CODE = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, Integer.parseInt(ad_code));
		pstmt.setInt(2, Integer.parseInt(report_code));
		
		result = pstmt.executeUpdate();
		
		pstmt.close();				
		
		return result;
	}
	
	
	// 그룹 신고 게시글 상세 페이지에서 신고 처리(블라인드 유지/해제)
	public int GroupReportResult(String rr_code, String report_code) throws SQLException
	{
		int result = 0;
		
		String sql = "UPDATE GROUP_REPORT SET GR_PROCESS = SYSDATE, RR_CODE = ? WHERE GR_CODE = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, Integer.parseInt(rr_code));
		pstmt.setInt(2, Integer.parseInt(report_code));
		
		result = pstmt.executeUpdate();
		
		pstmt.close();				
		
		return result;
	}

	// 자유게시글 신고 게시글 상세 페이지에서 신고 처리(블라인드 유지/해제)
	public int BoardReportResult(String rr_code, String report_code) throws SQLException
	{
		int result = 0;
		
		String sql = "UPDATE BOARD_REPORT SET BRDR_PROCESS = SYSDATE, RR_CODE = ? WHERE BRDR_CODE = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, Integer.parseInt(rr_code));
		pstmt.setInt(2, Integer.parseInt(report_code));
		
		result = pstmt.executeUpdate();
		
		pstmt.close();				
		
		return result;
	}

	// 자유게시글 댓글 신고 게시글 상세 페이지에서 신고 처리(블라인드 유지/해제)
	public int BoardCommentReportResult(String rr_code, String report_code) throws SQLException
	{
		int result = 0;
		
		String sql = "UPDATE BOARD_COMMENT_REPORT SET BRDCR_PROCESS = SYSDATE, RR_CODE = ? WHERE BRDCR_CODE = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, Integer.parseInt(rr_code));
		pstmt.setInt(2, Integer.parseInt(report_code));
		
		result = pstmt.executeUpdate();
		
		pstmt.close();				
		
		return result;
	}

	// 자유게시글 대댓글 신고 게시글 상세 페이지에서 신고 처리(블라인드 유지/해제)
	public int BoardRecommentReportResult(String rr_code, String report_code) throws SQLException
	{
		int result = 0;
		
		String sql = "UPDATE BOARD_RECOMMENT_REPORT SET BRDRCR_PROCESS = SYSDATE, RR_CODE = ? WHERE BRDRCR_CODE = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, Integer.parseInt(rr_code));
		pstmt.setInt(2, Integer.parseInt(report_code));
		
		result = pstmt.executeUpdate();
		
		pstmt.close();				
		
		return result;
	}

	// 모임 글 신고 게시글 상세 페이지에서 신고 처리(블라인드 유지/해제)
	public int MeetingReportResult(String rr_code, String report_code) throws SQLException
	{
		int result = 0;
		
		String sql = "UPDATE MEETING_REPORT SET MR_PROCESS = SYSDATE, RR_CODE = ? WHERE MR_CODE = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, Integer.parseInt(rr_code));
		pstmt.setInt(2, Integer.parseInt(report_code));
		
		result = pstmt.executeUpdate();
		
		pstmt.close();				
		
		return result;
	}

	// 모임 댓글 신고 게시글 상세 페이지에서 신고 처리(블라인드 유지/해제)
	public int MeetingCommentReportResult(String rr_code, String report_code) throws SQLException
	{
		int result = 0;
		
		String sql = "UPDATE MEETING_COMMENT_REPORT SET MCR_PROCESS = SYSDATE, RR_CODE = ? WHERE MCR_CODE = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, Integer.parseInt(rr_code));
		pstmt.setInt(2, Integer.parseInt(report_code));
		
		result = pstmt.executeUpdate();
		
		pstmt.close();				
		
		return result;
	}

	// 모임 대댓글 신고 게시글 상세 페이지에서 신고 처리(블라인드 유지/해제)
	public int MeetingRecommentReportResult(String rr_code, String report_code) throws SQLException
	{
		int result = 0;
		
		String sql = "UPDATE MEETING_RECOMMENT_REPORT SET MRCR_PROCESS = SYSDATE, RR_CODE = ? WHERE MRCR_CODE = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, Integer.parseInt(rr_code));
		pstmt.setInt(2, Integer.parseInt(report_code));
		
		result = pstmt.executeUpdate();
		
		pstmt.close();				
		
		return result;
	}

	// 히스토리 신고 게시글 상세 페이지에서 신고 처리(블라인드 유지/해제)
	public int HistoryReportResult(String rr_code, String report_code) throws SQLException
	{
		int result = 0;
		
		String sql = "UPDATE HISTORY_REPORT SET HR_PROCESS = SYSDATE, RR_CODE = ? WHERE HR_CODE = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, Integer.parseInt(rr_code));
		pstmt.setInt(2, Integer.parseInt(report_code));
		
		result = pstmt.executeUpdate();
		
		pstmt.close();				
		
		return result;
	}

	// 히스토리 댓글 신고 게시글 상세 페이지에서 신고 처리(블라인드 유지/해제)
	public int HistoryCommentReportResult(String rr_code, String report_code) throws SQLException
	{
		int result = 0;
		
		String sql = "UPDATE HISTORY_COMMENT_REPORT SET HCR_PROCESS = SYSDATE, RR_CODE = ? WHERE HCR_CODE = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, Integer.parseInt(rr_code));
		pstmt.setInt(2, Integer.parseInt(report_code));
		
		result = pstmt.executeUpdate();
		
		pstmt.close();				
		
		return result;
	}

	// 히스토리 대댓글 신고 게시글 상세 페이지에서 신고 처리(블라인드 유지/해제)
	public int HistoryRecommentReportResult(String rr_code, String report_code) throws SQLException
	{
		int result = 0;
		
		String sql = "UPDATE HISTORY_RECOMMENT_REPORT SET HRCR_PROCESS = SYSDATE, RR_CODE = ? WHERE HRCR_CODE = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, Integer.parseInt(rr_code));
		pstmt.setInt(2, Integer.parseInt(report_code));
		
		result = pstmt.executeUpdate();
		
		pstmt.close();				
		
		return result;
	}
	
	
}
