<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" %>

<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("ID");
	
	try {
		
		Class.forName("com.mysql.jdbc.Driver");
		String DB_URL = "jdbc:mysql://localhost:3306/book_db";
		
		String userName="root";
		String password="choi0344";
		
		Connection con = DriverManager.getConnection(DB_URL, userName, password);

		String sql = "DELETE FROM shopping WHERE UserID=?";

		PreparedStatement pstmt = con.prepareStatement(sql); 
		pstmt.setString(1, id);

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
	response.sendRedirect("AdminUserList.jsp");
%>