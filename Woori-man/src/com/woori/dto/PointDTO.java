package com.woori.dto;

// 그룹 포인트 내역 객체
public class PointDTO
{
	private int score;		// 점수
	private String cg_code;	// 그룹 코드
	private String gm_code;	// 그룹원 코드
	private String ps_code;	// 포인트 상태 코드
	private String pk_code;	// 포인트 종류 코드
	
	// getter / setter 구성
	
	public int getScore()
	{
		return score;
	}
	public void setScore(int score)
	{
		this.score = score;
	}
	public String getCg_code()
	{
		return cg_code;
	}
	public void setCg_code(String cg_code)
	{
		this.cg_code = cg_code;
	}
	public String getGm_code()
	{
		return gm_code;
	}
	public void setGm_code(String gm_code)
	{
		this.gm_code = gm_code;
	}
	public String getPs_code()
	{
		return ps_code;
	}
	public void setPs_code(String ps_code)
	{
		this.ps_code = ps_code;
	}
	public String getPk_code()
	{
		return pk_code;
	}
	public void setPk_code(String pk_code)
	{
		this.pk_code = pk_code;
	}
	
}
