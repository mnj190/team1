<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${contextPath }/maintest/css/mypage/main.css">
<link rel="stylesheet"
	href="${contextPath }/maintest/css/mypage/common2.css">
</head>
<body>
	<!-- header -->
	<%@ include file="/WEB-INF/views/layout/haeder.jsp"%>

	<div class="box-container">
		<!-- aside -->
		<%@ include file="/WEB-INF/views/mypage/mypage_sidebar.jsp"%>

		<!-- main -->
		<main id="content" class="mylist">
			<table id="">
				<colgroup>
					<col width="40">
					<col width="200">
					<col width="200">
					<col width="100">
					<col width="100">
				</colgroup>
				<thead id="">
					<tr>
						<th></th>
						<th>리스트 이름</th>
						<th>진행률</th>
						<th>작성일자</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td class="title">리스트1</td>
						<td>3/30 [ 10% ]</td>
						<td>2020.02.02</td>
						<td><input type="button" name="mylist_btn"
							id="mylist_delete_btn" value="삭제"></td>
					</tr>
				</tbody>
			</table>

			<div id="page_num">
				<span>1</span>
			</div>
		</main>
	</div>
	<!-- footer -->
	<footer>footer</footer>
</body>
</html>
