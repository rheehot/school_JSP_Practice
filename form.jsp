<%@ include file="top.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
  function functionK(){
     if (f1.sno.value=="") {
        alert("학번을 입력해 주세요 ");
        return  false ;
     }
  }
</script>


</head>
<body>

<section>
<br><br>
<form name="f1" onSubmit="return functionK();" action="form_ok.jsp" method="GET" >
<font style align=center size=5px><p><b>학생 성적 입력</b></p></font>
<table border=1 align=center width=350 height=100>
<tr>
<td align=center  width=80><b>학&emsp;번</b></td><td>
<input type=text  name=sno></td>
</tr>
<tr>
<td align=center><b>성&emsp;명</b></td><td>
<input type=text  name=sname></td>
</tr>
<tr>
<td align=center><b>국&emsp;어</b></td><td>
<input type=number  name=kor></td>
</tr>
<tr>
<td align=center><b>영&emsp;어</b></td><td>
<input type=number name=eng></td>
</tr>
<tr>
<td align=center><b>수&emsp;학</b></td><td>
<input type=number name=math></td>
</tr>
<tr>
<td align=center><b>역&emsp;사</b></td><td>
<input type=number name=hist></td>
</tr>

<tr>
<td align=center colspan=2>
<input type=submit value=성적저장></td>
</tr>
</table>
</form>
</section>


</body>
</html>
<%@ include file="bottom.jsp" %>