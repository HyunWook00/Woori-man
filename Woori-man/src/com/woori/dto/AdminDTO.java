package com.woori.dto;

public class AdminDTO
{
	// AdminDTO
	
	// 주요 속성 구성
	private String ad_code;		// 관리자 코드
	private String ad_pwd;		// 관리자 비밀번호
	private String ad_ssn1;		// 관리자 생년월일
	private String ad_name;		// 관리자 이름
	private String ad_tel;		// 관리자 전화번호
	private String ad_create;	// 관리자 계정 생성일
	
	// getter / setter 구성
	public String getAd_code()
	{
		return ad_code;
	}
	public void setAd_code(String ad_code)
	{
		this.ad_code = ad_code;
	}
	public String getAd_pwd()
	{
		return ad_pwd;
	}
	public void setAd_pwd(String ad_pwd)
	{
		this.ad_pwd = ad_pwd;
	}
	public String getAd_ssn1()
	{
		return ad_ssn1;
	}
	public void setAd_ssn1(String ad_ssn1)
	{
		this.ad_ssn1 = ad_ssn1;
	}
	public String getAd_name()
	{
		return ad_name;
	}
	public void setAd_name(String ad_name)
	{
		this.ad_name = ad_name;
	}
	public String getAd_tel()
	{
		return ad_tel;
	}
	public void setAd_tel(String ad_tel)
	{
		this.ad_tel = ad_tel;
	}
	public String getAd_create()
	{
		return ad_create;
	}
	public void setAd_create(String ad_create)
	{
		this.ad_create = ad_create;
	}
}
