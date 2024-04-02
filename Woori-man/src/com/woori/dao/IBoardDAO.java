package com.woori.dao;

import java.util.ArrayList;

import com.woori.dto.BoardDTO;

// 자유게시판 쿼리문 관련 dao
public interface IBoardDAO
{
	public ArrayList<BoardDTO> getBoardList(String cg_code);
	public BoardDTO getBoardArticle(String brd_code);
	public int getNewArticle(String cg_code);
	public int insertArticle(BoardDTO dto);
	public int updateArticleView(String brd_code);
	public int updateArticle(BoardDTO dto);
	public int deleteArticle(String brd_code);
	public int countArticle(String cg_code);
	public Integer prcInsertBoard(BoardDTO dto);
	public int insertAttach(int param1, String param2);		// 게시글코드, 파일명
	public ArrayList<String> searchAttach(String brd_code);	// 첨부파일 검색
}
