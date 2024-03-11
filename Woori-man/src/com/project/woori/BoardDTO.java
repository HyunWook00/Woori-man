package com.project.woori;

// 2024-03-04 노은하
// 자유게시판 관련 사용자 정의 자료형
public class BoardDTO
{
	private int num;				// 게시글 번호
	private String brd_code;		// 자유게시글 코드
	private String cg_code;			// 그룹 코드
	private String cg_name;			// 그룹명
	private String gm_code;			// 작성자 코드
	private String gm_nickname;		// 작성자 닉네임
	private String brd_date;		// 작성일
	private String brd_subject;		// 자유게시글 제목
	private String brd_content;		// 자유게시글 내용
	private String brd_view;			// 자유게시글 조회수
	private String brd_like;			// 자유게시글 좋아요수
	
	// getter / setter 구성
	public int getNum()
	{
		return num;
	}
	public void setNum(int num)
	{
		this.num = num;
	}
	public String getBrd_code()
	{
		return brd_code;
	}
	public void setBrd_code(String brd_code)
	{
		this.brd_code = brd_code;
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
	public String getBrd_date()
	{
		return brd_date;
	}
	public void setBrd_date(String brd_date)
	{
		this.brd_date = brd_date;
	}
	public String getBrd_subject()
	{
		return brd_subject;
	}
	public void setBrd_subject(String brd_subject)
	{
		this.brd_subject = brd_subject;
	}
	public String getBrd_content()
	{
		return brd_content;
	}
	public void setBrd_content(String brd_content)
	{
		this.brd_content = brd_content;
	}
	public String getBrd_view()
	{
		return brd_view;
	}
	public void setBrd_view(String brd_view)
	{
		this.brd_view = brd_view;
	}
	public String getBrd_like()
	{
		return brd_like;
	}
	public void setBrd_like(String brd_like)
	{
		this.brd_like = brd_like;
	}
}
