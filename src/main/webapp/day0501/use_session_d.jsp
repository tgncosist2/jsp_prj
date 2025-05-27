<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<%-- <%@ include file="../common/jsp/Login_chk.jsp"%> --%>
<%
session.removeAttribute("name");
session.invalidate();
response.sendRedirect("use_session_a.jsp");
%>

