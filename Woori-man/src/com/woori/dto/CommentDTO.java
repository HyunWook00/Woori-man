package com.woori.dto;

//2024-02-26 노은하
//사용자 정의 자료형 댓글 DTO

public class CommentDTO
{
	private String commentCode;				// 댓글 코드
	private String commentDate;				// 댓글 작성일
	private String commentContent;			// 댓글 내용
	private String commentWriterName;		// 댓글 작성자 닉네임
	private String commentWriterCode;		// 댓글 작성자 코드
	private String commentWriterProfile;	// 댓글 작성자 프로필
	private String articleCode;				// 댓글 달린 게시글 코드
	private String commentLikeCount;		// 댓글 좋아요 갯수
	
	// getter / setter 구성
	
	public String getCommentCode()
	{
		return commentCode;
	}
	public void setCommentCode(String commentCode)
	{
		this.commentCode = commentCode;
	}
	public String getCommentDate()
	{
		return commentDate;
	}
	public void setCommentDate(String commentDate)
	{
		this.commentDate = commentDate;
	}
	public String getCommentContent()
	{
		return commentContent;
	}
	public void setCommentContent(String commentContent)
	{
		this.commentContent = commentContent;
	}
	public String getCommentWriterName()
	{
		return commentWriterName;
	}
	public void setCommentWriterName(String commentWriterName)
	{
		this.commentWriterName = commentWriterName;
	}
	public String getCommentWriterCode()
	{
		return commentWriterCode;
	}
	public void setCommentWriterCode(String commentWriterCode)
	{
		this.commentWriterCode = commentWriterCode;
	}
	public String getCommentWriterProfile()
	{
		return commentWriterProfile;
	}
	public void setCommentWriterProfile(String commentWriterProfile)
	{
		this.commentWriterProfile = commentWriterProfile;
	}
	public String getArticleCode()
	{
		return articleCode;
	}
	public void setArticleCode(String articleCode)
	{
		this.articleCode = articleCode;
	}
	public String getCommentLikeCount()
	{
		return commentLikeCount;
	}
	public void setCommentLikeCount(String commentLikeCount)
	{
		this.commentLikeCount = commentLikeCount;
	}
}