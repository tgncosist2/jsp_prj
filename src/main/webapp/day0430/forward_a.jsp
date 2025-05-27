<%@page import="day0430.DataDTO"%>
<%@page import="java.util.List"%>
<%@page import="day0430.Service"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>

<%
// 업무처리 페이지에서는 응답이 되지 않기 때문에 디자인 코드를 작성하지 않고,
// 업무로직 구현에 집중합니다.

Service service = new Service();
String name = service.name();
List<DataDTO> list = service.subject();

request.setAttribute("name", name);
request.setAttribute("list", list);

// 1. 이동할 페이지로 값 설정
RequestDispatcher dispatcher = request.getRequestDispatcher("forward_b.jsp");
dispatcher.forward(request, response);
%>