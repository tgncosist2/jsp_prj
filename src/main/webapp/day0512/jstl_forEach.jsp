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
			<c:forEach var="test" begin="1" end="10" step="1">
				<c:if test="${ test eq 1 or test eq 3 }">
					${ test }
				</c:if>
			</c:forEach>
			
			<%-- <c:forEach var="i" begin="10" end="0" step="-1">
			<c:out value="${ i }"/>
			</c:forEach> --%> <!-- forEach는 증가만 가능하다. -->
		</div>
	</main>
	<footer class="text-body-secondary py-5">
		<jsp:include page="../common/jsp/footer.jsp" />
	</footer>
</body>
</html>