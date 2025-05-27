<%@page import="kr.co.sist.member.login.LoginResultDTO"%>
<%@page import="kr.co.sist.place.PlaceService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../common/jsp/site_config.jsp"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="rDTO" class="kr.co.sist.place.RestDTO" scope="page" />
<jsp:setProperty name="rDTO" property="*" />
<%
PlaceService ps = new PlaceService();

String id = ((LoginResultDTO) session.getAttribute("userData")).getId();

rDTO.setIp(request.getRemoteAddr());
rDTO.setId(id);

boolean flag = ps.writeRestaurant(rDTO);

pageContext.setAttribute("flag", flag);
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
				<c:when test="${flag}">
					<div style="text-align: center;">
						맛집이 등록되었습니다. <img src="../common/images/img_5.jpg" />
						<meta http-equiv="refresh" content="3;http://localhost/jsp_prj/place/restaurant_list.jsp"/>
					</div>
				</c:when>
				<c:otherwise>
					맛집 등록에 실패하였습니다.
					<img src="../common/images/img_7.jpg" />
					<meta http-equiv="refresh" content="3;http://localhost/jsp_prj/place/restaurant_list.jsp"/>
				</c:otherwise>
			</c:choose>
		</div>
	</main>
	<footer class="text-body-secondary py-5">
		<c:import url="${url }/common/jsp/footer.jsp" />
	</footer>
</body>
</html>