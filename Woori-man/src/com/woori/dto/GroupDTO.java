package com.woori.dto;

public class GroupDTO
{
	// GroupDTO
	
	// 그룹 관련 변수
	private String cg_code;		// 그룹 코드	
	private String gi_code;		// 그룹 초대 코드
	private String cg_intro;	// 그룹 한줄소개
	private String cg_profile;	// 그룹 대표이미지
	private String cg_name;		// 그룹명
	private String cg_date;		// 그룹 개설일
	private String gm_count;	// 총 그룹원 수
	private String brd_name;	// 그룹 자유게시판명
	private int group_point;	// 그룹 포인트
	
	// 노은하
	// GroupDTO 필요한 요소 추가
	private String gc_code;		// 그룹 카테고리 코드
	private String gc_name;		// 그룹 카테고리명
	
	private int gb_code;
	private String gm_code;
	private int g_count;
	
	// getter / setter 구성
	public String getCg_code()
	{
		return cg_code;
	}
	public void setCg_code(String cg_code)
	{
		this.cg_code = cg_code;
	}
	public String getGi_code()
	{
		return gi_code;
	}
	public void setGi_code(String gi_code)
	{
		this.gi_code = gi_code;
	}
	public String getCg_intro()
	{
		return cg_intro;
	}
	public void setCg_intro(String cg_intro)
	{
		this.cg_intro = cg_intro;
	}
	public String getCg_profile()
	{
		return cg_profile;
	}
	public void setCg_profile(String cg_profile)
	{
		this.cg_profile = cg_profile;
	}
	public String getCg_name()
	{
		return cg_name;
	}
	public void setCg_name(String cg_name)
	{
		this.cg_name = cg_name;
	}
	public String getCg_date()
	{
		return cg_date;
	}
	public void setCg_date(String cg_date)
	{
		this.cg_date = cg_date;
	}
	public String getGm_count()
	{
		return gm_count;
	}
	public void setGm_count(String gm_count)
	{
		this.gm_count = gm_count;
	}
	public String getBrd_name()
	{
		return brd_name;
	}
	public void setBrd_name(String brd_name)
	{
		this.brd_name = brd_name;
	}
	public int getGroup_point()
	{
		return group_point;
	}
	public void setGroup_point(int group_point)
	{
		this.group_point = group_point;
	}
	public String getGc_code()
	{
		return gc_code;
	}
	public void setGc_code(String gc_code)
	{
		this.gc_code = gc_code;
	}
	public String getGc_name()
	{
		return gc_name;
	}
	public void setGc_name(String gc_name)
	{
		this.gc_name = gc_name;
	}
	public int getGb_code()
	{
		return gb_code;
	}
	public void setGb_code(int gb_code)
	{
		this.gb_code = gb_code;
	}
	public String getGm_code()
	{
		return gm_code;
	}
	public void setGm_code(String gm_code)
	{
		this.gm_code = gm_code;
	}
	public int getG_count()
	{
		return g_count;
	}
	public void setG_count(int g_count)
	{
		this.g_count = g_count;
	}
	
}
