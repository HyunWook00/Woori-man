package com.woori.dao;

import java.util.ArrayList;

import com.woori.dto.CommentDTO;
import com.woori.dto.HistoryDTO;
import com.woori.dto.MeetingDTO;
import com.woori.dto.RecommentDTO;

// 히스토리 관련 dao

public interface IHistoryDAO
{
	public ArrayList<HistoryDTO> getHistoryList(String mt_code);			// 히스토리 글목록
	public HistoryDTO getHistoryArticle(String his_code);					// 히스토리 게시글 상세정보
	public int getArticleLike(String param1, String param2);				// 히스토리 좋아요 정보
	public int insertArticleLike(String param1, String param2);				// 게시글 좋아요 클릭
	public int updateArticleView(String his_code);							// 조회수 업데이트
	public int deleteArticleLike(String param1, String param2);				// 게시글 좋아요 취소
	public ArrayList<MeetingDTO> getMeetingList(String cg_code);			// 모임 리스트
	public String checkHistory(String param1, String param2);				// 히스토리 작성 가능여부 확인
	public int insertArticle(HistoryDTO dto);								// 히스토리 작성
	public int insertHistoryComment(CommentDTO dto);						// 댓글 작성
	public int insertHistoryRecomment(RecommentDTO dto);					// 대댓글 작성
	public ArrayList<CommentDTO> getHistoryComment(String his_code);		// 댓글 목록
	public ArrayList<RecommentDTO> getHistoryRecomment(String hc_code);		// 대댓글 목록
	public int updateComment(CommentDTO dto);								// 댓글 수정
	public int updateRecomment(RecommentDTO dto);							// 대댓글 수정
	public int deleteComment(String hc_code);								// 댓글 삭제
	public int deleteRecomment(String hrc_code);							// 대댓글 삭제
	public int insertCommentReport(String param1, String param2);			// 댓글 신고
	public int insertRecommentReport(String param1, String param2);			// 대댓글 신고
	public int insertArticleReport(String param1, String param2);			// 게시글 신고
	public int deleteArticle(String his_code);								// 게시글 삭제
}
