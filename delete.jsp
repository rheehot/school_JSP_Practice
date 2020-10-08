<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file ="dbcon.jsp" %>  

	<% 
	try { 
	
	String passwd = request.getParameter("passwd");
	String sno = request.getParameter("sno");
	if ( passwd.equals("1234") ) {
		
		String sql = "delete  from examtbl where sno = ?";
		PreparedStatement stmt = con.prepareStatement(sql);	
		stmt.setString(1,sno);
		stmt.executeUpdate() ;
		
		response.sendRedirect("list.jsp");
		
	} else {
	%>	
	    <script>
	     alert ("암호가 일치하지 않습니다. ");
	     location.href='pwd.jsp?sno=<%=sno%> ';
	    </script>
		
	<% 	
	}
	
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		if (pstmt != null ){
			try{
			    pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		if (con != null ){
			try{
				con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}		
	}
		
	%>
