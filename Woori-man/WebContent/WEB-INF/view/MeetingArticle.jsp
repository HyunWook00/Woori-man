<%@page import="com.woori.dto.GroupMemberDTO"%>
<%@page import="com.woori.dto.CommentDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	ArrayList<CommentDTO> comments = (ArrayList<CommentDTO>)request.getAttribute("comments");
	
	int attend = (int)request.getAttribute("attendMemberCount");
	int notAttend = (int)request.getAttribute("notAttendMemberCount");
	int total = (int)request.getAttribute("totalMemberCount");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모임 게시판 - ${meetingArticle.mt_title }</title>
<link rel="stylesheet" href="<%=cp %>/css/footer.css" />
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/article.css">
<script type="text/javascript" src="<%=cp %>/js/article.js"></script>
<link rel="stylesheet" href="<%=cp %>/css/meetingArticle.css" />
<script type="text/javascript" src="<%=cp %>/js/meetingArticle.js"></script>
<script type="text/javascript">

	function commentLikeDelete(commentCode, gm_code)
	{
		var gmCode = gm_code;
		var params = "mcmCode=" + commentCode + "&gmCode=" + gm_code;
		var obj = document.getElementById("comment-like-btn-" + commentCode);
		var objId = "#comment-like-btn-" + commentCode;
		$.ajax(
		{
			type: "GET"
			, url: "commentunlikeajax.woori"
			, data: params
			, success: function(args)
			{
				obj.innerHTML = args;
				 
				$(objId).removeClass("comment-unlike-btn");
				$(objId).addClass("comment-like-btn");
				$(objId).attr("onclick", "commentLikeInsert(" + commentCode + "," + gm_code + ")");
			}
			, beforeSend: function()
			{
				return true;
			}
			, error: function(e)
			{
				alert(e.responseText);
			}
		});
		
	}
	
	function recommentLikeDelete( recommentCode, gm_code)
	{
		var gmCode = gm_code;
		var params = "mrcmCode=" + recommentCode + "&gmCode=" + gm_code;
		var obj = document.getElementById("recomment-like-btn-" + recommentCode);
		var objId = "#recomment-like-btn-" + recommentCode;
		$.ajax(
		{
			type: "GET"
			, url: "recommentunlikeajax.woori"
			, data: params
			, success: function(args)
			{
				obj.innerHTML = args;
				 
				$(objId).removeClass("recomment-unlike-btn");
				$(objId).addClass("recomment-like-btn");
				$(objId).attr("onclick", "recommentLikeInsert(" + recommentCode + "," + gm_code + ")");
			}
			, beforeSend: function()
			{
				return true;
			}
			, error: function(e)
			{
				alert(e.responseText);
			}
		});
	}
	
	// 2024-02-29 노은하
	// 댓글 신고하기 버튼 클릭
	function reportComment(commentCode, gm_code, mt_code)
	{
		var params = "commentCode=" + commentCode + "&gm_code=" + gm_code;
		$.ajax(
		{
			type: "GET"
			, url: "reportcommentajax.woori"
			, data: params
			, success: function(args)
			{
				document.getElementById("report-modal-body").innerHTML = args;
				$("#modal-btn").click();
				var onclickEvent = "location.href='meetingcommentreport.woori?commentCode=" + commentCode + "&gm_code=" + gm_code + "&mt_code=" + mt_code + "'";
				$("#report-submit-btn").attr("onclick", onclickEvent);
			}
			, error: function(e)
			{
				alert(e.responseText);
			}
		});
	}
	
	function reportArticle(articleCode, gm_code)
	{
		//var params = "articleCode=" + 
	}
	
</script>
</head>
<body>


<!-- 2024-02-11 노은하 -->
<!-- 각 모임 게시글 상세내용 페이지 -->

<!-- 헤더 -->
<div class="header">
	<c:import url="MemberHeader.jsp"></c:import>
</div>

<!-- 상단메뉴 -->
<div class="menuList">
	이런메뉴... 저런메뉴... 조런메뉴...
</div>


