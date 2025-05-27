<%@page import="kr.co.sist.board.BoardService"%>
<%@page import="java.util.Random"%>
<%@page import="kr.co.sist.member.login.LoginResultDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../common/jsp/site_config.jsp"%>
<%@ include file="../common/jsp/login_chk.jsp"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="bDTO" class="kr.co.sist.board.BoardDTO" scope="page" />
<jsp:setProperty name="bDTO" property="*" />
<%
// useBean으로 입력되는 parameter는 subject와 content밖에 없다.
bDTO.setId(((LoginResultDTO) session.getAttribute("userData")).getId());
bDTO.setIp(request.getRemoteAddr());

BoardService bs = new BoardService();

pageContext.setAttribute("writeFlag", bs.addBoard(bDTO));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>야호</title>
<script>
	<c:choose>
		<c:when test="${writeFlag }">
			alert('글쓰기 완료 되었습니다.');
			location.href = "${url}/board/board_list.jsp";
		</c:when>
		<c:otherwise>
			alert('글쓰기 실패했습니다.')
		</c:otherwise>
	</c:choose>
</script>
</head>
</html>