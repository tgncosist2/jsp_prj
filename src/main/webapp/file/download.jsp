<%@page import="java.io.OutputStream"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java"
	contentType="application/octet-stream; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<%@ include file="../common/jsp/site_config.jsp"%>
<%
// 1. 파일명을 저장
String fileName = request.getParameter("fileName"); // 파일명이 영어는 Ok, 한글은 인코딩 필요
String downFile = fileName;

// 1-1. 한글파일은 인코딩
fileName = URLEncoder.encode(fileName, "UTF-8").replaceAll("\\+", "%20");

// .replaceAll("\\+", "%20")은 공백이 +로 표기되는걸 방지함

// 2. 응답 헤더를 변경합니다.
response.setHeader("Content-Disposition", "attachment; fileName=" + fileName);

// 3. 다운로드 할 파일의 정보를 얻기
File file = new File("C:/dev/workspace/jsp_prj/src/main/webapp/upload/" + downFile);

if (file.exists()) { // 파일이 존재한다면
	// 4-1. 파일에 읽기 스트림 연결!
	FileInputStream fis = new FileInputStream(file);
	// 4-2. 파일을 응답하기 위한 현재 접속자 스트림 연결!
	OutputStream os = response.getOutputStream();
	
	// 5. 읽어 들인 파일을 저장할 배열을 생성하고, 파일에서 읽어들여 출력스트림으로 내보냅니다. 
	byte[] readData = new byte[512]; // 512로 가든 1024로 가든 제조사마다 다름.
	
	int readSize = 0;
	
	while ((readSize = fis.read(readData)) != -1) {
		os.write(readData, 0, readSize);
	}// end while
		
	os.flush();
	
}// end if

// 6. 파일 출력이 끝났다면 출력스트림 초기화 : out 내장 객체는 HTML을 출력할 목적의 스트림 => File 출력으로 변경한것.
out.clear();

// 7. 응답헤더 초기화 : 다운로드 파일의 정보가 설정된 헤더를 초기화
pageContext.pushBody();

%>
