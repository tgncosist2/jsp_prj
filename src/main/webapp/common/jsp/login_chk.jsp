<%@page import="kr.co.sist.member.login.LoginResultDTO"%>
<%@page import="kr.co.sist.member.login.LoginDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<%
LoginResultDTO lrDTO = (LoginResultDTO) session.getAttribute("userData");
if (lrDTO == null) {
	// 세션에 값이 없다면 페이지를 이동시킨다.
	response.sendRedirect("http://localhost/jsp_prj/index.html");
	return;
}
%>