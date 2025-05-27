<%@page import="day0512.Singleton"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="http://192.168.10.91/jsp_prj/common/jsp/external_file.jsp" />

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
		<c:import url="http://192.168.10.91/jsp_prj/common/jsp/header.jsp" />
	</header>
	<main>
		<div id="container">
			<%
			Singleton s = Singleton.getInstance();

			Connection con = s.getConn();
			%>
			
			<%= con.hashCode() %>
			
			<%
			s.getClose(con, null, null);
			%>
			
		</div>
	</main>
	<footer class="text-body-secondary py-5">
		<c:import url="http://192.168.10.91/jsp_prj/common/jsp/footer.jsp" />
	</footer>
</body>
</html>