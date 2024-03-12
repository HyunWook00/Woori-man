package com.woori.dto;

// 2024-02-26 노은하
// 사용자 정의 자료형 대댓글 DTO

public class RecommentDTO
{
	private String recommentCode;
	private String recommentDate;
	private String recommentContent;
	private String recommentWriterName;
	private String recommentWriterCode;
	private String recommentWriterProfile;
	private String commentCode;
	private String recommentLikeCount;
	private String recommentLikeCheck;
	
	// getter / setter 구성
	
	public String getRecommentCode()
	{
		return recommentCode;
	}
	public void setRecommentCode(String recommentCode)
	{
		this.recommentCode = recommentCode;
	}
	public String getRecommentDate()
	{
		return recommentDate;
	}
	public void setRecommentDate(String recommentDate)
	{
		this.recommentDate = recommentDate;
	}
	public String getRecommentContent()
	{
		return recommentContent;
	}
	public void setRecommentContent(String recommentContent)
	{
		this.recommentContent = recommentContent;
	}
	public String getRecommentWriterName()
	{
		return recommentWriterName;
	}
	public void setRecommentWriterName(String recommentWriterName)
	{
		this.recommentWriterName = recommentWriterName;
	}
	public String getRecommentWriterCode()
	{
		return recommentWriterCode;
	}
	public void setRecommentWriterCode(String recommentWriterCode)
	{
		this.recommentWriterCode = recommentWriterCode;
	}
	public String getRecommentWriterProfile()
	{
		return recommentWriterProfile;
	}
	public void setRecommentWriterProfile(String recommentWriterProfile)
	{
		this.recommentWriterProfile = recommentWriterProfile;
	}
	public String getCommentCode()
	{
		return commentCode;
	}
	public void setCommentCode(String commentCode)
	{
		this.commentCode = commentCode;
	}
	public String getRecommentLikeCount()
	{
		return recommentLikeCount;
	}
	public void setRecommentLikeCount(String recommentLikeCount)
	{
		this.recommentLikeCount = recommentLikeCount;
	}
	public String getRecommentLikeCheck()
	{
		return recommentLikeCheck;
	}
	public void setRecommentLikeCheck(String recommentLikeCheck)
	{
		this.recommentLikeCheck = recommentLikeCheck;
	}
}
