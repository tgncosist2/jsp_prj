<%@page import="day0512.StudentService"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.Connection"%>
<%@page import="day0512.ProductService"%>
<%@page import="day0512.ProductDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import
	url="http://192.168.10.91/jsp_prj/common/jsp/external_file.jsp" />

<style type="text/css">
#container {
	min-height: 600px;
	margin-top: 30px;
	margin-left: 20px
}

.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}

.b-example-divider {
	width: 100%;
	height: 3rem;
	background-color: rgba(0, 0, 0, .1);
	border: solid rgba(0, 0, 0, .15);
	border-width: 1px 0;
	box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em
		rgba(0, 0, 0, .15);
}

.b-example-vr {
	flex-shrink: 0;
	width: 1.5rem;
	height: 100vh;
}

.bi {
	vertical-align: -.125em;
	fill: currentColor;
}

.nav-scroller {
	position: relative;
	z-index: 2;
	height: 2.75rem;
	overflow-y: hidden;
}

.nav-scroller .nav {
	display: flex;
	flex-wrap: nowrap;
	padding-bottom: 1rem;
	margin-top: -1px;
	overflow-x: auto;
	text-align: center;
	white-space: nowrap;
	-webkit-overflow-scrolling: touch;
}

.btn-bd-primary {
	--bd-violet-bg: #712cf9;
	--bd-violet-rgb: 112.520718, 44.062154, 249.437846;
	--bs-btn-font-weight: 600;
	--bs-btn-color: var(--bs-white);
	--bs-btn-bg: var(--bd-violet-bg);
	--bs-btn-border-color: var(--bd-violet-bg);
	--bs-btn-hover-color: var(--bs-white);
	--bs-btn-hover-bg: #6528e0;
	--bs-btn-hover-border-color: #6528e0;
	--bs-btn-focus-shadow-rgb: var(--bd-violet-rgb);
	--bs-btn-active-color: var(--bs-btn-hover-color);
	--bs-btn-active-bg: #5a23c8;
	--bs-btn-active-border-color: #5a23c8;
}

.bd-mode-toggle {
	z-index: 1500;
}

.bd-mode-toggle .bi {
	width: 1em;
	height: 1em;
}

.bd-mode-toggle .dropdown-menu .active .bi {
	display: block !important;
}
</style>

<script type="text/javascript">
	$(function() {
		${'#btn'}.click(function() {
			alert('asd');
		})
	});//ready
</script>
</head>
<body>
	<header data-bs-theme="dark">
		<c:import url="http://192.168.10.91/jsp_prj/common/jsp/header.jsp" />
	</header>
	<main>
		<div id="container">

			<%
			List<ProductDTO> list = new ProductService().serchPrd();

			pageContext.setAttribute("list", list);
			
			System.out.println(new StudentService().searchStuNum());
			%>

			<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
				<c:forEach var="item" items="${list }">
					<div class="col">
						<div class="card shadow-sm">
						<img src="../common/images/${item.img }" style="width: 100%; height: 200px;"/>
							<div class="card-body">
								<p class="card-text">
									<strong>${item.prd }</strong>
								</p>
								<p>
								${item.price }원
								<p style="text-align: right;"><fmt:formatDate value="${item.date }" pattern="yyyy-MM-dd"/></p>
								</p>
								<div class="d-flex justify-content-between align-items-center">
									<div class="btn-group">
										<button type="button" class="btn btn-sm btn-success" name="btn">구매</button>
										<button type="button" class="btn btn-sm btn-outline-secondary">장바구니</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>

		</div>
	</main>
	<footer class="text-body-secondary py-5">
		<c:import url="http://192.168.10.91/jsp_prj/common/jsp/footer.jsp" />
	</footer>
</body>
</html>