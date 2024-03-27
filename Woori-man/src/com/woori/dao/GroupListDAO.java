package com.woori.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

import com.woori.dto.GroupDTO;
import com.woori.util.DBConn;

public class GroupListDAO
{
	private DataSource dataSource;
	
	public DataSource getDataSource()
	{
		return dataSource;
	}

	public void setDataSource(DataSource dataSource)
	{
		this.dataSource = dataSource;
	}
	
	
	// 3/6 그룹 검색 메소드 추가

	// 나의 가입그룹 상세조회 리스트 → 폐쇄된 그룹인지 확인 후 조회되도록 수정
		public ArrayList<GroupDTO> myGrouplist(String us_code) throws SQLException, ClassNotFoundException
		{
			Connection conn = null;
			conn = DBConn.getConnection();
			
			ArrayList<GroupDTO> result = new ArrayList<GroupDTO>();
			
			// ○그룹명, 그룹프사, 그룹멤버등록일, 그룹카테고리, 그룹장닉네임, 그룹한줄소개, 그룹즐겨찾기여부
			// → 그룹장닉네임, 그룹즐겨찾기 여부(메소드추가)
			String sql = "SELECT CG_NAME, CG_PROFILE, GC_NAME, CG_INTRO FROM USERGROUPLIST_VIEW WHERE US_CODE = ?";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,us_code);
			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next())
			{
				GroupDTO dto = new GroupDTO();
				
				dto.setCg_name(rs.getString("CG_NAME"));
				dto.setCg_profile(rs.getString("CG_PROFILE"));
				
				dto.setGc_name(rs.getString("GC_NAME"));			
				dto.setCg_intro(rs.getString("CG_INTRO"));
				
				result.add(dto);
			}
			
			
			rs.close();
			pstmt.close();
			DBConn.close();
			
			return result;
		}
		
	/*
	// 내 그룹의 그룹장 닉네임 조회
	public GroupDTO groupLeader(int cg_code) throws ClassNotFoundException, SQLException
	{
		Connection conn = null;
		conn = DBConn.getConnection();

		GroupDTO result = new GroupDTO();
		
		String sql = "SELECT GM_NICKNAME FROM VIEW_GROUPLEADER WHERE CG_CODE = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, cg_code);
		
		ResultSet rs = pstmt.executeQuery();
		
		if (rs.next())
		{
			result.setGm_nickname(rs.getString("GM_NICKNAME"));
		}
		
		rs.close();
		pstmt.close();
		DBConn.close();
		
		return result;
	
	}
	
	//--------------------------------------------------------------
	
	// 특정 그룹의 최근 활동일 조회 
	public GroupDTO recentDate() throws ClassNotFoundException, SQLException
	{
		
		GroupDTO result = new GroupDTO();
		
		Connection conn = null;
		conn = DBConn.getConnection();
		
		//String result = "";
		
		String sql = "SELECT TO_CHAR(RECENT_DATE, 'YYYY-MM-DD') AS RECENT_DATE FROM VIEW_RECENT";
		PreparedStatement pstmt = conn.prepareStatement(sql);

		
		ResultSet rs = pstmt.executeQuery();
		
		if (rs.next())
		{
			result.setRecent_date(rs.getString("RECENT_DATE"));
		}
		
		rs.close();
		pstmt.close();
		DBConn.close();
		
		return result;
		
	}
	*/
	
	// 대기 그룹 리스트 조회  → 그룹원 정보 등록 버튼 클릭시 그룹메인으로 이동
		public ArrayList<GroupDTO> waitingGroupList(String us_code) throws ClassNotFoundException, SQLException
		{
			Connection conn = null;
			conn = DBConn.getConnection();
			
			ArrayList<GroupDTO> result = new ArrayList<GroupDTO>();
			
			//○ 그룹명, 그룹프사, 그룹카테고리, 그룹장닉네임, 그룹한줄소개, 그룹초대응답일
			// → 그룹카테고리, 그룹장닉네임 추가
			/*
			 * String sql = "SELECT CG_PROFILE, CG_NAME, CG_INTRO, GI_RESPONSE " +
			 * " FROM VIEW_USERGROUPLIST WHERE US_CODE =? AND RS_CODE = 1 AND GI_RESPONSE IS NOT NULL AND GM_REGDATE IS NULL"
			 * ;
			 */
			
			
			//String sql = "SELECT CG_NAME, CG_PROFILE, GC_NAME, CG_INTRO, GI_RESPONSE FROM VIEW_WAITINGGROUPLIST WHERE US_CODE = ?";
			String sql = "SELECT CG_NAME, CG_PROFILE, GC_NAME, CG_INTRO FROM WAITINGGROUPLIST_VIEW WHERE US_CODE = ?";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,us_code);
			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next())
			{
				GroupDTO dto = new GroupDTO();
				
				
				dto.setCg_name(rs.getString("CG_NAME"));
				dto.setCg_profile(rs.getString("CG_PROFILE"));
				dto.setGc_name(rs.getString("GC_NAME"));			
				dto.setCg_intro(rs.getString("CG_INTRO"));
				//dto.setGi_response(rs.getString("GI_RESPONSE"));
				//dto.setGm_Nickname(rs.getString("GM_NICKNAME"));
				
				result.add(dto);
			}
			
			rs.close();
			pstmt.close();
			DBConn.close();
			
			return result;
		}
		
		
		// 초대 받은 그룹 리스트 조회 → 차단하지 않은 그룹만 조회 추가완료
		public ArrayList<GroupDTO> inviteGroupList(String us_code) throws ClassNotFoundException, SQLException
		{
			Connection conn = null;
			conn = DBConn.getConnection();
			
			//int us_Code = 1;
			
			ArrayList<GroupDTO> result = new ArrayList<GroupDTO>();
			
			//○ 그룹명, 그룹프사, 그룹장닉네임, 그룹한줄소개, 그룹초대발신일
			//→ 그룹장닉네임, 그룹초대발신일 추가
			String sql = "SELECT CG_NAME, CG_PROFILE, CG_INTRO, GI_CODE, CG_CODE FROM INVITEGROUP_VIEW WHERE US_CODE = ?";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1,Integer.parseInt(us_code));
			
			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next())
			{
				GroupDTO dto = new GroupDTO();
				dto.setCg_name(rs.getString("CG_NAME"));
				dto.setCg_profile(rs.getString("CG_PROFILE"));
				dto.setCg_intro(rs.getString("CG_INTRO"));
				dto.setGi_code(rs.getString("GI_CODE"));
				dto.setCg_code(rs.getString("CG_CODE"));
				//dto.setGi_request(rs.getString("GI_REQUEST"));
				
				result.add(dto);
			}
			
			rs.close();
			pstmt.close();
			DBConn.close();
			
			return result;
		}
		
		// 차단한 그룹리스트 조회
		public ArrayList<GroupDTO> blockedGroupList(String us_code) throws ClassNotFoundException, SQLException
		{
			Connection conn = null;
			conn = DBConn.getConnection();
			
			ArrayList<GroupDTO> result = new ArrayList<GroupDTO>();
			
			String sql = "SELECT CG_NAME, CG_INTRO, GC_NAME, CG_CODE, GI_CODE FROM BLOCKEDGROUP_VIEW WHERE US_CODE = ?";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, us_code);
			
			ResultSet rs = pstmt.executeQuery();
			while (rs.next())
			{
				GroupDTO dto = new GroupDTO();
				dto.setCg_name(rs.getString("CG_NAME"));
				dto.setCg_intro(rs.getString("CG_INTRO"));
				dto.setGc_name(rs.getString("GC_NAME"));
				dto.setCg_code(rs.getString("CG_CODE"));
				dto.setGi_code(rs.getString("GI_CODE"));
				
				result.add(dto);
			}
			
			rs.close();
			pstmt.close();
			DBConn.close();
			
			return result;
		}
		
	
	
		// 초대 수락 버튼 클릭 시 그룹 초대 테이블 업데이트  (수락시 대기그룹으로 이동)
		public int accept(String gi_code) throws ClassNotFoundException, SQLException
		{
			int result = 0;
			
			Connection conn = null;
			conn = DBConn.getConnection();
			
			String sql = "UPDATE GROUP_INVITE SET GI_RESPONSE = SYSDATE, RS_CODE = 1 WHERE GI_CODE = ?";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, gi_code);
			
			result = pstmt.executeUpdate();
			
			pstmt.close();
			DBConn.close();
			
			return result;
		}


		// 초대 거절 버튼 클릭 시 그룹 초대 테이블 업데이트 (테스트 X)
		// + 그룹 → 그룹을 차단하시겠습니까?  → 거절만 할게요
		public int refuse(String gi_code) throws ClassNotFoundException, SQLException
		{
			int result = 0;
			
			Connection conn = null;
			conn = DBConn.getConnection();
			
			String sql = "UPDATE GROUP_INVITE SET GI_RESPONSE = SYSDATE, RS_CODE = 2 WHERE GI_CODE = ?";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, gi_code);
			
			result = pstmt.executeUpdate();
			
			pstmt.close();
			DBConn.close();
			
			return result;
		}
		
		// 그룹 초대거절 → 차단할래요 버튼 클릭시 그룹차단테이블 업데이트
		public int block(String us_code, String cg_code) throws ClassNotFoundException, SQLException
		{
			int result = 0;
			
			Connection conn = null;
			conn = DBConn.getConnection();
			
			String sql = "INSERT INTO BLOCKED_GROUP(BG_CODE, CG_CODE, US_CODE, BG_DATE) VALUES(SEQ_BLOCKED_GROUP.NEXTVAL, ?, ?, SYSDATE)";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(cg_code));
			pstmt.setInt(2, Integer.parseInt(us_code));
			
			result = pstmt.executeUpdate();
			
			pstmt.close();
			DBConn.close();
			
			return result;
		}
		
		// 그룹 차단 해제 버튼 클릭시 → ① 차단테이블에서 해당 그룹 삭제
		public int unblock(String us_code, String cg_code) throws ClassNotFoundException, SQLException
		{
			int result = 0;
			
			Connection conn = null;
			conn = DBConn.getConnection();
			
			String sql = "DELETE FROM BLOCKED_GROUP WHERE US_CODE = ? AND CG_CODE = ?";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(us_code));
			pstmt.setString(2, cg_code);
			
			result = pstmt.executeUpdate();
			
			pstmt.close();
			DBConn.close();
			
			return result; 
			
		}

		// 3/26 추가
		// 그룹 차단 해제 버튼 클릭시 → ② 초대그룹으로 돌아가도록.. gi_response , rs_code = null
		public int unblockBack(String us_code, String cg_code) throws ClassNotFoundException, SQLException
		{
			int result = 0;
			
			Connection conn = null;
			conn = DBConn.getConnection();
			
			String sql = "UPDATE GROUP_INVITE SET GI_RESPONSE = NULL, RS_CODE = NULL WHERE CG_CODE = ?";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(us_code));
			
			result = pstmt.executeUpdate();
			
			pstmt.close();
			DBConn.close();
			
			return result;
		}
		
		// 그룹원 정보 입력 메소드
		public int groupMemberInsert(String gi_code, String gm_nickname, String gm_profile, String gm_intro) throws SQLException, ClassNotFoundException
		{
			int result = 0;
			
			Connection conn = null;
			conn = DBConn.getConnection();
			
			String sql = "INSERT INTO GROUP_MEMBER(GM_CODE, GI_CODE, GM_NICKNAME, GM_PROFILE, GM_INTRO) VALUES(SEQ_GROUP_MEMBER.NEXTVAL, ?, ?, ?, ?)";
			PreparedStatement pstmt = null;
			if (gm_profile.equals("") || gm_profile == null)
			{
				sql = "INSERT INTO GROUP_MEMBER(GM_CODE, GI_CODE, GM_NICKNAME, GM_PROFILE, GM_INTRO) VALUES(SEQ_GROUP_MEMBER.NEXTVAL, ?, ?, NULL, ?)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, Integer.parseInt(gi_code));
				pstmt.setString(2, gm_nickname);
				pstmt.setString(3, gm_intro);
			}
			else if (gm_intro.equals("") || gm_intro == null)
			{
				sql = "INSERT INTO GROUP_MEMBER(GM_CODE, GI_CODE, GM_NICKNAME, GM_PROFILE, GM_INTRO) VALUES(SEQ_GROUP_MEMBER.NEXTVAL, ?, ?, ?, NULL)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, Integer.parseInt(gi_code));
				pstmt.setString(2, gm_nickname);
				pstmt.setString(3, gm_profile);
			}
			else if (gm_profile.equals("") || gm_profile == null && gm_intro.equals("") || gm_intro == null)
			{
				sql = "INSERT INTO GROUP_MEMBER(GM_CODE, GI_CODE, GM_NICKNAME, GM_PROFILE, GM_INTRO) VALUES(SEQ_GROUP_MEMBER.NEXTVAL, ?, ?, NULL, NULL)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, Integer.parseInt(gi_code));
				pstmt.setString(2, gm_nickname);
			}
			
			result = pstmt.executeUpdate();
			pstmt.close();
			
			DBConn.close();
			
			return result;
		}
		
	
}
