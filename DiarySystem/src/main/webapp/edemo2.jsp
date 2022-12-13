<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java"
	import="java.sql.*" import=" java.text.*" import=" java.util.*"
	errorPage=""%>
	

<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>

<%@ include file="MenuNew.jsp"%>
<%@ include file="header.jsp"%>
<html>
  <head>  
    <title>AngularJS $http Example</title>  
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
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <link href="css/form.css" rel="stylesheet" type="text/css" />
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
     
  </head>
  <body>

         <div class="panel panel-default">
              <div class="panel-heading"><span class="lead">Fuel Information </span></div>
              <div class="formcontainer">
              <form>
  <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputEmail4">Vehicle Number</label>
      <input type="text" class="form-control" id="inputEmail4" placeholder="Vehicle no">
    </div>
    <div class="form-group col-md-6">
      <label for="inputPassword4">Date-Time</label>
      <input type="text" class="form-control" id="inputPassword4">
    </div>
  </div>
  <div class="form-group">
  <div class="form-group col-md-6">
    <label for="inputAddress">Driver</label>
    <input type="text" class="form-control" id="inputAddress" placeholder="Driver Name">
  </div></div>
  <div class="form-group">
  <div class="form-group col-md-6">
    <label for="inputAddress2">Liters</label>
    <input type="text" class="form-control" id="inputAddress2" placeholder="Liters">
  </div></div>
  <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputCity">Full Tank</label>
      <input type="text" class="form-control" id="inputCity">
    </div>
    <div class="form-group col-md-4">
      <label for="inputState">Amount</label>
      <select id="inputState" class="form-control">
        <option selected>Choose...</option>
        <option>...</option>
      </select>
    </div>
    <div class="form-group col-md-2">
      <label for="inputZip">Odometer</label>
      <input type="text" class="form-control" id="inputZip">
    </div>
  </div>
  <div class="form-group">
    <div class="form-check">
      <input class="form-check-input" type="checkbox" id="gridCheck">
      <label class="form-check-label" for="gridCheck">
        Check me out
      </label>
    </div>
  </div>
  <button type="submit" class="btn btn-primary">Sign in</button>
</form>
               </div>
          </div>
      <%
      
      String str="09-Sep-2020 3:26 PM";
      String dt = "";String t1="";String t2="";
      dt=str.substring(0, 11);
      System.out.println("date"+dt);
      t1=str.substring(12, 18);
                  
    	      String[] p1 = t1.split(":");
    	      String[] p2 = p1[1].split(" "); 
   // to remove am/pm

      System.out.println("HHH"+p1[0]);      System.out.println("mm"+p2[0]);
      
      %>
      </div>
  </body>
</html>