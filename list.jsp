<%@ include file="top.jsp" %>

<%@ page language="java" 
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*" %>
<section>

<% 
     String  jdbc = "jdbc:oracle:thin:@//localhost:1521/xe";
     String  id = "system";
     String  pwd = "1234";

	Class.forName("oracle.jdbc.OracleDriver"); 
	Connection con = DriverManager.getConnection(jdbc,id,pwd); 

	String sql="select * from examtbl";
	PreparedStatement stmt = con.prepareStatement(sql);	
	ResultSet rs = stmt.executeQuery() ;
%>
	<div align="center" >
	<br>
	<font size=5> 학생 성적처리 목록보기</font>
	<table width=500  border=1>
	<tr>
	<td> 번호 </td> <td> 이름 </td><td> 국어 </td> 
	<td>영어 </td>  <td>수학 </td> <td>역사 </td> <td>합계</td> <td>평균</td> 
	</tr>
<%
	while(rs.next()){
		int sum = rs.getInt("kor")+rs.getInt("eng")+rs.getInt("math")+rs.getInt("hist");
		double avg = sum/4.0;
%>    
    <tr>
	<td> <%=rs.getString(1)%> </td> <td> <%=rs.getString("sname")%> </td>
	<td>  <%=rs.getString("kor")%> </td> <td> <%=rs.getString("eng")%> </td> 
	<td> <%=rs.getString("math")%> </td> <td> <%=rs.getString("hist")%> </td> 
	<td> <%=sum %> </td> <td> <a href=./delete.jsp?sno=<%=rs.getString("sno")%>><%=avg %></a></td> 
	</tr>

<%
	}
		
	rs.close();
	stmt.close();
	con.close();
%>
    </table>
    </div>
    </section>
    
<%@ include file="bottom.jsp" %>