<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="TopNav.css">
<script src="https://kit.fontawesome.com/8351000410.js"
	crossorigin="anonymous"></script>
<title>InjoonMall</title>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@300&display=swap"
	rel="stylesheet">

</head>

<body>
	<nav class="navbar">
		<div class="navbar_logo">
			<i class="fas fa-cookie-bite"></i> <a href="AdminMain.jsp">InjoonMall</a>
		</div>

		<ul class="navbar_menu">
			<li><a href="AdminMain.jsp">인기상품</a></li>
			<li><a href="Admincookie.jsp">과자</a></li>
			<li><a href="Admincandy.jsp">캔디류</a></li>
			<li><a href="Admindrink.jsp">음료</a></li>
		</ul>

		<ul class="navbar_usermenu">
			<li><a href="AdminUserList.jsp">회원관리</a></li>
			<li><a href="list.jsp">게시판</a></li>
			<li><a href="Logout.jsp">로그아웃</a></li>
		</ul>

		<ul class="navbar_icons">
			<li><i class="fab fa-twitter-square"></i></li>
			<li><i class="fab fa-facebook-square"></i></li>
			<li><i class="fab fa-instagram"></i></li>
		</ul>

		<a href="#" class="navbar_toggleBtn"> <i class="fas fa-bars"></i>
		</a>
	</nav>

	<script> //윈도우 창의 사이즈를 줄였을 시 나오는 햄버거 모양 토글바
	const toggleBtn = document.querySelector('.navbar_toggleBtn');
	const menu = document.querySelector('.navbar_menu');
	const icons = document.querySelector('.navbar_icons');
	
	toggleBtn.addEventListener('click',()=>{
	    menu.classList.toggle('active');
	    icons.classList.toggle('active');
	});
	</script>

</body>
</html>