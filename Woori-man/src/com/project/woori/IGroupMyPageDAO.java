package com.project.woori;

import java.util.ArrayList;

import com.woori.dto.BoardDTO;
import com.woori.dto.UserDTO;

public interface IGroupMyPageDAO
{
	public GroupDTO_ming myGroupProfileList(String gm_code);					// 그룹 마이 프로필 조회
	public UserDTO myProfileList(String us_code);								// 계정 정보 조회
	
	public ArrayList<BoardDTO> regularBoard(String gm_code);					// 정기 모임 조회
	public ArrayList<BoardDTO> impromptuBoard(String gm_code);					// 번개 모임 조회
	public ArrayList<BoardDTO> historyBorad(String gm_code);					// 히스토리 조회
	public ArrayList<BoardDTO> board(String gm_code);							// 자유게시판 조회
}	
