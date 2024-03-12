package com.woori.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

// 2024-03-05 노은하
// 자유게시글 관련 dao
public class BoardDAO
{
	public Connection conn;
	
	public BoardDAO()
	{
		try
		{
			conn = DBConn.getConnection();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
	}
	
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
	
	// 게시글 좋아요 갯수 얻어오기
	public int getArticleLike(String brd_code, String gm_code)
	{
		int result = 0;
		
		try
		{
			String sql = "SELECT COUNT(*) AS COUNT FROM BOARD_LIKE WHERE BRD_CODE = ? AND GM_CODE = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(brd_code));
			pstmt.setInt(2, Integer.parseInt(gm_code));
			ResultSet rs = pstmt.executeQuery();
			if (rs.next())
			{
				result = rs.getInt("COUNT");
			}
			rs.close();
			pstmt.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
	}
	
	// 게시글 좋아요 입력
	public int insertArticleLike(String brd_code, String gm_code)
	{
		int result = 0;
		
		try
		{
			String sql = "INSERT INTO BOARD_LIKE(BL_CODE, BRD_CODE, GM_CODE, BL_DATE) VALUES(SEQ_BOARD_LIKE.NEXTVAL, ?, ?, SYSDATE)";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(brd_code));
			pstmt.setInt(2, Integer.parseInt(gm_code));
			result = pstmt.executeUpdate();
			pstmt.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
	}
	
	// 게시글 좋아요 삭제
	public int deleteArticleLike(String brd_code, String gm_code)
	{
		int result = 0;
		
		try
		{
			String sql = "DELETE FROM BOARD_LIKE WHERE BRD_CODE = ? AND GM_CODE = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(brd_code));
			pstmt.setInt(2, Integer.parseInt(gm_code));
			result = pstmt.executeUpdate();
			pstmt.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
	}
	
	// 게시글 댓글 리스트 출력
	public ArrayList<CommentDTO> getCommentList(String brd_code)
	{
		ArrayList<CommentDTO> result = new ArrayList<CommentDTO>();
		
		try
		{
			String sql = "SELECT BC_CODE, BC_DATE, BC_CONTENT, GM_CODE, GM_NICKNAME, BRD_CODE, GM_PROFILE, BC_LIKE FROM VIEW_BOARD_COMMENT WHERE BRD_CODE = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(brd_code));
			ResultSet rs = pstmt.executeQuery();
			while (rs.next())
			{
				CommentDTO dto = new CommentDTO();
				dto.setCommentCode(rs.getString("BC_CODE"));
				dto.setCommentDate(rs.getString("BC_DATE"));
				dto.setCommentContent(rs.getString("BC_CONTENT"));
				dto.setCommentWriterCode(rs.getString("GM_CODE"));
				dto.setCommentWriterName(rs.getString("GM_NICKNAME"));
				dto.setArticleCode(rs.getString("BRD_CODE"));
				dto.setCommentWriterProfile(rs.getString("GM_PROFILE"));
				dto.setCommentLikeCount(rs.getString("BC_LIKE"));
				
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
	
	// 2024-03-07 노은하 이어서 작업
	
	// 로그인한 회원의 게시글 좋아요 여부 확인
	public int checkArticleLike(String brd_code, String gm_code)
	{
		int result = 0;
		
		try
		{
			String sql = "SELECT COUNT(*) AS COUNT FROM BOARD_LIKE WHERE BRD_CODE = ? AND GM_CODE = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(brd_code));
			pstmt.setInt(2, Integer.parseInt(gm_code));
			ResultSet rs = pstmt.executeQuery();
			if (rs.next())
				result = rs.getInt("COUNT");
			rs.close();
			pstmt.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
	}
	
	// 로그인한 회원이 좋아요한 댓글 목록 확인
	public int checkCommentLike(String bc_code, String gm_code)
	{
		int result = 0;
		
		try
		{
			String sql = "SELECT COUNT(*) AS COUNT FROM BOARD_COMMENT_LIKE WHERE GM_CODE = ? AND BC_CODE = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(gm_code));
			pstmt.setInt(2, Integer.parseInt(bc_code));
			ResultSet rs = pstmt.executeQuery();
			if (rs.next())
				result = rs.getInt("COUNT");
			rs.close();
			pstmt.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
	}
	
	// 댓글 좋아요 입력
	public int insertCommentLike(String bc_code, String gm_code)
	{
		int result = 0;
		
		try
		{
			String sql = "INSERT INTO BOARD_COMMENT_LIKE(BCL_CODE, GM_CODE, BC_CODE) VALUES(SEQ_BOARD_COMMENT_LIKE.NEXTVAL, ?, ?)";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(gm_code));
			pstmt.setInt(2, Integer.parseInt(bc_code));
			result = pstmt.executeUpdate();
			pstmt.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
	}
	
	// 댓글 좋아요 취소
	public int deleteCommentLike(String bc_code, String gm_code)
	{
		int result = 0;
		
		try
		{
			String sql = "DELETE FROM BOARD_COMMENT_LIKE WHERE GM_CODE = ? AND BC_CODE = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(gm_code));
			pstmt.setInt(2, Integer.parseInt(bc_code));
			result = pstmt.executeUpdate();
			pstmt.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
	}
	
	// 댓글 좋아요 갯수 출력
	public int countCommentLike(String bc_code)
	{
		int result = 0;
		
		try
		{
			String sql = "SELECT COUNT(*) AS COUNT FROM BOARD_COMMENT_LIKE WHERE BC_CODE = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(bc_code));
			ResultSet rs = pstmt.executeQuery();
			if (rs.next())
				result = rs.getInt("COUNT");
			rs.close();
			pstmt.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
	}

}
