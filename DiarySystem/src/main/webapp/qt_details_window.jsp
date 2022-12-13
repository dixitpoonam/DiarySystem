<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java"
	import="java.sql.*" import=" java.text.*" import=" java.util.*"
	errorPage=""%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@ page import="java.util.Date"%>
<%-- <%@ include file="Unitconn.jsp" %>  --%>



<html>
<head>
<style type=text/css>
table.mytable {
	font: 13px arial, sans-serif;
	border-collapse: collapse;
	border: 1px solid #839E99;
	background: #f8fcff;
}
</style>
<title>Seven Day Diary System</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="style.css" type="text/css" charset="utf-8" />
<link rel="stylesheet" href="css/css.css" type="text/css"
	charset="utf-8" />

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css">
<link rel="stylesheet"
	href="https://cdn.datatables.net/responsive/2.2.1/css/responsive.dataTables.min.css">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript"
	src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
 -->
<link rel="stylesheet" href="css/styleMakePlan.css">
<!-- Export Options Links of DataTables -->

<link rel="stylesheet"
	href="https://cdn.datatables.net/buttons/1.5.1/css/buttons.dataTables.min.css">
<script
	src=" https://cdn.datatables.net/buttons/1.5.1/js/dataTables.buttons.min.js"></script>
<script
	src=" https://cdn.datatables.net/buttons/1.5.1/js/buttons.flash.min.js"></script>
<script
	src=" https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script
	src=" https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js"></script>
<script
	src=" https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js"></script>
<script
	src=" https://cdn.datatables.net/buttons/1.5.1/js/buttons.html5.min.js"></script>
<script
	src=" https://cdn.datatables.net/buttons/1.5.1/js/buttons.print.min.js "></script>
<script type="text/javascript"
	src="//cdn.datatables.net/plug-ins/1.10.19/sorting/date-dd-MMM-yyyy.js"></script>
<script type="text/javascript"
	src="//cdnjs.cloudflare.com/ajax/libs/moment.js/2.8.4/moment.min.js"></script>
<script type="text/javascript"
	src="//cdn.datatables.net/plug-ins/1.10.19/sorting/datetime-moment.js"></script>


<script type="text/javascript">
	$(document).ready(
			function() {

				$('#example').DataTable(
						{
							"pagingType" : "full_numbers",

							dom : 'Blfrtip',
							responsive : true,
							scrollY : "500px",
							scrollX : true,
							scrollCollapse : true,
							buttons : [

							{
								extend : 'collection',

								text : 'Export',
								buttons : [ {
									extend : 'excel',
									title : 'Quick Test Details',

								}, {
									extend : 'pdf',
									title : 'Quick Test Details',
									pageSize : 'A0',
								}, {
									extend : 'csv',
									title : 'Quick Test Details',
									
								}, {
									extend : 'print',
									title : 'Quick Test Details',
									pageSize : 'A0',
								}, {
									extend : 'copy',
									title : 'Quick Test Details',
								},

								/* 'copy', 'csv', 'excel', 'pdf', 'print' */
								]
							} ],
							lengthMenu : [ [ -1, 10, 25, 50, 100 ],
									[ "All", 10, 25, 50, 100 ] ],

						});
			});
</script>
<style>
#example {
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	border-collapse: collapse;
	width: 100%;
}
#cent
{
    padding-right: 45px;
}
#example td, #example th {
	border: 1px solid #ddd;
	padding: 16px;
}

#example tr:nth-child(even) {
	background-color: #f2f2f2;
}

#example tr:hover {
	background-color: #ddd;
}

#example th {
	padding-top: 12px;
	padding-bottom: 12px;
	text-align: left;
	background-color: #4CAF50;
	color: white;
}
</style>
</head>


<body style="background-color: #FFFFFF;">
	<div id="wrapper">
		<div id="logo">
			<h1>
				<img src="images/Transworld.gif">
			</h1>
			<p>We care about your Vehicles</p>
		</div>
		 <%@ include file="header1.jsp"%> 
