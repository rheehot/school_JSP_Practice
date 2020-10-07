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
out.print("저장완료!");

String sno = request.getParameter("sno");
String sname = request.getParameter("sname");
String kor = request.getParameter("kor");
String eng = request.getParameter("eng");
String math = request.getParameter("math");
String hist = request.getParameter("hist");

int sum = Integer.parseInt(kor)+Integer.parseInt(eng)+Integer.parseInt(math)+Integer.parseInt(hist);
double avg = Math.round((sum/4.0)*100)/100.0;

out.print("학번:" + sno +"<br>") ;
out.print("성명:" + sname +"<br>") ;
out.print("국어:" + kor +"<br>") ;
out.print("영어:" + eng +"<br>") ;
out.print("수학:" + math +"<br>") ;
out.print("역사:" + hist+"<br>") ;
out.print("평균:" + avg +"<br>") ;
out.print("합계:" + sum ) ;

%> 

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
	
	String sql ="insert into examtbl(sno, sname, kor, eng, math, hist) values(?, ?, ?, ?, ?, ?)";
	
    PreparedStatement stmt = con.prepareStatement(sql);
    stmt.setString(1, sno);
    stmt.setString(2, sname);
    stmt.setString(3, kor);
    stmt.setString(4, eng);
    stmt.setString(5, math);
    stmt.setString(6, hist);
    
    stmt.executeUpdate() ;
    
	stmt.close();
	con.close();
	
    response.sendRedirect("list.jsp");
    %>

</body>
</html>