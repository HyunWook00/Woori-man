package com.woori.dto;

// 2024-02-23 노은하
public class MeetingDTO
{
	private int num;			// 게시글번호
	private String mt_code;		// 모임 코드
	private String cg_code;		// 그룹 코드
	private String cg_name;		// 그룹 이름
	private String gm_code;		// 그룹원(발의자) 코드
	private String gm_nickname;	// 그룹원(발의자) 닉네임
	private String mt_date;		// 모임 발의일
	private String mt_meet;		// 모임 예정일
	private String mt_update;	// 최종 수정일
	private String mt_vote;		// 참석 여부 확인 마감일
	private String mt_title;	// 모임 제목
	private String ct_code;		// 도시 코드
	private String ct_name;		// 도시 이름
	private String rg_code;		// 지역 코드
	private String rg_name;		// 지역 이름
	private String mt_status;	// 모임 상태
	private String mt_etc;		// 모임 한줄메모
	private String mc_code;		// 모임 카테고리 코드
	private String mc_name;		// 모임 카테고리명 (번개 or 정기)
	
	// getter / setter 구성
	public String getMt_code()
	{
		return mt_code;
	}
	public void setMt_code(String mt_code)
	{
		this.mt_code = mt_code;
	}
	public String getMc_code()
	{
		return mc_code;
	}
	public void setMc_code(String mc_code)
	{
		this.mc_code = mc_code;
	}
	public String getGm_code()
	{
		return gm_code;
	}
	public void setGm_code(String gm_code)
	{
		this.gm_code = gm_code;
	}
	public String getMt_date()
	{
		return mt_date;
	}
	public void setMt_date(String mt_date)
	{
		this.mt_date = mt_date;
	}
	public String getMt_update()
	{
		return mt_update;
	}
	public void setMt_update(String mt_update)
	{
		this.mt_update = mt_update;
	}
	public String getMt_meet()
	{
		return mt_meet;
	}
	public void setMt_meet(String mt_meet)
	{
		this.mt_meet = mt_meet;
	}
	public String getMt_title()
	{
		return mt_title;
	}
	public void setMt_title(String mt_title)
	{
		this.mt_title = mt_title;
	}
	public String getCt_code()
	{
		return ct_code;
	}
	public void setCt_code(String ct_code)
	{
		this.ct_code = ct_code;
	}
	public String getMt_etc()
	{
		return mt_etc;
	}
	public void setMt_etc(String mt_etc)
	{
		this.mt_etc = mt_etc;
	}
	public String getGm_nickname()
	{
		return gm_nickname;
	}
	public void setGm_nickname(String gm_nickname)
	{
		this.gm_nickname = gm_nickname;
	}
	public String getMt_vote()
	{
		return mt_vote;
	}
	public void setMt_vote(String mt_vote)
	{
		this.mt_vote = mt_vote;
	}
	public String getCt_name()
	{
		return ct_name;
	}
	public void setCt_name(String ct_name)
	{
		this.ct_name = ct_name;
	}
	public String getMt_status()
	{
		return mt_status;
	}
	public void setMt_status(String mt_status)
	{
		this.mt_status = mt_status;
	}
	public int getNum()
	{
		return num;
	}
	public void setNum(int num)
	{
		this.num = num;
	}
	public String getCg_code()
	{
		return cg_code;
	}
	public void setCg_code(String cg_code)
	{
		this.cg_code = cg_code;
	}
	public String getCg_name()
	{
		return cg_name;
	}
	public void setCg_name(String cg_name)
	{
		this.cg_name = cg_name;
	}
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
	public String getMc_name()
	{
		return mc_name;
	}
	public void setMc_name(String mc_name)
	{
		this.mc_name = mc_name;
	}
	
	
}
