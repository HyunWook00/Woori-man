
package com.woori.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.woori.dto.GroupDTO;
import com.woori.dto.LoginDTO;
import com.woori.dto.UserDTO;
import com.woori.util.DBConn;


public class LoginDAO 
{
	
	private Connection conn;
	
	// 데이터베이스 연결
	public void connection() throws ClassNotFoundException, SQLException
	{
		conn = DBConn.getConnection();
	}
	
	// 데이터베이스 연결 해제
	public void close() throws SQLException
	{
		DBConn.close();
	}
	
	// 아이디 중복 체크 여부 확인 메소드
	public int checkId(String us_id) throws SQLException
	{
		int result = 0;
		
		String sql = "SELECT COUNT(US_ID) AS COUNT FROM USERS WHERE US_ID = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, us_id);
		
		ResultSet rs = pstmt.executeQuery();
		while (rs.next())
			result = rs.getInt("COUNT");
		
		rs.close();
		pstmt.close();
		
		return result;
	}
	
	
	// 전화번호 중복 체크 확인 메소드
	public int checkTel(String us_tel) throws SQLException
	{
		int result = 0;
		
		String sql = "SELECT COUNT(US_TEL) AS COUNT FROM USER_INFO WHERE US_TEL = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, us_tel);
		
		ResultSet rs = pstmt.executeQuery();
		while (rs.next())
			result = rs.getInt("COUNT");
		
		rs.close();
		pstmt.close();
		
		return result;
	}
	

	// 회원가입 처리 메소드
	//
	public int membership(UserDTO dto) throws SQLException 
	{
		int result = 0;
		
		String sql = "{call PRC_USER_INSERT(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";
		CallableStatement cstmt = conn.prepareCall(sql);
		cstmt.setString(1, dto.getUs_id());
		cstmt.setString(2, dto.getUs_pwd());
		cstmt.setString(3, dto.getUs_name());
		cstmt.setString(4, dto.getUs_birthday());
		cstmt.setString(5, dto.getUs_lunar());
		cstmt.setString(6, dto.getUs_zipcode());
		cstmt.setString(7, dto.getUs_addr1());
		cstmt.setString(8, dto.getUs_addr2());
		cstmt.setString(9, dto.getUs_tel());
		cstmt.setString(10, dto.getUs_email());
		
		result = cstmt.executeUpdate();
		
		cstmt.close();
		
		return result;
	}
	
	
	
	// 로그인 처리 메소드
	// 아이디와 비밀번호에 맞는 회원의 이름을 받아옴
	public LoginDTO login(String id, String pwd) throws SQLException, ClassNotFoundException
	{
		
		LoginDTO result = new LoginDTO();

		String sql = "SELECT US_CODE, UW_CODE FROM USER_VIEW WHERE US_ID = ? AND US_PWD = CRYPTPACK.ENCRYPT(?, ?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, pwd);
		pstmt.setString(3, pwd);
		
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			result.setUs_code(rs.getString("US_CODE"));
			result.setUw_code(rs.getString("UW_CODE"));
		}
		
		rs.close();
		pstmt.close();
		
