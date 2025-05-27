<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartResponse"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../common/jsp/site_config.jsp"%>
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
			<%
			String method = request.getMethod();
			
			if (method.equals("POST")) {
				File fileDir = new File("C:/dev/20250516");
				int maxSize = 1 * 1024 * 1024;
				
				if(!fileDir.exists()) {
					fileDir.mkdir();
				}
				
				MultipartRequest multi = new MultipartRequest(request, fileDir.getAbsolutePath(), maxSize, "UTF-8", new DefaultFileRenamePolicy());
				
				System.out.println("length : " + multi.getFilesystemName("uploadFile").length());
				
			
				String filename = multi.getFilesystemName("uploadFile");
				String name = multi.getParameter("name");
			%>
			<p>업로드된 파일 이름 : <strong><%= filename %></strong></p>
			<p>이름 : <strong><%= name %></strong>
			<%
			}
			%>

			<form method="post" action="servlets.jsp"
				enctype="multipart/form-data">
				<input type="file" name="uploadFile"/><br>
				<input type="text" name="name"/> 
				<input type="submit" value="Upload"/>
			</form>

		</div>
	</main>
	<footer class="text-body-secondary py-5">
		<c:import url="${url }/common/jsp/footer.jsp" />
	</footer>
</body>
</html>