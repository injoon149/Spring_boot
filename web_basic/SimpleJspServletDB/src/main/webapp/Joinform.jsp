<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="UserTop.jsp"%>
<html>
<head>
<title>회원가입 페이지</title>
<style>
#wrap {
	width: 530px;
	margin-left: auto;
	margin-right: auto;
	text-align: center;
}

table {
	border: 3px solid red
}

td {
	border: 1px solid pink
}

#title {
	background-color: pink
}
</style>

<script type="text/javascript">
	
		// 필수 입력정보인 아이디, 비밀번호가 입력되었는지 확인하는 함수
		function checkValue() {
			if(!document.userInfo.ID.value){
				alert("아이디를 입력하세요.");
				return false;
			}
			
			if(!document.userInfo.PWD.value){
				alert("비밀번호를 입력하세요.");
				return false;
			}
			
			// 비밀번호와 비밀번호 확인에 입력된 값이 동일한지 확인
			if(document.userInfo.PWD.value != document.userInfo.PWD_RE.value ){
				alert("비밀번호를 동일하게 입력하세요.");
				return false;
			}
			
			if(!document.userInfo.UserName.value){
				alert("이름을 입력하세요.");
				return false;
			}
		}
		
		// 취소 버튼 클릭시 로그인 화면으로 이동
		function goLoginForm() {
			location.href="Loginform.jsp";
		}

	</script>
</head>
<body>
	<div id="wrap">
		<br>
		<br> <b><font size="6" color="gray">회원가입</font></b> <br>
		<br>
		<br>

		<form method="post" action="JoinPro.jsp" name="userInfo"
			onsubmit="return checkValue()">
			<table>
				<tr>
					<td id="title">아이디</td>
					<td><input type="text" name="ID" maxlength="20"> <input
						type="button" value=" 중복확인 "></td>
				</tr>

				<tr>
					<td id="title">비밀번호</td>
					<td><input type="password" name="PWD" maxlength="15">
					</td>
				</tr>

				<tr>
					<td id="title">비밀번호 확인</td>
					<td><input type="password" name="PWD_RE" maxlength="15">
					</td>
				</tr>

				<tr>
					<td id="title">이름</td>
					<td><input type="text" name="UserName" maxlength="40">
					</td>
				</tr>
			</table>
			<br> <input type="submit" value=" 가 입 "> <input
				type="button" value=" 취 소 " onclick="goLoginForm()">
		</form>
	</div>
</body>
</html>