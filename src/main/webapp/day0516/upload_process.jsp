<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
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
			// 1. 저장 directory 설정
			File saveDir = new File("C:/dev/workspace/jsp_prj/src/main/webapp/upload");
			
			// 2. 업로드 크기를 설정합니다. : 10Mbyte
			int maxSize = 1 * 1024 * 1024;
			/* int limitSize = 1 * 1024 * 1024; */
			
			if (!saveDir.exists()) {
				saveDir.mkdir();
			}// end if
			
			try {
			// 3. 파일 컴포넌트 객체를 생성
			MultipartRequest mr = new MultipartRequest(request, saveDir.getAbsolutePath(), maxSize, "UTF-8", new DefaultFileRenamePolicy());
			
			String newfilename = mr.getFilesystemName("upfile");
			String filename = mr.getOriginalFileName("upfile");
			String uploader = mr.getParameter("uploader");
			
			String imagefile = saveDir.getAbsolutePath() + "\\" + filename;
			
			pageContext.setAttribute("imagefile", imagefile);
			
			%>
			업로더 : <strong><%= uploader %></strong><br>
			원본파일명 : <strong><%= filename %></strong><br>
			새파일명 : <strong><%= newfilename %></strong>
			<div style="width: 500px;">
				<img src="${imagefile }"/>
			</div>
			<%
			} catch (Exception e) {	
			%>
			최대 10메가 이하 파일
			<%
			}
			%>
			
		</div>
	</main>
	<footer class="text-body-secondary py-5">
		<c:import url="${url }/common/jsp/footer.jsp" />
	</footer>
</body>
</html>