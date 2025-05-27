<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="http://192.168.10.91/jsp_prj/common/jsp/external_file.jsp" />

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
		<c:import url="http://192.168.10.91/jsp_prj/common/jsp/header.jsp" />
	</header>
	<main>
		<div class="left-section">
            <img src="background.png" alt="배경 이미지" class="background-img">
            <div class="logo-text">
                <img src="logo.png"/>
            </div>
        </div>
        <div class="right-section">
            <form class="login-form">
                <h2>로그인</h2>
                <label for="email">이메일</label>
                <input type="email" id="email" placeholder="이메일">
                <label for="password">비밀번호</label>
                <input type="password" id="password" placeholder="비밀번호">
                <div class="options">
                    <label><input type="checkbox"> 아이디 기억하기</label>
                    <a href="#" class="find-password">비밀번호 찾기</a>
                </div>
                <button type="submit" class="login-btn">로그인</button>
                <button type="button" class="signup-btn">회원가입</button>
            </form>
        </div>
	</main>
	<footer class="text-body-secondary py-5">
		<c:import url="http://192.168.10.91/jsp_prj/common/jsp/footer.jsp" />
	</footer>
</body>
</html>