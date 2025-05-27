<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../common/jsp/site_config.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><c:out value="${ site_name }"/></title>
<c:import
	url="${url }/common/jsp/external_file.jsp" />

<style type="text/css">
#container {
	min-height: 600px;
	margin-top: 30px;
	margin-left: 20px
}
</style>

<script type="text/javascript">
	$(function() {
		$('#txt').click(()=>{
			$.ajax({
				url : 'ajax.txt',
				type : 'get',
				dataType : 'text',
				error:function(xhr) {
					$('#output').html('에러코드 : ' + xhr.status + ', 에러메세지 : ' + xhr.statusText);
				},
				success:function(textData) {
					$('#output').html('<strong>' + textData + '</strong>');
				}
				
				<%
				Cookie cookie = new Cookie("username","이장훈");
				
				cookie.setMaxAge(60);
				
				cookie.setPath("/");
				
				response.addCookie(cookie);
				
				%>
			});
		})
		$('#html').click(()=>{
			$.ajax({
				url:'ajax.html',
				type:'get',
				dataType:'html',
				error:function(xhr){
					console.log(xhr.status + ' / ' + xhr.statusText);
				},
				success:function(data){
					$('#output').html(data);
				}
			})
		})
		$('#xml').click(()=>{
			$.ajax({
				url:'ajax.xml',
				type:'get',
				dataType:'xml',
				error:function(xhr) {
					console.log(xhr.status + ' / ' + xhr.statusText);
				},
				success:function(xmlData){
					$('#output').html($(xmlData).find('item0').first().text())
				}
			});
		})
		$('#json').click(()=>{
			$.ajax({
				url : 'ajax.json',
				type : 'get',
				dataType : 'json',
				error:function(xhr) {
					$('#output').html('에러코드 : ' + xhr.status + ', 에러메세지 : ' + xhr.statusText);
				},
				success:function(textData) {
					$('#output').html('<strong>' + textData.item0.name + '</strong><br><strong>' + textData.item0.addr + '</strong><br>'
							+ '<strong>' + textData.item1.name + '</strong><br><strong>' + textData.item1.addr + '</strong>');
					$('#name').val(textData.item0.name);
					$('#addr').val(textData.item1.addr);
				}
			});
		})
	});//ready


</script>
</head>
<body>
	<header data-bs-theme="dark">
		<c:import url="${url }/common/jsp/header.jsp" />
	</header>
	<main>
		<div id="container">
			<input type="button" value="TEXT" class="btn btn-success" id="txt"/>
			<input type="button" value="HTML" class="btn btn-info" id="html"/>
			<input type="button" value="XML" class="btn btn-danger" id="xml"/>
			<input type="button" value="JSON" class="btn btn-warning" id="json"/>
			
			<div id="output">
			</div>
			<input type="text" name="name" id="name"/><br>
			<input type="text" name="addr" id="addr"/>
		</div>
	</main>
	<footer class="text-body-secondary py-5">
		<c:import url="${url }/common/jsp/footer.jsp" />
	</footer>
</body>
</html>