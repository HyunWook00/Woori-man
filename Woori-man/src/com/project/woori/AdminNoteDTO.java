package com.project.woori;

public class AdminNoteDTO
{
	// 주요 속성 구성
	private String an_code;		// 관리자 쪽지 코드
	private String ad_code;		// 관리자 코드(작성자)
	private String an_title;	// 관리자 쪽지 제목
	private String an_send;		// 관리자 쪽지 보낸 날짜
	private String an_content;	// 관리자 쪽지 내용

	// getter / setter 구성
	public String getAn_code()
	{
		return an_code;
	}
	public void setAn_code(String an_code)
	{
		this.an_code = an_code;
	}
	public String getAd_code()
	{
		return ad_code;
	}
	public void setAd_code(String ad_code)
	{
		this.ad_code = ad_code;
	}
	public String getAn_title()
	{
		return an_title;
	}
	public void setAn_title(String an_title)
	{
		this.an_title = an_title;
	}
	public String getAn_send()
	{
		return an_send;
	}
	public void setAn_send(String an_send)
	{
		this.an_send = an_send;
	}
	public String getAn_content()
	{
		return an_content;
	}
	public void setAn_content(String an_content)
	{
		this.an_content = an_content;
	}
	
	
	
}
