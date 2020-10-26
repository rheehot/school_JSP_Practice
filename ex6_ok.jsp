<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<body>
<font size=5><b>입력한 숫자만큼 반복수행</b></font>
<br><br>
<table border=1 width=450 height=200>
	<tr align="center">
		<td><b>글번호</b></td><td><b>글제목</b></td><td><b>글내용</b></td>
	</tr>
<%	
	int number = Integer.parseInt(request.getParameter("number"));
	for(int i=number ; i >= 1 ; i--){
%>
		<tr align="left">
		<td><%=i %></td><td>제목 <%=i%></td><td>내용 <%=i%></td>
		</tr>
<% 	
	}
%>
</table>

</body>
</html>