<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>main</title>
<script defer src="${pageContext.request.contextPath}/js/main.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/main.css">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap"
	rel="stylesheet" />
<!-- fontawesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.1/css/all.min.css"
	integrity="sha256-2XFplPlrFClt0bIdPgpz8H7ojnk10H69xRqd9+uTShA="
	crossorigin="anonymous" />
</head>
<body>

	<!-- header -->
	<%@ include file="/WEB-INF/views/layout/header.jsp"%>

	<div class="main_img">
		<span class="main_text"> Lorem ipsum dolor sit amet,
			consectetur adipisicing </span>
	</div>
	<main>
		<section class="list scroll">
			<div class="list_wrap">
				<h3>리스트 작성</h3>
				<div class="line"></div>
				<div class="createlist">
					<div class="default_list"></div>
					<div class="user_list"></div>
				</div>
			</div>
		</section>

		<section class="tip scroll">
			<div class="list_wrap">
				<h3>여행 팁</h3>
				<div class="line"></div>
				<div class="tip_list">
					<ul>
					<!-- begin : data 들어오는 곳  -->			
					
					<c:forEach var="tdata" items="${requestScope.tipBoardVO }" >
						<li><a href="${contextPath }/read/${tdata.bnum}">
								<div class="qna_title">
									<span> ${tdata.btitle }</span>									
									 <span> <fmt:formatDate value="${tdata.budate }" pattern="MM/dd" /> </span>
								</div>
						</a></li>
						</c:forEach>
						
					<!-- end : data 들어오는 곳  -->
						
						
					</ul>
				</div>
				<div class="more">
					<a href="${contextPath }/board/1"><span>더보기</span></a>
				</div>
			</div>
		</section>

		<section class="qna scroll">
			<div class="list_wrap">
				<h3>QnA</h3>
				<div class="line"></div>
				<div class="qna_list">
					<ul>
						<!-- begin : data 들어오는 곳  -->					
					<c:if test="${empty qaBoardVO}"> 게시글 없음  </c:if>
					<c:forEach var="qdata" items="${requestScope.qaBoardVO }" >
						<li><a href="${contextPath }/read/${qdata.bnum}">
								<div class="qna_title">
									<span> ${qdata.btitle }</span>									
									 <span> <fmt:formatDate value="${qdata.budate }" pattern="MM/dd" /> </span>
								</div>
						</a></li>
						</c:forEach>
						
							<!-- end : data 들어오는 곳  -->
					</ul>
				</div>
				<div class="more">
					<a href="${contextPath }/board/3"><span>더보기</span></a>
				</div>
			</div>
		</section>

		<section class="gallery scroll">
			<div class="list_wrap">
				<h3>갤러리</h3>
				<div class="line"></div>
				<div class="gallery_list">
					<ul>
					
					<!-- begin : data 들어오는 곳  -->	
					<c:forEach var="gdata" items="${requestScope.galBoardVO }" >
						<li class="inner"><a href="${contextPath }/read/${gdata.bnum}">
								<div class="li_img">
									<img
										src="data:${gdata.thumbnailVO.thumbftype };base64,${gdata.thumbnailVO.base64encoded}"
										alt="" />
								</div>
								<div class="li_text">
									<div class="li_text_poa">
										<h4 class="li_text_head">${gdata.btitle }</h4>
										<p class="li_text_summary">${gdata.bcontent }</p>
									</div>
								</div>
						</a></li>
						</c:forEach>
							<!-- end : data 들어오는 곳  -->
					</ul>
				</div>
				<div class="more">
					<a href="${contextPath }/board/2"><span>더보기</span></a>
				</div>
			</div>
		</section>

		<!-- <section class="introduce scroll">
        <div class="introduce_img"></div>
      </section> -->
	</main>
	<%@ include file="/WEB-INF/views/layout/footer.jsp"%>
</body>
</html>
