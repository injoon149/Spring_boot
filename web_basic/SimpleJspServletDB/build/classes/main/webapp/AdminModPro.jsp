<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" %>
    
    <%
	  request.setCharacterEncoding("utf-8");
	  // id passwd name가져오기
	  String id = request.getParameter("id");
	  String pwd = request.getParameter("pwd");
	  String username = request.getParameter("username");
	  
	    //객체참조변수 선언    
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	  
	   // 1단계 드라이버로더
	   Class.forName("com.mysql.jdbc.Driver");
	   
	// 2단계 디비연결
	   String DB_URL = "jdbc:mysql://localhost:3306/book_db";
	   String DB_USER = "root";
	   String DB_PASSWORD= "choi0344";
	   conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
	   
	   pstmt = conn.prepareStatement("UPDATE SHOPPING SET PASSWORD=?, USERNAME=? WHERE USERID=?");

	   pstmt.setString(1, id);
	   pstmt.setString(2, pwd);
	   pstmt.setString(3, username);
	
	   int result = pstmt.executeUpdate();

	   out.println(result + "<-- result");
 
		pstmt.close();
		conn.close(); 
		
 		response.sendRedirect("AdminUserList.jsp");
%>