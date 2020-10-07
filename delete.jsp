<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

String sno = request.getParameter("sno");

	String jdbc = "jdbc:oracle:thin:@//localhost:1521/xe";
	String id = "system";
	String pwd = "1234";


	Class.forName("oracle.jdbc.OracleDriver"); 
	Connection con = DriverManager.getConnection(jdbc,id,pwd); 
	out.println("Connection : " + con);
	
	if(con != null)	{	
		out.println("Database Connect : [ " + " <b>success</b> ]<br>");
	}else{	
		out.println("Database Connect : [ " + " <b>fail</b> ]<br>");
	};
	
	String sql ="delete from examtbl where sno = ? ";
    PreparedStatement stmt = con.prepareStatement(sql);
    stmt.setString(1, sno);
    
    stmt.executeUpdate() ;
    
	stmt.close();
	con.close();
	
    response.sendRedirect("list.jsp");
    %>

</body>
</html>