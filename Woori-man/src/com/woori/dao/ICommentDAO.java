package com.woori.dao;

import com.woori.dto.CommentDTO;
import com.woori.dto.RecommentDTO;

// 댓글, 대댓글 쿼리문용 dao
public interface ICommentDAO
{
	// 댓글, 대댓글 입력
	public int insertComment(CommentDTO dto);			// 모임
	public int insertRecomment(RecommentDTO dto);		// 모임
	public int insertBoardComment(CommentDTO dto);		// 자유게시글
	
	// 댓글, 대댓글 수정
	public int updateComment(CommentDTO dto);
	public int updateRecomment(RecommentDTO dto);
	
	// 댓글, 대댓글 삭제
	public int deleteComment(String commentCode);
	public int deleteRecomment(String recommentCode);
	
	// 댓글, 대댓글 좋아요 카운트
	public int countCommentLike(String commentCode);
	public int countRecommentLike(String recommentCode);
	
	// 댓글, 대댓글 찾기
	public CommentDTO searchComment(String commentCode);			// 모임
	public CommentDTO searchRecomment(String recommentCode);		// 모임
	public CommentDTO searchBoardComment(String commentCode);		// 자유게시판
	public CommentDTO searchBoardRecomment(String recommentCode);	// 자유게시판
	public CommentDTO searchHistoryComment(String commentCode);		// 히스토리
	public CommentDTO searchHistoryRecomment(String recommentCode);	// 히스토리
	
	
}
