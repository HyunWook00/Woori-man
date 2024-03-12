package com.woori.dto;

public class GroupMemberDTO
{
	// 주요 변수 선언
	private String cg_code, gm_code, pos_code;		// 식별 코드들 : 그룹개설코드, 그룹원 코드, 직위 코드
		
	private String gm_nickname, gm_profile, gm_intro, gm_regdate, pos_name; // 속성 -- 닉네임, 프로필, 상태메세지, 정보등록일, 직위명

		
	// getter / setter 구성
	public String getPos_name()
	{
		return pos_name;
	}

	public void setPos_name(String pos_name)
	{
		this.pos_name = pos_name;
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

	public String getPos_code()
	{
		return pos_code;
	}

	public void setPos_code(String pos_code)
	{
		this.pos_code = pos_code;
	}

	public String getGm_nickname()
	{
		return gm_nickname;
	}

	public void setGm_nickname(String gm_nickname)
	{
		this.gm_nickname = gm_nickname;
	}

	public String getGm_profile()
	{
		return gm_profile;
	}

	public void setGm_profile(String gm_profile)
	{
		this.gm_profile = gm_profile;
	}

	public String getGm_intro()
	{
		return gm_intro;
	}

	public void setGm_intro(String gm_intro)
	{
		this.gm_intro = gm_intro;
	}

	public String getGm_regdate()
	{
		return gm_regdate;
	}

	public void setGm_regdate(String gm_regdate)
	{
		this.gm_regdate = gm_regdate;
	}
}
