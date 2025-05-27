<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../common/jsp/external_file.jsp"/>

<style type="text/css">
 #container{ min-height: 600px; margin-top: 30px; margin-left: 20px}
</style>

<script type="text/javascript">
$(function(){
	
});//ready



</script>
</head>
<body>
<header data-bs-theme="dark">
<jsp:include page="../common/jsp/header.jsp"/>
</header>
<main>
<div id="container">
<h2>Welcome. This page is English Page.</h2>
name : <%=request.getParameter("name") %><br>
age : <%=request.getParameter("age") %><br>
<%-- 이전 페이지에서 < jsp:param name="language" value="<%=lang >"/>" --%>
사용언어 : <%=request.getParameter("language") %><br>
접속ip : <%=request.getAttribute("ip") %><br>
<a href ="javascript:history.back()">back</a>
</div>
</main>
<footer class="text-body-secondary py-5">
<jsp:include page="../common/jsp/footer.jsp"/>  
</footer>


</body>
</html>