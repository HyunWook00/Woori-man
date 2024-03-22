package com.woori.dao;

import java.util.ArrayList;

import com.woori.dto.CommentDTO;
import com.woori.dto.HistoryDTO;
import com.woori.dto.MeetingDTO;
import com.woori.dto.RecommentDTO;

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
	public String checkHistory(String param1, String param2);
	public int insertArticle(HistoryDTO dto);
	public int insertHistoryComment(CommentDTO dto);
	public int insertHistoryRecomment(RecommentDTO dto);
	public ArrayList<CommentDTO> getHistoryComment(String his_code);
	public ArrayList<RecommentDTO> getHistoryRecomment(String hc_code);
	public int updateComment(CommentDTO dto);
	public int updateRecomment(RecommentDTO dto);
	public int deleteComment(String hc_code);
	public int deleteRecomment(String hrc_code);
	public int insertCommentReport(String param1, String param2);
	public int insertRecommentReport(String param1, String param2);
	public int insertArticleReport(String param1, String param2);
}
