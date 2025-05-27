<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- bootstrap CDN -->
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" />
<style type="text/css">
</style>
<!-- jquery CDN -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
	$(() => {
		$('#txt1').keyup(() => {
			if($('#txt1').val().length == 6) {
				$('#txt2').focus();
			}
		});
		
		$('#txt2').blur(function() {
			if($('#txt1').val().length + $('#txt2').val().length != 13) {
				$('#txt1').val('');
				$('#txt2').val('');
				$('#txt1').focus();
				alert('제대로 입력하셈');
			}
			
			var total = 0;
			var arr = [2,3,4,5,6,7];
			var arr2 = [8,9,2,3,4,5];
			// 1. 각 자리 구하고 곱하고 더하기
			for (var i = 0; i < $('#txt1').val().length; i++ ) {
				total += ($('#txt1').val().charAt(i) * arr[i]);
			}
			
			for (var i = 0; i < $('#txt2').val().length - 1; i++ ) {
				total += ($('#txt2').val().charAt(i) * arr2[i]);
			}
			
			// 2. 11로 나누고 나머지 구하기
			var namuji = (total % 11);
			
			// 3. 빼고
			var yaho = 11 - namuji;
			
			
			// 4. 10으로 나누고 나머지
			var namuji2 = yaho % 10;
			
			// 5. 마지막 숫자와 같다면
			if (parseInt($('#txt2').val().charAt(6)) == namuji2) {
				$('#output').html(`
						<strong>야호</strong>
				`);
			} else {
				$('#output').html(`
						<strong>ㅠㅠㅠㅠㅠㅠ</strong>
				`);
			}
			
			
			
		})
		
	}); 
</script>
</head>
<body>
	<label>주민번호</label>
	<input type="text" id="txt1" /> -
	<input type="password" id="txt2" />
	<div>
		<label>결과 </label> <span id="output"></span>
	</div>

	<% int index = 0; %>
	
	<strong>index 값 : ${param.index} </strong>
	
	<% 
	
	for (int i = 0; i < 10; i++ ) {
		index+=i;
	}
	
	%>
	
	<strong>index 값 : ${param.index} </strong>
</body>
</html>