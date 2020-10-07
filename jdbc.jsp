<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	String jdbc = "jdbc:oracle:thin:@//localhost:1521/xe";
	String id = "system";
	String pwd = "1234";


	Class.forName("oracle.jdbc.OracleDriver"); // 오라클 드라이버를 불러준다. (jdbc를 로딩하는 문장)
	Connection con = DriverManager.getConnection(jdbc,id,pwd); // db에 로그인하고 연동한다.(오라클 연결)
	out.println("Connection : " + con);
	
	if(con != null)	{	
		out.println("Database Connect : [ " + " <b>success</b> ]<br>");
	}else{	
		out.println("Database Connect : [ " + " <b>fail</b> ]<br>");
	};
	
	String sql ="select * from examtbl";
	
    PreparedStatement stmt = con.prepareStatement(sql);
    ResultSet rs = stmt.executeQuery();
    while(rs.next()){	// rs.next()레코드의 커서를 다음으로 넘긴다. 넘길게 있으면 참. 반복!
    %>
    
    <%=rs.getString(1) %> <%=rs.getString(2) %><br>

    <%}
    	rs.close();
    	stmt.close();
    	con.close();
    %>