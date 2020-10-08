<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file ="dbcon.jsp" %>   
<%
 String sno = request.getParameter("sno");
 String sname = request.getParameter("sname");
 String kor = request.getParameter("kor");
 String eng = request.getParameter("eng");
 String math = request.getParameter("math");
 String hist = request.getParameter("hist");
 
    try {
    	
    // dbconn.jsp 에서 데이터베이스 연동 컨넥션 하고 있음.!!
	
	String sql="update examtbl set ";  
	       sql = sql + " sname=?, kor=?,eng=?,math=?, hist=?" ;
	       sql = sql + " where sno=? ";
	
	pstmt = con.prepareStatement(sql);	
	
	pstmt.setString(1,sname);
	pstmt.setString(2,kor);
	pstmt.setString(3,eng);
	pstmt.setString(4,math);
	pstmt.setString(5,hist);
	pstmt.setString(6,sno);	
	
	pstmt.executeUpdate() ;
	
    } catch(Exception e)  {
    	out.print("에러가 발생하였습니다.");
    	e.printStackTrace();
    } finally { 
    	pstmt.close();
    	con.close(); 
    }
  
	response.sendRedirect("list.jsp");
	
%>	
