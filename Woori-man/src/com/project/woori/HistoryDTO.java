package com.project.woori;

// 2024-03-08 노은하
// 히스토리 관련 사용자 정의 자료형

public class HistoryDTO
{
	private String his_code;		// 히스토리 코드
	private String his_date;		// 히스토리 작성일
	private String his_view;		// 히스토리 조회수
	private String his_content;		// 히스토리 내용
	private String ao_code;			// 히스토리 작성자 참석확인 코드
	private String gm_code;			// 히스토리 작성자 그룹원 코드
	private String gm_nickname;		// 히스토리 작성자 닉네임
	private String gm_profile;		// 히스토리 작성자 프로필사진
	private String mt_code;			// 히스토리 관련 모임 코드
	private String mt_title;		// 히스토리 관련 모임명
	private String cg_code;			// 그룹 코드
	
	// getter / setter
	
	public String getHis_code()
	{
		return his_code;
	}
	public void setHis_code(String his_code)
	{
		this.his_code = his_code;
	}
	public String getHis_date()
	{
		return his_date;
	}
	public void setHis_date(String his_date)
	{
		this.his_date = his_date;
	}
	public String getHis_view()
	{
		return his_view;
	}
	public void setHis_view(String his_view)
	{
		this.his_view = his_view;
	}
	public String getHis_content()
	{
		return his_content;
	}
	public void setHis_content(String his_content)
	{
		this.his_content = his_content;
	}
	public String getAo_code()
	{
		return ao_code;
	}
	public void setAo_code(String ao_code)
	{
		this.ao_code = ao_code;
	}
	public String getGm_code()
	{
		return gm_code;
	}
	public void setGm_code(String gm_code)
	{
		this.gm_code = gm_code;
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
	public String getMt_code()
	{
		return mt_code;
	}
	public void setMt_code(String mt_code)
	{
		this.mt_code = mt_code;
	}
	public String getMt_title()
	{
		return mt_title;
	}
	public void setMt_title(String mt_title)
	{
		this.mt_title = mt_title;
	}
	public String getCg_code()
	{
		return cg_code;
	}
	public void setCg_code(String cg_code)
	{
		this.cg_code = cg_code;
	}
	
}
