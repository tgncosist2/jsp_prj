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
		$('#btnQuery').click(()=>{
			// web parameter를 QueryString 형식으로 만들어서 전송
			var param = "name="+$('#name').val()+"&myAge="+$('#age').val();
			
			$.ajax({
				url:'ajax_param_process.jsp',
				type: 'GET',
				data: param,
				dataType:'JSON',
				error:function(xhr){
					console.log(xhr.statusText);
				},
				success:function(jsonObj){
					$('#output').html(jsonObj.method+'/'+jsonObj.msg + '/' + jsonObj.birth);
				}
			});
		});
		$('#btnJson').click(()=>{
			// web parameter를 JSONObject 형식으로 만들어서 전송
			var param = {name : $('#name').val(), myAge : $('#age').val()};
			
			$.ajax({
				url:'ajax_param_process.jsp',
				type: 'POST',
				data: param,
				dataType:'JSON',
				error:function(xhr){
					console.log(xhr.statusText);
				},
				success:function(jsonObj){
					$('#output').html(jsonObj.method+'/'+jsonObj.msg + '/' + jsonObj.birth);
				}
			});
		});
	});//ready
</script>
</head>
<body>
	<header data-bs-theme="dark">
		<c:import url="${url }/common/jsp/header.jsp" />
	</header>
	<main>
		<div id="container">
			<input type="text" name="name" id="name" placeholder="이름"/>
			<input type="text" name="age" id="age" placeholder="나이"/><br>
			<input type="button" value="QueryString" id="btnQuery" class="btn btn-success"/>
			<input type="button" value="JSONObject" id="btnJson" class="btn btn-danger"/>
			
			<div id="output"></div>
		</div>
	</main>
	<footer class="text-body-secondary py-5">
		<c:import url="${url }/common/jsp/footer.jsp" />
	</footer>
</body>
</html>