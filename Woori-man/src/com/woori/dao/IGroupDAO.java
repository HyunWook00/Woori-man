package com.woori.dao;

import java.util.ArrayList;

import com.woori.dto.GroupMemberDTO;

// 그룹 데이터 처리 dao
public interface IGroupDAO
{
	public int countGroupMember(String cg_code);
	public int countAttendMember(String mt_code);
	public int countNotAttendMember(String mt_code);
	
	public ArrayList<GroupMemberDTO> searchAttendMemberList(String mt_code);
	public ArrayList<GroupMemberDTO> searchNotAttendMemberList(String mt_code);
}