		return result;
	}
	
	// UserDTO 구성 메소드
	public UserDTO setUser(String us_code) throws SQLException
	{
		UserDTO dto = new  UserDTO();
		
		String sql = "SELECT US_CODE, US_ID, US_NAME, US_BIRTHDAY, US_LUNAR, US_TEL, US_EMAIL, US_PROFILE"
				+ ", US_SIGNUP, US_ZIPCODE, US_ADDR1, US_ADDR2 FROM USER_VIEW WHERE US_CODE = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, us_code);
		
		ResultSet rs = pstmt.executeQuery();
		while(rs.next())
		{
			dto.setUs_code(rs.getString("US_CODE"));
			dto.setUs_id(rs.getString("US_ID"));
			dto.setUs_name(rs.getString("US_NAME"));
			dto.setUs_birthday(rs.getString("US_BIRTHDAY"));
			dto.setUs_lunar(rs.getString("US_LUNAR"));
			dto.setUs_tel(rs.getString("US_LUNAR"));
			dto.setUs_email(rs.getString("US_EMAIL"));
			dto.setUs_profile(rs.getString("US_PROFILE"));
			dto.setUs_signup(rs.getString("US_SIGNUP"));
			dto.setUs_zipcode(rs.getString("US_ZIPCODE"));
			dto.setUs_addr1(rs.getString("US_ADDR1"));
			dto.setUs_addr2(rs.getString("US_ADDR2"));
		};
		
		return dto;
	}
	
	
	
	
	// 아이디 찾기 메소드
	// 사용자의 이름, 생년월일, 전화번호를 입력받아 
	// 사용자의 아이디를 찾아오는 메소드
	public String searchId(String us_name, String us_birthday, String us_tel) throws SQLException
	{
		String result = null;
		
		String sql = "SELECT US_ID FROM USER_VIEW WHERE US_NAME = ? AND US_BIRTHDAY = ? AND US_TEL = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, us_name);
		pstmt.setString(2, us_birthday);
		pstmt.setString(3, us_tel);
		
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next())
			result = rs.getString("US_ID");
		
		rs.close();
		pstmt.close();
		
		return result;
	}
	
	// 비밀번호 찾기 
	// 사용자의 아이디, 이름, 생년월일을 입력받아
	// 사용자의 비밀번호 존재 여무를 확인
	public LoginDTO searhPwd(String us_id, String us_name, String us_tel) throws SQLException
	{
		LoginDTO result = new LoginDTO();
		
		String sql = "SELECT US_CODE, US_PWD FROM USER_VIEW WHERE US_ID = ? AND US_NAME = ? AND US_BIRTHDAY = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, us_id);
		pstmt.setString(2, us_name);
		pstmt.setString(3, us_tel);
		
		ResultSet rs = pstmt.executeQuery();
		while (rs.next())
		{
			result.setUs_code(rs.getString("US_CODE"));
			result.setUs_pwd(rs.getString("US_PWD"));
		}
		
		rs.close();
		pstmt.close();
		
		return result;
	}
	
	
	
	
	// 비밀번호 재설정 액션 메소드
	// 미리얻어온 사용자 정보와 사용자가 입력한 새로운 비밀번호를
	// 이용하여 비밀번호를 update 한다
	public int modifyPwd(String us_code, String us_pwd) throws SQLException
	{
		int result = 0;
		
		String sql = "UPDATE USERS SET US_PWD = CRYPTPACK.ENCRYPT(?, ?) WHERE US_CODE = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, us_pwd);
		pstmt.setString(2, us_pwd);
		pstmt.setString(3, us_code);
		
		result = pstmt.executeUpdate();
		
		pstmt.close();
		
		
		return result;
	}


	
	// 그룹 리스트 뿌려주기
	public ArrayList<GroupDTO> groupList(String us_code) throws SQLException
	{
		ArrayList<GroupDTO> result = new ArrayList<GroupDTO>();
		
		
		String sql = "SELECT MGV.CG_CODE, MGV.CG_NAME, MGV.GC_CODE, MGV.CG_INTRO, TO_CHAR(MGV.CG_DATE, 'YYYY-MM-DD') AS CG_DATE"
				+ ", NVL(MGV.GB_CODE, 0) AS GB_CODE, MGV.GM_CODE"
				+ ", (SELECT COUNT(MGV2.CG_CODE) FROM MY_GROUP_VIEW MGV2 WHERE MGV2.CG_CODE = MGV.CG_CODE) AS COUNT"
				+ " FROM MY_GROUP_VIEW MGV"
				+ " WHERE US_CODE2 = ? AND CGL_CODE IS NULL AND GW_CODE IS NULL"
				+ " ORDER BY GB_CODE DESC";

		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, us_code);
		
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next())
		{
			GroupDTO dto = new GroupDTO();
			
			dto.setCg_code(rs.getString("CG_CODE"));
			dto.setCg_name(rs.getString("CG_NAME"));
			dto.setGc_code(rs.getString("GC_CODE"));
			dto.setCg_intro(rs.getString("CG_INTRO"));
			dto.setCg_date(rs.getString("CG_DATE"));
			dto.setGb_code(rs.getInt("GB_CODE"));
			dto.setGm_code(rs.getString("GM_CODE"));
			dto.setG_count(rs.getInt("COUNT"));
			
			result.add(dto);
		}
		
		rs.close();
		pstmt.close();
		
		return result;
	}

}
