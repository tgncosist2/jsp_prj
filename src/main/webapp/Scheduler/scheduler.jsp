<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- favicon 설정 -->
<link rel="shortcut icon"
	href="http://192.168.10.91/jsp_prj/common/images/favicon.ico" />
<!--  bootstrap CDN -->
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>

<style type="text/css">
#container {
	min-height: 600px;
	margin-top: 30px;
	margin-left: 20px
}

#calendarWrap {
	width: 895px;
}

#calendarHeader {
	text-align: center;
	font-size: 25px;
	font-weight: bold;
}

a {
	text-decoration: none;
	color: #333;
}

.prevMonth, .nextMonth {
	color: #848AA3;
	font-size: 27px;
}

.btnToDay {
	font-size: 20px;
	border: 1px solid #CECECE;
	background-color: #DFDFDF;
}

.calTab>thead>tr>th {
	width: 100px;
	height: 30px;
	border: 1px solid #333;
	text-align: center;
}

.calTab>tbody>tr>td {
	width: 100px;
	height: 80px;
	border: 1px solid #CECECE;
	vertical-align: top;
	padding-left: 5px;
	font-weight: bold;
}

.calTab {
	border: 1px solid #333;
	margin: 0px auto;
}

.sunTitle {
	color: white;
	background-color: red;
}

.setTitle {
	color: white;
	background-color: blue;
}

/* 요일별 색깔 */
.sunColor {
	color: red;
}

.setColor {
	color: blue;
}

.weekColor {
	color: #333;
}

/* 오늘의 바닥색 */
.todayBgColor {
	background-color: #E9F4F8;
}

.weekBgColor {
	background-color: #ffffff;
}
</style>
<!-- jquery CDN -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

