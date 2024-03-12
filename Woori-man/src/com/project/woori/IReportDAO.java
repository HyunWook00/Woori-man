package com.project.woori;

import java.util.ArrayList;

public interface IReportDAO
{
	public ArrayList<ReportDTO> allReportList (String us_code);		// 전체 신고 내역
	public ArrayList<ReportDTO> groupReportList(String us_code);	// 그룹 신고 내역
	public ArrayList<ReportDTO> meetingReportList(String us_code);	// 모임 신고 내역
	public ArrayList<ReportDTO> historyReportList(String us_code);	// 히스토리 신고 내역
	public ArrayList<ReportDTO> boardportList(String us_code);		// 자유게시판 신고 내역
	
}
