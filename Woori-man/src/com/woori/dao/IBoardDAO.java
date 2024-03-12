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
}
