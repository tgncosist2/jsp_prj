<%@ page language="java" contentType="application/json; charset=UTF-8"
	pageEncoding="UTF-8" info="" trimDirectiveWhitespaces="false"%><%
	String name = "이장훈";
	int age = 25;
%>{ "name" : "<%= name %>", "age" : <%= age %> }