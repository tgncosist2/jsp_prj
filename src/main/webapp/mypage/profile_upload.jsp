<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../common/jsp/site_config.jsp"%>
<%

Object obj = session.getAttribute("userData");

JSONObject jsonObj = new JSONObject();

boolean resultFlag = (obj != null);

jsonObj.put("resultFlag", resultFlag);

if (resultFlag) { // 로그인이 되어있는 상태인가요?!
	
	File saveDir = new File("C:/dev/workspace/jsp_prj/src/main/webapp/upload");

	if (saveDir.exists()) {
		saveDir.mkdir();
	}// end if
	
	int maxSize = 5 * 1024 * 1024; // 5MB
	// 파일 업로드를 수행하게 됩니다.
	MultipartRequest mr = new MultipartRequest(request, saveDir.getAbsolutePath(), maxSize, "UTF-8", new DefaultFileRenamePolicy());
		
	String fileName = mr.getFilesystemName("profileImg") == null ? (String) session.getAttribute("nowProfileImg") : mr.getFilesystemName("profileImg");
	
	jsonObj.put("fileName", fileName);
	
}// end if

out.print(jsonObj.toJSONString()); // {resultFlag : rtue

%>