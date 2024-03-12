package com.woori.dto;

public class InquiryDTO
{
	// 주요 속성 구성
	private String iq_code;		// 문의사항 코드
	private String iqc_code;	// 문의사항 카테고리 코드
	private String iqc_name;	// 문의사항 카테고리 명	
	private String iq_title;	// 문의사항 제목
	private String iq_content;	// 문의사항 내용
	private String iqa_code;	// 문의사항 첨부파일 코드	
	private String iqa_name;	// 문의사항 첨부파일 명(경로)
	private String iq_read;		// 문의사항 열람일
	private String us_id;		// 문의사항 작성한 회원 아이디
	private String ad_code;		// 담당 관리자 코드
	private String iq_date;		// 문의사항 작성일
	private String iq_status;	// 문의사항 처리상태
	private String as_code;		// 문의사항 답변 코드
	private String as_content;	// 문의사항 답변 내용
	private String as_date;		// 문의사항 답변 날짜

	
	// getter / setter 구성
	public String getIq_code()
	{
		return iq_code;
	}

	public void setIq_code(String iq_code)
	{
		this.iq_code = iq_code;
	}

	public String getAd_code()
	{
		return ad_code;
	}

	public void setAd_code(String ad_code)
	{
		this.ad_code = ad_code;
	}

	public String getAs_code()
	{
		return as_code;
	}

	public void setAs_code(String as_code)
	{
		this.as_code = as_code;
	}

	public String getIqa_code()
	{
		return iqa_code;
	}

	public void setIqa_code(String iqa_code)
	{
		this.iqa_code = iqa_code;
	}

	public String getIqc_code()
	{
		return iqc_code;
	}

	public void setIqc_code(String iqc_code)
	{
		this.iqc_code = iqc_code;
	}

	public String getIqc_name()
	{
		return iqc_name;
	}

	public void setIqc_name(String iqc_name)
	{
		this.iqc_name = iqc_name;
	}

	public String getIq_title()
	{
		return iq_title;
	}

	public void setIq_title(String iq_title)
	{
		this.iq_title = iq_title;
	}

	public String getUs_id()
	{
		return us_id;
	}

	public void setUs_id(String us_id)
	{
		this.us_id = us_id;
	}

	public String getIq_date()
	{
		return iq_date;
	}

	public void setIq_date(String iq_date)
	{
		this.iq_date = iq_date;
	}

	public String getIq_status()
	{
		return iq_status;
	}

	public void setIq_status(String iq_status)
	{
		this.iq_status = iq_status;
	}

	public String getIq_content()
	{
		return iq_content;
	}

	public void setIq_content(String iq_content)
	{
		this.iq_content = iq_content;
	}

	public String getIqa_name()
	{
		return iqa_name;
	}

	public void setIqa_name(String iqa_name)
	{
		this.iqa_name = iqa_name;
	}

	public String getAs_content()
	{
		return as_content;
	}

	public void setAs_content(String as_content)
	{
		this.as_content = as_content;
	}

	public String getAs_date()
	{
		return as_date;
	}

	public void setAs_date(String as_date)
	{
		this.as_date = as_date;
	}

	public String getIq_read()
	{
		return iq_read;
	}

	public void setIq_read(String iq_read)
	{
		this.iq_read = iq_read;
	}
	
	
	
	
	
}
