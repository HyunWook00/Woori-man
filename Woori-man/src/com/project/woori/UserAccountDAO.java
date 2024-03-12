/*======================
  	UserDAO.java 
=======================*/

package com.project.woori;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class UserAccountDAO
{
	// 나의 플랫폼 계정정보 조회
	public UserDTO myProfile() throws SQLException, ClassNotFoundException
	{
		// System.out.println("--------------");
		UserDTO result = new UserDTO();

		Connection conn = null;
		conn = DBConn.getConnection();
		
		//○ 회원이름, 회원아이디, 회원프로필사진, 회원전화번호, 회원이메일, 회원주소
		// → 3/7 회원 프로필 사진 데이터 추가
		String sql = "SELECT US_NAME, US_ID, US_PROFILE, US_TEL, US_EMAIL, US_ZIPCODE, US_ADDR1, US_ADDR2 FROM VIEW_USER WHERE US_CODE=3859105";

		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		//pstmt.setInt(1, Integer.parseInt(us_Code));

		ResultSet rs = pstmt.executeQuery();

		while (rs.next())
		{
			result.setUs_name(rs.getString("US_NAME"));
			result.setUs_id(rs.getString("US_ID"));
			result.setUs_profile(rs.getString("US_PROFILE"));
			result.setUs_tel(rs.getString("US_TEL"));
			result.setUs_email(rs.getString("US_EMAIL"));
			
			result.setUs_zipCode(rs.getString("US_ZIPCODE"));
			result.setUs_addr1(rs.getString("US_ADDR1"));
			result.setUs_addr2(rs.getString("US_ADDR2"));
			
			// System.out.println("--------------"+ rs.getString("US_EMAIL"));
		}

		rs.close();
		pstmt.close();

		DBConn.close();

		return result;
	}

	// 플랫폼 계정정보 수정 → 3/7 → 프로필 사진 데이터 추가
	// ○ 회원프사, 회원전화번호, 회원주소, 회원이메일, 양음력
	public int modify(UserDTO dto) throws SQLException, ClassNotFoundException
	{
		int result = 0;

		try
		{
			Connection conn = null;
			conn = DBConn.getConnection();

			String sql = "UPDATE USER_INFO SET US_PROFILE = ?, US_TEL = ?, US_ZIPCODE = ?, US_ADDR1 = ?, US_ADDR2 = ? "
						+ " ,US_EMAIL = ?, US_LUNAR = ? WHERE US_CODE = 3859105";

			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt = conn.prepareStatement(sql);
			
			//CallableStatement cstmt = null;
			//cstmt = conn.prepareCall(sql);
			
			pstmt.setString(1, dto.getUs_profile());
			pstmt.setString(2, dto.getUs_tel());
			pstmt.setString(3, dto.getUs_zipCode());
			pstmt.setString(4, dto.getUs_addr1());
			pstmt.setString(5, dto.getUs_addr2());
			pstmt.setString(6, dto.getUs_email());
			pstmt.setInt(7, dto.getUs_lunar());

			result = pstmt.executeUpdate();

			pstmt.close();
			DBConn.close();

		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		// Connection conn = dataSource.getConnection();
		
		return result;
	}
	
	// 입력한 비밀번호가 현재 비밀번호와 같은지 확인하는 메소드 → 풀리면 숫자, 안풀리면 특수문자가 보임
	public String pwdCheck(String us_pwd)
	{
		String result = "";
		//us_pwd = "2393726";
		
		try
		{
			Connection conn = null;
			conn = DBConn.getConnection();
			
			// userpwd1 입력 시 → 6627127(암호화안풀림 ) / 2393726(암호화풀림)
			String sql = "SELECT CRYPTPACK.DECRYPT(US_PWD, ?) FROM USERS WHERE US_CODE = 2393726";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, us_pwd);
			
			ResultSet rs = pstmt.executeQuery();
			while (rs.next())
			{
				result = rs.getString(1);
			}
			
			rs.close();
			pstmt.close();
			DBConn.close();
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		System.out.println("check 메소드 복호화 확인 : " + result);
		
		
		return result;
	}
	
	// 플랫폼 비밀번호 수정과 동시에 암호화 처리
	public int pwdModify(String us_pwd)
	{
		int result = 0;
		
		try
		{
			Connection conn = null;
			conn = DBConn.getConnection();
			UserDTO dto = new UserDTO();
			
			dto.setUs_pwd(us_pwd);
			dto.setUs_pwd2(us_pwd);
			
			String sql = "UPDATE USERS SET US_PWD = CRYPTPACK.ENCRYPT(?, ?) WHERE US_CODE = 2393726";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getUs_pwd());	// 새로운 비밀번호
			pstmt.setString(2, dto.getUs_pwd2());   // 새로운 비밀번호 복호화 키
			
			result = pstmt.executeUpdate();
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		System.out.println("modify 메소드 수정 비밀번호 확인 : " + us_pwd);
		
		return result;
	
	}
	

	// 플랫폼 비밀번호 수정
	public int pwdModify(UserDTO dto)
	{
		int result = 0;
		
		try
		{
			Connection conn = null;
			conn = DBConn.getConnection();
			
			String sql = "{call PRC_USERPWD_UPDATE (?, ?, ?)}";
			
			CallableStatement cstmt = null;
			cstmt = conn.prepareCall(sql);
			
			cstmt.setInt(1, dto.getUs_code());
			cstmt.setString(2, dto.getUs_pwd());
			cstmt.setString(3, dto.getUs_pwd2());
			
			result = cstmt.executeUpdate();
			
			cstmt.close();
			DBConn.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		return result;
	}
	
	
	
	// 탈퇴 전 직위가 있는지 카운트 (확인○)
	public int count()
	{
		int result = 0;
		
		try
		{
			Connection conn = null;
			conn = DBConn.getConnection();
			
			// 3859105 탈퇴버튼활성화 , 9513969(여행그룹장) 탈퇴버튼비활성화
			String sql = "SELECT COUNT(*) AS COUNT FROM VIEW_USERPOSITION WHERE US_CODE = 9513969";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			if (rs.next())
			{
				result = rs.getInt("COUNT");
			}
			
			rs.close();
			pstmt.close();
			DBConn.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
	}
	
	
	// 플랫폼 탈퇴 (테스트아직X)
	public int accountWthdr(UserDTO dto)
	{
		int result = 0;
		
		try
		{
			Connection conn = null;
			conn = DBConn.getConnection();
			
			String sql = "{call PRC_USER_WHTDR(?)}";
			
			CallableStatement cstmt = conn.prepareCall(sql);
			
			cstmt.setInt(1, dto.getUs_code());
				
			result = cstmt.executeUpdate();
			
			cstmt.close();
			DBConn.close();
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
	}
	
	
	

}
