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

	});//ready
</script>
</head>
<body>
	<header data-bs-theme="dark">
		<c:import url="${url }/common/jsp/header.jsp" />
	</header>
	<main>
		<div id="container">
			<h2>맛도리</h2>
		
			<div id="map" style="width: 100%; height: 350px;"></div>

			<script type="text/javascript"
				src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bd811b0f31f210496827de3ea38119ae"></script>
			<script>
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
				mapOption = {
					center : new kakao.maps.LatLng(37.4992674, 127.0330423), // 지도의 중심좌표
					level : 3
				// 지도의 확대 레벨
				};

				var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

				// 마커를 표시할 위치와 title 객체 배열입니다 
				var positions = [ {
					title : '제주은희네',
					latlng : new kakao.maps.LatLng(37.498189, 127.0315992)
				}, {
					title : '탄',
					latlng : new kakao.maps.LatLng(37.4988739, 127.0346841)
				}, {
					title : '호보식당',
					latlng : new kakao.maps.LatLng(37.4980618, 127.0346506)
				}, {
					title : '명동칼국수',
					latlng : new kakao.maps.LatLng(37.5008458, 127.0339423)
				} ];

				// 마커 이미지의 이미지 주소입니다
				var imageSrc = "markerStar.png";

				for (var i = 0; i < positions.length; i++) {

					// 마커 이미지의 이미지 크기 입니다
					var imageSize = new kakao.maps.Size(24, 35);

					// 마커 이미지를 생성합니다    
					var markerImage = new kakao.maps.MarkerImage(imageSrc,
							imageSize);

					// 마커를 생성합니다
					var marker = new kakao.maps.Marker({
						map : map, // 마커를 표시할 지도
						position : positions[i].latlng, // 마커를 표시할 위치
						title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
						image : markerImage
					// 마커 이미지 
					});
				}
			</script>
		</div>
	</main>
	<footer class="text-body-secondary py-5">
		<c:import url="${url }/common/jsp/footer.jsp" />
	</footer>
</body>
</html>