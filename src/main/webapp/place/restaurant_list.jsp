<%@page import="kr.co.sist.place.RestDTO"%>
<%@page import="kr.co.sist.place.PlaceService"%>
<%@page import="kr.co.sist.board.PaginationDTO"%>
<%@page import="kr.co.sist.board.BoardUtil"%>
<%@page import="kr.co.sist.board.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.sist.board.BoardService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<%@ include file="../common/jsp/site_config.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:useBean id="rDTO" class="kr.co.sist.board.RangeDTO" scope="page" />
<jsp:setProperty name="rDTO" property="*" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><c:out value="${ site_name }" /></title>
<c:import url="${url }/common/jsp/external_file.jsp" />

<style type="text/css">
#container {
	min-height: 600px;
	margin-top: 30px;
	margin-left: 20px
}

a {
	text-decoration: none;
	color: #333;
}

a:hover {
	color: #5A90D0;
}

.prevMark {
	color: #FF0000;
}

.nextMark {
	color: #FF0000;
}
</style>

<script type="text/javascript">
	$(function() {
		$('#btnSearch').click(function() {
			var keyword = $('#keyword').val();
			if (keyword == "") {
				alert('검색어를 입력해주세요.');
				return;
			}// end if
			
			$('#searchFrm').submit();
		});
		
		$('#h3').click(()=> {
				location.href = 'http://localhost/jsp_prj/place/restaurant_list.jsp';
		});
	});//ready
</script>
</head>
<body>
	<header data-bs-theme="dark">
		<c:import url="${url }/common/jsp/header.jsp" />
	</header>
	<main>
		<div id="container">
			<div
				style="text-align: center; margin-right: 50px; margin-bottom: 30px;">
				<h3 id="h3">맛집 리스트</h3>
			</div>
			<div class="boardWrap"
				style="width: 1150px; height: 540px; text-align: center; margin: 0px auto">
				<%
				PlaceService ps = new PlaceService();

				int totalCount = 0; // 총 게시물의 수
				totalCount = ps.totalCount(rDTO);
				int pageScale = 0; // 한화면에 보여줄 게시물의 수
				pageScale = ps.pageScale();
				int totalPage = 0; // 총 페이지 수
				totalPage = ps.totalPage(totalCount, pageScale);
				int startNum; // 시작번호
				startNum = ps.startNum(pageScale, rDTO);
				int endNum; // 끝번호
				endNum = ps.endNum(pageScale, rDTO);

				List<RestDTO> restlist = ps.selectRestaurant(rDTO);
				
				pageContext.setAttribute("totalCount", totalCount);
				pageContext.setAttribute("pageScale", pageScale);
				pageContext.setAttribute("totalPage", totalPage);
				pageContext.setAttribute("startNum", rDTO.getStartNum());
				pageContext.setAttribute("endNum", rDTO.getEndNum());
				pageContext.setAttribute("fieldText", rDTO.getRestFieldText());
				pageContext.setAttribute("restlist", restlist);

				session.setAttribute("cntFlag", true);
				%>
				[맛집] 전체 <c:out value="${totalCount }" /> 건
				<div style="text-align: right;">
					<a href="write_rest_frm.jsp" class="btn btn-success btn-sm">당신의 맛집</a>
				</div>
				<table class="table table-hover">
					<thead>
						<tr>
							<th style="width: 80px;">번호</th>
							<th style="width: 450px;">식당명</th>
							<th style="width: 320px;">메인 메뉴</th>
							<th style="width: 100px;">작성자</th>
							<th style="width: 200px;">작성일</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${ empty restlist }">
							<tr>
								<td colspan="5">등록된 맛집이 없습니다.<br> <img
									src="../login/images/login_fail.jpg" style="width: 60px;" /><br>
									<a href="write_rest_frm.jsp">맛집등록하기</a>
								</td>
							</tr>
						</c:if>
						<c:forEach var="restDTO" items="${restlist }" varStatus="i">
							<tr>
								<td><c:out value="${i.count + (startNum-1) }" /></td>
								<td><a href="rest_detail.jsp?num=${restDTO.rest_num }&currentPage=${rDTO.currentPage}${queryStr}"><c:out
											value="${restDTO.restaurant }" /></a></td>
								<td><c:out value="${restDTO.menu }" /></td>
								<td><c:out value="${restDTO.id }" /></td>
								<td><fmt:formatDate value="${restDTO.input_date }"
										pattern="yyyy-MM-dd" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div style="text-align: center;">
				<form action="restaurant_list.jsp" method="GET" id="searchFrm">
					<select name="field">
						<c:forEach var="field" items="${fieldText }" varStatus="i">
							<option value="${i.index }"><c:out value="${field }" /></option>
						</c:forEach>
					</select> <input type="text" name="keyword" id="keyword"
						style="width: 200px;" /> <input type="button"
						value="검색" class="btn btn-success btn-sm" id="btnSearch" />
				</form>
			</div>
			
			<div id="paginationDiv" style="text-align: center; margin-top: 50px;">
				<%
				PaginationDTO pDTO = new PaginationDTO(3, rDTO.getCurrentPage(), totalPage, "restaurant_list.jsp", rDTO.getField(), rDTO.getKeyword());
				
				%>
				
				<%= BoardUtil.pagination(pDTO) %>
			</div>
			
		</div>
	</main>
	<footer class="text-body-secondary py-5">
		<c:import url="${url }/common/jsp/footer.jsp" />
	</footer>
</body>
</html>