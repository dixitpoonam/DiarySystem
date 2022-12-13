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
    <title>Fuel Entry Example</title>  
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
   	        todayHighlight: true, format: 'd-M-yyyy',
   	  }).datepicker('update', new Date());
   	});

     </script>
     
  </head>
  <body>

      <div class="generic-container">
          <div class="panel panel-default">
              <div class="panel-heading"><span class="lead">Fuel Information </span></div>
              <div class="formcontainer">
                  <form  name="myForm" class="form-horizontal">
                      <input type="hidden"  />
                      <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="file">* Vehicle No :</label>
                              <div class="col-md-7">
                       <select class="form-control input-sm"  style="width:170px;">
      <option>1</option>
      <option>2</option>
      <option>3</option>
      <option>4</option>
      <option>5</option>
    </select>
                              </div>
                          </div>
                      </div>
                        <%
                    	String nwfrmtdte = new SimpleDateFormat("dd-MMM-yyyy")
    					.format(new java.util.Date());
                        %>
                      <!-- data-date-format="mm-dd-yyyy" -->
                      <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="file">Date-Time :</label>
                              <div class="col-md-7 mb-3">
                                <!--   <input type="text"  class="form-control input-sm" placeholder="Enter your Address. [This field is validation free]"/> -->
                                <div id="datepicker" class="input-group date"  style="width:170px;">
    <input class="form-control input-sm" type="text" />
    <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
</div>                        </div>



                          </div>
                      </div>






                      <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="file">* Driver :</label>
                              <div class="col-md-7">
                                 <select class="form-control input-sm"  style="width:170px;">
      <option>1</option>
      <option>2</option>
      <option>3</option>
      <option>4</option>
      <option>5</option>
    </select>
                                  </div>
                          </div>
                      </div>
      <div class="row">
                          <div class="form-group col-md-12">
      <label class="col-md-2 control-lable" for="inputCity">* Liters</label>
       <div class="col-md-5">
      <input type="text" class="form-control input-sm" id="inputCity">
    </div>

    <div class="form-group col-md-2">
      <label  class="col-md-5 control-lable" for="inputZip">Full Tank</label><div class="col-md-5">
      <input type="checkbox" class="form-check-input" id="inputZip">
    </div></div>
                      </div></div>
                        
                      
                      <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="file">	* Amount : </label>
                              <div class="col-md-7">
                                  <input type="text" name="uname" class="username form-control input-sm" placeholder="Enter Amount" required style="width:170px;" />
                              </div>
                          </div>
                      </div>

<div class="row">
                          <div class="form-group col-md-12">
      <label class="col-md-2 control-lable" for="inputCity">Odometer</label>
       <div class="col-md-5">
      <input type="text" class="form-control input-sm" id="inputCity">
    </div>

    <div class="form-group col-md-2">
      <label  class="col-md-5 control-lable" for="inputZip">Odometer Reset</label><div class="col-md-5">
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" class="form-check-input" id="inputZip">
    </div></div>
                      </div></div>

                            <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="file">Petrol Pump</label>
                              <div class="col-md-7">
                                  <input type="text" name="uname" class="username form-control input-sm" placeholder="Enter your name" required  />
                                  
                              </div>
                          </div>
                      </div>
                        
                      
                      <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="file">Remark</label>
                              <div class="col-md-7">
  <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
                              </div>
                          </div>
                      </div>


                      <div class="row">
                          <div class="text-center">
                              <input type="submit"  value="Submit" class="btn btn-primary btn-sm" >
                             <!--  <button type="button"  class="btn btn-warning btn-sm" >Reset Form</button> -->
                          </div>
                      </div>
                  </form>
              </div>
          </div>
      
      </div>
  </body>
</html>