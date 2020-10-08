<%@ include file ="top.jsp" %>
<%@ page language="java" 
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ page import="java.sql.*" %>
<%@ include file ="dbcon.jsp" %>   

<% 
    try {
	    String sql = null;
	    String ch1 = request.getParameter("ch1");
	    String ch2 = request.getParameter("ch2");	  
	    
	    if(ch2 == null || ch2 == ""){
			sql  = "select SNO";
			sql += "     , SNAME";
			sql += "     , NVL(KOR,0) KOR";
			sql += "     , NVL(ENG,0) ENG";
			sql += "     , NVL(MATH,0) MATH";
			sql += "     , NVL(HIST,0) HIST";
			sql += "  from examtbl";
		}
	    else{
	    	sql="select * from examtbl where " + ch1 + " like '%" + ch2 +"%' " ;
	    }
	    
	    /* SQL 쿼리문 안에는 되도록 ?를 사용하지 않는 것을 권장한다.
	    		
	    if(ch1.equals("sno")){
	    	sql="select * from examtbl where sno like '%" + ch2 +"%' " ;
	    }else{
	    	sql="select * from examtbl where sname like '%" + ch2 +"%' " ;
	    }
	    */
	    pstmt = con.prepareStatement(sql);	
    	rs = pstmt.executeQuery() ;
	%>
	
	<section>
	<div align="center" >
    <br>
	<font size=5> 학생성적 목록보기 </font>
	<div align="left">
		<ul>
			<li>학번클릭 : 성적확인/ 수정</li>
			<li>평균클릭: 기록삭제</li>
		</ul>
	</div>
	<br>
	<table width=600  border=1>
	<tr>
	<td> 번호 </td> <td> 이름 </td><td> 국어 </td> 
	<td>영어 </td>  <td>수학 </td> <td>역사 </td> <td>합계 </td> <td>평균 </td> 
	</tr>
	<%
	int count=0;
	String bg = null;
	while(rs.next()){
	int	sum = rs.getInt("kor") + rs.getInt("eng") + rs.getInt("math") +rs.getInt("hist") ;
	double avg = Math.round(( sum / 4.0) *10 )/10.0 ;
	count += 1;
	if(count%2 != 0 ){
		bg = "#C97CBF";
	}else{
		bg = "#FFD9EC";
	}
    %>    
    <tr bgcolor=<%=bg%>>
	<td> <a href=content.jsp?sno=<%=rs.getString("sno")%>><%=rs.getString("sno")%> </a> </td><td> <%=rs.getString("sname")%> </td>
	<td>  <%=rs.getString("kor")%> </td> <td> <%=rs.getString("eng")%> </td> 
	<td> <%=rs.getString("math")%> </td> <td> <%=rs.getString("hist")%> </td> 
	<td>&emsp; <%=sum%></td>
	<td>&emsp; <a href=pwd.jsp?sno=<%=rs.getString("sno")%>>
	               <%=avg%>
	           </a> 
	</td>
	</tr>

<%  }%>


	<tr>
		<td colspan=2 align="center">학생 수</td><td colspan=6 align="center"><%=count %>&emsp;명</td>
	</tr>

	
<%	
  } catch(Exception e)  {
		
  } finally {
	rs.close();
	pstmt.close();
	con.close();
  }
%>
    </table>
     <form>
            <select name="ch1">
                <option value="sno">학번</option>
                <option value="sname">이름</option>
            </select>
            <input type="text" name="ch2">
            <input type="submit" value="검색">
        </form>
    
    </div>
    </section>
    
<%@ include file ="bottom.jsp" %>    