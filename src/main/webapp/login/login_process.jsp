<%@page import="org.json.simple.JSONObject"%>
<%@page import="kr.co.sist.member.login.LoginResultDTO"%>
<%@page import="kr.co.sist.member.login.LoginDTO"%>
<%@page import="kr.co.sist.member.login.LoginService"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="lDTO" class="kr.co.sist.member.login.LoginDTO" scope="page"/>
<jsp:setProperty name="lDTO" property="*"/>
<%
String json = "";

if ("POST".equals(request.getMethod().toUpperCase())) {
		
	LoginService ls = new LoginService();
	
	boolean flag = ls.loginProcess(lDTO, session);
	
	LoginResultDTO lrDTO = (LoginResultDTO) session.getAttribute("userData");
	
	JSONObject jsonObj = new JSONObject();
	
	jsonObj.put("loginResult", flag);
	
	json = jsonObj.toJSONString();
	
}// end if
%>

<%= json %>
