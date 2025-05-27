<%@page import="day0516.EmpService"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<%
String paramDeptno = request.getParameter("deptno");
int deptno = 0;
deptno = Integer.parseInt(paramDeptno);
EmpService es = new EmpService();

String strJson = es.searchEmp(deptno);

%>
<%= es.searchEmp(deptno) %>