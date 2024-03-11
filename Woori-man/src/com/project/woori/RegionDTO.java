package com.project.woori;

//2023-03-02 노은하
//모임에서 활용할 지역 정보를 담을 사용자 정의 자료형
public class RegionDTO
{
	private String rg_code;		// 지역 코드
	private String rg_name;		// 지역 이름
	
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
	
}
