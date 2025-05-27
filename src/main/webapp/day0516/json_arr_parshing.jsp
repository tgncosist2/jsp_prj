<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../common/jsp/site_config.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><c:out value="${ site_name }" /></title>
<c:import url="${url }/common/jsp/external_file.jsp" />

<style type="text/css">
#container {
	min-height: 600px;
	margin-top: 30px;
	margin-left: 20px
}
</style>

<script type="text/javascript">
	$(function() {
		$('#btn').click(()=>{
			$.ajax({
				url:'${url}/day0515/use_json_simple.jsp',
				type:'GET',
				dataType:'JSON',
				error:function(xhr){
					console.log(xhr.status);
				},
				success:function(jsonArr){
					var table =`
					<table class='table table-hover'>
					<thead>
						<tr>
							<th>번호</th>
							<th>부서번호</th>
							<th>부서명</th>
							<th>위치</th>
						</tr>
					</thead>
					<tbody>
					`;
					
					
					$.each(jsonArr, function(i , jsonObj) {
						table+="<tr><td>"+(i+1)+"</td><td>"+jsonObj.DEPTNO+"</td><td>"+jsonObj.DNAME+"</td><td>"+jsonObj.LOC+"</td>"
					});
					
					$('#output').html(table);
					
					table+=`
					</tbody>
					</table>
					`;
					
				}
			});
		});
		$('#btn2').click(()=>{
			$.ajax({
				url:'${url}/day0515/use_json_simple.jsp',
				type:'GET',
				dataType:'JSON',
				error:function(xhr) {
					alert('문제가 발생하였습니다, 잠시후 다시 시도해주세요.');
					console.log(xhr.status);
				},
				success:function(jsonArr) {
					$.each(jsonArr, function(i, jsonObj) {
						createTr = '<tr><td>'+jsonObj.DEPTNO+'</td><td>'+jsonObj.DNAME+'</td><td>'+jsonObj.LOC+'</td>';
						$('#deptTab > tbody').append(createTr);
					});
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
			<input type="button" value="부서정보조회" class="btn btn-info" id="btn" />
			<input type="button" value="부서정보조회" class="btn btn-danger" id="btn2" />

			<div id="output"></div>
			<div stlye="width: 360px;">
				<table id="deptTab" class="table table-hover">
					<thead>
						<tr>
							<th style="width: 60px;">부서번호</th>
							<th style="width: 150px;">부서명</th>
							<th style="width: 150px;">위치</th>
						</tr>
					</thead>
					<tbody></tbody>
				</table>
			</div>
		</div>
	</main>
	<footer class="text-body-secondary py-5">
		<c:import url="${url }/common/jsp/footer.jsp" />
	</footer>
</body>
</html>