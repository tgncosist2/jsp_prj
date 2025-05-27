<%@page import="kr.co.sist.board.BoardUtil"%>
<%@page import="kr.co.sist.board.PaginationDTO"%>
<%@page import="kr.co.sist.file.FileService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../common/jsp/site_config.jsp"%>
<jsp:useBean id="rDTO" class="kr.co.sist.board.RangeDTO" scope="page" />
<jsp:setProperty name="rDTO" property="*" />
<%
FileService fs = new FileService();

int totalCount = 0; // 총 게시물의 수
totalCount = fs.totalCount();
int pageScale = 0; // 한화면에 보여줄 게시물의 수
pageScale = fs.pageScale();
int totalPage = 0; // 총 페이지 수
totalPage = fs.totalPage(totalCount, pageScale);
int startNum; // 시작번호
startNum = fs.startNum(pageScale, rDTO);
int endNum; // 끝번호
endNum = fs.endNum(pageScale, rDTO);

pageContext.setAttribute("fileList", fs.fileList(rDTO));

pageContext.setAttribute("totalCount", totalCount);
pageContext.setAttribute("pageScale", pageScale);
pageContext.setAttribute("totalPage", totalPage);
pageContext.setAttribute("startNum", rDTO.getStartNum());
pageContext.setAttribute("endNum", rDTO.getEndNum());
pageContext.setAttribute("fieldText", rDTO.getRestFieldText());

pageContext.setAttribute("rDTO", rDTO);
%>
${rDTO }
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><c:out value="${ site_name }"/></title>
<c:import
	url="${url }/common/jsp/external_file.jsp" />

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
	color: #0000FF;
}
</style>

<script type="text/javascript">
	$(function() {

	});//ready
</script>
</head>
<body>
	<header data-bs-theme="dark">
		<c:import url="${url }/common/jsp/header.jsp" />
	</header>
	<main>
		<div id="container">
			<div>
			<h3>업로드 파일목록</h3>
			</div>
			<div>
			<table class="table table-hover">
			<thead>
				<tr>
					<th>번호</th>
					<th>파일명</th>
					<th>파일크기(Byte)</th>
					<th>업로드일</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty fileList}">
					<tr>
					<td colspan="4" style="text-align: center;">
						업로드된 파일이 존재하지 않습니다.
						<a href="">업로드하러 가기</a>
					</td>
					</tr>
				</c:if>
				<c:forEach var="file" items="${fileList }" varStatus="i">
				<tr>
				<td><c:out value="${i.count + (startNum-1) }"/></td>
				<td><a href="download.jsp?fileName=${file.fileName}"><c:out value="${file.fileName }"/></a></td>
				<td><fmt:formatNumber value="${file.length }" pattern="###,###"/> Byte</td>
				<td><fmt:formatDate value="${file.lastModified }" pattern="yyyy-MM-dd"/></td>
				</tr>
				</c:forEach>
			</tbody>
			</table>
			</div>
			
			<div id="paginationDiv" style="text-align: center; margin-top: 50px;">
				<%
				PaginationDTO pDTO = new PaginationDTO(3, rDTO.getCurrentPage(), totalPage, "file_list.jsp", rDTO.getField(), rDTO.getKeyword());
				
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