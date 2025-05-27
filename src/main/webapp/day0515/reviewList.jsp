<%@page import="day0515.Review"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>

<%
// This would typically come from a database via a service or DAO
// Here we're creating sample data for demonstration
List<Review> reviewList = new ArrayList<>();
reviewList.add(new Review("공통(안내)", "휴게소를 안내해서...", "2025-03-21"));
reviewList.add(new Review("기타(대기)", "결합이 맛있어요", "2025-02-02"));
reviewList.add(new Review("공통(안내)", "휴게소가 많게 되고 싶어요...", "2025-01-02"));

// Set the reviewList as a request attribute
request.setAttribute("reviewList", reviewList);

// Forward to the myPage.jsp
request.getRequestDispatcher("myPage.jsp").forward(request, response);
%>