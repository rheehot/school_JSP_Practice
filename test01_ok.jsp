<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<body>
<font size=5><b>���ȭ��</b></font>
<br><br>

<%
	double number1 = Double.parseDouble(request.getParameter("number1"));
	double number2 = Double.parseDouble(request.getParameter("number2"));
	out.print("number1 : "+ number1+"<br>");
	out.print("number2 : "+ number2);
%>
<hr>
<%
	double sum = number1 + number2;
	out.print("sum : "+ sum);
%>

</body>
</html>