package com.woori.dto;

// 방문장소 객체
public class PlaceDTO
{
	private String vp_code;		// 방문장소 코드
	private String vp_zipcode;	// 우편번호
	private String mt_code;		// 모임코드
	private String vp_addr1;	// 주소
	private String vp_addr2;	// 상세주소
	private String vp_expenses;	// 사용경비
	private String vp_plan;		// 장소 등록일자
	private String vp_date;		// 경비 등록일자
	
	// getter / setter
	
	public String getVp_code()
	{
		return vp_code;
	}
	public void setVp_code(String vp_code)
	{
		this.vp_code = vp_code;
	}
	public String getVp_zipcode()
	{
		return vp_zipcode;
	}
	public void setVp_zipcode(String vp_zipcode)
	{
		this.vp_zipcode = vp_zipcode;
	}
	public String getMt_code()
	{
		return mt_code;
	}
	public void setMt_code(String mt_code)
	{
		this.mt_code = mt_code;
	}
	public String getVp_addr1()
	{
		return vp_addr1;
	}
	public void setVp_addr1(String vp_addr1)
	{
		this.vp_addr1 = vp_addr1;
	}
	public String getVp_addr2()
	{
		return vp_addr2;
	}
	public void setVp_addr2(String vp_addr2)
	{
		this.vp_addr2 = vp_addr2;
	}
	public String getVp_expenses()
	{
		return vp_expenses;
	}
	public void setVp_expenses(String vp_expenses)
	{
		this.vp_expenses = vp_expenses;
	}
	public String getVp_plan()
	{
		return vp_plan;
	}
	public void setVp_plan(String vp_plan)
	{
		this.vp_plan = vp_plan;
	}
	public String getVp_date()
	{
		return vp_date;
	}
	public void setVp_date(String vp_date)
	{
		this.vp_date = vp_date;
	}
	
}
