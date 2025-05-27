<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONValue"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.sist.member.MemberDTO"%>
<%@page import="kr.co.sist.member.MemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import
	url="http://192.168.10.91/jsp_prj/common/jsp/external_file.jsp" />

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

			<h2>회원 리스트</h2>

			<a href="member_list.jsp?role=a">관리자A (암호화된 데이터)</a> <a
				href="member_list.jsp?role=b">관리자B (이름, 이메일 확인)</a> <a
				href="member_list.jsp?role=c">관리자B (나머지)</a>


			<c:choose>
				<c:when test="${param.role eq a }">

				</c:when>
				<c:when test="${param.role eq b }">

				</c:when>
				<c:otherwise>

				</c:otherwise>
			</c:choose>

			<%
			String role = request.getParameter("role");

			if (role == null || role.equals("")) {
				role = "a";
			}
			
			MemberService ms = new MemberService();
			
			List<MemberDTO> list = ms.searchAllMember(role);
			
			pageContext.setAttribute("memberList", list);
			%>

			<table class="table table-hover">
				<thead>
					<tr>
						<th>번호</th>
						<th>아이디</th>
						<th>이름</th>
						<th>생년월일</th>
						<th>전화번호</th>
						<th>이메일</th>
						<th>성별</th>
						<th>가입일</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${empty memberList }">
						<tr>
							<td colspan="8">회원정보가 존재하지 않습니다.</td>
						</tr>
					</c:if>
					<c:forEach var="mDTO" items="${ memberList }" varStatus="i">
					<tr>
						<td><c:out value="${i.count }"/></td>
						<td><c:out value="${mDTO.id }"/></td>
						<td><c:out value="${mDTO.name }"/></td>
						<td><c:out value="${mDTO.birth }"/></td>
						<td><c:out value="${mDTO.tel }"/></td>
						<td><c:out value="${mDTO.useEmail }"/></td>
						<td><c:out value="${mDTO.gender }"/></td>
						<td><fmt:formatDate value="${mDTO.input_date }" pattern="yyyy-MM-dd EEEE HH:mm"/></td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		
		<%
		// json_simple 사용해보자
		// 1. 객체 생성
		JSONObject jsonObj = new JSONObject();
		
		// 2. 값 할당 ) 입력한 값은 순서대로 들어가지 않는다. (같은 이름이 존재하면 덮어쓴다.)
		jsonObj.put("name", "이장훈");
		jsonObj.put("age", 25);
		
		
		%>
	</main>
	<footer class="text-body-secondary py-5">
		<c:import url="http://192.168.10.91/jsp_prj/common/jsp/footer.jsp" />
	</footer>
</body>
</html>