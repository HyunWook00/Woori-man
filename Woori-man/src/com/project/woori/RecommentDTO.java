package com.project.woori;

//2024-02-26 노은하
//사용자 정의 자료형 대댓글 DTO

public class RecommentDTO
{
	private String recommentCode;			// 대댓글 코드
	private String recommentDate;			// 대댓글 작성일
	private String recommentContent;		// 대댓글 내용
	private String recommentWriterName;		// 대댓글 작성자 닉네임
	private String recommentWriterCode;		// 대댓글 작성자 코드
	private String recommentWriterProfile;	// 대댓글 작성자 프로필사진
	private String commentCode;				// 대댓글 달린 댓글 코드
	private String recommentLikeCount;		// 대댓글 좋아요 갯수
	
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
}
