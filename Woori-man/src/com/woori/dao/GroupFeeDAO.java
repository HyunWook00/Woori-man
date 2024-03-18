package com.woori.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.websocket.MessageHandler.Whole;

import com.woori.dto.GroupFeeDTO;
import com.woori.util.DBConn;

public class GroupFeeDAO
{
	// 데이터베이스 연결 변수 생성
	private Connection conn;
	
	// 사용자 정의 생성자 생성
	public GroupFeeDAO() 
	{
		try
		{
			conn = DBConn.getConnection();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
	}
	
	// 데이터베이스 연결 해제 
	public void close() 
	{
		try
		{
			DBConn.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
	}
	
	// 그룹별 설정된 회비 조회
	public GroupFeeDTO groupFeeList(String cg_code)
	{
		GroupFeeDTO result = new GroupFeeDTO();
		
		try
		{
			String sql = "SELECT GF_CODE, GF_AMOUNT, TO_CHAR(GF_DATE,'YYYY-MM-DD') AS GF_DATE , TO_CHAR(GF_START,'YYYY-MM-DD') AS GF_START"
					+ ", CG_CODE, GM_NICKNAME FROM GROUP_FEE GF JOIN GROUP_MEMBER GM ON GF.GM_CODE = GM.GM_CODE WHERE CG_CODE = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(cg_code));
			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next())
			{
				result.setGf_amount(rs.getInt("GF_AMOUNT"));
				result.setGf_date(rs.getString("GF_DATE"));
				result.setGf_start(rs.getString("GF_START"));
				result.setGm_nickname(rs.getString("GM_NICKNAME"));
				result.setGf_code(rs.getString("GF_CODE"));
			}
			
			rs.close();
			pstmt.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		return result; 
	}
		
	// 그룹 회비 설정 
	public int groupFeeInsert(GroupFeeDTO dto , String cg_code)
	{
		int result = 0;

		try
		{
			String sql = "INSERT INTO GROUP_FEE (GF_CODE, GF_AMOUNT, GF_DATE, GF_START, CG_CODE, GM_CODE)"
					+ " VALUES (SEQ_GROUP_FEE.NEXTVAL,?, SYSDATE, ?, ?, ?)";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getGf_amount());
			pstmt.setString(2, dto.getGf_start());
			pstmt.setString(3, cg_code);
			pstmt.setString(4, dto.getGm_code());
			
			result = pstmt.executeUpdate();
			pstmt.close();

		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		return result; 
	}
	
	
	// 그룹 회비 업데이트 
	public int groupFeeModify(GroupFeeDTO dto)
	{
		int result = 0;
		
		try
		{
			String sql = "UPDATE GROUP_FEE SET GF_AMOUNT = ?, GF_DATE = SYSDATE"
					+ " , GF_START = ?, GM_CODE = ? WHERE GF_CODE = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, dto.getGf_amount());
			pstmt.setString(2, dto.getGf_start());
			pstmt.setInt(3, Integer.parseInt(dto.getGm_code()));
			pstmt.setInt(4, Integer.parseInt(dto.getGf_code()));
			
			//System.out.println("DAO 진입");
			//System.out.println(dto.getGf_amount());
			//System.out.println(dto.getGf_code());
			//System.out.println(dto.getGf_start());
			//System.out.println(dto.getGm_code());
			
			result = pstmt.executeUpdate();
			
			pstmt.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
	}
	
	
	// 회비 납부한 그룹원 확인 
	public ArrayList<GroupFeeDTO> groupFeeInsertList(String cg_code)
	{
		ArrayList<GroupFeeDTO> result = new ArrayList<GroupFeeDTO>();
		
		try
		{
			String sql = "SELECT GM_NICKNAME, POS_CODE, GFI_CODE ,GFI_DATE, GFI_AMOUNT, GM_CODE1, CG_CODE"
					+ " FROM GROUP_MEMBER_FEE_LIST_VIEW WHERE CG_CODE = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(cg_code));
			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next())
			{
				GroupFeeDTO dto = new GroupFeeDTO();
				dto.setGfi_code(rs.getString("GFI_CODE"));
				dto.setGfi_date(rs.getString("GFI_DATE"));
				dto.setGm_nickname(rs.getString("GM_NICKNAME"));
				dto.setGm_code(rs.getString("GM_CODE1"));
				dto.setGfi_amount(rs.getInt("GFI_AMOUNT"));
				
				//System.out.println(dto.getGfi_code());
				//System.out.println(dto.getGf_date());
				//System.out.println(dto.getGm_nickname());
				//System.out.println(dto.getGm_code());
				//System.out.println(dto.getGfi_amount());
				
				result.add(dto);
			}

			rs.close();
			pstmt.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		//System.out.println("DAO나감");
		
		return result;
	}
	
	// 그룹원 회비 납부 체크 (group_fee_insert)
	public int groupFeeInsertCheck(GroupFeeDTO dto, String gm_code1)
	{
		int result = 0;
		try
		{
			String sql = "INSERT INTO GROUP_FEE_INSERT (GFI_CODE, GFI_DATE, GFI_AMOUNT, GF_CODE, GM_CODE1, GM_CODE2)"
					+ " VALUES (SEQ_GROUP_FEE_INSERT.NEXTVAL, SYSDATE,?,?,?,?)";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getGfi_amount());
			pstmt.setInt(2, Integer.parseInt(dto.getGf_code()));
			pstmt.setString(4, gm_code1);
			pstmt.setString(3, dto.getGm_code());
			
			result = pstmt.executeUpdate();
			pstmt.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
	}
	
}
