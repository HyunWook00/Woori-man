package com.woori.dto;

// 2024-03-03 노은하
// 모임에서 활용할 도시 정보를 담은 사용자 정의 자료형
public class CityDTO
{
	private String rg_code;		// 지역 코드
	private String rg_name;		// 지역 이름
	private String ct_code;		// 도시 코드
	private String ct_name;		// 도시 이름
	
	// getter / setter 구성
	public String getRg_code()
	{
		return rg_code;
	}
	public void setRg_code(String rg_code)
	{
		this.rg_code = rg_code;
	}
	public String getRg_name()
	{
		return rg_name;
	}
	public void setRg_name(String rg_name)
	{
		this.rg_name = rg_name;
	}
	public String getCt_code()
	{
		return ct_code;
	}
	public void setCt_code(String ct_code)
	{
		this.ct_code = ct_code;
	}
	public String getCt_name()
	{
		return ct_name;
	}
	public void setCt_name(String ct_name)
	{
		this.ct_name = ct_name;
	}
	
}
