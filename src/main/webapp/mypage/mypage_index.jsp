<%@page import="kr.co.sist.member.MemberDTO"%>
<%@page import="kr.co.sist.member.MemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../common/jsp/site_config.jsp"%>
<%@ include file="../common/jsp/login_chk.jsp"%>

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

h3 {
	text-align: center;
	margin-bottom: 50px;
}
</style>

<script type="text/javascript">
	$(function() {
		
		$('#btnImg').click(()=>{
			$('#profileImg').click();
		});
		
		// #profileImg = input type="file"
		$('#profileImg').change((evt)=>{
			// 선택한 파일이 이미지인지를 체크합니다.
			
			// input type="hidden" #imgName에 파일 경로 value에 저장
			//$('#imgName').val($('#profileImg').val()); // 같은 이름에 파일이 있으면 문제가 생길 수 있으니 날리세요.
			
			// 1. 이벤트를 발생시킨 객체로 접근하여 file 객체를 얻는다.
			var file = evt.target.files[0];
			
			// 2. 스트림 생성
			var reader = new FileReader();
			
			
			// 3. FileReader 객체의 onload 이벤트 핸들러를 설정
			reader.onload = function(evt) {
				$('#imgSrc').prop("src",evt.target.result); // Base64
			};
			
			// 4. 파일을 읽어들여 img 태그에 미리보기 설정
			reader.readAsDataURL(file);
			
		});
		
		$('#btnUpdate').click(()=>{
			if (confirm('회원 정보를 수정하시겠습니까?')) {
				var uploadFlag = $('#imgSrc')[0].src.lastIndexOf('default.jpg') == -1;
				if (uploadFlag) {
					// 파일 업로드
					// 1. input type='file'을 가진 <form> 을 얻어서
					// 		parameter 전송방식을 binary 전송방식으로 바꾼다.
					var form = $('#frm')[0];
					var formData = new FormData(form);
					
					$.ajax({
						url: 'profile_upload.jsp',
						type: 'post',
						contentType: false, // 이걸로 파일 전송방식이 됩니다. Parameter 전송 -> binary 전송으로 변환
						processData: false, // QueryString 사용 X
						data: formData,
						dataType: 'json',
						error: function(xhr) {
							console.log(xhr.status + ', TEXT : ' + xhr.statusText);					
						},
						success: function(jsonObj) {
							if(jsonObj.resultFlag) {
								$('#imgName').val(jsonObj.fileName);
								$('#frm').submit();
							} else {
								console.log("프로필 이미지가 업로드 되지 않았습니다.");
							}// end if
						}// success
					});
					
				}// end if
					
				
			}// end if
		});
	});//ready
</script>
</head>
<body>
	<header data-bs-theme="dark">
		<c:import url="${url }/common/jsp/header.jsp" />
	</header>
	<main>
		<div id="container">
			<%
			String id = ((LoginResultDTO) session.getAttribute("userData")).getId();

			MemberService ms = new MemberService();

			MemberDTO mDTO = ms.searchOneMember(id);
			if (mDTO == null) {
				response.sendRedirect("http://192.168.10.91/jsp_prj");
				return;
			}
			
			session.setAttribute("nowProfileImg", mDTO.getProfile_img());

			pageContext.setAttribute("mDTO", mDTO);
			%>

			<table class="table table-hover"
				style="text-align: center; margin: 0 auto;">
				<thead>
					<tr>
						<th colspan="2"><h3>마이페이지</h3></th>
					</tr>
				</thead>
				<form action="mypage_process.jsp" method="POST" name="frm" id="frm" accept-charset="UTF-8">
					<tbody>
						<tr>
							<td><img src="${mDTO.profile_img eq 'default.jpg' ? "../common/images" : uploadURL }/${mDTO.profile_img }"
								style="width: 150px; height: 150px;" id="imgSrc" />
								<p style="margin-top: 20px;">프로필 사진</p></td>
							<td style="text-align: center; vertical-align: middle;"><input
								type="button" class="btn btn-danger" value="이미지선택" id="btnImg"
								name="btnImg" /> <input type="hidden" class="btn btn-danger"
								value="이미지선택" id="imgName" name="imgName" /> <input type="file"
								id="profileImg" multiple="multiple" name="profileImg"
								style="display: none;" /></td>
						</tr>
						<tr>
							<td>이름</td>
							<td>${mDTO.name }<input type="hidden" name="name"
								value="${mDTO.name }" />
							</td>

						</tr>
						<tr>
							<td>생년월일</td>
							<td><input type="date" name="birth" value="${mDTO.birth }"
								style="text-align: center;" /></td>
						</tr>
						<tr>
							<td>전화번호</td>
							<td>
							<input type="text" value="${mDTO.tel }" style="text-align: center;" name="tel"/>
							</td>
						</tr>
						<tr>
							<td>성별</td>
							<td><input type="radio" name="gender" value="남자"
								${ mDTO.gender eq "남자" ? "checked" : "" } />남자 <input
								type="radio" name="gender" value="여자"
								${ mDTO.gender eq "여자" ? "checked" : "" } />여자</td>
						</tr>
						<tr>
							<td>가입시 사용된 IP Address</td>
							<td><c:out value="${mDTO.ip }" /></td>
						</tr>
						<tr>
							<td>가입일</td>
							<td><fmt:formatDate value="${mDTO.input_date }"
									pattern="yyyy-MM-dd a EEEE HH:mm" /></td>
						</tr>
					</tbody>
			</table>


			<div style="text-align: center; margin-top: 100px;">
				<input type="button" class="btn btn-success" value="정보변경"
					id="btnUpdate" /> <input type="button" class="btn btn-info"
					onclick="javascript:history.back()" value="뒤로가기" />
			</div>
			</form>
		</div>
	</main>
	<footer class="text-body-secondary py-5">
		<c:import url="${url }/common/jsp/footer.jsp" />
	</footer>
</body>
</html>