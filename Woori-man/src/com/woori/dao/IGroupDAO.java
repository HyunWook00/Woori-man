package com.woori.dao;

import java.util.ArrayList;

// 2024-02-28 노은하
// 그룹 데이터 처리 dao
public interface IGroupDAO
{
	public int countGroupMember(String cg_code);
	public int countAttendMember(String mt_code);
	public int countNotAttendMember(String mt_code);
	
	public ArrayList<GroupMemberDTO> searchAttendMemberList(String mt_code);
	public ArrayList<GroupMemberDTO> searchNotAttendMemberList(String mt_code);
}
