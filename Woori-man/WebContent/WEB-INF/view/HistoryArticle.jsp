<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>히스토리 - ${historyArticle.gm_nickname }님의 후기</title>
<link rel="stylesheet" href="<%=cp %>/css/footer.css" />
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/groupContentCommon.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/article.css" />
<script type="text/javascript" src="<%=cp%>/js/historyArticle.js"></script>
<link rel="stylesheet" href="<%=cp %>/css/historyArticle.css" />
<style type="text/css">
	div.article-content {text-align: left; padding: 0px 50px;}
</style>
</head>
<body>

<!-- 2024-03-08 노은하 -->
<!-- 그룹내 히스토리 게시판 상세내용 페이지 -->

<!-- 헤더 영역 -->
<div class="header">
	<c:import url="MemberHeader.jsp"></c:import>
</div>

<!-- 상단메뉴 영역 -->
<div class="menuList">
 	<c:import url="GroupHeader.jsp"></c:import>
</div>

<!-- 주요 콘텐츠 영역 -->
<div class="container">

	<!-- 좌측 고정메뉴 -->
	<div class="leftMenu">
		<div class="groupMain_side">
		<c:import url="GroupSideBar.jsp"></c:import>
		</div>
	</div>
	
	<!-- 중앙 주요 컨텐츠 영역 -->
	<div class="centerContent">
	
		<!-- 게시판 정보 영역 -->
		<div class="board-info">
			<div class="board-title">[ <span class="group-name">${groupDTO.cg_name }</span> ] ${meetingArticle.mt_title }의 히스토리</div>
			
			<div class="button-zone">
				<!-- 목록으로 / 이전글 / 다음글 버튼 영역 -->
				<div class="button-div">
					<button type="button" class="article-button article-list">목록으로</button>
				</div>
				<div class="button-div">
					<!-- 세션에서 회원코드 받아오고 작성자랑 분기 -->
					<c:choose>
					<c:when test="${historyArticle.gm_code ==  groupMemberDTO.gm_code}">
					<button type="button" class="article-button article-modify" value="${historyArticle.his_code }">수정하기</button>
					<button type="button" class="article-button article-delete" value="${historyArticle.his_code }">삭제하기</button>
					</c:when>
					
					<c:otherwise>
					<button type="button" class="article-button" onclick="reportArticle(${historyArticle.his_code})">신고하기</button>
					</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div><!-- .board-info -->
		
		<!-- 게시글 영역 -->
		<div class="content">
		
			<!-- 게시글 제목 영역 -->
			<div class="article-title">
				<div class="article-subject">
					${historyArticle.gm_nickname }님이 작성한 [${meetingArticle.mt_title }] 의 참석 후기 입니다.
				</div>
				<div class="wirte-date">
					작성일 : ${historyArticle.his_date }
				</div>
				<div class="article-view">
					조회수 : ${historyArticle.his_view }
				</div>
			</div><!-- .article-title -->
			
			<!-- 게시글 상세정보 영역 -->
			<div class="article-content">
				<!-- 해당 모임 관련 정보 -->
				<div class="meeting-info">
					<div class="meeting-title">모임명 : ${meetingArticle.mt_title }</div>
					<div class="meeting-writer">발의자 : ${meetingArticle.gm_nickname }</div>
					<div class="meeting-date">모임일시 : ${meetingArticle.mt_meet }</div>
					<div class="meeting-city">모임지역 : ${meetingArticle.rg_name } ${meetingArticle.ct_name }</div>
				</div>
			
				<!-- 게시글 내용 -->
				<div class="article-detail">
					${historyArticle.his_content }<br>
				</div>
			</div><!-- .article-content -->
			
			<!-- 게시글 좋아요 영역 -->
			<div class="article-like">
				<c:choose>
				<c:when test="${checkArticleLike <= 0}">
				<button type="button" class="article-like-btn" value="${historyArticle.his_code }" onclick="articleLike(this)">
					<i class="bi bi-heart" id="article-like-icon"></i>
					<span class="article-like-count">${historyArticle.his_like }</span>
				</button>
				</c:when>
				
				<c:otherwise>
				<button type="button" class="article-unlike-btn" value="${historyArticle.his_code }" onclick="articleUnlike(this)">
					<i class="bi bi-heart-fill" id="article-like-icon"></i>
					<span class="article-like-count">${historyArticle.his_like }</span>
				</button>
				</c:otherwise>
				</c:choose>
			</div><!-- .article-like -->
		
		</div><!-- .content -->
		
		<!-- 댓글 영역 -->
		<div class="comment-list">
			<div class="comment-title">
				댓글 <span>${totalCommentCount }</span>개
			</div>
			
			<!-- 개별 댓글 영역 -->
			<c:forEach items="${commentList }" var="comment">
				<div class="comment ${groupMemberDTO.gm_code == comment.commentWriterCode ? 'my-comment' : '' }">
				
					<div class="commenter-profile">
						<img src="${comment.commentWriterProfile==null ? 'images/basic-profile.png' : comment.commentWriterProfile }" alt="profile" class="profile-img" />
					</div> <!-- .commenter-profile -->
					
					<div class="comment-info">
						<div class="commenter-info">
							<div class="commenter-name">${comment.commentWriterName }</div>
							<div class="comment-create">${comment.commentDate }</div>
							
							<div class="comment-menu">
								<button type="button" class="dropdown-toggle btn" data-bs-toggle="dropdown" aria-expanded="false">
									<i class="bi bi-three-dots"></i>
								</button>
								
								<!-- 메뉴 목록 -->
								<ul class="dropdown-menu dropdown-menu-end dropdown-menu-start">
									<li><a class="dropdown-item" onclick="insertRecomment(${comment.commentCode})">댓글달기</a></li>
									<c:choose>
									<c:when test="${comment.commentWriterCode == groupMemberDTO.gm_code }">
										<li><a class="dropdown-item" onclick="modifyComment(${comment.commentCode})">수정하기</a></li>
										<li><a href="historycommentdelete.woori?commentCode=${comment.commentCode }&his_code=${historyArticle.his_code}&mt_code=${meetingArticle.mt_code}" class="dropdown-item" >삭제하기</a></li>
									</c:when>
									<c:otherwise>
										<li><a class="dropdown-item" onclick="reportComment(${comment.commentCode}, ${historyArticle.his_code}, ${meetingArticle.mt_code})">신고하기</a></li>
									</c:otherwise>
									</c:choose>
								</ul>							
							</div><!-- .comment-menu -->
						</div><!-- .commenter-info -->
					
						<!-- 댓글 내용&수정하기 공간 -->
						<div class="temp">
						
							<!-- 수정하기(내 댓글에서만 사용) -->
							<div class="modify-comment-div" id="${comment.commentCode }-modify">
								<form action="updatecomment.woori" class="write-recomment write-area update-comment-form" method="post">
									<div class="write-area">
										<textarea class="comment-input" name="commentContent" id="commentContent" placeholder="타인을 비방하는 내용의 댓글은 블라인드 처리됩니다." >${comment.commentContent }</textarea>
										<input type="hidden" name="commentCode" id="commentCode" value="${comment.commentCode }">
										<input type="hidden" name="articleCode" id="articleCode" value="${comment.articleCode }">
										<input type="hidden" name="mt_code" value="${meetingArticle.mt_code }">
									</div><!-- .write-area -->
									<button type="submit" class="comment-submit-btn">수정</button>
									<button type="button" class="comment-cancel-btn">취소</button>
								</form>
							</div><!-- .modify-comment-div -->
							
							<!-- 댓글 내용 -->
							<div class="comment-detail">${comment.commentContent }</div>
						</div><!-- .temp -->
						
						<!-- 대댓글 달기 -->
						<div class="write-recomment-div" id="${comment.commentCode }-recomment">
							<form action="insertrecomment.woori" method="post" class="write-recomment">
								<div class="write-area">
									<textarea class="comment-input" name="recommentContent" id="recommentContent" placeholder="타인을 비방하는 내용의 댓글은 블라인드 처리됩니다."></textarea>
									<input type="hidden" name="commentCode" id="commentCode" value="${comment.commentCode }">
									<input type="hidden" name="his_code" id="his_code" value="${historyArticle.his_code }">
									<input type="hidden" name="mt_code" value="${meetingArticle.mt_code }">
								</div>
								<button type="submit" class="comment-submit-btn">등록</button>
								<button type="button" class="comment-cancel-btn">취소</button>
							</form>
						</div><!-- .write-recomment -->
						
						<!-- 대댓글 뽑아내기 -->
						<c:forEach var="recomment" items="${recommentList[comment.commentCode] }">
						<div class="recomment">
							<div class="commenter-profile">
							<img src="${recomment.recommentWriterProfile == null ? 'images/basic-profile.png' : recomment.recommentWriterProfile }" alt="profile" class="profile-img" />
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
												<c:when test="${groupMemberDTO.gm_code == recomment.recommentWriterCode }">
													<li><a class="dropdown-item" onclick="modifyRecomment(${recomment.recommentCode})">수정하기</a></li>
													<li><a href="historyrecommentdelete.woori?recommentCode=${recomment.recommentCode }&his_code=${historyArticle.his_code}&mt_code=${meetingArticle.mt_code}" class="dropdown-item">삭제하기</a></li>
												</c:when>
												<c:when test="${groupMemberDTO.gm_code != recomment.recommentWriterCode }">
													<li><a class="dropdown-item" onclick="reportRecomment(${recomment.recommentCode}, ${historyArticle.his_code }, ${meetingArticle.mt_code})">신고하기</a></li>
												</c:when>
											</c:choose>
										</ul>
									</div><!-- .comment-menu -->
								</div><!-- .commenter-info -->
							
								<!-- 나의 대댓글 수정하기 메뉴창이다. -->
								<div class="modify-comment-div" id="${recomment.recommentCode }-modify-recomment">
									<form action="historyrecommentupdate.woori" method="post" class="write-recomment write-area update-comment-form" >
										<div class="write-area">
										<textarea class="comment-input" name="recommentContent" id="recommentContent" placeholder="타인을 비방하는 내용의 댓글은 블라인드 처리됩니다." >${recomment.recommentContent }</textarea>
										<div class="submit-and-count">
											<span class="count"><span class="now-count">0</span> / 200</span>
										</div>
											<button type="submit" class="comment-submit-btn">수정</button>
											<button type="button" class="comment-cancel-btn">취소</button>
											<input type="hidden" name="recommentCode" id="recommentCode" value="${recomment.recommentCode }">
											<input type="hidden" name="commentCode" id="commentCode" value="${recomment.commentCode }">
											<input type="hidden" name="his_code" id="his_code" value="${historyArticle.his_code }">
											<input type="hidden" name="mt_code" id="mt_code" value="${meetingArticle.mt_code }">
										</div>
									</form>
								</div><!-- .modify-comment -->
								
								<div class="comment-detail recomment-detail">${recomment.recommentContent }</div>
							</div><!-- .comment-info -->
						</div><!-- .recomment -->
						</c:forEach>
						
					</div><!-- .comment-info -->
				</div><!-- .comment -->
			</c:forEach>
			
		</div><!-- div.comment-list -->
		
		
		<!-- 댓글 입력하기 창 -->
		<div class="write-comment">
			<form action="historycommentinsert.woori" class="history-comment-form write-area" method="post"  id="historyCommentForm">
				<textarea class="comment-input" id="commentContent" name="commentContent" placeholder="타인을 비방하는 내용의 댓글은 블라인드 처리됩니다."></textarea>
				<input type="hidden" name="articleCode" id="articleCode" value="${historyArticle.his_code }">
				<input type="hidden" name="mt_code" value="${meetingArticle.mt_code }">
				<div class="submit-and-count">
					<button type="button" class="comment-submit-btn">등록</button>
					<span class="count"><span class="now-count">0</span> / 200</span>
				</div>
			</form>
		</div>

	</div><!-- .centerContent -->
	
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

<!-- 푸터 영역 -->
<div class="footer">
<c:import url="MemberFooter.jsp"></c:import>
</div>

</body>
</html>