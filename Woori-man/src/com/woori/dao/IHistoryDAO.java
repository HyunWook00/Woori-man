package com.woori.dao;

import java.util.ArrayList;

import com.woori.dto.HistoryDTO;
import com.woori.dto.MeetingDTO;

// 히스토리 관련 dao

public interface IHistoryDAO
{
	public ArrayList<HistoryDTO> getHistoryList(String mt_code);
	public HistoryDTO getHistoryArticle(String his_code);
	public int getArticleLike(String param1, String param2);
	public int insertArticleLike(String param1, String param2);
	public int updateArticleView(String his_code);
	public int deleteArticleLike(String param1, String param2);
	public ArrayList<MeetingDTO> getMeetingList(String cg_code);
}