<%
Connection con3=null;
String recDate=null,recTime=null,dispDate=null,dispTime=null,unitid=null,qtcount=null;
String dbconn="jdbc:mysql://164.68.105.216/db_CustomerComplaints";
String username="unitdesp";
String password="1@unit";
try
{
	Class.forName(MM_dbConn_DRIVER);
	con3= DriverManager.getConnection(dbconn,username,password);
	
	Statement stmt1 = con3.createStatement();
	ResultSet rs1=null;
	String sql1="";
	recDate=request.getParameter("recDate");
	recTime=request.getParameter("recTime");
	dispDate=request.getParameter("dispDate");
	dispTime=request.getParameter("dispTime");
	unitid=request.getParameter("unitid");
	qtcount=request.getParameter("qtcount");
	System.out.println("qtcount"+qtcount);
%>
<br>
		<div id="cent">
		<table border="0" width="750px" bgcolor="#E6E6E6" align="center">
					<tr>
						<td>
							<table border="0" width="100%">
								<tr>
									<td align="center">
									<font color="black" size="3"> 
									Quick Test Details 
									</font></td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
</div>
<br>
<%-- <tr>

<td align="left"><a href="qt_details_window_excel.jsp?unitid=<%=unitid %>&recDate=<%=recDate%>&recTime=<%=recTime %>&dispDate=<%=dispDate%>&dispTime=<%=dispTime %>"><img src="images/excel.jpg" width="15px" height="15px" border="0" /></a></u></font>
<a href="#" onclick="javascript:window.open('qt_details_window_print.jsp?unitid=<%=unitid %>&recDate=<%=recDate%>&recTime=<%=recTime %>&dispDate=<%=dispDate%>&dispTime=<%=dispTime %>');"title="Print Report"><img src="images/print.jpg" width="20px" height="20px" border="0"/> 
			
				</td>
				</tr> --%>
</table>

<div class="form" style="width: 750px; color: black;">
					<table id="example" width="750px" border="0" align="center">

						<thead>
							<tr>

            <th style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: right; background-color: #e6e6e6; color: black;"> Ref No</th>
			<th style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: right; background-color: #e6e6e6; color: black;"> Date</th>
			<th style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: right; background-color: #e6e6e6; color: black;"> Customer Name</th>
			<th style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: right; background-color: #e6e6e6; color: black;"> Customer DB</th>
			<th style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: right; background-color: #e6e6e6; color: black;"> Unit ID</th>
			<th style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: right; background-color: #e6e6e6; color: black;"> Unit Type</th>
			<th style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: right; background-color: #e6e6e6; color: black;"> WMSN</th>
			<th style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: right; background-color: #e6e6e6; color: black;"> Mobile No DB</th>
			<th style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: right; background-color: #e6e6e6; color: black;"> Sim No DB</th>
			<th style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: right; background-color: #e6e6e6; color: black;"> RLED</th>
			<th style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: right; background-color: #e6e6e6; color: black;"> GLED</th>
			<th style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: right; background-color: #e6e6e6; color: black;"> GLED Blink</th>
			<th style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: right; background-color: #e6e6e6; color: black;"> RLEDConn</th>
			<th style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: right; background-color: #e6e6e6; color: black;"> GLED Ok</th>
			<th style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: right; background-color: #e6e6e6; color: black;"> Other Conn</th>
			<th style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: right; background-color: #e6e6e6; color: black;"> Firmware</th>
			<th style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: right; background-color: #e6e6e6; color: black;"> Comment</th>
			<th style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: right; background-color: #e6e6e6; color: black;"> Debit Note</th>
			<th style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: right; background-color: #e6e6e6; color: black;"> Manufactured By</th>
			<th style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: right; background-color: #e6e6e6; color: black;"> Correction Done</th>
			<th style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: right; background-color: #e6e6e6; color: black;"> Ent By</th> 
			
			
			
			</tr>	
			</thead>
			<%
			if(qtcount=="yes"||qtcount.equalsIgnoreCase("yes")){
				
				sql1="select * from hwunittest where unitid='"+unitid+"' and concat(TheDate,' ',TheTime) >= '"+recDate+" "+recTime+"' order by TheDate,TheTime";	
			//System.out.println(sql1);
			rs1=stmt1.executeQuery(sql1);
			while(rs1.next())
			{ %>
				<tr>
				
				<td><%=rs1.getString("RefNo") %></td>
				<td><%=rs1.getString("TheDate")%> </td>
				<td><%=rs1.getString("Cust")%> </td>
				<td><%=rs1.getString("Custdb")%> </td>
				<td><%=rs1.getString("UnitID")%> </td>
				<td><%=rs1.getString("UnitType")%> </td>
				<td><%=rs1.getString("WMSN")%> </td>
				<td><%=rs1.getString("MobileDB")%> </td>
				<td><%=rs1.getString("SIMDB")%> </td>
				<td><%=rs1.getString("RLED")%> </td>
				<td><%=rs1.getString("GLED")%> </td>
				<td><%=rs1.getString("GLEDBlink")%> </td>
				<td><%=rs1.getString("RLEDConn")%> </td>
				<td><%=rs1.getString("GLEDOk")%> </td>
				<td><%=rs1.getString("OthConn")%> </td>
				<td><%=rs1.getString("Firmware")%> </td>
				<td><%=rs1.getString("SWComment")%> </td>
				<td><%=rs1.getString("SWDebitNote")%> </td>
				<td><%=rs1.getString("ManufactBy")%> </td>
				<td><%=rs1.getString("Correctiondone")%> </td>
				<td><%=rs1.getString("User")%> </td>
				</tr>
				<% 
			}
		}else
		{
				if(dispDate!=null && !(dispDate.equalsIgnoreCase("-")))
			
			{
			sql1="select * from hwunittest where unitid='"+unitid+"' and concat(TheDate,' ',TheTime) between '"+recDate+" "+recTime+"' and '"+dispDate+" "+dispTime+"' order by TheDate,TheTime";
			}
			else{
				sql1="select * from hwunittest where unitid='"+unitid+"' and concat(TheDate,' ',TheTime) >= '"+recDate+" "+recTime+"' order by TheDate,TheTime";	
			}
			//System.out.println(sql1);
			rs1=stmt1.executeQuery(sql1);
			while(rs1.next())
			{ %>
				<tr>
				
				<td><%=rs1.getString("RefNo") %></td>
				<td><%=rs1.getString("TheDate")%> </td>
				<td><%=rs1.getString("Cust")%> </td>
				<td><%=rs1.getString("Custdb")%> </td>
				<td><%=rs1.getString("UnitID")%> </td>
				<td><%=rs1.getString("UnitType")%> </td>
				<td><%=rs1.getString("WMSN")%> </td>
				<td><%=rs1.getString("MobileDB")%> </td>
				<td><%=rs1.getString("SIMDB")%> </td>
				<td><%=rs1.getString("RLED")%> </td>
				<td><%=rs1.getString("GLED")%> </td>
				<td><%=rs1.getString("GLEDBlink")%> </td>
				<td><%=rs1.getString("RLEDConn")%> </td>
				<td><%=rs1.getString("GLEDOk")%> </td>
				<td><%=rs1.getString("OthConn")%> </td>
				<td><%=rs1.getString("Firmware")%> </td>
				<td><%=rs1.getString("SWComment")%> </td>
				<td><%=rs1.getString("SWDebitNote")%> </td>
				<td><%=rs1.getString("ManufactBy")%> </td>
				<td><%=rs1.getString("Correctiondone")%> </td>
				<td><%=rs1.getString("User")%> </td>
				</tr>
				<% }
				
			}
				
			%>
			</table>
			<%
} catch(Exception e) { out.println("Exception----->"+e); }

finally
{
con3.close();
}
%>

 <table border="1" width="100%">
<tr ><td bgcolor="white" class="copyright" width="100%">
<center>Copyright &copy; 2008 by Transworld 
                          Compressor Technologies Ltd. All Rights Reserved.</center>
</td></tr>
</table>
				
</body>
</html>