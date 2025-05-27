<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- favicon 설정 -->
<link rel="shortcut icon"
	href="http://192.168.10.91/jsp_prj/common/images/favicon.ico" />
<!--  bootstrap CDN -->
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>

<style type="text/css">
#container {
	min-height: 600px;
	margin-top: 30px;
	margin-left: 20px
}
</style>
<!-- jquery CDN -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
$(function () {

});// ready	



</script>
</head>
<body>
	<header data-bs-theme="dark">
		<div class="collapse text-bg-dark" id="navbarHeader">
			<div class="container">
				<div class="row">
					<div class="col-sm-8 col-md-7 py-4">
						<h4>템플릿</h4>
						<p class="text-body-secondary">모름.</p>
					</div>
					<div class="col-sm-4 offset-md-1 py-4">
						<h4>Contact</h4>
						<ul class="list-unstyled">
							<li><a href="https://google.com" class="text-white">구글에서
									찾기</a></li>
							<li><a href="https://chatgpt.com/" class="text-white">지피티
									찾기</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="navbar navbar-dark bg-dark shadow-sm">
			<div class="container">
				<a href="index.jsp" class="navbar-brand d-flex align-items-center">
					<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
						fill="none" stroke="currentColor" stroke-linecap="round"
						stroke-linejoin="round" stroke-width="2" aria-hidden="true"
						class="me-2" viewBox="0 0 24 24">
						<path
							d="M23 19a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2h4l2-3h6l2 3h4a2 2 0 0 1 2 2z" />
						<circle cx="12" cy="13" r="4" /></svg> <strong>템플릿</strong>
				</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarHeader"
					aria-controls="navbarHeader" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
			</div>
		</div>
	</header>
	<main>
		<%
		
		Calendar cal = Calendar.getInstance();
		Calendar cal2 = Calendar.getInstance();
		int dateOfWeek = cal.get(Calendar.DAY_OF_WEEK);
		int date = cal.get(Calendar.DAY_OF_MONTH);
		int month = cal.get(Calendar.MONTH)+1;
		int maximumDate = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
		int dateOfWeek123 = cal.get(Calendar.DAY_OF_WEEK);
		
		
		cal2.set(Calendar.DAY_OF_MONTH, 1);
		int firstDayOfWeek = cal2.get(Calendar.DAY_OF_WEEK);
		
		
		
		
		%>
		<div id="container">
		<%= maximumDate %>
		<table class="table table-bordered table-hover">
		<tr>
			<th colspan="7"><%= month %>월</th>
		</tr>
		<tr>
			<th>일</th>
			<th>월</th>
			<th>화</th>
			<th>수</th>
			<th>목</th>
			<th>금</th>
			<th>토</th>
		</tr>
		<%
			StringBuilder sb = new StringBuilder();
			
			int index = 1;
			sb.append("<tr>");
			for(int i = 1; i < 8; i++) {
				sb
				.append("<td>" + (firstDayOfWeek <= i ? index++ : "") + "</td>");
			}
			sb.append("</tr>");
			
			
			for(int i = 0; i < 4; i++) {
			if (index == (int)maximumDate) {
				break;
			}
			sb.append("<tr>");
				for(int j = 0; j < 7; j++) {
					sb.append("<td>").append(index < 31 ? index++ : "").append("</td>");
				}
			sb.append("</tr>");
			}
		
		%>
		<%= sb.toString() %>
		</table>
		</div>
	</main>
	<footer class="text-body-secondary py-5">
		<div class="container">
			<p class="float-end mb-1">
				<a href="#">Back to top</a>
			</p>
			<p class="mb-1">
				<strong style="font-size: 18px">2강의실</strong> 서울특별시 강남구 테헤란로
				132(역삼동) 한독약품빌딩 8층 쌍용교육센터 <strong>Tel_02-3482-4632~5</strong>
			</p>
		</div>
	</footer>


</body>
</html>