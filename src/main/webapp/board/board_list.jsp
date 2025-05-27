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
<%@ include file="../common/jsp/login_chk.jsp"%>
<jsp:useBean id="rDTO" class="kr.co.sist.board.RangeDTO" scope="page" />
<jsp:setProperty name="rDTO" property="*" />
<%
StringBuilder searchQueryString = new StringBuilder();
if(rDTO.getKeyword()!=null&&!rDTO.getKeyword().isEmpty()){
   searchQueryString.append("&field=").append(rDTO.getField())
   .append("&keyword=").append(rDTO.getKeyword());
}//end if

pageContext.setAttribute("queryStr", searchQueryString);
%> 





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
				location.href = 'http://192.168.10.91/jsp_prj/board/board_list.jsp';
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
				<h3 id="h3">자유게시판</h3>
			</div>
			<div class="boardWrap"
				style="width: 1150px; height: 540px; text-align: center; margin: 0px auto">
				<%
				BoardService bs = new BoardService();

				int totalCount = 0; // 총 게시물의 수
				totalCount = bs.totalCount(rDTO);
				int pageScale = 0; // 한화면에 보여줄 게시물의 수
				pageScale = bs.pageScale();
				int totalPage = 0; // 총 페이지 수
				totalPage = bs.totalPage(totalCount, pageScale);
				int startNum; // 시작번호
				startNum = bs.startNum(pageScale, rDTO);
				int endNum; // 끝번호
				endNum = bs.endNum(pageScale, rDTO);

				List<BoardDTO> list = bs.selectBoard(rDTO);

				pageContext.setAttribute("totalCount", totalCount);
				pageContext.setAttribute("pageScale", pageScale);
				pageContext.setAttribute("totalPage", totalPage);
				pageContext.setAttribute("startNum", rDTO.getStartNum());
				pageContext.setAttribute("endNum", rDTO.getEndNum());
				pageContext.setAttribute("fieldText", rDTO.getBoardFieldText());
				pageContext.setAttribute("list", list);

				session.setAttribute("cntFlag", true);
				%>
				전체
				<c:out value="${totalPage }" />
				페이지에서 현재
				<c:out value="${rDTO.currentPage }" />
				페이지
				<div style="text-align: right;">
					<input type="button" value="글작성" class="btn btn-info btn-sm"
						id="btnWrite" onclick="location.href='write_frm.jsp'" />
				</div>
				<table class="table table-hover">
					<thead>
						<tr>
							<th style="width: 80px;">번호</th>
							<th style="width: 650px;">제목</th>
							<th style="width: 120px;">작성자</th>
							<th style="width: 200px;">작성일</th>
							<th style="width: 100px;">조회수</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${ empty list }">
							<tr>
								<td colspan="5">게시물이 없습니다.<br> <img
									src="../login/images/login_fail.jpg" style="width: 60px;" />
								</td>
							</tr>
						</c:if>
						<c:forEach var="bDTO" items="${list }" varStatus="i">
							<tr>
								<td><c:out value="${i.count + (startNum-1) }" /></td>
								<td><a href="board_detail.jsp?num=${bDTO.num }&currentPage=${rDTO.currentPage}${queryStr}"><c:out
											value="${bDTO.subject }" /></a></td>
								<td><c:out value="${bDTO.id }" /></td>
								<td><fmt:formatDate value="${bDTO.inputDate }"
										pattern="yyyy-MM-dd" /></td>
								<td><c:out value="${bDTO.cnt }" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div style="text-align: center;">
				<form action="board_list.jsp" method="GET" id="searchFrm">
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
				PaginationDTO pDTO = new PaginationDTO(3, rDTO.getCurrentPage(), totalPage, "board_list.jsp", rDTO.getField(), rDTO.getKeyword());
				
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