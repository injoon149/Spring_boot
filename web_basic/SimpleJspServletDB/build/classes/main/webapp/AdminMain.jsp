<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="AdminTop.jsp"%>
<%
String[] img ={"caramel.jpg", "ring.jpg", "ggobuk.jpg", "milkis.jpg","mygummy.jpg", "cola.jpg", "doritos.jpg", "jjang.jpg"};
String[] name = {"카라멜콘 땅콩", "짜파링", "꼬북칩", "밀키스", "마이구미", "콜라", "도리토스", "짱구"};
String[] price = {"1,500", "1,500", "1,700", "1,300", "1,350", "1,400", "1,800", "1,000", "1,100"};
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>InjoonMall</title>
<script type="text/javascript">

function ProductModify(name, price) {
	location.href = "contents/admin/ProdModForm.jsp?name=" + name + "&price=" + price;
}

</script>
</head>
<body>
	<div align="center">
		<h3>[인기상품]</h3>
		<table border="1">
			<%
		for(int i = 0; i < img.length; i++) {
			if(i % 3 == 0) { 
				out.println("<tr align='center'>");
			}
			out.println("<td>");
				out.println("<table>");
					out.println("<tr align='center'>");
						out.println("<td>");
							out.println("<img src = '" + img[i] + "' width='150' height='150' />");
						out.println("</td>");
					out.println("</tr>");
					
					out.println("<tr align='center'>");
						out.println("<td>");
							out.println("<b>" + name[i] + "</b>");
						out.println("</td>");
					out.println("</tr>");
					
					out.println("<tr align='center'>");
						out.println("<td>");
							out.println("<b>￦" + price[i] + "원</b>");
						out.println("</td>");
					out.println("</tr>");
					
					out.println("<tr align='center'>");
						out.println("<td>");
							//한 줄로 쓰기
							//out.println("<input type='button' value='장바구니 담기' onclick='fnCart(\"" + name[i] + "\", \"" + price[i] + "\")' />");
							//두 줄로 쓰기, 닫는 큰 따옴표와 괄호 옆의 띄어쓰기 필수
							out.println("<input type='button' value='상품정보수정' ");
							out.println("onclick='ProductModify(\"" + name[i] + "\", \"" + price[i] + "\")' />");
						out.println("</td>");
					out.println("</tr>");
				out.println("</table>");
			out.println("</td>");
			if(i % 3 == 2) {
				out.println("</tr>");
			}
		}
		%>
		</table>
	</div>
</body>
</html>