<%@ include file="conn.jsp" %>
<%@ include file="MenuNew.jsp"%>
<html>
<head>

<script>
function InsertSuccessfully(){
	alert(" Insert Successfully ")
	location.href = 'CreatedsId.jsp';
	return true;
}

function InsertExcept(){
	alert("Error While Inserting..")
	location.href = 'CreatedsId.jsp';
	return true;
}
</script>


</head>
<body>
	
<%!
Connection conn1;
%>
<% 

try {
	
	Class.forName(MM_dbConn_DRIVER);
	conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
Statement stmt1 = conn1.createStatement();
ResultSet rs2=null;
String sql1="", sql2=""; 
String username=session.getAttribute("username").toString();
String trans="", fn="", pass="", un="",typeofuser="";
int maxid=0;
String name=request.getParameter("name");
String user=request.getParameter("user");
String usertype=request.getParameter("utype");
String mail=request.getParameter("email");
		java.util.Date d = new java.util.Date();
		Format formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String s=formatter.format(d);
			
sql2="select max(Id) as maxid from db_CustomerComplaints.t_admin";
rs2=stmt1.executeQuery(sql2);
if(rs2.next())
{
	maxid=rs2.getInt("maxid");
}
	maxid=maxid+1;	
	
String sqluser="select UName from db_CustomerComplaints.t_admin where UName='"+user+"' and UserType='service'";	
ResultSet rsuser=stmt1.executeQuery(sqluser);
if(rsuser.next())
{
	
	
}
else
{
sql1="insert into db_CustomerComplaints.t_admin (Id,Name,UName,pass,URole,UserType,Email,EntBy) values ('"+maxid+"','"+name+"', '"+user+"', 'transworld', 'service', '"+usertype+"','"+mail+"','"+username+"') ";
stmt1.executeUpdate(sql1);

System.out.println("Hereeer");



out.println("<script>InsertSuccessfully();</script>");

/* response.sendRedirect("CreatedsId.jsp?inserted=successfull");
 */
}
} catch(Exception e) { out.println("Exception----->"+e);

out.println("<script>InsertExcept();</script>");

}finally{conn1.close();}

%>
</body>
</html>
<%@ 		include file="footer.jsp"%>	