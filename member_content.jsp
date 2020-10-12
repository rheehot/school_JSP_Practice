<%@ include file ="top.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*" %>
<%@ include file ="dbconn.jsp" %> 
<%

	String  saveFolder ="/file/";
	ServletContext context = getServletContext();
	String realFolder =context.getRealPath(saveFolder);
		
	String sno = request.getParameter("sno");
	String sql="select * from member where sno=?";
    pstmt = con.prepareStatement(sql);	
    pstmt.setString(1,sno);
	rs = pstmt.executeQuery() ;
	
	rs.next(); 
	
	String idx =rs.getString("idx");
		   sno =rs.getString("sno");
	String sname =rs.getString("sname");
	String tel =rs.getString("tel");
	String email =rs.getString("email");
	String addr =rs.getString("addr");
	String file =rs.getString("fileT");
	String img = "./file/" + file; //웹에서도 보기 위해서는 처리필요
	//String img = realFolder + file;
	
%>

<section>
<br>
<form name="f1" 
      onSubmit="return functionK();" 
      action="member_content_ok.jsp" method="post" 
      enctype="multipart/form-data" >
      
<div align=center >
<font  size=5px><b>[ 학생 회원 정보수정 ]</b></font>
<br>
</div>
<table border=1 align=center width=400 height=100>
<tr>
<td align=center  width=80><b>학&emsp;번</b></td><td>
<input type=text  name=sno value=<%=sno%>></td>
</tr>
<tr>
<td align=center><b>성&emsp;명</b></td><td>
<input type=text  name=sname value=<%=sname%>></td>
</tr>
<tr>
<td align=center><b>전화번호</b></td><td>
<input type=text  name=tel value=<%=tel%>></td>
</tr>
<tr>
<td align=center><b>이메일</b></td><td>
<input type=text name=email size="30" value=<%=email%>></td>
</tr>
<tr>
<td align=center><b>주소</b></td><td>
<input type=text name=addr size="30" value="<%=addr%>"></td>
</tr>
<tr  >
<td align=center rowspan=2><b>사진</b></td>
<td align="center">
	<%if(rs.getString("fileT") != null) {%>
	<img src="<%=img%>"  width=300  height=150>
	<%}else{ %>
	<img src="./file/no.JPG"  width=200  height=200>
	<%} %>
</td>
</tr>
<tr>
<td ><input type=file name=file ></td>
</tr>
<tr>
<td align=center colspan=2>
<input type=submit value=정보수정></td>
</tr>
</table>
</form>
	<hr  width=80% />
	<div  align="center" >
	&emsp;<a href=member.jsp>[글쓰기]</a>
	&emsp;<a href=member_list.jsp>[목록보기]</a>
	&emsp;<a href=member_delete.jsp?sno=<%=rs.getString("sno") %>>[삭제하기]</a>
	</div>
</section>
<%
 rs.close();
 pstmt.close();
 con.close();
%>

<%@ include file ="bottom.jsp" %>   