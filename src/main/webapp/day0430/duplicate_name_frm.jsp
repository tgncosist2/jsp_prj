<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="name속성이 중복되어있는 Form Control"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- favicon 설정 -->
<link rel="shortcut icon" href="http://192.168.10.68/jsp_prj/common/images/favicon.ico"/>
<!--  bootstrap CDN -->
<link rel="stylesheet" type="text/css"
href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css">
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

<style type="text/css">
 #container{ min-height: 600px; margin-top: 30px; margin-left: 20px}
</style>
<!-- jquery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script> 
<script type="text/javascript">
$(function(){
$('#btnGet').click(() => {
	$('#frmGet').submit();
});
$('#btnPost').click(() => {
	$('#frmPost').submit();
});
});//ready


</script>
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
            <li><a href="https://google.com" class="text-white">구글에서 찾기</a></li>
            <li><a href="https://chatgpt.com/" class="text-white">지피티 찾기</a></li>
          </ul>
        </div>
      </div>
    </div>
  </div>
  <div class="navbar navbar-dark bg-dark shadow-sm">
    <div class="container">
      <a href="index.jsp" class="navbar-brand d-flex align-items-center">
        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" aria-hidden="true" class="me-2" viewBox="0 0 24 24"><path d="M23 19a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2h4l2-3h6l2 3h4a2 2 0 0 1 2 2z"/><circle cx="12" cy="13" r="4"/></svg>
        <strong>템플릿</strong>
      </a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarHeader" aria-controls="navbarHeader" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
    </div>
  </div>
</header>
<main>
<div id="container">
<div>
<h2>name 속성의 값이 중복되는 Form Control 전송(GET)</h2>
<form name="frmGet" id="frmGet" method="GET" action="forward_b.jsp">
<ul>
<li><label>radio</label>
	<input type="radio" name="gender" value="M"/>남자 | 
	<input type="radio" name="gender" value="F"/>여자  
 </li>
 <li>
 	<label>checkbox</label>
 	<input type="checkbox" name="lang" value="Java"/>Java SE
 	<input type="checkbox" name="lang" value="C/C++"/>C/C++
 	<input type="checkbox" name="lang" value="JSP"/>JSP
 	<input type="checkbox" name="lang" value="PyThon"/>PyThon
 	<input type="checkbox" name="lang" value="ASP"/>ASP
 </li>
  <li><label>이메일</label>
 <!-- HTML Form Control의 종류와 상관 없이
 		name 속성이 같다면 배열로 처리된다. 
   -->
 	<input type="text" name="email"/>
 	<input type="text" name="email"/>
 	<input type="text" name="email"/>
 </li>
 <li>
 	<input type="button" value="GET방식 전송" class="btn btn-success"
 		id="btnGet"/>
 </li>
</ul>
</form>
</div>
<div>
<h2>name 속성의 값이 중복되는 Form Control 전송(POST)</h2>
<form name="frmPost" id="frmPost" method="POST" action="forward_b.jsp">
<ul>
<li><label>radio</label>
	<input type="radio" name="gender" value="M"/>남자 | 
	<input type="radio" name="gender" value="F"/>여자  
 </li>
 <li>
 	<label>checkbox</label>
 	<input type="checkbox" name="lang" value="Java"/>Java SE
 	<input type="checkbox" name="lang" value="C/C++"/>C/C++
 	<input type="checkbox" name="lang" value="JSP"/>JSP
 	<input type="checkbox" name="lang" value="PyThon"/>PyThon
 	<input type="checkbox" name="lang" value="ASP"/>ASP
 </li>
  <li><label>이메일</label>
 <!-- HTML Form Control의 종류와 상관 없이
 		name 속성이 같다면 배열로 처리된다. 
   -->
 	<input type="text" name="email"/>
 	<input type="text" name="email"/>
 	<input type="text" name="email"/>
 </li>
 <li>
 	<input type="button" value="POST방식 전송" class="btn btn-success"
 		id="btnPost"/>
 </li>
</ul>
</form>
</div>
</div>
</main>
<footer class="text-body-secondary py-5">
  <div class="container">
    <p class="float-end mb-1">
      <a href="#">Back to top</a>
    </p>
    <p class="mb-1"><strong style="font-size: 18px">2강의실</strong> 서울특별시 강남구 테헤란로 132(역삼동) 한독약품빌딩 8층 쌍용교육센터 <strong>Tel_02-3482-4632~5</strong> </p>
  </div>
</footer>


</body>
</html>