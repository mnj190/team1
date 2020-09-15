<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!-- 공통모듈 -->
<%@ include file="/WEB-INF/views/included/common.jsp"%>

<!-- css/javascript  -->
<link rel="stylesheet"
	href="${contextPath }/css/board/boardMainFrm.css?ver=${today}">
<script defer type="text/javascript"
	src="${contextPath }/js/board/boardMainFrm.js"></script>
<title>Board Main</title>

</head>
<body>
	<main>
		<div class="main_wrap">
			<!-- 게시판 카테고리 메뉴  -->
			<%@ include file="/WEB-INF/views/board/included/boardAsideMenu.jsp"%>

			<section>
				<div class="section_wrap">
					<div class="section_write">
						<button type="button" class="writeBtn" id="writeBtn">글쓰기</button>
					</div>
					<div class="section_table">

						<input type="hidden" id="returnPage" name="returnPage"
							value="${pagingComponent.pageCriteria.currReqPage}" /> <input
							type="hidden" id="catnum" name="catnum"
							value="${requestScope.bcategoryVO.catnum}" />
						<c:if test="${requestScope.bcategoryVO.btype == 'album' }">
							<c:import url="/WEB-INF/views/board/boardGalleryListFrm.jsp"></c:import>
						</c:if>
						<c:if test="${requestScope.bcategoryVO.btype != 'album'  }">
							<c:import url="/WEB-INF/views/board/boardBlogListFrm.jsp"></c:import>
						</c:if>
					</div>
				</div>
			</section>
		</div>
	</main>
</body>
</html>