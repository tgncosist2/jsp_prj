<%@page import="day0515.Dept"%>
<%@page import="java.util.List"%>
<%@page import="day0515.DeptService"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<%

DeptService ds = new DeptService();

List<Dept> list = ds.searchAllDept();

JSONArray jsonArr = new JSONArray();

for (Dept item : list) {
	JSONObject obj = new JSONObject();
	
	obj.put("DEPTNO",item.getDeptno());
	obj.put("DNAME",item.getDname());
	obj.put("LOC",item.getLoc());
	
	jsonArr.add(obj);
}

%>


<%= jsonArr.toJSONString() %>