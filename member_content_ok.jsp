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
	String  addr= multi.getParameter("addr");
	
	String  filename=multi.getFilesystemName("file"); // 이름
	File file = multi.getFile("file"); // 실제 파일
	
    try {
	
	    if(filename != null){
	    	// 정보변경시 기존 파일 삭제하기 위한 영역(삭제파일 찾기)
	    	String select_sql = "select * from member where sno=?";
	    	pstmt = con.prepareStatement(select_sql);
	    	pstmt.setString(1, sno);
	    	rs = pstmt.executeQuery();
	    	rs.next();
	    	String fileT = rs.getString("fileT");
	    	//실제 파일 삭제 영역
	    	String fileName = context.getRealPath(saveFolder)+fileT;
	    	out.print("삭제fileName: "+fileName);
	    	File delfile = new File(fileName);
	    	delfile.delete();
	    	rs.close();
	    	pstmt.close();
	    	
	    	// 정보수정영역
			String sql="update member set ";  
			       sql = sql + " sname=?, tel=?,email=?,addr=?, fileT=?" ;
			       sql = sql + " where sno=? ";
			
			pstmt = con.prepareStatement(sql);	
			
			pstmt.setString(1,sname);
			pstmt.setString(2,tel);
			pstmt.setString(3,email);
			pstmt.setString(4,addr);
			pstmt.setString(5,filename);
			pstmt.setString(6,sno);	
			
			pstmt.executeUpdate() ;
	    }else{
	    	//수정할 파일이 없을 경우, 기존의 파일을 그대로 두기
	    	String sql="update member set ";  
		       sql = sql + " sname=?, tel=?,email=?,addr=?" ;
		       sql = sql + " where sno=? ";
		
			pstmt = con.prepareStatement(sql);	
			
			pstmt.setString(1,sname);
			pstmt.setString(2,tel);
			pstmt.setString(3,email);
			pstmt.setString(4,addr);
			pstmt.setString(5,sno);	
			
			pstmt.executeUpdate() ;
		    	
	    }
    } catch(Exception e)  {
    	out.print("에러가 발생하였습니다.");
    	e.printStackTrace();
    } finally { 
    	pstmt.close();
    	con.close(); 
    }
  
	response.sendRedirect("member_list.jsp");
	
%>	
