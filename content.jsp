<%@ include file ="top.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*" %>
<%@ include file ="dbcon.jsp" %> 
<%
 // 학생 성적 조회 
    String sno = request.getParameter("sno");
	String sql="select * from examtbl where sno=?";
    pstmt = con.prepareStatement(sql);	
    pstmt.setString(1,sno);
	rs = pstmt.executeQuery() ;
	
	rs.next();  // BOF 다음으로 넘겨 첫번째 레코드 사용
	
	int kor =rs.getInt("kor");
	int eng =rs.getInt("eng");
	int math =rs.getInt("math");
	int hist =rs.getInt("hist");
	int sum = kor + eng + math + hist ;
	double avg = sum / 4 ;
%>


<section>
<br>
<form name="f1" 
      onSubmit="return functionK();" 
      action="content_ok.jsp" method="GET" >
      
<div align=center >
<font  size=5px><b> 학생 성적 확인 </b></font>
</div>
<table border=1 align=center width=350 height=100>
<tr>
<td align=center  width=80><b>학&emsp;번</b></td><td>
<input type=text  name=sno value=<%=rs.getString("sno") %>></td>
</tr>
<tr>
<td align=center><b>성&emsp;명</b></td><td>
<input type=text  name=sname  value=<%=rs.getString("sname") %>></td>
</tr>
<tr>
<td align=center><b>국&emsp;어</b></td><td>
<input type=number  name=kor value=<%=kor %>></td>
</tr>
<tr>
<td align=center><b>영&emsp;어</b></td><td>
<input type=number name=eng  value=<%=eng %>></td>
</tr>
<tr>
<td align=center><b>수&emsp;학</b></td><td>
<input type=number name=math  value=<%=math %>></td>
</tr>
<tr>
<td align=center><b>역&emsp;사</b></td><td>
<input type=number name=hist  value=<%=hist %>></td>
</tr>

<tr>
<td align=center><b>합&emsp;계</b></td>
<td>&emsp;<%=sum %> </td>
</tr>

<tr>
<td align=center><b>평&emsp;균</b></td>
<td>&emsp;<%=avg %> </td>
</tr>

<tr>
<td align=center colspan=2>
<input type=submit value=성적저장></td>
</tr>
</table>
<hr width=80%>

<div align="center">
&emsp;<a href="list.jsp">[목록보기]</a>
&emsp;<a href="form.jsp">[성적추가입력하기]</a>
&emsp;<a href="pwd.jsp?sno=<%=sno%>">[삭제하기]</a>


</div>

</form>
</section>
<%@ include file ="bottom.jsp" %>   