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
			// 1. 배열, Collection 생성
			String[] arrs = { "오늘은", "월요일", "입니다." };

			// 2. scope객체에 저장. => EL에서 직접 사용할 수 없다.
			pageContext.setAttribute("arrs", arrs);
			session.setAttribute("name", "강태일");
			application.setAttribute("name", "유연수");
			%>
			<ul>
				<c:forEach var="item" items="${arrs}" varStatus="i">
				<li><c:out value="${ i.index } ${ i.count } ${ i.first } ${ i.last } ${ item }"/></li>
				<c:if test="${ i.last }">
					<c:out value="${ i.count }"/> 명
				</c:if>
				</c:forEach>
			</ul>
			
			
		</div>
	</main>
	<footer class="text-body-secondary py-5">
		<jsp:include page="../common/jsp/footer.jsp" />
	</footer>
</body>
</html>