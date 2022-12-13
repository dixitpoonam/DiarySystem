<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java"
	import="java.sql.*" import=" java.text.*" import=" java.util.*"
	errorPage=""%>
<%@ include file="header.jsp"%>
<%! 
Connection conn,conn1;
Statement st,st1,st2,st3,st4;
String sql,sql1,sql2,sql3,sql4,username,userrole1,today,olddate,Svehlist;
int total,updated,dealy,disconnected,notactive,transid;
String userrole4="";
%>
<%
 userrole4=session.getAttribute("userrole").toString();

%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>

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
<link href="css/form.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<title>Seven Day Diary System.</title>
<link rel="stylesheet" href="style.css" type="text/css" charset="utf-8" />

<script src="sorttable.js" type="text/javascript"></script>
<style type="text/css">
@import url(jscalendar-1.0/calendar-win2k-1.css);
</style>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css"
	rel="stylesheet" type="text/css" />
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker.css"
	rel="stylesheet" type="text/css" />
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/js/bootstrap-datepicker.js"></script>

<script type="text/javascript" src="jscalendar-1.0/calendar.js"></script>
<script type="text/javascript" src="jscalendar-1.0/lang/calendar-en.js"></script>
<script type="text/javascript" src="jscalendar-1.0/calendar-setup.js"></script>

<script language="javascript">
function AJAXFunc()
{
  
  var v1=document.form1.callertype.value;
  var trans=document.form1.transporter.value;
  //alert(v1);

  var ajaxRequest;  // The variable that makes Ajax possible!

     try{
 	        // Opera 8.0+, Firefox, Safari
 	 	ajaxRequest = new XMLHttpRequest();
        }  
        catch (e)
        {
 	        // Internet Explorer Browsers
 	        try
                 {
 	             ajaxRequest = new ActiveXObject("Msxml2.XMLHTTP");
 	        } 
                 catch (e)
                 {
 		    try
                     {
 		        ajaxRequest = new ActiveXObject("Microsoft.XMLHTTP");
 		    } 
                     catch (e)
                     {
 		           // Something went wrong
 	                   alert("Your browser broke!");
 			   return false;
 	            }
 	        }
          }
                
          // Create a function that will receive data sent from the server
            ajaxRequest.onreadystatechange = function()
            {
     	       if(ajaxRequest.readyState == 4)
                {
                      var reslt=ajaxRequest.responseText;

                      document.getElementById("divmain").innerHTML=reslt; 	       }
            }
            
  
      var queryString = "?typevalue=" +v1+"&trans="+trans;
 	   ajaxRequest.open("GET", "Ajaxgetinfo.jsp" + queryString, true);
 	   ajaxRequest.send(null); 
}

function validate()
{
	//alert("hi atul");
	var aa=document.form1.callertype.selectedIndex;
	//alert(aa);
	if(aa==0)
	{
		alert("Please Select Caller/Reciver Type");
		return false;
	}
	if(document.form1.callername.value=="Select")
	{
		alert("Please Select Caller Name");
		return false;
	}
	if(document.form1.callinformation.value=="")
	{
		alert("Please Enter Call Information");
		return false;
	}
	
	return true;
}
function fun1()
{
	
	var selObj = document.form1.callertype;
	selObj.selectedIndex = 0;
}
</script>

</head>

<body>


	<%
        if(userrole4.equalsIgnoreCase("supertech"))
        {%>

	<%@ include file="headertech.jsp"%>

	<%  }else{
        %>
	<%@ include file="MenuNew.jsp"%>

	<% 
        }
       %>


	

	<!--- code start here ------>
	<%
try
{
	Class.forName(MM_dbConn_DRIVER);
	conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	st=conn.createStatement();
	st1=conn.createStatement();
	st2=conn1.createStatement();
%>


	   <div class="generic-container" style="margin-left: 275px; margin-top: 60px;">
          <div class="panel panel-default">
	
			<div class="panel-heading">
				<span class="lead">Call Capture Screen </span>
			</div>
			<div class="formcontainer">


				<%
String ss=request.getParameter("err");
if(!(null==ss))
{
out.print("Inserted Successfully");
}
%>


				<form name="form1" method="post" action="insertcallinfo.jsp"
					onSubmit="return validate();">
					
					<div class="row">
						<div class="form-group col-md-12">
						
							<label class="col-md-2 control-lable" for="file">* Call Type :</label>
							
							<div class="col-md-6">

								<input type="radio" name="calltype" value="InComing" checked />
								INCOMING <input type="radio" name="calltype" value="OutGoing" />
								OUTGOING <input type="radio" name="calltype" value="NotCalled" />NOT
								CALLED
							</div>
						</div>
						</div>



						<div class="row">
							<div class="form-group col-md-12">
								<label class="col-md-2 control-lable" for="file">Transporter :</label>
									
	<div style="width: 72%;">



								<%
sql="select  distinct(TypeValue)  from db_gps.t_transporter where ActiveStatus='Yes' order by TypeValue";
ResultSet rstx=st1.executeQuery(sql);
%>
								<select name="transporter" class="formElement" 
									onchange="fun1();">
									<%
while(rstx.next())
{
%>
									<option value='<%=rstx.getString("TypeValue")%>'><%=rstx.getString("TypeValue")%></option>
									<%
}
%>
								</select>


							</div>
						</div>
						</div>
						
						<div class="row">
							<div class="form-group col-md-9">
								<label class="col-md-4 control-lable" for="file">Caller/Receiver Type :</label>
								 
								 <div style="width: 52%;">
								
								 <select name="callertype" class="formElement"
									onchange="AJAXFunc();">
									<option value="Select">Select</option>
									<option value="Transporter">Transporter</option>
									<option value="Technician">Technician</option>
								
								</select>
						</div>
						</div>
						</div>

						<div class="row">
							<div class="form-group col-md-9">
								<label class="col-md-4 control-lable" for="file">Caller/Receiver Name :</label>
									
 <div style="width: 80%;">

								<div id="divmain">
									<select name="callername" id="callername" class="formElement">
										<option value="Select">Select</option>
									</select>
									
									
									&nbsp;&nbsp;&nbsp; 
								<a href="addcontact.jsp"><font color="red">Not in
									list click to add contact.</font></a>
							
									
								</div>
							</div>
							</div>


					
					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-3 control-lable" for="file">Call Information :</label>
								
								 <div class="col-md-4">

							<textarea class="form-control" id="exampleFormControlTextarea1"
								rows="3"></textarea>

						</div>
					</div>
					</div>


					<input type="submit" name="Submit" value="Submit"
						class="formElement" />

				</form>

				<%
}
catch(Exception e)
{
	out.print("Exception --->"+e);
}
finally
{
	conn.close();
	conn1.close();
}
%>
				
			</div>
		</div>

	
</body>
</html>

<%@ include file="footer.jsp"%>	
