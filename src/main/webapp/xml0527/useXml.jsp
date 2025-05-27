<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../common/jsp/site_config.jsp"%>
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
</style>

<script type="text/javascript">
	$(function() {
		$('#btn').click(()=>{
			$.ajax({
				url: 'depts.xml',
				type: 'get',
				dataType: 'xml',
				error: function(xhr) {
					console.log(xhr.status);
				},
				success: function(xmlData) {
					alert(xmlData);
				}
			});
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
			<div id="output" style="border: 1px solid #333; width: 200px; height: 200px; margin-bottom: 20px;"></div>
			<input type="button" class="btn btn-success btn-sm" id="btn" value="버튼"/>
			
		</div>
	</main>
	<footer class="text-body-secondary py-5">
		<c:import url="${url }/common/jsp/footer.jsp" />
	</footer>
</body>
</html>