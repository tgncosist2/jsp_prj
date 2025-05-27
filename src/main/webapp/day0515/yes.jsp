<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>모두집 - 마이페이지</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="container">
        <!-- Header -->
        <header class="header">
            <div class="logo">
                <img src="logo.png" alt="모두집 로고">
            </div>
            <nav class="main-nav">
                <ul>
                    <li><a href="#">휴게소 편의시설 정보</a></li>
                    <li><a href="#">노선별 주유소</a></li>
                    <li><a href="#">게시판</a></li>
                    <li><a href="#" class="active">마이페이지</a></li>
                    <li><a href="#">로그아웃</a></li>
                </ul>
            </nav>
        </header>

        <div class="content-wrapper">
            <!-- Sidebar -->
            <aside class="sidebar">
                <div class="sidebar-header">마이페이지</div>
                <nav class="sidebar-nav">
                    <ul>
                        <li><a href="#">내 정보</a></li>
                        <li><a href="#" class="active">나의 리뷰</a></li>
                        <li><a href="#">문의내역</a></li>
                        <li><a href="#">즐겨찾기</a></li>
                    </ul>
                </nav>
            </aside>

            <!-- Main Content -->
            <main class="main-content">
                <h2 class="content-title">나의 리뷰</h2>
                
                <div class="table-container">
                    <table class="data-table">
                        <thead>
                            <tr>
                                <th>휴게소명</th>
                                <th>내용</th>
                                <th>작성일</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="review" items="${reviewList}">
                                <tr>
                                    <td>${review.category}</td>
                                    <td>${review.content}</td>
                                    <td>${review.date}</td>
                                </tr>
                            </c:forEach>
                            
                            <!-- Fallback static data if no items in reviewList -->
                            <c:if test="${empty reviewList}">
                                <tr>
                                    <td>공통(안내)</td>
                                    <td>휴게소를 안내해서...</td>
                                    <td>2025-03-21</td>
                                </tr>
                                <tr>
                                    <td>기타(대기)</td>
                                    <td>결합이 맛있어요</td>
                                    <td>2025-02-02</td>
                                </tr>
                                <tr>
                                    <td>공통(안내)</td>
                                    <td>휴게소가 많게 되고 싶어요...</td>
                                    <td>2025-01-02</td>
                                </tr>
                            </c:if>
                        </tbody>
                    </table>
                </div>
                <!-- Pagination -->
                <div class="pagination">
                    <a href="#" class="page-nav prev">&lt;</a>
                    <span class="page-number current">1</span>
                    <a href="#" class="page-nav next">&gt;</a>
                </div>
            </main>
        </div>

        <!-- Footer -->
        <footer class="footer">
            <div class="footer-logo">
                <img src="logo-small.png" alt="모두집 로고">
            </div>
            <p>(우) 06235 서울특별시 강남구 역삼동 735 한국어웨이빌딩 8층 모두집</p>
            <p>COPYRIGHT © 2025 Korea Expressway Corporation. All Right reserved.</p>
        </footer>
    </div>

    <script src="script.js"></script>
</body>
</html>