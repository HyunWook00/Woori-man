package com.woori.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.woori.dto.CancelReasonDTO;
import com.woori.dto.CommentDTO;
import com.woori.dto.MeetingDTO;
import com.woori.dto.RecommentDTO;
import com.woori.util.DBConn;

// 2024-02-23 노은하
public class MeetingDAO
{
	public Connection conn;
	
	public MeetingDAO()
	{
		try
		{
			conn = DBConn.getConnection();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
	}
	
	// 새글수 출력 메소드 ok
	public int getArticleCount(String cg_code)
	{
		int result = 0;
		
		try
		{
			String sql = "SELECT COUNT(*) AS NEW FROM MEETING WHERE CG_CODE = ? AND TRUNC(MT_DATE) = TRUNC(SYSDATE)";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(cg_code));
			ResultSet rs = pstmt.executeQuery();
			if (rs.next())
				result = rs.getInt("NEW");
			
			rs.close();
			pstmt.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
	}
	
	// 모임 게시글 리스트 출력 메소드 ok
	public ArrayList<MeetingDTO> getMeetingList(String cg_code)
	{
		ArrayList<MeetingDTO> result = new ArrayList<MeetingDTO>();
		
		try
		{
			String sql = "SELECT ROW_NUMBER() OVER(ORDER BY MT_DATE DESC) AS NUM, MT_CODE, CG_CODE, CG_NAME, GM_CODE, GM_NICKNAME, MT_DATE, MT_UPDATE, MT_MEET, MT_VOTE, MT_TITLE, CT_CODE, CT_NAME, RG_CODE, RG_NAME"
						+ ", MT_STATUS, MT_ETC, MC_CODE, MC_NAME"
						+" FROM VIEW_MEETING_LIST WHERE CG_CODE = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(cg_code));
			ResultSet rs = pstmt.executeQuery();
			while (rs.next())
			{
				MeetingDTO dto = new MeetingDTO();
				dto.setNum(rs.getInt("NUM"));
				dto.setMt_code(rs.getString("MT_CODE"));
				dto.setCg_code(rs.getString("CG_CODE"));
				dto.setCg_name(rs.getString("CG_NAME"));
				dto.setGm_code(rs.getString("GM_CODE"));
				dto.setGm_nickname(rs.getString("GM_NICKNAME"));
				dto.setMt_date(rs.getString("MT_DATE"));
				dto.setMt_update(rs.getString("MT_UPDATE"));
				dto.setMt_meet(rs.getString("MT_MEET"));
				dto.setMt_vote(rs.getString("MT_VOTE"));
				dto.setMt_title(rs.getString("MT_TITLE"));
				dto.setCt_code(rs.getString("CT_CODE"));
				dto.setCt_name(rs.getString("CT_NAME"));
				dto.setRg_code(rs.getString("RG_CODE"));
				dto.setRg_name(rs.getString("RG_NAME"));
				dto.setMt_status(rs.getString("MT_STATUS"));
				dto.setMt_etc(rs.getString("MT_ETC"));
				dto.setMc_code(rs.getString("MC_CODE"));
				dto.setMc_name(rs.getString("MC_NAME"));
				
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
	
	// 페이징 처리용 모임 게시글 리스트 출력 메소드
	public ArrayList<MeetingDTO> getMeetingLists(String cg_code, int start, int end, String key, String value)
	{
		ArrayList<MeetingDTO> result = new ArrayList<MeetingDTO>();
		
		try
		{
			value = "%" + value + "%";
			String sql = "SELECT RNUM, MT_CODE, CG_CODE, CG_NAME, GM_CODE, GM_NICKNAME, MT_DATE, MT_UPDATE, MT_MEET, MT_VOTE, MT_TITLE, CT_CODE, CT_NAME, RG_CODE, RG_NAME, MT_STATUS, MT_ETC, MC_CODE, MC_NAME" + 
					" FROM (SELECT ROWNUM AS RNUM, DATA.* FROM (SELECT MT_CODE, CG_CODE, CG_NAME, GM_CODE, GM_NICKNAME, MT_DATE, MT_UPDATE, MT_MEET, MT_VOTE, MT_TITLE, CT_CODE, CT_NAME, RG_CODE, RG_NAME, MT_STATUS, MT_ETC, MC_CODE, MC_NAME" + 
					" FROM VIEW_MEETING_LIST WHERE CG_CODE = ? AND " + key + " LIKE ? ORDER BY MT_CODE DESC)DATA) WHERE RNUM >= ? AND RNUM <= ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(cg_code));
			pstmt.setString(2, value);
			pstmt.setInt(3, start);
			pstmt.setInt(4, end);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next())
			{
				MeetingDTO dto = new MeetingDTO();
				dto.setNum(rs.getInt("RNUM"));
				dto.setMt_code(rs.getString("MT_CODE"));
				dto.setCg_code(rs.getString("CG_CODE"));
				dto.setCg_name(rs.getString("CG_NAME"));
				dto.setGm_code(rs.getString("GM_CODE"));
				dto.setGm_nickname(rs.getString("GM_NICKNAME"));
				dto.setMt_date(rs.getString("MT_DATE"));
				dto.setMt_update(rs.getString("MT_UPDATE"));
				dto.setMt_meet(rs.getString("MT_MEET"));
				dto.setMt_vote(rs.getString("MT_VOTE"));
				dto.setMt_title(rs.getString("MT_TITLE"));
				dto.setCt_code(rs.getString("CT_CODE"));
				dto.setCt_name(rs.getString("CT_NAME"));
				dto.setRg_code(rs.getString("RG_CODE"));
				dto.setRg_name(rs.getString("RG_NAME"));
				dto.setMt_status(rs.getString("MT_STATUS"));
				dto.setMt_etc(rs.getString("MT_ETC"));
				dto.setMc_code(rs.getString("MC_CODE"));
				dto.setMc_name(rs.getString("MC_NAME"));
				
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
	
	// 페이징 처리용 확정된 모임 게시글 리스트 출력 메소드
	public ArrayList<MeetingDTO> getCompleteMeetingLists(String cg_code, int start, int end, String key, String value)
	{
		ArrayList<MeetingDTO> result = new ArrayList<MeetingDTO>();
		
		try
		{
			value = "%" + value + "%";
			String sql = "SELECT RNUM, MT_CODE, CG_CODE, CG_NAME, GM_CODE, GM_NICKNAME, MT_DATE, MT_UPDATE, MT_MEET, MT_VOTE, MT_TITLE, CT_CODE, CT_NAME, RG_CODE, RG_NAME, MT_STATUS, MT_ETC, MC_CODE, MC_NAME" + 
					" FROM (SELECT ROWNUM AS RNUM, DATA.* FROM (SELECT MT_CODE, CG_CODE, CG_NAME, GM_CODE, GM_NICKNAME, MT_DATE, MT_UPDATE, MT_MEET, MT_VOTE, MT_TITLE, CT_CODE, CT_NAME, RG_CODE, RG_NAME, MT_STATUS, MT_ETC, MC_CODE, MC_NAME" + 
					" FROM VIEW_MEETING_LIST WHERE CG_CODE = ? AND " + key + " LIKE ? AND MT_STATUS = 2 ORDER BY MT_CODE DESC)DATA) WHERE RNUM >= ? AND RNUM <= ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(cg_code));
			pstmt.setString(2, value);
			pstmt.setInt(3, start);
			pstmt.setInt(4, end);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next())
			{
				MeetingDTO dto = new MeetingDTO();
				dto.setNum(rs.getInt("RNUM"));
				dto.setMt_code(rs.getString("MT_CODE"));
				dto.setCg_code(rs.getString("CG_CODE"));
				dto.setCg_name(rs.getString("CG_NAME"));
				dto.setGm_code(rs.getString("GM_CODE"));
				dto.setGm_nickname(rs.getString("GM_NICKNAME"));
				dto.setMt_date(rs.getString("MT_DATE"));
				dto.setMt_update(rs.getString("MT_UPDATE"));
				dto.setMt_meet(rs.getString("MT_MEET"));
				dto.setMt_vote(rs.getString("MT_VOTE"));
				dto.setMt_title(rs.getString("MT_TITLE"));
				dto.setCt_code(rs.getString("CT_CODE"));
				dto.setCt_name(rs.getString("CT_NAME"));
				dto.setRg_code(rs.getString("RG_CODE"));
				dto.setRg_name(rs.getString("RG_NAME"));
				dto.setMt_status(rs.getString("MT_STATUS"));
				dto.setMt_etc(rs.getString("MT_ETC"));
				dto.setMc_code(rs.getString("MC_CODE"));
				dto.setMc_name(rs.getString("MC_NAME"));
				
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
	
	// 모임 게시글 상세조회 데이터 출력 메소드 ok
	public MeetingDTO getMeetingArticle(String mt_code)
	{
		MeetingDTO result = new MeetingDTO();
		
		try
		{
			String sql = "SELECT MT_CODE, CG_CODE, CG_NAME, GM_CODE, GM_NICKNAME, MT_DATE, MT_UPDATE, MT_MEET, MT_VOTE, MT_TITLE, CT_CODE, CT_NAME, RG_CODE, RG_NAME"
						+ " , MT_STATUS, MT_ETC, MC_CODE, MC_NAME"
						+ "	FROM VIEW_MEETING_LIST WHERE MT_CODE = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(mt_code));
			
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next())
			{
				result.setMt_code(rs.getString("MT_CODE"));
				result.setCg_name(rs.getString("CG_NAME"));
				result.setGm_code(rs.getString("GM_CODE"));
				result.setGm_nickname(rs.getString("GM_NICKNAME"));
				result.setMt_date(rs.getString("MT_DATE"));
				result.setMt_update(rs.getString("MT_UPDATE"));
				result.setMt_meet(rs.getString("MT_MEET"));
				result.setMt_vote(rs.getString("MT_VOTE"));
				result.setMt_title(rs.getString("MT_TITLE"));
				result.setCt_code(rs.getString("CT_CODE"));
				result.setCt_name(rs.getString("CT_NAME"));
				result.setRg_code(rs.getString("RG_CODE"));
				result.setRg_name(rs.getString("RG_NAME"));
				result.setMt_status(rs.getString("MT_STATUS"));
				result.setMt_etc(rs.getString("MT_ETC"));
				result.setMc_code(rs.getString("MC_CODE"));
				result.setMc_name(rs.getString("MC_NAME"));
			}
			
			rs.close();
			pstmt.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
	}
	
	// 모임 댓글 가져오기 ok
	public ArrayList<CommentDTO> getComments(String mt_code, String gm_code)
	{
		ArrayList<CommentDTO> result = new ArrayList<CommentDTO>();
		
		try
		{
			String sql = "SELECT MT_CODE, MCM_CODE, MCM_DATE, MCM_CONTENT, GM_NICKNAME, GM_CODE, GM_PROFILE, MCM_LIKE, (SELECT COUNT(*) FROM MEETING_COMMENT_LIKE WHERE GM_CODE = ? AND MCM_CODE = VMC.MCM_CODE) AS LIKE_CHECK FROM VIEW_MEETING_COMMENT VMC WHERE MT_CODE = ? ORDER BY MCM_CODE ASC";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(gm_code));
			pstmt.setInt(2, Integer.parseInt(mt_code));
			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next())
			{
				CommentDTO dto = new CommentDTO();
				dto.setArticleCode(rs.getString("MT_CODE"));
				dto.setCommentCode(rs.getString("MCM_CODE"));
				dto.setCommentDate(rs.getString("MCM_DATE"));
				dto.setCommentContent(rs.getString("MCM_CONTENT"));
				dto.setCommentWriterName(rs.getString("GM_NICKNAME"));
				dto.setCommentWriterCode(rs.getString("GM_CODE"));
				dto.setCommentWriterProfile(rs.getString("GM_PROFILE"));
				dto.setCommentLikeCount(rs.getString("MCM_LIKE"));
				dto.setCommentLikeCheck(rs.getString("LIKE_CHECK"));
				
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
	
	// 모임 대댓글 가져오기 ok
	public ArrayList<RecommentDTO> getRecomments(String mcm_code, String gm_code)
	{
		ArrayList<RecommentDTO> result = new ArrayList<RecommentDTO>();
		
		try
		{
			String sql = "SELECT MRC_CODE, MRC_DATE, MRC_CONTENT, GM_NICKNAME, MCM_CODE, GM_CODE, GM_PROFILE, MRC_LIKE, (SELECT COUNT(*) FROM MEETING_RECOMMENT_LIKE WHERE GM_CODE = ? AND MRC_CODE = VMR.MRC_CODE) AS LIKE_CHECK FROM VIEW_MEETING_RECOMMENT VMR WHERE MCM_CODE =?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(gm_code));
			pstmt.setInt(2, Integer.parseInt(mcm_code));
			
			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next())
			{
				RecommentDTO dto = new RecommentDTO();
				dto.setRecommentCode(rs.getString("MRC_CODE"));
				dto.setRecommentDate(rs.getString("MRC_DATE"));
				dto.setRecommentContent(rs.getString("MRC_CONTENT"));
				dto.setRecommentWriterName(rs.getString("GM_NICKNAME"));
				dto.setCommentCode(rs.getString("MCM_CODE"));
				dto.setRecommentWriterCode(rs.getString("GM_CODE"));
				dto.setRecommentWriterProfile(rs.getString("GM_PROFILE"));
				dto.setRecommentLikeCount(rs.getString("MRC_LIKE"));
				dto.setRecommentLikeCheck(rs.getString("LIKE_CHECK"));
				
				
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
	
	
	// 댓글을 회원이 좋아요를 눌렀는지 안 눌렀는지 확인 -> 댓글 리스트 출력에서 함
	/*
	public String getCommentLike(String mcm_code, String gm_code)
	{
		String result = "";
		
		try
		{
			String sql = "SELECT MCL_CODE FROM MEETING_COMMENT_LIKE WHERE MCM_CODE = ? AND GM_CODE = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(mcm_code));
			pstmt.setInt(2, Integer.parseInt(gm_code));
			
			ResultSet rs = pstmt.executeQuery();
			
			if (rs.next())
				result = rs.getString("MCL_CODE");
			
			rs.close();
			pstmt.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
	}
	*/
	
	// 대댓글을 회원이 좋아요를 눌렀는지 안 눌렀는지 확인 -> 대댓글 리스트 출력에서 함
	/*
	public String getRecommentLike(String mrc_code, String gm_code)
	{
		String result = "";
		
		try
		{
			String sql = "SELECT MRL_CODE FROM MEETING_RECOMMENT_LIKE WHERE MRCM_CODE = ? AND GM_CODE = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(mrc_code));
			pstmt.setInt(2, Integer.parseInt(gm_code));
			
			ResultSet rs = pstmt.executeQuery();
			
			if (rs.next())
				result = rs.getString("MRL_CODE");
			
			rs.close();
			pstmt.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
	}
	*/
	
	// 댓글 좋아요 입력
	public int insertCommentLike(String commentCode, String gm_code)
	{
		int result = 0;
		
		try
		{
			String sql = "INSERT INTO MEETING_COMMENT_LIKE(MCL_CODE, MCM_CODE, GM_CODE, MCL_DATE) VALUES(SEQ_MEETING_COMMENT_LIKE.NEXTVAL,?, ?, SYSDATE)";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(commentCode));
			pstmt.setInt(2, Integer.parseInt(gm_code));
			result = pstmt.executeUpdate();
			
			pstmt.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
	}
	
	// 댓글 좋아요 삭제
	public int deleteCommentLike(String mcm_code, String gm_code)
	{
		int result = 0;
		
		try
		{
			String sql = "DELETE FROM MEETING_COMMENT_LIKE WHERE MCM_CODE = ? AND GM_CODE = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(mcm_code));
			pstmt.setInt(2, Integer.parseInt(gm_code));
			result = pstmt.executeUpdate();
			pstmt.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
	}
	
	// 댓글 좋아요 갯수
	public int countCommentLike(String mcm_code)
	{
		int result = 0;
		
		try
		{
			String sql = "SELECT COUNT(*) AS COUNT FROM MEETING_COMMENT_LIKE WHERE MCM_CODE = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(mcm_code));
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
	
	// 대댓글 좋아요 갯수
	public int countRecommentLike(String mrc_code)
	{
		int result = 0;
		
		try
		{
			String sql = "SELECT COUNT(*) AS COUNT FROM MEETING_RECOMMENT_LIKE WHERE MRC_CODE = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(mrc_code));
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
	
	// 대댓글 좋아요 입력
	public int insertRecommentLike(String recommentCode, String gm_code)
	{
		int result = 0;
		
		try
		{
			String sql = "INSERT INTO MEETING_RECOMMENT_LIKE(MRL_CODE, MRC_CODE, GM_CODE, MRL_DATE) VALUES(SEQ_MEETING_RECOMMENT_LIKE.NEXTVAL, ?, ?, SYSDATE)";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(recommentCode));
			pstmt.setInt(2, Integer.parseInt(gm_code));
			result = pstmt.executeUpdate();
			
			pstmt.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
	}
	
	// 대댓글 좋아요 삭제
	public int deleteRecommentLike(String mrc_code, String gm_code)
	{
		int result = 0;
		
		try
		{
			String sql = "DELETE FROM MEETING_RECOMMENT_LIKE WHERE MRC_CODE = ? AND GM_CODE = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(mrc_code));
			pstmt.setInt(2, Integer.parseInt(gm_code));
			result = pstmt.executeUpdate();
			
			pstmt.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
	}
	
	// 댓글 좋아요 코드 검색
	public String searchCommentLikeCode(String mcm_code, String gm_code)
	{
		String result = "";
		
		try
		{
			String sql = "SELECT MCL_CODE FROM MEETING_COMMENT_LIKE WHERE MCM_CODE = ? AND GM_CODE = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(mcm_code));
			pstmt.setInt(2,Integer.parseInt(gm_code));
			ResultSet rs = pstmt.executeQuery();
			if (rs.next())
				result = rs.getString("MCL_CODE");
			rs.close();
			pstmt.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
	}
	
	// 대댓글 좋아요 코드 검색
	public String searchRecommentLikeCode(String mrcm_code, String gm_code)
	{
		String result = "";
		
		try
		{
			String sql = "SELECT MRL_CODE FROM MEETING_RECOMMENT_LIKE WHERE MRCM_CODE = ? AND GM_CODE = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(mrcm_code));
			pstmt.setInt(2, Integer.parseInt(gm_code));
			ResultSet rs = pstmt.executeQuery();
			if (rs.next())
				result = rs.getString("MRL_CODE");
			rs.close();
			pstmt.close();
				
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
	}
	
	// 댓글 신고                        댓글 코드,       신고자 코드
	public int insertCommentReport(String mcm_code, String gm_code)
	{
		int result = 0;
		
		try
		{
			String sql = "INSERT INTO MEETING_COMMENT_REPORT(MCR_CODE, MCR_DATE, MCM_CODE, GM_CODE) VALUES(SEQ_MCR.NEXTVAL, SYSDATE, ?, ?)";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(mcm_code));
			pstmt.setInt(2, Integer.parseInt(gm_code));
			result = pstmt.executeUpdate();
			
			pstmt.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
	}
	
	// 대댓글 신고
	public int insertRecommentReport(String mrc_code, String gm_code)
	{
		int result = 0;
		
		try
		{
			String sql = "INSERT INTO MEETING_RECOMMENT_REPORT(MRCR_CODE, MRC_CODE, GM_CODE) VALUES(SEQ_MRCR.NEXTVAL, ?, ?)";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(mrc_code));
			pstmt.setInt(2, Integer.parseInt(gm_code));
			result = pstmt.executeUpdate();
			pstmt.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
	}
	
	// 게시글 신고
	public int insertArticleReport(String mt_code, String gm_code)
	{
		int result = 0;
		
		try
		{
			String sql = "INSERT INTO MEETING_REPORT(MR_CODE, MT_CODE, GM_CODE) VALUES(SEQ_MEETING_REPORT.NEXTVAL, ?, ?)";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(mt_code));
			pstmt.setInt(2, Integer.parseInt(gm_code));
			result = pstmt.executeUpdate();
			pstmt.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
	}
	
	
	// 특정 모임에 참석 의사 확인값 출력
	public String getAttend(String mt_code, String gm_code)
	{
		String result = null;
		
		try
		{
			String sql = "SELECT AOC_CODE FROM ATTEND_OPINION WHERE MT_CODE = ? AND GM_CODE = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(mt_code));
			pstmt.setInt(2, Integer.parseInt(gm_code));
			ResultSet rs = pstmt.executeQuery();
			if (rs.next())
			{
				result = rs.getString("AOC_CODE");
			}
			rs.close();
			pstmt.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
	}
	
	// 모임 참석 여부 확인 입력
	public int insertAttend(String mt_code, String gm_code, String aoc_code)
	{
		int result = 0;
		
		try
		{
			//모임코드, 그룹원코드, 참석여부상태코드
			String sql = "{call PRC_ATTEND_OPINION_INSERT(?, ?, ?)}";
			CallableStatement cstmt = conn.prepareCall(sql);
			cstmt.setInt(1, Integer.parseInt(mt_code));
			cstmt.setInt(2, Integer.parseInt(gm_code));
			cstmt.setInt(3, Integer.parseInt(aoc_code));
			
			result = cstmt.executeUpdate();
			cstmt.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
	}
	
	// 모임 등록 프로시저 호출
	public int insertMeeting(MeetingDTO dto)
	{
		int result = 0;
		
		try
		{
			// 모임일, 제목, 기타, 카테고리, 그룹원코드, 도시코드, 그룹코드
			String sql = "{call PRC_MEETING_INSERT(TO_DATE(?, 'YYYY-MM-DD'), ?, ?, ?, ?, ?, ?)}";
			CallableStatement cstmt = null;
			if (dto.getMt_etc() == null || dto.getMt_etc().equals(""))
			{
				System.out.println();
				sql = "{call PRC_MEETING_INSERT(TO_DATE(?, 'YYYY-MM-DD'), ?, NULL, ?, ?, ?, ?)}";
				cstmt = conn.prepareCall(sql);
				cstmt.setString(1, dto.getMt_meet());
				cstmt.setString(2, dto.getMt_title());
				cstmt.setInt(3, Integer.parseInt(dto.getMc_code()));
				cstmt.setInt(4, Integer.parseInt(dto.getGm_code()));
				cstmt.setInt(5, Integer.parseInt(dto.getCt_code()));
				cstmt.setInt(6, Integer.parseInt(dto.getCg_code()));
			}
			else
			{
				cstmt = conn.prepareCall(sql);
				cstmt.setString(1, dto.getMt_meet());
				cstmt.setString(3, dto.getMt_etc());
				cstmt.setString(2, dto.getMt_title());
				cstmt.setInt(4, Integer.parseInt(dto.getMc_code()));
				cstmt.setInt(5, Integer.parseInt(dto.getGm_code()));
				cstmt.setInt(6, Integer.parseInt(dto.getCt_code()));
				cstmt.setInt(7, Integer.parseInt(dto.getCg_code()));
			}
				
			result = cstmt.executeUpdate();
			cstmt.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
	}
	
	// 모임 철회 사유 리스트 출력
	public ArrayList<CancelReasonDTO> getCancelReasonList()
	{
		ArrayList<CancelReasonDTO> result = new ArrayList<CancelReasonDTO>();
		
		try
		{
			String sql = "SELECT CRC_CODE, CRC_REASON FROM CANCELED_REASON_CATEGORY";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next())
			{
				CancelReasonDTO dto = new CancelReasonDTO();
				dto.setCrc_code(rs.getString("CRC_CODE"));
				dto.setCrc_reason(rs.getString("CRC_REASON"));
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
	
	// 모임 철회
	public int deleteMeeting(String crc_code, String mt_code)
	{
		int result = 0;
		
		try
		{
			String sql = "INSERT INTO CANCELED_MEETING(CM_CODE, CRC_CODE, MT_CODE) VALUES(SEQ_CANCELED_MEETING.NEXTVAL, ?, ?)";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(crc_code));
			pstmt.setInt(2, Integer.parseInt(mt_code));
			result = pstmt.executeUpdate();
			pstmt.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
	}
	
	// 특정 모임 참여 인원수 출력
	public int countAttendMember(String mt_code)
	{
		int result = 0;
		
		try
		{
			String sql = "SELECT COUNT(*) AS ATTEND FROM ATTEND_OPINION WHERE MT_CODE = ? AND AOC_CODE = 1 AND GM_CODE NOT IN (SELECT GM_CODE FROM GROUP_WTHDR)";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(mt_code));
			ResultSet rs = pstmt.executeQuery();
			if (rs.next())
				result = rs.getInt("ATTEND");
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
	}
	
	// 특정 모임 불참 인원수 출력
	public int countNotAttendMember(String mt_code)
	{
		int result = 0;
		
		try
		{
			String sql = "SELECT COUNT(*) AS NOTATTEND FROM ATTEND_OPINION WHERE MT_CODE = ? AND AOC_CODE = 2 AND GM_CODE NOT IN (SELECT GM_CODE FROM GROUP_WTHDR)";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(mt_code));
			ResultSet rs = pstmt.executeQuery();
			if (rs.next())
				result = rs.getInt("NOTATTEND");
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
	}
	
	// 모임 기타 메모사항 변경
	public int updateMeetingEtc(String mt_code, String mt_etc)
	{
		int result = 0;
		
		try
		{
			String sql = "UPDATE MEETING SET MT_ETC = ? WHERE MT_CODE = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mt_etc);
			pstmt.setInt(2, Integer.parseInt(mt_code));
			result = pstmt.executeUpdate();
			pstmt.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
	}
	
	// 모임 게시글 개수
	public int countArticle(String cg_code)
	{
		int result = 0;
		
		try
		{
			String sql = "SELECT COUNT(*) AS COUNT FROM MEETING WHERE CG_CODE = ? AND MT_CODE NOT IN (SELECT MT_CODE FROM MEETING_REPORT)";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(cg_code));
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
	
	public void close() throws SQLException
	{
		DBConn.close();
	}
}
