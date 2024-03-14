package com.woori.dto;

public class GroupFeeDTO
{
	private String gf_code;			// 월 회비 코드
	private int gf_amount;			// 회비 금액
	private String gm_code;			// 그룹원 코드
	private String gf_date;			// 회비 설정일 
	private String gf_start;		// 회비 납부 설정일
	private String gfi_code;		// 회비 납부 코드
	private String gfi_date;		// 회비 납부일
	private int gfi_amount;			// 회비 납부 금액

	//getter/setter 구성
	
	public String getGm_code()
	{
		return gm_code;
	}
	public void setGm_code(String gm_code)
	{
		this.gm_code = gm_code;
	}
	public String getGf_code()
	{
		return gf_code;
	}
	public void setGf_code(String gf_code)
	{
		this.gf_code = gf_code;
	}
	public int getGf_amount()
	{
		return gf_amount;
	}
	public void setGf_amount(int gf_amount)
	{
		this.gf_amount = gf_amount;
	}
	public String getGf_date()
	{
		return gf_date;
	}
	public void setGf_date(String gf_date)
	{
		this.gf_date = gf_date;
	}
	public String getGf_start()
	{
		return gf_start;
	}
	public void setGf_start(String gf_start)
	{
		this.gf_start = gf_start;
	}
	public String getGfi_code()
	{
		return gfi_code;
	}
	public void setGfi_code(String gfi_code)
	{
		this.gfi_code = gfi_code;
	}
	public String getGfi_date()
	{
		return gfi_date;
	}
	public void setGfi_date(String gfi_date)
	{
		this.gfi_date = gfi_date;
	}
	public int getGfi_amount()
	{
		return gfi_amount;
	}
	public void setGfi_amount(int gfi_amount)
	{
		this.gfi_amount = gfi_amount;
	}

	
	
}
