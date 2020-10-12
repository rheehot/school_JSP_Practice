<%@ include file ="top.jsp" %>
<%@ page language="java" 
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file ="dbconn.jsp" %>   
<% 
	   String sql="select * from member";
	   pstmt = con.prepareStatement(sql);	
	   rs = pstmt.executeQuery() ;

    try {	
    	String bg ="#E47EB1";
		%>
		<section>
		<div align="center" >
	    <br>
		<font size=5> [ 학생 회원정보 목록보기 ]</font>
		<br>
		<center> 순 번 클릭시 회원정보 수정창이 활성화 됩니다.</center>   
		<br>
		<table width=600  border=1>
		<tr bgcolor=<%=bg %>>
		<td> 순번 </td> <td> 학번 </td> <td> 이름 </td>
		<td> 전화 </td> 	<td> 메일 </td> <td> 사진 </td>    
		</tr>
			<% 
			int cnt = 0;
			String bgclr =null;
			while(rs.next()){
			cnt ++;
			if(cnt%2 == 0){
				bgclr ="#F3B4FF";
			}else{
				bgclr ="#FF77C2";
			}
		    %> 
		    <tr bgcolor=<%=bgclr%>>
		   	<td><a href="member_content.jsp?sno=<%=rs.getString("sno")%>"><%=rs.getString("idx")%></a></td>  
			<td><%=rs.getString("sno")%> </td>      
			<td><%=rs.getString("sname")%> </td>
			<td><%=rs.getString("tel")%> </td>
			<td> <%=rs.getString("email")%> </td> 
			<td align="center"> 
			
			<%if(rs.getString("fileT") != null){ %>
			<img src="./file/<%=rs.getString("fileT")%>" width=25 height=25 /> 
			<%}else{ %>
			<img src="./file/no.JPG" width=25 height=25 /> 
			<%} %>
			</td>
			</tr>
		
		<%  } %>
	
	<% 	
	  } catch(Exception e)  {
		 e.printStackTrace();	
	  } finally {
		rs.close();
		pstmt.close();
		con.close();
	  }
	%>
    </table>

    </div>
    </section>
    
<%@ include file ="bottom.jsp" %>    