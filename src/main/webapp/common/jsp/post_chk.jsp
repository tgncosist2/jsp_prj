<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<%

String method = request.getMethod();

if("POST".equals(method.toUpperCase())) {
	System.out.println("method : " + method);
	response.sendRedirect("http://localhost/jsp_prj/index.html");
	return;
}// end if

%>
