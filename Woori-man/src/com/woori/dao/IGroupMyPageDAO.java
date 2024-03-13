package com.woori.dao;

import java.util.ArrayList;

import com.woori.dto.BoardDTO;
import com.woori.dto.HistoryDTO;
import com.woori.dto.MeetingDTO;
import com.woori.dto.UserDTO;

// 마이페이지 접속 시 필요한 dao - 민지 
public interface IGroupMyPageDAO
{
	public UserDTO myProfileList(String us_code);								// 계정 정보 조회
	
	public ArrayList<MeetingDTO> regularBoard(String gm_code);					// 정기 모임 조회
	public ArrayList<MeetingDTO> impromptuBoard(String gm_code);				// 번개 모임 조회
	public ArrayList<HistoryDTO> historyBorad(String gm_code);					// 히스토리 조회
	public ArrayList<BoardDTO> board(String gm_code);							// 자유게시판 조회
}	
