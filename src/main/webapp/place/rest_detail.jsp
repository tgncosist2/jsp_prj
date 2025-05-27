<%@page import="kr.co.sist.place.PlaceService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../common/jsp/site_config.jsp"%>
<%@ include file="../common/jsp/login_chk.jsp"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="restDTO" class="kr.co.sist.place.RestDTO" scope="page"/>
<jsp:setProperty name="restDTO" property="*"/>
<%

PlaceService ps = new PlaceService();

restDTO = ps.searchOneRestaurant(Integer.parseInt(request.getParameter("num")));

String price = String.format("%,d",restDTO.getPrice())+"원";

pageContext.setAttribute("restDTO", restDTO);
pageContext.setAttribute("price", price);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><c:out value="${ site_name }" />-맛집상세정보</title>
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
			<div id="restWrap" style="width: 80%; margin: 0px auto;">
				<h3>맛집상세정보</h3>
				<div id="map"
					style="width: 100%; height: 550px; margin-bottom: 20px; border: 1px solid #ddd;"></div>
				<script type="text/javascript"
					src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bd811b0f31f210496827de3ea38119ae"></script>
				<script>
					$(function() {
						var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
						mapOption = {
							center : new kakao.maps.LatLng(${restDTO.lat}, ${restDTO.lng}), // 지도의 중심좌표
							level : 3
						// 지도의 확대 레벨
						};
						
						var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

						// 지도를 클릭한 위치에 표출할 마커입니다
						var marker = new kakao.maps.Marker({
							// 지도 중심좌표에 마커를 생성합니다 
							position : map.getCenter()
						});
						// 지도에 마커를 표시합니다
						marker.setMap(map);

						// 지도에 클릭 이벤트를 등록합니다
						// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
						kakao.maps.event.addListener(map, 'click', function(
								mouseEvent) {

							// 클릭한 위도, 경도 정보를 가져옵니다 
							var latlng = mouseEvent.latLng;

							// 마커 위치를 클릭한 위치로 옮깁니다
							marker.setPosition(latlng);

							$('#lat').val(latlng.getLat()); // 위도 설정
							$('#lng').val(latlng.getLng()); // 경도 설정
							/*
							var message = '클릭한 위치의 위도는 ' + latlng.getLat()
									+ ' 이고, ';
							message += '경도는 ' + latlng.getLng() + ' 입니다';

							var resultDiv = document.getElementById('clickLatlng');
							resultDiv.innerHTML = message;
							 */

						}); //addListener
					}); //Ready
				</script>

				<form action="rest_frm_process.jsp" method="POST" name="restFrm"
					id="restFrm">
					<table class="table table-hover">
						<thead>
							<tr>
							<th colspan="2" style="text-align: center;">맛집입력</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td style="padding-top: 15px;">식당명</td>
								<td><input type="text" name="restaurant"
									style="width: 500px;" id="restaurant" class="form-control" value="${restDTO.restaurant }" readonly="readonly" /></td>
							</tr>
							<tr>
								<td>대표메뉴</td>
								<td><input type="text" name="menu" id="menu" style="width: 500px;" class="form-control" value="${restDTO.menu }" readonly="readonly" /></td>
							</tr>
							<tr>
								<td>가격</td>
								<td><input type="text" name="price" id="price" style="width: 500px;" class="form-control" value="${price }" readonly="readonly"/></td>
							</tr>
							<tr>
								<td>식당정보</td>
								<td><input type="text" name="info" id="info" style="width: 500px;" class="form-control" value="${restDTO.info }" readonly="readonly"/></td>
							</tr>
							<tr>
								<td>작성자</td>
								<td><input type="text" name="id" id="id" style="width: 500px;" class="form-control" value="${restDTO.id }" readonly="readonly"/></td>
							</tr>
							<tr>
								<td>작성일</td>
								<td><input type="text" name="inputDate" id="inputDate" style="width: 500px;" class="form-control" value="${restDTO.input_date }" readonly="readonly"/></td>
							</tr>
							<tr>
								<td colspan="2" style="text-align: center;"><input
									type="hidden" name="lat" id="lat" /> <input type="hidden"
									name="lng" id="lng" /> <input type="button" value="식당정보추가"
									class="btn btn-success" id="btnAdd" /> <a
									href="restaurant_list.jsp" class="btn btn-info btn-sm">맛집리스트</a>
								</td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
		</div>
	</main>
	<footer class="text-body-secondary py-5">
		<c:import url="${url }/common/jsp/footer.jsp" />
	</footer>
</body>
</html>