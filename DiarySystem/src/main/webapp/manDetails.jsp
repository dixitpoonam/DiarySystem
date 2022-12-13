<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java"
	import="java.sql.*" import=" java.text.*" import=" java.util.*"
	errorPage=""%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>

<%@page import="java.sql.ResultSet"%>
<%@ page import="java.util.Date"%>
<%@ include file="headeradmin.jsp"%>

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
									title : 'Dispatch Details Report',

								}, {
									extend : 'pdf',
									title : 'Dispatch Details Report',
									pageSize : 'A0',
								}, {
									extend : 'csv',
									title : 'Dispatch Details Report',
									
								}, {
									extend : 'print',
									title : 'Dispatch Details Report',
									pageSize : 'A0',
								}, {
									extend : 'copy',
									title : 'Dispatch Details Report',
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
		<P></p>
		<%@ include file="header1.jsp"%></div>
		
<br>
		<div id="cent">
		<table border="0" width="750px" bgcolor="#E6E6E6" align="center">
					<tr>
						<td>
							<table border="0" width="100%">
								<tr>
									<td align="center">
									<font color="black" size="3"> 
									Dispatch Details Report
									</font></td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
</div>
<br>

  	
  	
  	<%!
Connection con1;
Connection con2;
String refno=null;
%>
<% 
try {
Class.forName(MM_dbConn_DRIVER);
con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
con2 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);

Statement stmt1 = con2.createStatement();
Statement stmt2 = con1.createStatement();
Statement stmt3 = con1.createStatement();
Statement st=con1.createStatement();
Statement st1=con1.createStatement();

ResultSet rs1=null,rs2=null, rs3=null, rs4=null, rs5=null, rs6=null,rs7=null,rs8=null,rs9=null,rs10=null,rs11=null;
String sql1="",sql2="", sql3="", sql4="", sql5="", sql6="",sql7="",que="",que1="";
String data="",data1="",vendor="",Statustype="",technician="";
String unit=request.getParameter("unitid");
System.out.println("unitID_list--->"+unit);
String from=request.getParameter("from");
System.out.println("from--->"+from);
String to=request.getParameter("to");
System.out.println("to--->"+to);
String username="-";

String prevdispdate="",prevrecdate="";
String recddate=null,recname="",custname="";

String qtdate="",qtby="";

String SIM_No="",SIM_Co="",Mobile_No="",WMSN_No="",Module_Type="",soft_ver="",GPS_No="",Unit_Type="",Inst_Type="",Peripherals="",boxtype="";




/* String user=session.getValue("urole").toString();
String type=session.getValue("typeval").toString(); */
//out.println(user);
String today=new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());

//String ustyp=session.getValue("urole").toString();
//out.println(ustyp);

