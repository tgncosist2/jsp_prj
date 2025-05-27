<%@page import="kr.co.sist.config.SiteProperty"%>
<%@ page language="java" pageEncoding="UTF-8" info=""%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
String url = SiteProperty.PROTOCOL+SiteProperty.SERVER_NAME+SiteProperty.SERVER_PORT
				+SiteProperty.SERVLET_PATH;

String uploadURL = url+SiteProperty.UPLOAD_PATH;

String logo = url+"/common/images/"+SiteProperty.LOGO_IMG;

String site_name = SiteProperty.SITE_NAME;

session.setAttribute("url", url);
session.setAttribute("uploadURL", uploadURL);
session.setAttribute("logo", logo);
session.setAttribute("site_name", site_name);
%>