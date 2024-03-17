package com.woori.dto;

public class GroupInviteDTO
{
	private String gi_code;		// 그룹 초대 코드
	private String fr_code;		// 친구 코드
	private String cg_code;		// 개설 그룹 코드
	private String gi_request;	// 그룹 초대 보낸 날짜
	private String gi_response; // 그룹 초대 응답한 날짜
	private String rs_code;		// 그룹 초대 응답(수락/거절)

	
	public String getGi_code()
	{
		return gi_code;
	}

	public void setGi_code(String gi_code)
	{
		this.gi_code = gi_code;
	}

	public String getFr_code()
	{
		return fr_code;
	}

	public void setFr_code(String fr_code)
	{
		this.fr_code = fr_code;
	}

	public String getCg_code()
	{
		return cg_code;
	}

	public void setCg_code(String cg_code)
	{
		this.cg_code = cg_code;
	}

	public String getGi_request()
	{
		return gi_request;
	}

	public void setGi_request(String gi_request)
	{
		this.gi_request = gi_request;
	}

	public String getGi_response()
	{
		return gi_response;
	}

	public void setGi_response(String gi_response)
	{
		this.gi_response = gi_response;
	}

	public String getRs_code()
	{
		return rs_code;
	}

	public void setRs_code(String rs_code)
	{
		this.rs_code = rs_code;
	}
	
}