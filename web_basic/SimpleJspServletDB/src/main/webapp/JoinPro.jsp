<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>

<%
	request.setCharacterEncoding("UTF-8"); 
	
%>

<%
	String ID = request.getParameter("ID"); // JoinForm.jsp에서 입력받은 값들을 받아옵니다.
	String PWD = request.getParameter("PWD");
	String UserName = request.getParameter("UserName");

	try {
		
		Class.forName("com.mysql.jdbc.Driver");
		String DB_URL = "jdbc:mysql://localhost:3306/book_db";
		
		
		String userName="root";
		String password="choi0344";
		
		Connection con = DriverManager.getConnection(DB_URL, userName, password);
		String sql = "INSERT INTO shopping(UserType,UserID, password, UserName) VALUES ('customer',?,?,?)"; // sql문 작성(입력받은 값들을 보내기 위한 작업)

		PreparedStatement pstmt = con.prepareStatement(sql);

		pstmt.setString(1, ID); // values에 들어갈 각각의 ID, PWD, UserName설정
		pstmt.setString(2, PWD);
		pstmt.setString(3, UserName);

		pstmt.executeUpdate();

		pstmt.close();
		con.close();
	}

	catch(ClassNotFoundException e) {
		out.println(e);
	}
	catch(SQLException e) {
		out.println(e);
	}
%>


<script>
	alert("회원가입을 축하합니다!");
	location.href='Usermain.jsp'; 
</script>