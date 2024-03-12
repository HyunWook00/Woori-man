package com.woori.dao;

import java.util.ArrayList;

import com.woori.dto.BoardDTO;
import com.woori.dto.CsDTO;
import com.woori.dto.GroupDTO;
import com.woori.dto.HistoryDTO;
import com.woori.dto.MeetingDTO;

public interface IGroupDAO
{
	public GroupDTO groupPoint (String cg_code);						// 그룹 포인트 조회
	
	public ArrayList<BoardDTO> newBorad(String cg_code);				// 자유게시판 조회
	public ArrayList<HistoryDTO> newHistory(String cg_code);			// 히스토리 조회
	public ArrayList<CsDTO> noticesList();								// 공지사항 제목 조회
	
	public ArrayList<MeetingDTO> impromptuMeeting(String cg_code);		// 현재 참석 여부 확인중인 번개 모임 조회
	public ArrayList<MeetingDTO> regularMeeting(String cg_code);		// 현재 참석 여부 확인중인 정기 모임 조회
	
}
