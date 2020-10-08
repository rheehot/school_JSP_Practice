<%@ include file ="top.jsp" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
  String  sno = request.getParameter("sno");
%>

<script src=./js/form.js>   </script>

<section>
<br><br>
<form name="f1" action="delete.jsp" method="GET" >
      
<div align=center >
<font  size=5px><b>암호 확인</b></font>
</div>
<table border=1 align=center width=350 height=120>
<tr>
<td align=center  width=80><b>학&emsp;번</b></td><td>
<input type=text  name=sno  value=<%=sno %>></td>
</tr>
<tr>
<td align=center><b>암&emsp;호</b></td><td>
<input type=text  name=passwd ></td>
</tr>
<tr>
<td align=center colspan=2>
<input type=submit value=삭제완료하기></td>
</tr>
</table>
<hr width=80%>
<div align="center">
&emsp;<a href="list.jsp">[이전페이지로 돌아가기]</a>
&emsp;<a href="form.jsp">[성적추가입력하기]</a>
</div>
</form>
</section>
<%@ include file ="bottom.jsp" %>  
