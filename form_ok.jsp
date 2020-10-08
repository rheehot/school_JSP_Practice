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
    
	String sql="insert into examtbl(sno,sname, kor,eng,math,hist) values(?,?,?,?,?,?)";	
	pstmt = con.prepareStatement(sql);	
	pstmt.setString(1,sno);
	pstmt.setString(2,sname);
	pstmt.setString(3,kor);
	pstmt.setString(4,eng);
	pstmt.setString(5,math);
	pstmt.setString(6,hist);
	
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