%>
  	</td></tr>
	
			</table>
			 
			 <div class="form" style="width: 750px; color: black;">
					<table id="example" width="750px" border="0" align="center">

						<thead>
							<tr>
						
						
						<th style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: right; background-color: #e6e6e6; color: black;"> Sr.</th>
						<th style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: right; background-color: #e6e6e6; color: black;"> Unit ID</th>
						<th style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: right; background-color: #e6e6e6; color: black;"> Edited Date Time</th>
						<th style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: right; background-color: #e6e6e6; color: black;">Dispatch Date</th>
						<th style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: right; background-color: #e6e6e6; color: black;"> Edited By</th>
						<th style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: right; background-color: #e6e6e6; color: black;">SIM No</th>
						<th style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: right; background-color: #e6e6e6; color: black;">SIM Company</th>
						<th style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: right; background-color: #e6e6e6; color: black;">Mobile No</th>
						<th style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: right; background-color: #e6e6e6; color: black;"> WMSN No</th>
						<th style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: right; background-color: #e6e6e6; color: black;"> Module Type</th>
						<th style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: right; background-color: #e6e6e6; color: black;">Software Version</th>
						<th style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: right; background-color: #e6e6e6; color: black;">GPS No</th>
						<th style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: right; background-color: #e6e6e6; color: black;">Unit Type</th>
						<th style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: right; background-color: #e6e6e6; color: black;">Inst. Type</th>
						<th style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: right; background-color: #e6e6e6; color: black;">Box Enclosure Type</th>
						<th style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: right; background-color: #e6e6e6; color: black;">Peripherals</th>
						<th style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: right; background-color: #e6e6e6; color: black;"> FirmwareChanged</th>
						<th style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: right; background-color: #e6e6e6; color: black;"> ModulePCBChanged</th>
						<th style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: right; background-color: #e6e6e6; color: black;"> PCBmodification</th>
						<th style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: right; background-color: #e6e6e6; color: black;"> PowerSupplyChanged</th>
						<th style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: right; background-color: #e6e6e6; color: black;"> GPSMouseChanged</th>
						<th style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: right; background-color: #e6e6e6; color: black;"> GSMAntennaChanged</th>
						<th style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: right; background-color: #e6e6e6; color: black;"> SoftwareSimCorrections</th>
						<th style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: right; background-color: #e6e6e6; color: black;"> OtherCorrections</th> 
						
						</tr>
						</thead>		
						<%
						
							sql2="select * from t_unitmasterhistory where Status not in ('Tested','Sent','Dispatched') and EntDate between '"+from+"' and '"+to+"' and UnitID='"+unit+"' ";
						int i=1;
						System.out.println(sql2);
						rs2=stmt2.executeQuery(sql2);
						while(rs2.next())
						{	
							
							//to get disp address
							String name="",location="",fulladdress="";
							
							String unitid=rs2.getString("UnitId");
							String Dispdate=rs2.getString("DispDate");
							//String EnteredDate=rs2.getString("EntDate");
							
						
								String Entdatetime="",editedby="";
								String FirmwareChanged="",ModulePCBChanged="",PCBmodification="",PowerSupplyChanged="",GPSMouseChanged="",GSMAntennaChanged="",SoftwareSimCorrections="",OtherCorrections="",entdate="",enttime="";
								
										entdate=rs2.getString("EntDate");
										enttime=rs2.getString("EntTime");
										editedby=rs2.getString("EditedBy");
										SIM_No=rs2.getString("SimNo");
										SIM_Co=rs2.getString("SimCompany");
										Mobile_No=rs2.getString("MobNo");
										WMSN_No=rs2.getString("WMSN");
										Module_Type=rs2.getString("Module");
										soft_ver=rs2.getString("SwVer");
										GPS_No=rs2.getString("GPS");
										Unit_Type=rs2.getString("typeunit");
										Inst_Type=rs2.getString("InstType");
										Peripherals=rs2.getString("Peripherals");
										FirmwareChanged=rs2.getString("FirmwareChanged");
										ModulePCBChanged=rs2.getString("ModulePCBChanged");
										PCBmodification=rs2.getString("PCBmodification");
										PowerSupplyChanged=rs2.getString("PowerSupplyChanged");
										GPSMouseChanged=rs2.getString("GPSMouseChanged");
										GSMAntennaChanged=rs2.getString("GSMAntennaChanged");
										SoftwareSimCorrections=rs2.getString("SoftwareSimCorrections");
										OtherCorrections=rs2.getString("OtherCorrections");
										boxtype=rs2.getString("Box_type");
										Entdatetime=entdate+" "+enttime;
										
									
										
							
						%>
							<tr>
								<td> <%=i%></td>
								<td><%=unitid%></td>
							
								<td><%=new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(Entdatetime))%> </td>
								<%	if(!(Dispdate.equals("-"))) 
							{%>
								<td><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(Dispdate))%></td>
								<%}
							else{ %>
							<td><%=Dispdate %></td>
							<%} %>
								
								<%%>
								<td><%=editedby%></td>
								<td><%=SIM_No %></td>
								<td><%=SIM_Co %></td>
								<td><%=Mobile_No %></td>
								<td><%=WMSN_No %></td>
								<td><%=Module_Type %></td>
								<td> <%=soft_ver %></td>
								<td> <%=GPS_No %></td>
								<td><%=Unit_Type %> </td>
									<td><%=Inst_Type %> </td>
									<td><%=boxtype %> </td>
										<td><%=Peripherals %> </td>
								<td><%=FirmwareChanged %></td>
								<td><%=ModulePCBChanged %></td>
								<td><%=PCBmodification %></td>
								<td><%=PowerSupplyChanged %></td>
								<td><%=GPSMouseChanged %></td>
								<td> <%=GSMAntennaChanged %></td>
								<td> <%=SoftwareSimCorrections %></td>
								<td><%=OtherCorrections %> </td>
								
							</tr>	
						<% i++;
						}// inner while
						   // while%>
						   
						</table>
			
			<!-- body part come here -->
					<%
} catch(Exception e) { 
	//out.println("Exception----->"+e); 
System.out.println("Exception----->"+e);	
}

finally
{
con1.close();
con2.close();
}
%>
			</td>
    </tr>
    </table>
       <table border="1" width="100%">
<tr ><td bgcolor="white" class="copyright" width="100%">
<center>Copyright &copy; 2008 by Transworld 
                          Compressor Technologies Ltd. All Rights Reserved.</center>
</td></tr>
</table>
      
    </body>
    
</html>