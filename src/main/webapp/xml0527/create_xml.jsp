<%@page import="java.io.IOException"%>
<%@page import="org.jdom2.output.Format"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="org.jdom2.output.XMLOutputter"%>
<%@page import="org.jdom2.Element"%>
<%@page import="org.jdom2.Document"%>
<%@ page language="java" contentType="application/xml; charset=UTF-8"
	pageEncoding="UTF-8" info="" trimDirectiveWhitespaces="true"%>
<%
Document doc = new Document(); // <?xml version="1.0" encoding="UTF-8" ?>

// 2. 최상위 부모노드 생성
Element rootNode = new Element("root"); // <root> </root>

// 3. 자식 노드를 생성
Element msgNode = new Element("msg");

// 3-1. 자식노드에 값 설정
msgNode.setText("안녕하세요?");

// 4. 배치
rootNode.addContent(msgNode);

// 4-1. XML문서객체에 최상위 부모노드 배치
doc.addContent(rootNode);

// 5. 생성된 XML을 출력, 출력객체 생성!
XMLOutputter xout = new XMLOutputter(Format.getPrettyFormat());

try {
	xout.output(doc, out);
} catch (IOException e){
	e.printStackTrace();
}// end try-catch
%>
