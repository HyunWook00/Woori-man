package com.woori.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.woori.dto.BoardDTO;
import com.woori.dto.CommentDTO;
import com.woori.dto.RecommentDTO;
import com.woori.util.DBConn;

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
	public ArrayList<CommentDTO> getCommentList(String brd_code, String gm_code)
	{
		ArrayList<CommentDTO> result = new ArrayList<CommentDTO>();
		
		try
		{
			String sql = "SELECT BC_CODE, BC_DATE, BC_CONTENT, GM_CODE, GM_NICKNAME, BRD_CODE, GM_PROFILE, BC_LIKE, (SELECT COUNT(*) FROM BOARD_COMMENT_LIKE BCL WHERE BCL.BC_CODE = TBL.BC_CODE AND BCL.GM_CODE = ?) AS BC_LIKE_CHECK FROM VIEW_BOARD_COMMENT TBL WHERE BRD_CODE = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(gm_code));
			pstmt.setInt(2, Integer.parseInt(brd_code));
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
				dto.setCommentLikeCheck(rs.getString("BC_LIKE_CHECK"));
				
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
	
	// 게시글 대댓글 리스트 출력
	public ArrayList<RecommentDTO> getRecommentList(String bc_code, String gm_code)
	{
		ArrayList<RecommentDTO> result = new ArrayList<RecommentDTO>();
		
		try
		{
			String sql = "SELECT BR_CODE, BR_DATE, BR_CONTENT, GM_CODE, GM_NICKNAME, BC_CODE, GM_PROFILE, BR_LIKE, (SELECT COUNT(*) FROM BOARD_RECOMMENT_LIKE BRL WHERE BRL.BR_CODE = TBL.BR_CODE AND BRL.GM_CODE = ?) AS BR_LIKE_CHECK FROM BOARD_RECOMMENT_VIEW TBL WHERE BC_CODE = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(gm_code));
			pstmt.setInt(2, Integer.parseInt(bc_code));
			ResultSet rs = pstmt.executeQuery();
			while (rs.next())
			{
				RecommentDTO dto = new RecommentDTO();
				dto.setCommentCode(rs.getString("BC_CODE"));
				dto.setRecommentCode(rs.getString("BR_CODE"));
				dto.setRecommentContent(rs.getString("BR_CONTENT"));
				dto.setRecommentDate(rs.getString("BR_DATE"));
				dto.setRecommentLikeCheck(rs.getString("BR_LIKE_CHECK"));
				dto.setRecommentLikeCount(rs.getString("BR_LIKE"));
				dto.setRecommentWriterCode(rs.getString("GM_CODE"));
				dto.setRecommentWriterName(rs.getString("GM_NICKNAME"));
				dto.setRecommentWriterProfile(rs.getString("GM_PROFILE"));
				
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
	
	// 대댓글 좋아요 입력
	public int insertRecommentLike(String br_code, String gm_code)
	{
		int result = 0;
		
		try
		{
			String sql = "INSERT INTO BOARD_RECOMMENT_LIKE(BRL_CODE, BR_CODE, GM_CODE) VALUES (SEQ_BOARD_RECOMMENT_LIKE.NEXTVAL, ?, ?)";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(br_code));
			pstmt.setInt(2, Integer.parseInt(gm_code));
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
	
	// 대댓글 좋아요 취소
	public int deleteRecommentLike(String br_code, String gm_code)
	{
		int result = 0;
		
		try
		{
			String sql = "DELETE FROM BOARD_RECOMMENT_LIKE WHERE GM_CODE = ? AND BR_CODE = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(gm_code));
			pstmt.setInt(2, Integer.parseInt(br_code));
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
	
	// 대댓글 좋아요 갯수 출력
	public int countRecommentLike(String br_code)
	{
		int result = 0;
		
		try
		{
			String sql = "SELECT COUNT(*) AS COUNT FROM BOARD_RECOMMENT_LIKE WHERE BR_CODE = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(br_code));
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
	
	// 댓글 입력
	public int insertComment(CommentDTO dto)
	{
		int result = 0;
		
		try
		{
			String sql = "INSERT INTO BOARD_COMMENT(BC_CODE, BC_CONTENT, BRD_CODE, GM_CODE) VALUES(SEQ_BOARD_COMMENT.NEXTVAL, ?, ?, ?)";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getCommentContent());
			pstmt.setInt(2, Integer.parseInt(dto.getArticleCode()));
			pstmt.setInt(3, Integer.parseInt(dto.getCommentWriterCode()));
			result = pstmt.executeUpdate();
			pstmt.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
	}
	
	// 댓글 수정
	public int updateComment(CommentDTO dto)
	{
		int result = 0;
		
		try
		{
			String sql = "UPDATE BOARD_COMMENT SET BC_CONTENT = ? WHERE BC_CODE = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getCommentContent());
			pstmt.setInt(2, Integer.parseInt(dto.getCommentCode()));
			result = pstmt.executeUpdate();
			pstmt.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
	}
	
	// 대댓글 수정
	public int updateRecomment(RecommentDTO dto)
	{
		int result = 0;
		
		try
		{
			String sql = "UPDATE BOARD_RECOMMENT SET BR_CONTENT = ? WHERE BR_CODE = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getRecommentContent());
			pstmt.setInt(2, Integer.parseInt(dto.getRecommentCode()));
			result = pstmt.executeUpdate();
			pstmt.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
	}
	
	// 댓글 삭제
	public int deleteComment(String bc_code)
	{
		int result = 0;
		
		try
		{
			String sql = "DELETE FROM BOARD_COMMENT WHERE BC_CODE = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(bc_code));
			result = pstmt.executeUpdate();
			pstmt.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
	}
	
	// 대댓글 입력
	public int insertRecomment(RecommentDTO dto)
	{
		int result = 0;
		
		try
		{
			String sql = "INSERT INTO BOARD_RECOMMENT(BR_CODE, BR_CONTENT, BC_CODE, GM_CODE) VALUES(SEQ_BOARD_RECOMMENT.NEXTVAL, ?, ?, ?)";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getRecommentContent());
			pstmt.setInt(2, Integer.parseInt(dto.getCommentCode()));
			pstmt.setInt(3, Integer.parseInt(dto.getRecommentWriterCode()));
			result = pstmt.executeUpdate();
			pstmt.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
	}
	
	// 페이징 처리 적용 자유게시판 게시글 목록 출력 메소드
	public ArrayList<BoardDTO> getBoardList(String cg_code, int start, int end, String key, String value)
	{
		ArrayList<BoardDTO> result = new ArrayList<BoardDTO>();
		
		try
		{
			value = "%" + value + "%";
			String sql = "SELECT RNUM, BRD_CODE, CG_CODE, GM_CODE, GM_NICKNAME, BRD_DATE, BRD_SUBJECT, BRD_CONTENT, BRD_VIEW, BRD_LIKE" + 
					" FROM (SELECT ROWNUM AS RNUM, DATA.* FROM(SELECT BRD_CODE, CG_CODE, GM_CODE, GM_NICKNAME, BRD_DATE, BRD_SUBJECT, BRD_CONTENT, BRD_VIEW, BRD_LIKE" + 
					" FROM VIEW_BOARD_LIST WHERE CG_CODE = ? AND " + key + " LIKE ? ORDER BY BRD_CODE DESC)DATA) WHERE RNUM >= ? AND RNUM <= ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(cg_code));
			pstmt.setString(2, value);
			pstmt.setInt(3, start);
			pstmt.setInt(4, end);
			
			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next())
			{
				BoardDTO dto = new BoardDTO();
				dto.setNum(rs.getInt("RNUM"));
				dto.setBrd_code(rs.getString("BRD_CODE"));
				dto.setCg_code(rs.getString("CG_CODE"));
				dto.setGm_code(rs.getString("GM_CODE"));
				dto.setGm_nickname(rs.getString("GM_NICKNAME"));
				dto.setBrd_date(rs.getString("BRD_DATE"));
				dto.setBrd_subject(rs.getString("BRD_SUBJECT"));
				dto.setBrd_content(rs.getString("BRD_CONTENT"));
				dto.setBrd_view(rs.getString("BRD_VIEW"));
				dto.setBrd_like(rs.getString("BRD_LIKE"));
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
	
	public int insertBoardReport(String brd_code, String gm_code)
	{
		int result = 0;
		
		try
		{
			String sql = "INSERT INTO BOARD_REPORT(BRDR_CODE, BRD_CODE, GM_CODE) VALUES(SEQ_BOARD_REPORT.NEXTVAL, ?, ?)";
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

}
