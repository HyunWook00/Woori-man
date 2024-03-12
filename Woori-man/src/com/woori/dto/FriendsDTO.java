/*====================
	FriendsDTO.java
====================*/

package com.woori.dto;

public class FriendsDTO
{
	// 주요 속성 구성
	private String fr_code;			// 친구 코드
	private String us_code;			// 회원 코드
	private String us_profile;		// 회원 프로필	
	private String us_name;			// 회원 이름
	private String us_id;			// 회원 아이디
	private String us_signup;		// 회원 가입일
	private String us_number;		// 회원 번호(난수)
	private String us_code1;		// (친구)회원 코드1
	private String us_code2;		// (친구)회원 코드2
	private String fd_code;			// 친구 삭제코드
	private String fd_date;			// 회원 삭제일

	
	// getter / setter 구성
	public String getUs_code()
	{
		return us_code;
	}
	public void setUs_code(String us_code)
	{
		this.us_code = us_code;
	}
	public String getUs_code1()
	{
		return us_code1;
	}
	public void setUs_code1(String us_code1)
	{
		this.us_code1 = us_code1;
	}
	public String getUs_profile()
	{
		return us_profile;
	}
	public void setUs_profile(String us_profile)
	{
		this.us_profile = us_profile;
	}
	public String getUs_name()
	{
		return us_name;
	}
	public void setUs_name(String us_name)
	{
		this.us_name = us_name;
	}
	public String getUs_id()
	{
		return us_id;
	}
	public void setUs_id(String us_id)
	{
		this.us_id = us_id;
	}
	public String getUs_signup()
	{
		return us_signup;
	}
	public void setUs_signup(String us_signup)
	{
		this.us_signup = us_signup;
	}
	public String getUs_number()
	{
		return us_number;
	}
	public void setUs_number(String us_number)
	{
		this.us_number = us_number;
	}
	public String getUs_code2()
	{
		return us_code2;
	}
	public void setUs_code2(String us_code2)
	{
		this.us_code2 = us_code2;
	}
	public String getFr_code()
	{
		return fr_code;
	}
	public void setFr_code(String fr_code)
	{
		this.fr_code = fr_code;
	}
	public String getFd_code()
	{
		return fd_code;
	}
	public void setFd_code(String fd_code)
	{
		this.fd_code = fd_code;
	}
	public String getFd_date()
	{
		return fd_date;
	}
	public void setFd_date(String fd_date)
	{
		this.fd_date = fd_date;
	} 
	
	
	
	

	
	
	
	
}