</head>
<body>
	<header data-bs-theme="dark">
		<div class="collapse text-bg-dark" id="navbarHeader">
			<div class="container">
				<div class="row">
					<div class="col-sm-8 col-md-7 py-4">
						<h4>템플릿</h4>
						<p class="text-body-secondary">모름.</p>
					</div>
					<div class="col-sm-4 offset-md-1 py-4">
						<h4>Contact</h4>
						<ul class="list-unstyled">
							<li><a href="https://google.com" class="text-white">구글에서
									찾기</a></li>
							<li><a href="https://chatgpt.com/" class="text-white">지피티
									찾기</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="navbar navbar-dark bg-dark shadow-sm">
			<div class="container">
				<a href="index.jsp" class="navbar-brand d-flex align-items-center">
					<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
						fill="none" stroke="currentColor" stroke-linecap="round"
						stroke-linejoin="round" stroke-width="2" aria-hidden="true"
						class="me-2" viewBox="0 0 24 24">
						<path
							d="M23 19a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2h4l2-3h6l2 3h4a2 2 0 0 1 2 2z" />
						<circle cx="12" cy="13" r="4" /></svg> <strong>템플릿</strong>
				</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarHeader"
					aria-controls="navbarHeader" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
			</div>
		</div>
	</header>
	<main>
		<div id="container">

			<div id="calendarWrap">

				<%
				Calendar cal = Calendar.getInstance(); // 현재 시스템에 날짜 정보를 가지고 있습니다.

				// 매개변수로 입력되는 년, 월을 받기.
				String paramYear = request.getParameter("year");
				String paramMonth = request.getParameter("month");

				int nowYear2 = cal.get(Calendar.YEAR);
				int nowMonth2 = cal.get(Calendar.MONTH) + 1;

				int nowDay = cal.get(Calendar.DAY_OF_MONTH);

				if (paramYear != null) { // 입력되는 년,월을 사용하여 다른 날짜로 설정
					cal.set(Calendar.DAY_OF_MONTH, 1);
					cal.set(Calendar.YEAR, Integer.parseInt(paramYear));
					cal.set(Calendar.MONTH, Integer.parseInt(paramMonth) - 1);
				} // end if

				int nowYear = cal.get(Calendar.YEAR);
				int nowMonth = cal.get(Calendar.MONTH) + 1;

				boolean flagToday = (nowYear2 + "" + nowMonth2).equals(nowYear + "" + nowMonth);
				%>
				<form action="scheduler.jsp" method="POST" name="calFrm" id="calFrm">
					<input type="hidden" name="year" id="year"/> <input type="hidden"
						name="month" id="month" />
					<div id="calendarHeader">
						<span id="prevMonth" title="이전 월" class="prevMonth">&lt;</span> <span><%=nowYear%>.<%=nowMonth%></span>
						<span title="다음 월" class="nextMonth" id="nextMonth">&gt;</span> <span
							title="오늘" class="btnToDay"> 
							
							<a href="javascript:moveCalendar('t',<%= nowYear2 %>,<%= nowMonth2 %>)" id="asd">오늘</a>
						</span>
						<%-- 					<span id="prevMonth" title="이전 월" class="prevMonth">&lt;</span> <span><%=nowYear%>.<%=nowMonth%></span>
					<span title="다음 월" class="nextMonth" id="nextMonth">&gt;</span> <span
						title="오늘" class="btnToDay"> <a href="scheduler.jsp"
						id="asd">오늘</a>
					</span> --%>
					</div>
				</form>
				<div id="calendarContainer">
					<table class="calTab">
						<thead>
							<tr>
								<th class="sunTitle">일</th>
								<th class="weekTitle">월</th>
								<th class="weekTitle">화</th>
								<th class="weekTitle">수</th>
								<th class="weekTitle">목</th>
								<th class="weekTitle">금</th>
								<th class="setTitle">토</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<%
								// 1일의 요일 
								cal.set(Calendar.DAY_OF_MONTH, 1);
								int blankTdCnt = cal.get(Calendar.DAY_OF_WEEK);

								String dayColorCss = ""; // 요일별 색 설정
								String todayCss = ""; // 오늘의 바닥색 설정

								/* log("123"+blankTdCnt); */
								for (int blankTd = 1; blankTd < blankTdCnt; blankTd++) {
								%>
								<td class="blankTd"></td>
								<%
								} // end for

								for (int tempDay = 1;; tempDay++) {
								//현재 날을 가지고 있는 달력 객체의 1일부터 설정
								//(Calendar 특성 : 현재 월에 없는 날짜가 들어가면 자동으로 다음 달로 바뀜 )							
								cal.set(Calendar.DAY_OF_MONTH, tempDay);

								// 마지막 날이면 반복문을 나가자.
								// 설정된 날짜로 얻어낸 날짜와 임시로 증가하는 날짜가 다르면(다음달 1일) 반복문 탈출
								if (tempDay != cal.get(Calendar.DAY_OF_MONTH)) {
									for (int blankTd = cal.get(Calendar.DAY_OF_WEEK); blankTd < Calendar.SATURDAY + 1; blankTd++) {
								%><td class="blankTd"></td>
								<%
								} // end for
								break;
								} // end if

								// 날짜별 색깔
								dayColorCss = "weekColor";
								switch (cal.get(Calendar.DAY_OF_WEEK)) {
								case Calendar.SATURDAY :
								dayColorCss = "setColor";
								break;
								case Calendar.SUNDAY :
								dayColorCss = "sunColor";
								break;
								}

								todayCss = "weekBgColor";
								// 오늘의 바닥색
								if (tempDay == nowDay && flagToday) {
								todayCss = "todayBgColor";
								}

								// 날짜 출력
								%>
								<td class="<%=dayColorCss%> <%=todayCss%>"><%=tempDay%></td>

								<%
								switch (cal.get(Calendar.DAY_OF_WEEK)) {
									case Calendar.SATURDAY :
								%>
							</tr>
							<tr>
								<%
								}
								} // end for
								%>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</main>
	<footer class="text-body-secondary py-5">
		<div class="container">
			<p class="float-end mb-1">
				<a href="#">Back to top</a>
			</p>
			<p class="mb-1">
				<strong style="font-size: 18px">2강의실</strong> 서울특별시 강남구 테헤란로
				132(역삼동) 한독약품빌딩 8층 쌍용교육센터 <strong>Tel_02-3482-4632~5</strong>
			</p>
		</div>
	</footer>
	<script type="text/javascript">
	$(function() {
		$('#prevMonth').click(function () {
			<%-- location.href = '?year=<%=nowMonth - 1 == 0 ? nowYear - 1 : nowYear%>&month=<%=nowMonth - 1 == 0 ? 12 : nowMonth - 1%>'; --%>
			moveCalendar('p',<%=nowYear%>, <%=nowMonth - 1%>);
		});
		
		$('#nextMonth').click(() => {
			<%-- location.href = '?year=<%=nowMonth + 1 == 13 ? nowYear + 1 : nowYear%>&month=<%=nowMonth + 1 == 13 ? 1 : nowMonth + 1%>'; --%>
			moveCalendar('n',<%=nowYear%>, <%=nowMonth + 1%>);
		});
		
		$('#asd').click(() => {
			
		});
		
	});// ready
	
	function moveCalendar(flag, year, month) {
		if (flag == 'p') {
			year = month == 0 ? year-1 : year;
			month = month == 0 ? 12 : month;
		}
		if (flag == 'n') {
			year = month == 13 ? year+1 : year;
			month = month == 13 ? 1 : month;
		}
		
		//년, 월을 설정해주세요.
		$('#year').val(year); 
		$('#month').val(month); 
		
		$('#calFrm').submit();
	}// moveCalendar
	
</script>

</body>
</html>