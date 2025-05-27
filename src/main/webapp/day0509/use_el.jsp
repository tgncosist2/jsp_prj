<%@page import="java.util.Random"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="EL의 사용"
    isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../common/jsp/external_file.jsp"/>

<style type="text/css">
 #container{ min-height: 600px; margin-top: 30px; margin-left: 20px}
</style>

<script type="text/javascript">
$(function(){
	
});//ready



</script>
</head>
<body>
<header data-bs-theme="dark">
<jsp:include page="../common/jsp/header.jsp"/>
</header>
<main>
<div id="container">
<div>
<h2>EL에서 변수의 사용</h2>
<%
	String name="주현석";
	int age=26;
//EL에서 변수를 사용하려면 scope 객체 할당.
	 pageContext.setAttribute("na", name);
	 pageContext.setAttribute("age", age);
%>
<!-- EL에서는 변수를 직접 접근할 수 없다. 표현식은 접근 가능 -->
이름 : ${ name }, <%=name %>, ( ${ na } ), ${ age }, ${ -age } <br>
</div>

<h2>EL에서 제공하는 연산자 사용</h2>
<%
	boolean flag=false;
	int i=5;
	int j=9;
	pageContext.setAttribute("flag", flag);
	pageContext.setAttribute("i", i);
	pageContext.setAttribute("j", j);
%>
	단항 : ${ flag }, ${ !flag }, ${ not flag }, ${ -age } <br>
	산술 : ${ i } + ${ j } = ${ i+j },${ i } %2 = ${ i%2 } ( ${ i mod 2 } ) )<br>
	관계 : ${ i > 4 } ( ${ i gt 4  } ),
			${ i < 4 } ( ${ i lt 4  } ),
			${ i >= 5 } ( ${ i ge 5  } ),
			${ i <= 5 } ( ${ i le 5  } ),
			${ i == 5 } ( ${ i eq 5  } ),
			${ i != 5 } ( ${ i ne 5  } )<br>
			
	논리 : ${ i > 4 && i < 6 } ( ${ i gt 4 and i lt 6 } ),
	 		${ i > 6 || i < 3 } ( ${ i gt 6 or i lt 3 } )<br>
	<!-- EL에서는 문자가 없다. 문자열을 표현할 때 ", '모두 사용 가능 -->
	삼항 : ${i %2==0 ? "짝수인가":'홀수입니다.' } (${ i mod 2 eq 0 ? " 짝수인가 ":' 홀수입니다.' } )<br>
	<!-- scope 객체가 가지고 있는 i값이 0~10 이면 유효, 아니면 무효 웹 브라우저에 출력-->
	${ i ge 0 or i le 10 ? "유효": '무효'} 
	${ i gt -1 and i lt 11 ? "유효": '무효'}<br>
	
<%
	String str=null; //객체가 생성되지 않음
	String str2=""; // literal에 비어있는 값(empty)을 할당
	List<String> list=new ArrayList<String>(); // 빈 리스트 생성
	if(new Random().nextBoolean()){
		list.add("EL사용함");
	}//end if
	
	pageContext.setAttribute("str", str);/* 가장 가까운 것 사용한다.->식별해서 사용할 수 있다. (scope-page,sesssion, applicaton등 ) */
	pageContext.setAttribute("str2", str2);
	pageContext.setAttribute("list", list);

%>
null 비교 : ${ empty str? "oㅅo 없쪙":"있음" }, ${ !empty str }, ${ not empty str }<br>
"" 비교 : ${ empty str2 }<br>
list size가 0인지 비교 : ${ empty list }<br>

null은 출력되지 않는다. [ ${ str } ], [<%=str %>]

</div>
</main>
<footer class="text-body-secondary py-5">
<jsp:include page="../common/jsp/footer.jsp"/>  
</footer>


</body>
</html>