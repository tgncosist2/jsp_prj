<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="useBean action tag 사용"%>
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
<!-- 객체생성과 scope객체 설정 - 객체 생성과 사용 범위(id="객체명" scope기본이 page) -->
<jsp:useBean id="dDto" class="day0508.DataDTO" scope="page" />
<!-- 새로고침 할 때마다 하나씩 생성 -->
<%-- <jsp:useBean id="dDto" class="day0508.DataDTO" scope="request" /> --%>
<!-- 새로고침 할 때마다 하나씩 생성 -->
<%-- <jsp:useBean id="dDto" class="day0508.DataDTO" scope="session" /> --%>
<!-- 다른 브라우저 (크롬, 엣지)에서 각 하나씩 -->
<%-- <jsp:useBean id="dDto" class="day0508.DataDTO" scope="application" /> --%>
<!-- 하나만 만들어지고 끝(브라우저가 바뀌어도 안만들어짐) -->

<!-- setter method 호출 (대소문자 구별함) -->
<jsp:setProperty property="name" value="이장훈" name="dDto"/>
<jsp:setProperty property="myAge" value="20" name="dDto"/>


<!-- getter method 호출 : seb browser로 출력 가능 -->
이름 : <jsp:getProperty property="name" name="dDto"/><br>
나이 : <jsp:getProperty property="myAge" name="dDto"/><br>

<%
	out.print(dDto);
	out.print("<br>");
	//<jsp:useBean으로 생성된 객체는 Java Code에서도 사용할 수 있다.
	dDto.setName("양준수");
	dDto.setMyAge(26);
	
%>
이름 : <%=dDto.getName() %><br>
나이 : <%=dDto.getMyAge() %><br>
<%-- <%= dDto %> --%>

</div>
</main>
<footer class="text-body-secondary py-5">
<jsp:include page="../common/jsp/footer.jsp"/>  
</footer>


</body>
</html>