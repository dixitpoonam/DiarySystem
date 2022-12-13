<%@ page contentType="text/html; charset=iso-8859-1" language="java"
	import="java.sql.*" import=" java.text.*" import=" java.util.*"
	errorPage=""%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>

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
	var trans=document.createidsform.name.value;
	var fn=document.createidsform.user.value;
	var un=document.createidsform.utype.value;
	

	
	if(trans=="")
	{
		alert("Please enter User Name");
		return false;
	}		

	if(fn=="")
	{
		alert("Please enter User ID");
		return false;
	}

	if(un=="")
	{
		alert("Please enter User Type");
		return false;
	}

	
}

</script>
        
  </head>

    
    


  <body>
  
  <%!Statement stmt1;
	String sql,sql1;
	Connection conn1;  %>
    

      <div class="generic-container" style="margin-left: 275px; margin-top: 60px;">
          <div class="panel panel-default">
              <div class="panel-heading" style="align:center";><span class="lead">Create New DiarySystem Login Id</span></div>
              
              <div class="formcontainer">
<form name="createidsform" action="inserdsid.jsp" onsubmit="return validate();">   <input type="hidden"  />
              
                                          
           
           <div class="row">
                          <div class="form-group col-md-12">
      <label class="col-md-2 control-lable" for="inputCity">User Name:</label>
       <div class="col-md-5">
       <input type="text" name="name" class="form-control input-sm" >
        
      
    </div>

   
    </div></div>   
    
              <div class="row">
                          <div class="form-group col-md-12">
      <label class="col-md-2 control-lable" for="inputCity">User ID: </label>
       <div class="col-md-5">
        <input type="text" name="user" class="form-control input-sm" >
        
      
    </div>

   
    </div></div>  
    
              <div class="row">
                          <div class="form-group col-md-12">
      <label class="col-md-2 control-lable" for="inputCity">Email ID: </label>
       <div class="col-md-5">
       <input type="text" name="email" class="form-control input-sm" >
        
      
    </div>
    </div>
    </div>
    
     <div class="row">
                          <div class="form-group col-md-12">
      <label class="col-md-2 control-lable" for="inputCity">User Type: </label>
       <div class="col-md-5">
                         <select class="form-control input-sm"  name="utype" style="width:170px;">
      <option>Select</option>
      
      				
       

<% 
    try{
    	
Class.forName(MM_dbConn_DRIVER);
conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	stmt1=conn1.createStatement();
	
	System.out.println("Here");
	
	sql1="select distinct(UserType) as UserType from db_CustomerComplaints.t_admin where URole='service' order by UserType asc";
	ResultSet rs1=stmt1.executeQuery(sql1);

	System.out.println("QQQQQQQQq"+sql1);
	System.out.println("Here");
     
					while(rs1.next())
					{ 
					String UserType=rs1.getString("UserType");
					System.out.println("UserType  "+ UserType);
					%>
						
						<option value="<%=rs1.getString("UserType")%>"><%=rs1.getString("UserType")%></option>
				
				<%	
				
				}
			

%>
      
    </select>
                                  </div>
                          </div>
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
<%    
    }catch(Exception e){
    	
    }finally{
	conn1.close();
}%>
      
</body>
</html>

<%@ include file="footer.jsp"%>	

		
			