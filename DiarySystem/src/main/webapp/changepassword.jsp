<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>

<%@ include file="header.jsp" %>


<%! 
Connection con1;
Statement stmt1;
%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

	<title>Seven Day Diary System.</title>
	
	   <link href="css/form.css" rel="stylesheet" type="text/css" />
    
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
     
	<!-- <link rel="stylesheet" href="style.css" type="text/css" charset="utf-8" />
	<link rel="stylesheet" href="css/css.css" type="text/css" charset="utf-8" /> -->
	
	<script src="sorttable.js" type="text/javascript"></script>

<script language="javascript">
function validate()
{
	v1=document.changepass.curpass.value;
	v2=document.changepass.newpass.value;
	v3=document.changepass.confpass.value;
	v4=document.changepass.curpasschk.value;

   if(v1.length==0)
   {
      alert("Please enter your current password");
      return false;
   }
   if(v1!=v4)
   {
      alert("Entered current Password doesn't match with our records ");
      return false;
   }
   
   if(v2.length==0)
   {
      alert("Please enter new password");
      return false;
   }

   if(v3.length==0)
   {
      alert("Please confirm your password");
      return false;
   }
 
   if(v2!=v3)
   {
      alert("Text in New password and confirm password doesn't match");
      return false;
   }
      return true;
}
</script>
<style>
.popup {
background-color: #98AFC7;
position: absolute;
visibility: hidden;

</style>

	
</head>

<body>

  
  <%String para=request.getParameter("parameter");
if(para!=null && para.equalsIgnoreCase("tech"))
{
%>
  <%@ include file="headertech.jsp" %>

<%}
else{%>
                    <%@ include file="MenuNew.jsp"%>
          <%} %>
          </div>
	<div id="gbox1">
            <div id="gbox-top1"> </div>
            <div id="gbox-bg1">
              <div id="gbox-grd1">

<form name="changepass" method="get" action="changepassinsrt.jsp" onSubmit="return validate();">
<%		
try
{
   Class.forName(MM_dbConn_DRIVER);
	con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	stmt1=con1.createStatement();	
	ResultSet rs1=null,rs2=null,rs3=null, rs4=null;
	String sql1="",sql,sql2,sql3, sql4;
	String user="", curpass="";

	String changed=request.getParameter("changed");
	if(changed==null)	
	{
	}
	else
	{ %>
		<table border="0" width="750px">
		  <tr>
		      <td> <div align="center">  <font color="maroon"> <U> Password changed successfully </U> </font> </div> </td>
  		</tr>
		</table>
<%	}
%>
		 <div class="generic-container" style="margin-left: 275px; margin-top: 60px;">
          <div class="panel panel-default">
              <div class="panel-heading" align="center" ><span class="lead">Change Password</span></div>
              <div class="formcontainer">
<%
	 user=session.getAttribute("userid").toString();
%>
<input type="hidden" name="user" value="<%=user%>" />
<%	
	sql1="select * from t_admin where UName='"+user+"' ";
	
	rs1=stmt1.executeQuery(sql1);
	while(rs1.next())
	{
  		curpass=rs1.getString("pass");
	}
%>
<input type="hidden" name="curpasschk" value="<%=curpass %>" />
<table border="0" width="750px">
 
	   <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="file"> Current Password :</label>
                              <div class="col-md-7">
                              
	        <input type="password" name="curpass" class="formElement" /> 
	       
	  </div>
	  </div>
	  </div>
	  
	  
	  <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="file"> New Password :</label>
                              <div class="col-md-7">
	        <input type="password" name="newpass" class="formElement" /> 
	   </div>
	   </div>
	   </div>
	   
	  <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="file"> Confirm Password :</label>
                              <div class="col-md-7">
	       <input type="password" name="confpass" class="formElement" /> 
	       </div>
	       </div>
	       </div>
	  <div class="row">
                          <div class="text-center">
	       <div align="center"> 
	       <input type="submit" name="submit" 	value="Submit" class="formElement" /> 
	       
	        
	  </div>
	  </div>
	  </div>
	  
	  
   	
</table>
<% 
}catch(Exception e)
{ 
	out.print("Exception -->"+e);
	
}
finally
{
	con1.close();
}
%>
		

<!-- code end here --->

 		
  
  </div>
  </div>
  </div>

</body>
</html>
<div id="copyright">
  <%@ include file="footer.jsp" %>
  </div>


