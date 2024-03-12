package com.woori.dto;

// 2024-02-26 노은하
// 사용자 정의 자료형 댓글 DTO

public class CommentDTO
{
	private String commentCode;
	private String commentDate;
	private String commentContent;
	private String commentWriterName;
	private String commentWriterCode;
	private String commentWriterProfile;
	private String articleCode;
	private String commentLikeCount;
	private String commentLikeCheck;
	
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
	public String getCommentLikeCheck()
	{
		return commentLikeCheck;
	}
	public void setCommentLikeCheck(String commentLikeCheck)
	{
		this.commentLikeCheck = commentLikeCheck;
	}
}