<div class="container">

	<!-- 좌측 고정메뉴 -->
	<div class="leftMenu">
		여기 좌측 메뉴 들어가용
	</div>
	
	<!-- 중앙 주요 컨텐츠 -->
	<div class="centerContent">
	
		<!-- 게시판 정보 -->
		<div class="board-info">
			
			<!-- 추후 세션에서 그룹명 받아오기 -->
			<div class="board-title">[ <span class="group-name">약속해조</span> ] 모임 게시판</div>
			
			<div class="button-zone">
				<!-- 목록으로 / 이전글 / 다음글 버튼 영역 -->
				<div class="button-div">
					<button type="button" class="article-button article-list">목록으로</button>
					<button type="button" class="article-button pre-article">이전글</button>
					<button type="button" class="article-button next-article">다음글</button>
				</div>
				<div class="button-div">
					<c:choose>
					<c:when test="${meetingArticle.gm_code ==  member.gm_code && meetingArticle.mt_status!=3}">
					<button type="button" class="article-button article-modify" value="${meetingArticle.mt_code }">수정하기</button>
					<c:if test="${meetingArticle.mt_status==1 }">
					<button type="button" class="article-button article-delete" value="${meetingArticle.mt_code }">철회하기</button>
					</c:if>
					</c:when>
					
					<c:when test="${meetingArticle.gm_code !=  member.gm_code}">
					<button type="button" class="article-button" value="${meetingArticle.mt_code }">신고하기</button>
					</c:when>
					</c:choose>
				</div>
			</div>
		</div><!-- .board-info -->

		
		<!-- 게시글 영역 -->
		<div class="content">
			
			<!-- 게시글 제목 -->
			<div class="article-title">
				
				<!-- 제목 중 모임 상태에 따른 뱃지 주기 -->
				<div class="meeting-category">
					<c:choose>
					<c:when test="${meetingArticle.mc_code==1 }">
						<span class="meeting-regular meeting-badge">정기모임</span>
					</c:when>
					
					<c:when test="${meetingArticle.mc_code==2}">
						<span class="meeting-irregular meeting-badge">번개모임</span>
					</c:when>
					</c:choose>
				</div><!-- .meeting-category -->
				
				<!-- 모임명 -->
				<div class="meeting-title">${meetingArticle.mt_title }</div>
				
				<!-- 발의자(작성자) -->
				<div class="wirte-user">발의자 : ${meetingArticle.gm_nickname }</div>
				
				<!-- 발의일(작성일) -->
				<div class="wirte-date">발의 : ${meetingArticle.mt_date }</div>
				
				<!-- 최종 수정일 -->
				<div class="update-date">최종 수정일 : ${meetingArticle.mt_update }</div>
			</div><!-- article-title -->
			
			
			<!-- 게시글 상세정보(내용) -->
			<div class="article-content">
				
				<!-- 게시글 내용 -->
				<div class="article-detail">
					
					<!-- 모임 정보 -->
					<table class="meeting-detail">
						<tr>
							<td><span>${meetingArticle.gm_nickname }</span> 님이 발의한</td>
						</tr>
						<tr>
							<td><span>${meetingArticle.mt_meet }</span> 에 예정된</td>
						</tr>
						<tr>
							<td><span>"${meetingArticle.mt_title }"</span> 모임입니다.</td>
						</tr>
						<tr>
							<td>이번엔 <span>${meetingArticle.rg_name } ${meetingArticle.ct_name }</span> 에서 우리 이날 만나!</td>
						</tr>
					</table>
					<table class="meeting-detail">
						<tr>
							<!-- 방문장소들 -->
							<th rowspan="2" class="visit-place">우리 여기 가자!</th>
							<td><span class="place-name">스타벅스 부천역점</span></td>
						</tr>
						<tr>
							<td><span class="place-name">인생네컷 부천역점</span></td>
						</tr>
					</table>
					<div class="meeting-memo">
						<span class="memo-title">${meetingArticle.gm_nickname }님의 메모</span><br>
						${meetingArticle.mt_etc==null ? '남기신 메모가 없습니다.' : meetingArticle.mt_etc }
					</div>
				</div><!-- .article-detail -->
				
				<!-- 모임 투표 -->
				<div class="article-vote">
					<div class="vote-end"><span>${meetingArticle.mt_vote }</span> 까지 결정해주세요!</div>
					<form action="" class="meeting-vote-form">
						<div class="vote-zone">
							<button type="button" class="vote-attend vote-submit-btn attend ${attendStatus == 1 ? 'selected-btn' : '' }"  ${attendStatus == 1 ? 'disabled=\"disabled\"' : '' } onclick="voteAttend(${meetingArticle.mt_code}, 1)"
							${member.gm_code == meetingArticle.gm_code || meetingArticle.mt_status!= 1 ? 'disabled=\"disabled\"' : '' }>참석</button>
							<button type="button" class="vote-attend vote-submit-btn not-attend ${attendStatus == 2 ? 'selected-btn' : '' }" ${attendStatus == 2 ? 'disabled=\"disabled\"' : '' } onclick="voteAttend(${meetingArticle.mt_code}, 2)"
							${member.gm_code == meetingArticle.gm_code || meetingArticle.mt_status!= 1 ? 'disabled=\"disabled\"' : '' }>불참석</button>
							<c:if test="${member.gm_code == meetingArticle.gm_code}">
								<div class="writer-message">발의자는 자동으로 참석 처리됩니다.</div>
							</c:if>
						</div>
					</form>
					<div class="vote-chart">
					<c:forEach items="${attendMemberList }" var="attned">
						${attned.gm_nickname }
					</c:forEach>
						<canvas id="vote-status">
						</canvas>
						<script type="text/javascript">
							var chart = document.getElementById("vote-status");
							new Chart(chart,
								{ type:'doughnut'
								, data: {labels: ['참석', '불참석', '미투표']
								, datasets: [{data: [<%= attend%>
											,<%= notAttend%>
											,<%= total-attend-notAttend %>]
											, backgroundColor: ['#0067a3', '#d1180b', '#ddd']}]}
								, options: { responsive: false
											}});
						
						</script>
					</div><!-- .vote-chart -->
					 
				</div><!-- .article-vote -->
				
			</div><!-- .article-content -->
			
		</div><!-- content -->
		
		<!-- 댓글 -->
		<div class="comment-list">
		
			<!-- 댓글 몇개인지 -->
			<div class="comment-title">
				댓글 <span>${totalCommentCount}</span>개
			</div>
			
			<c:forEach var="comment" items="<%=comments %>">
			<div class="comment ${meetingArticle.gm_code == comment.commentWriterCode ? 'my-comment' : '' }">
		
			 	<!-- 작성자 프로필사진 -->
				<div class="commenter-profile">
					<img src="${comment.commentWriterProfile == null ? 'images/basic-profile.png' : comment.commentWriterProfile }" alt="profile" class="profile-img" />
				</div><!-- .commenter-profile -->
				 
				<!-- 댓글 정보 -->
				<div class="comment-info">
				
					<!-- 작성자 정보(이름, 작성일) -->
					<div class="commenter-info">
						<div class="commenter-name">${comment.commentWriterName }</div>
						<div class="comment-create">${comment.commentDate }</div>
						
						<!-- 댓글 메뉴(대댓글달기, 수정하기, 삭제하기, 신고하기) -->
						<div class="comment-menu">
							<button type="button" class="dropdown-toggle btn" data-bs-toggle="dropdown" aria-expanded="false">
								<i class="bi bi-three-dots"></i>
							</button>
							
							<!-- 메뉴 목록 -->
							<ul class="dropdown-menu dropdown-menu-end dropdown-menu-start">
								<c:choose>
									<c:when test="${member.gm_code == comment.commentWriterCode }">
										<li><a class="dropdown-item" onclick="insertRecomment(${comment.commentCode})">댓글달기</a></li>
										<li><a class="dropdown-item" onclick="modifyMyComment(${comment.commentCode})">수정하기</a></li>
										<li><a href="meetingcommentdelete.woori?articleCode=${meetingArticle.mt_code }&commentCode=${comment.commentCode}" class="dropdown-item">삭제하기</a></li>
									</c:when>
									
									<c:when test="${member.gm_code != comment.commentWriterCode }">
										<li><a class="dropdown-item" onclick="insertRecomment(${comment.commentCode})">댓글달기</a></li>
										<li><a class="dropdown-item" onclick="reportComment(${comment.commentCode}, ${member.gm_code }, ${meetingArticle.mt_code })">신고하기</a></li>
									</c:when>
								</c:choose>
							</ul><!-- .dropdown-menu -->
							 
						</div><!-- .comment-menu -->
						 
					</div><!-- .commenter-info -->
						
						 
					<!-- 댓글 내용 & 수정하기 공간 -->
					<div class="temp">
					
						<!-- 수정하기(내 댓글에만 보임) -->
						<div class="modify-comment-div" id="${comment.commentCode }-modify">
							<form action="meetingcommentupdate.woori" method="post" class="write-recomment write-area update-comment-form" >
								<div class="write-area">
									<textarea class="comment-input" name="mcm_content" id="mcm_content" placeholder="타인을 비방하는 내용의 댓글은 블라인드 처리됩니다." >${comment.commentContent }</textarea>
									<input type="hidden" name="mcm_code" id="mcm_code" value="${comment.commentCode }">
									<input type="hidden" name="gm_code" id="gm_code" value="${comment.commentWriterCode }">
									<input type="hidden" name="mt_code" id="mt_code" value="${comment.articleCode }">
								</div>
								<button type="submit" class="comment-submit-btn">수정</button>
								<button type="button" class="comment-cancel-btn">취소</button>
							</form>
						</div><!-- .modify-comment -->
						 
						<!-- 댓글 내용 -->
						<div class="comment-detail" >${comment.commentContent }</div>
						
						<!-- 댓글 좋아요 정보 -->
						<div class="comment-like">
							<div class="like-button position-relative">
							
							<c:choose>
								<c:when test="${checkCommentLike[comment.commentCode] != '' }">
									<button class="comment-unlike-btn position-relative" id="comment-like-btn-${comment.commentCode }" onclick="commentLikeDelete(${comment.commentCode },${member.gm_code})">
										<i class="bi bi-heart-fill"></i>
										<c:if test="${comment.commentLikeCount != 0 }">
											<span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-like">
												${comment.commentLikeCount }
											</span>						
										</c:if>
									</button>
								</c:when>
								
								<c:otherwise>
									<button class="comment-like-btn position-relative" id="comment-like-btn-${comment.commentCode }" onclick="commentLikeInsert(${comment.commentCode },${member.gm_code})">
										<i class="bi bi-heart"></i>
										<c:if test="${comment.commentLikeCount != 0 }">
											<span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-like">
												${comment.commentLikeCount }
											</span>
										</c:if>
									</button>
								</c:otherwise>
							</c:choose>
							
							</div><!-- .like-button -->
						</div><!-- .comment-like -->
					</div><!-- temp -->
					
					<!-- 대댓글 달기 -->
					<div class="write-recomment" id="${comment.commentCode }-recomment">
						<form action="meetingrecommentinsert.woori" method="post" class="write-recomment">
						<div class="write-area">
							<textarea class="comment-input" name="mrc_content" id="mrc_content" placeholder="타인을 비방하는 내용의 댓글은 블라인드 처리됩니다."></textarea>
							<input type="hidden" name="gm_code" id="gm_code" value="${member.gm_code }">
							<input type="hidden" name="mcm_code" id="mcm_code" value="${comment.commentCode }">
							<input type="hidden" name="mt_code" id="mt_code" value="${meetingArticle.mt_code }">
						</div>
						<button type="submit" class="comment-submit-btn">등록</button>
						<button type="button" class="comment-cancel-btn">취소</button>
						</form>	
					</div>
						 
					<!-- 대댓글 뽑아내기 -->
					<c:forEach var="recomment" items="${recomments[comment.commentCode] }">
					<div class="recomment">
					
						<!-- 대댓글 프사 -->
						<div class="commenter-profile">
							<img src="${comment.commentWriterProfile == null ? 'images/basic-profile.png' : comment.commentWriterProfile }" alt="profile" class="profile-img" />
						</div><!-- .commenter-profile -->
						
						<div class="comment-info">
							<div class="commenter-info">
								<div class="commenter-name">${recomment.recommentWriterName }</div>
								<div class="comment-create">${recomment.recommentDate }</div>
								<div class="comment-menu">
									<button type="button" class="dropdown-toggle btn" data-bs-toggle="dropdown" aria-expanded="false">
										<i class="bi bi-three-dots"></i>
									</button>
									<ul class="dropdown-menu dropdown-menu-end dropdown-menu-start">
										<c:choose>
											<c:when test="${member.gm_code == recomment.recommentWriterCode }">
												<li><a class="dropdown-item" onclick="modifyMyComment(${recomment.recommentCode})">수정하기</a></li>
												<li><a href="/meetingrecommentdelete.woori?recommentCode=${recomment.recommentCode }&articleCode=${meetingArticle.mt_code}" class="dropdown-item">삭제하기</a></li>
											</c:when>
											<c:when test="${member.gm_code != recomment.recommentWriterCode }">
												<li><a href="" class="dropdown-item">신고하기</a></li>
											</c:when>
										</c:choose>
									</ul>
								</div><!-- .comment-menu -->
							</div><!-- .commenter-info -->
							
							<!-- 나의 대댓글 수정하기 메뉴창이다. -->
							<div class="modify-comment" id="${recomment.recommentCode }-modify">
								<form action="meetingrecommentupdate.woori" method="get" class="write-recomment write-area update-comment-form" >
									<div class="write-area">
									<textarea class="comment-input" name="mrc_content" id="mrc_content" placeholder="타인을 비방하는 내용의 댓글은 블라인드 처리됩니다." >${recomment.recommentContent }</textarea>
									<div class="submit-and-count">
										<span class="count"><span class="now-count">0</span> / 200</span>
									</div>
										<button type="submit" class="comment-submit-btn">수정</button>
										<button type="button" class="comment-cancel-btn">취소</button>
										<input type="hidden" name="mrc_code" id="mrc_code" value="${recomment.recommentCode }">
										<input type="hidden" name="gm_code" id="gm_code" value="${recomment.recommentWriterCode }">
										<input type="hidden" name="mcm_code" id="mcm_code" value="${recomment.commentCode }">
										<input type="hidden" name="mt_code" id="mt_code" value="${meetingArticle.mt_code }">
									</div>
								</form>
							</div><!-- .modify-comment -->
							
							<div class="comment-detail recomment-detail">${recomment.recommentContent }</div>
							
							<!-- 대댓글 좋아요 -->
							<div class="comment-like">
								<div class="like-button position-relative">
								
									<c:choose>
										<c:when test="${recommentLike[recomment.recommentCode] != '' }">
											<button class="recomment-unlike-btn position-relative" id="recomment-like-btn-${recomment.recommentCode }" onclick="recommentLikeDelete(${recomment.recommentCode },${member.gm_code})">
												<i class="bi bi-heart-fill"></i>
												<c:if test="${recomment.recommentLikeCount != 0 }">
													<span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-like">
														${recomment.recommentLikeCount }
													</span>						
												</c:if>
											</button>
										</c:when>
										
										<c:otherwise>
											<button class="recomment-like-btn position-relative" id="recomment-like-btn-${recomment.recommentCode }" onclick="recommentLikeInsert(${recomment.recommentCode },${member.gm_code})">
												<i class="bi bi-heart"></i>
												<c:if test="${recomment.recommentLikeCount != 0 }">
													<span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-like">
														${recomment.recommentLikeCount }
													</span>
												</c:if>
											</button>	
										</c:otherwise>
									</c:choose>
								</div>
								
							</div><!-- .comment-like -->
						</div><!-- .comment-info -->
						 
					</div><!-- .recomment -->
						
					</c:forEach>
						 
					</div><!-- .comment-info -->
					
				</div><!-- .comment -->
			</c:forEach>
			
			
			
		</div><!-- div.comment-list -->
		
		<!-- 댓글 입력하기 창 -->
		<div class="write-comment">
			<form action="meetingcommentinsert.woori" method="post" class="write-area">
					<textarea class="comment-input" name="mcm_content" id="mcm_content" placeholder="타인을 비방하는 내용의 댓글은 블라인드 처리됩니다."></textarea>
					<input type="hidden" name="mt_code" id="mt_code" value="${meetingArticle.mt_code }">
					<input type="hidden" name="gm_code" id="gm_code" value="${member.gm_code }">
					<div class="submit-and-count">
						<button type="submit" class="comment-submit-btn">등록</button>
						<span class="count"><span class="now-count">0</span> / 200</span>
					</div>
			</form>
		</div>
		
	</div>
</div>

<!-- 모달창 -->
<div class="modal fade" id="reportModal" tabindex="-1" aria-labelledby="reportModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h6 class="modal-title fs-5" id="reportModalLabel">신고접수</h6>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body" id="report-modal-body">
			</div>
			<div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소하기</button>
		        <button type="button" class="btn btn-primary" id="report-submit-btn">신고하기</button>
		   </div>
		</div>
	</div>
</div>

<!-- 모임 철회 모달 -->
<c:import url="MeetingCanceledModal.jsp"></c:import>

<button type="button" class="btn btn-primary" id="modal-btn" data-bs-toggle="modal" data-bs-target="#reportModal"></button>

	
<!-- 푸터 영역 -->
<div class="footer">
<c:import url="MemberFooter.jsp"></c:import>
</div>



</body>
</html>