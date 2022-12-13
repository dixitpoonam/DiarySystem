<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java"
	import="java.sql.*" import=" java.text.*" import=" java.util.*"
	errorPage=""%>

<%@ include file="MenuNew.jsp"%>
<%@ include file="Connections/conn.jsp"%>

<html>
  <head>  
    <title>Seven Day Diary System</title>  
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
    
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
     <%-- <link href="<c:url value='/css/app.css' />" rel="stylesheet"></link> --%>
     
     
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker.css" rel="stylesheet" type="text/css" />
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/js/bootstrap-datepicker.js"></script>
     <script>
     $(document).ready(function(){

   	  $("#datepicker").datepicker({ 
   	        autoclose: true, 
   	        todayHighlight: true
   	  }).datepicker('update', new Date());
   	});

     </script>
     
     <script language="javascript">
function validate()
{
	var trans=document.createidsform.trans.value;
	var fn=document.createidsform.fn.value;
	var ln=document.createidsform.ln.value;
	var un=document.createidsform.un.value;
	var pass=document.createidsform.pass.value;	
	var cpass=document.createidsform.cpass.value;

	
	if(trans=="Select")
	{
		alert("Please enter Transporter Name");
		return false;
	}		

	if(fn=="")
	{
		alert("Please enter First Name");
		return false;
	}
	
	if(ln=="")
	{
		alert("Please enter Last Name");
		return false;
	}

	if(un=="")
	{
		alert("Please enter User Name");
		return false;
	}

	var sss=validateEmail(un);
	
	if(!sss)
	{
	    //alert(sss);
		alert("Please enter valid Username");
		return false;
	} 
		
	if(pass=="")
	{
		alert("Please enter Password");
		return false;
	}

	if(cpass=="")
	{
		alert("Please confirm Password");
		return false;
	}

	if(pass!=cpass)	
	{
		document.createidsform.cpass.value="";
		alert("Password and Confirm Password doesn't match");
		return false;
	}		

}


function validateEmail(email)
{
     var splitted = email.match("^(.+)@(.+)$");
    if(splitted == null) return false;
    if(splitted[1] != null )
    {
      var regexp_user=/^\"?[\w-_\.]*\"?$/;
      if(splitted[1].match(regexp_user) == null) return false;
    }
    if(splitted[2] != null)
    {
      var regexp_domain=/^[\w-\.]*\.[A-Za-z]{2,4}$/;
      if(splitted[2].match(regexp_domain) == null) 
      {
	    var regexp_ip =/^\[\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\]$/;
	    if(splitted[2].match(regexp_ip) == null) return false;
      }// if
      return true;
    }
return false;
}
</script>
        
  </head>
  <body>

<%!
Statement stmt1;
String sql,sql1;Connection conn;
%>
<%
String flag = request.getParameter("inserted");
System.out.println("flagggggg "  + flag);

if(flag != null && flag.equals("1"))
{
	out.println("<div align='center'><font color='brown' size='2'>The username already exist !!</font></div>");
}
else
	if(flag != null && flag.equals("2"))
	{
		out.println("<div align='center'><font color='brown' size='2'>Added Successfully</font></div>");
	}
try{
	Class.forName(MM_dbConn_DRIVER);
	conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);	
		stmt1=conn.createStatement();
	
	sql1="select distinct(TypeValue) as TypeValue from(select distinct(TypeValue) as TypeValue from t_transporter where ActiveStatus = 'Yes' union select distinct(GPName) as TypeValue from t_group where SepReport='Yes' and Active = 'Yes') y order by TypeValue Asc";
//"select distinct(TypeValue) as TypeValue from t_security where TypeofUser in ('Transporter', 'GROUP') union  order by TypeValue asc";
	ResultSet rs1=stmt1.executeQuery(sql1);
%>
<!-- <form name="createidsform" action="createidsinsrt.jsp" onsubmit="return validate();">
 -->
  
      <div class="generic-container" style="margin-left: 275px; margin-top: 60px;">
          <div class="panel panel-default">
              <div class="panel-heading"><span class="lead">Create New Login Id </span></div>
              
              <div class="formcontainer">
<form name="createidsform" action="createidsinsrt.jsp" onsubmit="return validate();">
                      
              
                      <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="file">Transporter</label>
                              <div class="col-md-7">
                       <select name="trans" class="form-control input-sm" >	
				<option value="Select">Select</option>
				<%
					while(rs1.next())
					{ %>
						<option value="<%=rs1.getString("TypeValue")%>"><%=rs1.getString("TypeValue")%></option>
				<%
				}
	
				%>
			     </select>	
                              </div>
                          </div>
                      </div>
                        
                                 
           <div class="row">
                          <div class="form-group col-md-12">
      <label class="col-md-2 control-lable" for="inputCity"> First Name:</label>
       <div class="col-md-5">
        <input  type="text" name="fn" class="form-control input-sm" id="inputCity">
  
      
    </div>
    </div>
    </div>

<div class="row">
                          <div class="form-group col-md-12">
      <label class="col-md-2 control-lable" for="inputCity"> Last Name:</label>
       <div class="col-md-5">
        <input  type="text" name="ln" class="form-control input-sm" id="inputCity">
  
      
    </div>
    </div>
    </div>

<div class="row">
                          <div class="form-group col-md-12">
      <label class="col-md-2 control-lable" for="inputCity"> User Name:</label>
       <div class="col-md-5">
        <input  type="text" name="un" class="form-control input-sm" id="inputCity"> 
        Please enter email id as username
  
      
    </div>
</div>
</div>


<div class="row">
                          <div class="form-group col-md-12">
      <label class="col-md-2 control-lable" for="inputCity"> Password:</label>
       <div class="col-md-5">
        <input  type="password" name="pass" class="form-control input-sm" id="inputCity">
  
      
    </div>
</div>
</div>


<div class="row">
                          <div class="form-group col-md-12">
      <label class="col-md-2 control-lable" for="inputCity"> Conform Password:</label>
       <div class="col-md-5">
        <input  type="password" name="cpass" class="form-control input-sm" id="inputCity">
  
      
    </div>
</div>
</div>
<div class="row">
  <div class="form-group col-md-2">
      <label  class="col-md-5 control-lable" for="inputZip">Admin</label>
   
      <div class="col-md-5" >
      <input type="checkbox" name="admin" value="admin" id="inputZip">
    </div></div>
    </div>
                      
                      <div class="row">
                          <div class="text-center">
                              <input type="submit" name="submit" value="Submit" class="btn btn-primary btn-sm" >
                             <!--  <button type="button"  class="btn btn-warning btn-sm" >Reset Form</button> -->
                          </div>
                      </div>
                  </form>
              </div>
          </div>
      
      </div>
  </body>
</html>

<%
}catch(Exception e){
	
}finally{
	conn.close();
}
%>

		<%@ include file="footer.jsp"%>	
			