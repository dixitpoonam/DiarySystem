<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 4.01 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>

<%@ include file="header.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

	<title>Seven Day Diary System.</title>
	<link rel="stylesheet" href="style.css" type="text/css" charset="utf-8" />
	<link rel="stylesheet" href="css/css.css" type="text/css" charset="utf-8" />
	<script src="sorttable.js" type="text/javascript"></script>
	<style type="text/css">@import url(jscalendar-1.0/calendar-win2k-1.css);</style>
	<script type="text/javascript" src="jscalendar-1.0/calendar.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/lang/calendar-en.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/calendar-setup.js"></script>
	
	 <link href="css/form.css" rel="stylesheet" type="text/css" />
    
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

<style>

.username.ng-valid {
	background-color: lightgreen;
}

.username.ng-dirty.ng-invalid-required {
	background-color: red;
}

.username.ng-dirty.ng-invalid-minlength {
	background-color: yellow;
}

.email.ng-valid {
	background-color: lightgreen;
}

.email.ng-dirty.ng-invalid-required {
	background-color: red;
}

.email.ng-dirty.ng-invalid-email {
	background-color: yellow;
}

</style>


</head>

<body>
<%@ include file="MenuNew.jsp"%>
<br>
<br>
<!--- code start here ------>
<%
try
{	
	 String OwnerName=request.getParameter("owner");
	 String vehcles=request.getParameter("vehcles");
	 String grp=request.getParameter("grp");
	 
	%>
<!-- 	<table border="0" width="750px" bgcolor="#E6E6E6" align="center">
		<tr>
			<td colspan="4" align="center"><font size="3" color="#2A0A12" ><b>Add Vehicle To Group</b>  </font></td>
		</tr>
</table> -->

 <div class="generic-container" style="margin-left: 275px; margin-top: 60px;">
          <div class="panel panel-default">
              <div class="panel-heading"><span class="lead">Add Vehicle To Group</span></div>

<div class="formcontainer">
<form name="addgrpform" method="get" action="insrtgrp.jsp" onSubmit="return validate();">
<input type="hidden"  />




<%-- 
<table border="0" width="750px" bgcolor="#E6E6E6" align="center">
	<tr bgcolor="#BDBDBD">
       <td> <font color="black"> <b>Owner Name:</b> </font> </td>
       <td><font color="black"><%=OwnerName %></font></td>
 </tr>
  --%>
  <div class="row">
                          <div class="form-group col-md-12">
      <label class="col-md-2 control-lable" for="inputCity">Owner Name:</label>
       <div class="col-md-8">
       <font color="black"><%=OwnerName %></font>
       </div>
       </div>
       </div>
 
 
 
 
<%--   <tr bgcolor="#BDBDBD">
      <td>  <font color="black"><b>Vehicles : </b></font> </td>
      <td><font color="black"><%=vehcles %></font></td>
  </tr> --%>
  
  
   <div class="row">
                          <div class="form-group col-md-12">
      <label class="col-md-2 control-lable" for="inputCity">Vehicles:</label>
       <div class="col-md-8">
       <font color="black"><%=vehcles %></font>
       </div>
       </div>
       </div>
 
  
  
 <%--  <tr bgcolor="#BDBDBD">
     <td>  <font color="black"><b>Groups :</b> </font> </td>
     <td><font color="black"><%=grp %></font></td>
  </tr> --%>
  	
  	
  	 <div class="row">
                          <div class="form-group col-md-12">
      <label class="col-md-2 control-lable" for="inputCity">Groups:</label>
       <div class="col-md-8">
          <font color="black"><%=grp %></font>
       </div>
       </div>
       </div>
  
  <table>
  <tr>
	 <td colspan="2" align="center">
		 <input type="hidden" name=owner value="<%=OwnerName %>" />
	  	 <input type="hidden" name=vehcles value="<%=vehcles %>" />	
	     <input type="hidden" name=grp value="<%=grp %>" />	
	     
		 <input type="submit" name="Submit" value="Submit" class="formElement"  style="margin-left: 350px;" onclick="redirect();"/>
		 
	 </td>
 </tr>
</table>

 

<%
}
catch(Exception e)
{
	out.print("Exception --->"+e);
}

%>
<!-- code end here --->
</form>
  </div>
          </div>
      
      </div> 
 

  <br>
<br>
<%@ include file="footer.jsp"%>	
</body>
</html>

