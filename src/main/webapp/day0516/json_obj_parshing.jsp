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
				url:'../day0515/json_obj2.jsp',
				type:'GET',
				dataType:'JSON',
				error:function(xhr) {
					alert('문제 발생 잠시후 다시 시도');
					console.log(xhr.statusText);
				},
				success:function(jsonObj) {
					$('#deptCnt').html(jsonObj.dataLength);
					$('#createDate').html(jsonObj.pubDate);
					
					$('#deptTab tbody').empty();
					
					// 데이터
					if (!jsonObj.resultFlag) {
						$('#deptTab tbody').append(
						"<tr><td colspan='3'>부서정보가 존재하지 않습니다.</td></tr>"		
						)
					}
					
					$.each(jsonObj.data, function(i, jsonTemp){
						createTr = '<tr><td><a href="javascript:searchEmp('+jsonTemp.deptno+')">'+jsonTemp.deptno+'</a></td><td>'+jsonTemp.dname+'</td><td>'+jsonTemp.loc+'</td>';
						$('#deptTab > tbody').append(createTr);
					});
				}
			});// ajax
		});// click
	});// ready
	
	function searchEmp(deptno) {
		var param = { deptno : deptno};
		
		$.ajax({
			url:'ajax_emp_json.jsp',
			type:'POST',
			data:param,
			dataType:'JSON',
			error:function(xhr) {
				alert('잠시 후 다시 시도')
				console.log(xhr.status + ' / ' + xhr.statusText);
			},
			success:function(jsonObj) {
				alert(jsonObj.data[0].ename);
				
				$('#deptno').html(deptno)
				
				$('#empTab tbody').empty();
				
				if (!jsonObj.resultFlag) {
					$('#empTab tbody').append('<tr><td coldspan="6">야이야이야</td></tr>')
				}
				
				var createTr;
				$.each(jsonObj.data, function(i, jsonTemp) {
					createTr = '<tr><td>'+(i+1)+'</td><td>'+jsonTemp.empno+'</td><td>'+jsonTemp.ename+'</td><td>'+jsonTemp.job+'</td><td>'+jsonTemp.hiredate+'</td><td>'+jsonTemp.sal+'</td><td></tr>';
					
					$('#empTab tbody').append(createTr);
				});
			}
		});
	}
</script>
</head>
<body>
	<header data-bs-theme="dark">
		<c:import url="${url }/common/jsp/header.jsp" />
	</header>
	<main>
		<div id="container">
			<input type="button" value="부서정보조회" class="btn btn-danger" id="btn" />

			<div>
				<strong>부서수</strong> : <span id="deptCnt"></span><br> <strong>데이터
					생성일</strong> : <span id="createDate"></span><br>
			</div>
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

			<div style="height: 400px;">
				<h2>
					[<span id="deptno" style="width: 50px;"></span>]번 부서 사원 정보
				</h2>
				<div>
				<strong>사원수</strong> : <span id="empCnt"></span><br>
				<strong>데이터 생성일</strong> : <span id="createEmpDate"></span><br>
				</div>
				<div stlye="width: 650px;">
					<table id="empTab" class="table table-hover">
						<thead>
							<tr>
								<th style="width: 60px;">번호</th>
								<th style="width: 80px;">사원번호</th>
								<th style="width: 120px;">사원명</th>
								<th style="width: 150px;">직무</th>
								<th style="width: 120px;">입사일</th>
								<th style="width: 120px;">연봉</th>
							</tr>
						</thead>
						<tbody></tbody>
					</table>
				</div>
			</div>
		</div>
	</main>
	<footer class="text-body-secondary py-5">
		<c:import url="${url }/common/jsp/footer.jsp" />
	</footer>
</body>
</html>