package com.woori.dto;

public class AdminNotificationDTO
{
	// admin 관련 속성 구성
	
	// 관리자 관련 속성
	private String ad_code;		// 관리자 코드
	
	// 공지사항 관련 속성
	private String nf_code;		// 공지사항 코드
	private String nf_title;	// 공지사항 제목
	private String nf_content;	// 공지사항 내용
	private String nf_date; 	// 공지사항 게시일
	private String na_name;		// 첨부파일 명
	private String na_code;		// 공지사항코드
	
	
	// getter / setter 구성
	public String getAd_code()
	{
		return ad_code;
	}
	public void setAd_code(String ad_code)
	{
		this.ad_code = ad_code;
	}
	public String getNf_code()
	{
		return nf_code;
	}
	public void setNf_code(String nf_code)
	{
		this.nf_code = nf_code;
	}
	public String getNf_title()
	{
		return nf_title;
	}
	public void setNf_title(String nf_title)
	{
		this.nf_title = nf_title;
	}
	public String getNf_content()
	{
		return nf_content;
	}
	public void setNf_content(String nf_content)
	{
		this.nf_content = nf_content;
	}
	public String getNf_date()
	{
		return nf_date;
	}
	public void setNf_date(String nf_date)
	{
		this.nf_date = nf_date;
	}
	public String getNa_name()
	{
		return na_name;
	}
	public void setNa_name(String na_name)
	{
		this.na_name = na_name;
	}
	public String getNa_code()
	{
		return na_code;
	}
	public void setNa_code(String na_code)
	{
		this.na_code = na_code;
	}
	
}
