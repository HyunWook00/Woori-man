package com.woori.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

// 2024-03-03 노은하
public class CityDAO
{
	public Connection conn;
	
	// 생성자 DB연결 메소드 호출 삽입
	public CityDAO()
	{
		try
		{
			conn = DBConn.getConnection();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
	}
	
	// DB 연결 해제 메소드
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
	
	// 지역(시, 도) 정보 리스트 출력 메소드
	public ArrayList<RegionDTO> getRegionList()
	{
		ArrayList<RegionDTO> result = new ArrayList<RegionDTO>();
		
		try
		{
			String sql = "SELECT RG_CODE, RG_NAME FROM REGION";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next())
			{
				RegionDTO dto = new RegionDTO();
				dto.setRg_code(rs.getString("RG_CODE"));
				dto.setRg_name(rs.getString("RG_NAME"));
				
				result.add(dto);
			}
			
			rs.close();
			pstmt.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
	}
	
	// 지역 코드별 도시 정보 리스트 출력 메소드
	public ArrayList<CityDTO> getCityList(String rg_code)
	{
		ArrayList<CityDTO> result = new ArrayList<CityDTO>();
		
		try
		{
			String sql = "SELECT RG_CODE, CT_CODE, CT_NAME FROM CITY WHERE RG_CODE = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(rg_code));
			ResultSet rs = pstmt.executeQuery();
			while (rs.next())
			{
				CityDTO dto = new CityDTO();
				dto.setRg_code(rs.getString("RG_CODE"));
				dto.setCt_code(rs.getString("CT_CODE"));
				dto.setCt_name(rs.getString("CT_NAME"));
				
				result.add(dto);
			}
			
			rs.close();
			pstmt.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
	}
	
}
