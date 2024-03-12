package com.project.woori;

import java.util.ArrayList;

import com.woori.dto.CsDTO;

public interface ICsDAO
{
	public ArrayList<CsDTO> noticesList();							// 공지사항 내역 조회
	public CsDTO noticesListPost(String nf_code);					// 공지사항 게시글 
	
	public ArrayList<CsDTO> searchFaqList(String searchKeyword);	// 검색창
	public ArrayList<CsDTO> faqList(String fc_code);				// 자주묻는 질문 제목 조회
	
	public ArrayList<CsDTO> inquiryCategory();						// 문의사항 카테고리 조회
	public int inquiryInsert(CsDTO dto);							// 1:1 문의사항 입력
	public ArrayList<CsDTO> inquiryList(String us_code);			// 1:1 문의사항 내역 조회
	public CsDTO inquiryPost(String iq_code);						// 1:1 문의사항 상세내역 조회
	
	
	
}
