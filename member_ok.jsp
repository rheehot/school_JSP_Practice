<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ include file ="dbconn.jsp" %>   
      
<%     
String saveFolder ="/file/";
ServletContext context = getServletContext();
String realFolder =context.getRealPath(saveFolder);

out.print("realFolder : ---> " + realFolder + "<br>");

int maxSize = 5 * 1024 * 1024 ; // 5M 
String encType = "utf-8";
MultipartRequest multi 
   = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy() );

String  sno= multi.getParameter("sno");
String  sname=multi.getParameter("sname");
String  tel= multi.getParameter("tel");
String  email=multi.getParameter("email");
String  addr1= multi.getParameter("postAddr1");
String  addr2= multi.getParameter("postAddr2");
String  addr3= multi.getParameter("postAddr3");
String addr = addr1+" "+addr2+" "+addr3;

String  filename=multi.getFilesystemName("file"); // 이름
File file = multi.getFile("file"); // 실제 파일

   try {	
	String sql="insert into member(idx ,sno, sname, tel, email,addr, fileT) values(ss_member.NEXTVAL,?,?,?,?,?,?)";
	
	pstmt = con.prepareStatement(sql);	
	pstmt.setString(1,sno);
	pstmt.setString(2,sname);
	pstmt.setString(3,tel);
	pstmt.setString(4,email);
	pstmt.setString(5,addr);
	pstmt.setString(6,filename);
	
	pstmt.executeUpdate() ;
	
    } catch(Exception e)  {    	
    	out.print("에러가 발생하였습니다.");
    	e.printStackTrace();    	
    } finally {       	
    	pstmt.close();
    	con.close();     	
    }
  
	response.sendRedirect("member_list.jsp");
	
%>	