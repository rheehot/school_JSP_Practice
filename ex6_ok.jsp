<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<body>
<font size=5><b>�Է��� ���ڸ�ŭ �ݺ�����</b></font>
<br><br>
<table border=1 width=450 height=200>
	<tr align="center">
		<td><b>�۹�ȣ</b></td><td><b>������</b></td><td><b>�۳���</b></td>
	</tr>
<%	
	int number = Integer.parseInt(request.getParameter("number"));
	for(int i=number ; i >= 1 ; i--){
%>
		<tr align="left">
		<td><%=i %></td><td>���� <%=i%></td><td>���� <%=i%></td>
		</tr>
<% 	
	}
%>
</table>

</body>
</html>