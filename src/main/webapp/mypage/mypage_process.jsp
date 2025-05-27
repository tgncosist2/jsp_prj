<%@page import="kr.co.sist.member.MyPageService"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../common/jsp/site_config.jsp"%>
<%@ include file="../common/jsp/login_chk.jsp"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="mpDTO" class="kr.co.sist.member.MyPageDTO" scope="page" />
<jsp:setProperty name="mpDTO" property="*" />
<%
MyPageService mps = new MyPageService();

boolean result = mps.modifyMember(mpDTO, session);

pageContext.setAttribute("result", result);
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
			<c:choose>
				<c:when test="${result }">
					<h2>회원 정보 수정 성공!</h2>
					<a href="${url }">메인화면</a>
				</c:when>
				<c:otherwise>
					<h2>회원 정보 수정 실패...</h2>
					<img src="../common/images/img_7.jpg" />
					<a href="javascript:history.back()">뒤로</a>
				</c:otherwise>
			</c:choose>
		</div>
	</main>
	<footer class="text-body-secondary py-5">
		<c:import url="${url }/common/jsp/footer.jsp" />
	</footer>
</body>
</html>