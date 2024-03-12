package com.woori.dto;

public class LoginDTO
{
	
	// 로그인, 회원가입 및 유저정보 관련 속성
	private String us_code;		// 회원 코드
	private String us_pwd;		// 회원 패스워드
	private String uw_code;		// 탈퇴 코드
	private String us_id;		// 회원 아이디
	
	
	//getter, setter 구성
	public String getUs_code()
	{
		return us_code;
	}
	public void setUs_code(String us_code)
	{
		this.us_code = us_code;
	}
	public String getUs_pwd()
	{
		return us_pwd;
	}
	public void setUs_pwd(String us_pwd)
	{
		this.us_pwd = us_pwd;
	}
	public String getUw_code()
	{
		return uw_code;
	}
	public void setUw_code(String uw_code)
	{
		this.uw_code = uw_code;
	}
	public String getUs_id()
	{
		return us_id;
	}
	public void setUs_id(String us_id)
	{
		this.us_id = us_id;
	}
	
}
