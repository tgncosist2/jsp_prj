<%@page import="kr.co.sist.member.MemberService"%>
<%@page import="kr.co.sist.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../common/jsp/external_file.jsp" />

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
		<jsp:include page="../common/jsp/header.jsp" />
	</header>
	<main>
		<div id="container">
			<%
			//1. 한글처리
			request.setCharacterEncoding("UTF-8");
			%>

			<jsp:useBean id="mDTO" class="kr.co.sist.member.MemberDTO"
				scope="page" />
			<jsp:setProperty property="*" name="mDTO" />
			<%
			mDTO.setIp(request.getRemoteAddr());

			MemberService ms = new MemberService();
			
			boolean chkId = ms.searchID(mDTO.getId());
			
			if (!chkId) {
				pageContext.setAttribute("addResult", ms.addMember(mDTO));
			%>

			<c:choose>
				<c:when test="${ addResult }">
						<div style="background: #ffffff url('../common/images/success.png'); position: relative; width: 600px; height: 500px; margin: auto;">
							<div style="position: absolute; top: 130px; left: 225px; font-size: 45px;">
								<strong> <c:out value="${param.name }" />님</strong>
							</div>
							<div style="position: absolute; top: 270px; left: 250px; font-size: 25px;">
								<a href="javascript:location.replace('http://192.168.10.91/jsp_prj/index.html')" class="btn btn-dark btn-success">로그인 하러가기</a>
							</div>
						</div>
				</c:when>
				<c:otherwise>
					<%-- 회원가입 실패 --%>
					<h2>회원가입이 정상적으로 이루어지지 않았습니다.</h2>
					<h3>잠시 후 다시 시도해주세요.</h3>
					<img
						src="https://i.namu.wiki/i/AG1bf3iJF6KVtWbzpVJPz4aOo77d9DHD6-wCDjuNpw8n2FgQ2TPHO2aqcTEYhOs8a_LFnaz_pMzLKOTBtSccjg.webp" />
					<a href="http://192.168.10.91/jsp_prj/index.html">메인화연</a>
					<a href="javascript:history.back();">뒤로가기</a>
				</c:otherwise>
			</c:choose>
			<% } else { %>
				<c:out value="${param.id }"/>는 사용중인 아이디입니다.			
			<% } %>
		</div>
	</main>
	<footer class="text-body-secondary py-5">
		<jsp:include page="../common/jsp/footer.jsp" />

	</footer>


</body>
</html>