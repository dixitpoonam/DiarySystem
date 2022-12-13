<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import="java.util.*" import=" java.text.*" errorPage="" %>

<%!
Connection getDattabase;
Statement getStatement;
 %>
<%
try{
Class.forName("org.gjt.mm.mysql.Driver");
getDattabase= DriverManager.getConnection("jdbc:mysql://164.68.105.216/db_gps","diary","d@1ry");
// getDattabase= DriverManager.getConnection("jdbc:mysql://164.68.105.216/db_gps","diary","d@1ry");
 getStatement=getDattabase.createStatement();
}catch(Exception e)
{
	out.print("Exception "+e);
}
%>
