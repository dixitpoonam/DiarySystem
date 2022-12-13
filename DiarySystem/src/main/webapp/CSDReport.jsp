<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java"
	import="java.sql.*" import=" java.text.*" import="java.util.Date"  import=" java.util.*"
	errorPage=""%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>

<style type="text/css">
@import url(jscalendar-1.0/calendar-win2k-1.css);
</style>

<script type="text/javascript" src="jscalendar-1.0/calendar.js"></script>
<script type="text/javascript" src="jscalendar-1.0/lang/calendar-en.js"></script>
<script type="text/javascript" src="jscalendar-1.0/calendar-setup.js"></script>


<%@ page contentType="text/html; charset=iso-8859-1" language="java"
	import="java.sql.*" import=" java.text.*" import=" java.util.*"
	errorPage=""%>
	
<%@include file="header.jsp"%>
<%@page import="java.sql.ResultSet"%>


<%!public int nullIntconv(String str) {
		int conv = 0;
		if (str == null) {
			str = "0";
		} else if ((str.trim()).equals("null")) {
			str = "0";
		} else if (str.equals("")) {
			str = "0";
		}
		try {
			conv = Integer.parseInt(str);
		} catch (Exception e) {
		}
		return conv;
	}%>
<html>
<head>


<title>Seven Day Diary System.</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="style.css" type="text/css" charset="utf-8" />
<link rel="stylesheet" href="css/css.css" type="text/css"
	charset="utf-8" />



<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.js"></script>
 <script type="text/javascript"
	src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script> 

 <script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- Export Options Links of DataTables -->

<link rel="stylesheet"
	href="https://cdn.datatables.net/buttons/1.5.1/css/buttons.dataTables.min.css ">
<script type="text/javascript" src="datatablejs/bootstrap.js"></script>
<!--  <script
	src=" https://cdn.datatables.net/buttons/1.5.1/js/buttons.flash.min.js "></script> --> 
<script
	src=" https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js "></script>
<script
	src=" https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js "></script>
<script
	src=" https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js "></script>
<script
	src=" https://cdn.datatables.net/buttons/1.5.1/js/buttons.html5.min.js "></script>
<script
	src=" https://cdn.datatables.net/buttons/1.5.1/js/buttons.print.min.js "></script>
<script type="text/javascript" src="datatablejs/buttons.colVis.min.js"></script>


<script language="javascript">
	function fun2()
	{	
		document.form1.submit();
	}	
	</script>
	
	
	<%

	String complaint="";

complaint=request.getParameter("radio1");

if(null==complaint)
{
	complaint="Customer";
}

if(complaint.equals("Customer"))
{
%>
	
<script type="text/javascript">
 $(document).ready(function() {
	    $('#example').DataTable( {
	    //	"pagingType": "full_numbers",
	    	
	        dom: 'Blfrtip',
	        "bLengthChange" : false,
	        buttons: [
	        	
	        	{
	        		extend: 'collection',
	        		
	        		text: 'Export',
	        		buttons: [
	        			{
	                        extend: 'excel',
	                        title: 'CSD Report - Customer', 

							
	                    },
	                    {
	                        extend: 'pdf',
	                        orientation: 'landscape',
	                        pageSize: 'LEGAL',
	                        title: 'CSD Report - Customer',
	                        
	                       
	                     },
	                    {
	                        extend: 'csv',
	                        title: 'CSD Report - Customer',
	                       
	                    },
	                    {
	                        extend: 'print',
	                        title: 'CSD Report - Customer',
	                        
	                    },
	                    {
	                        extend: 'copy',
	                        title: 'CSD Report - Customer',
	                       
	                   },
	                    
	            				/* 'copy', 'csv', 'excel', 'pdf', 'print' */
	            				
	                    
	            			]
	        	},
	        	
	            'colvis',
	            'pageLength'
	        ],
	        
	        
	        "oLanguage": {
	        	   "sSearch": "Search"
	        	 },
	        
	        lengthMenu: [
	            [ 10, 25, 50, -1 ],
	            [ '10 Rows' , '25 Rows', '50 Rows', 'Show all' ],
	            
	        ],	        
	       
	        "aoColumns": [
	            null,
	            null,
	            null,
	            null,
	            null,
	            null,
	            null,
	            null,
	            null,
	            null,
	            null,
	            null,
	            null,
	            null
	            
	            

	          
	        ]
	    
	    	
	    } );
	} );
 jQuery.extend( jQuery.fn.dataTableExt.oSort, {
	 "date-uk-pre": function ( a ) {
	    var ukDatea = a.split('/');
	    return (ukDatea[2] + ukDatea[1] + ukDatea[0]) * 1;
	 },

	 "date-uk-asc": function ( a, b ) {
	    return ((a < b) ? -1 : ((a > b) ? 1 : 0));
	 },

	 "date-uk-desc": function ( a, b ) {
	    return ((a < b) ? 1 : ((a > b) ? -1 : 0));
	 }
	 } );

</script>

<%} %>


<% if(complaint.equals("Vehicle"))
{
%>
	
<script type="text/javascript">
 $(document).ready(function() {
	    $('#example').DataTable( {
	    //	"pagingType": "full_numbers",
	    	
	        dom: 'Blfrtip',
	        "bLengthChange" : false,
	        buttons: [
	        	
	        	{
	        		extend: 'collection',
	        		
	        		text: 'Export',
	        		buttons: [
	        			{
	                        extend: 'excel',
	                        title: 'CSD Report - Vehicle', 

							
	                    },
	                    {
	                        extend: 'pdf',
	                        orientation: 'landscape',
	                        pageSize: 'LEGAL',
	                        title: 'CSD Report - Vehicle',
	                        
	                       
	                     },
	                    {
	                        extend: 'csv',
	                        title: 'CSD Report - Vehicle',
	                       
	                    },
	                    {
	                        extend: 'print',
	                        title: 'CSD Report - Vehicle',
	                        
	                    },
	                    {
	                        extend: 'copy',
	                        title: 'CSD Report - Vehicle',
	                       
	                   },
	                    
	            				/* 'copy', 'csv', 'excel', 'pdf', 'print' */
	            				
	                    
	            			]
	        	},
	        	
	            'colvis',
	            'pageLength'
	        ],
	        
	        
	        "oLanguage": {
	        	   "sSearch": "Search"
	        	 },
	        
	        lengthMenu: [
	            [ 10, 25, 50, -1 ],
	            [ '10 Rows' , '25 Rows', '50 Rows', 'Show all' ],
	            
	        ],	        
	       
	        "aoColumns": [
	            null,
	            null,
	            null,
	            null,
	            null,
	            null,
	            null,
	            null,
	            null,
	            null,
	            null,
	            null,
	            null,
	            null,
	            null,
	            null,
	            null,
	            null,
	            null,
	            null,
	            null,
	            null,
	            null,
	            null,
	            null
	            
	            

	          
	        ]
	    
	    	
	    } );
	} );
 jQuery.extend( jQuery.fn.dataTableExt.oSort, {
	 "date-uk-pre": function ( a ) {
	    var ukDatea = a.split('/');
	    return (ukDatea[2] + ukDatea[1] + ukDatea[0]) * 1;
	 },

	 "date-uk-asc": function ( a, b ) {
	    return ((a < b) ? -1 : ((a > b) ? 1 : 0));
	 },

	 "date-uk-desc": function ( a, b ) {
	    return ((a < b) ? 1 : ((a > b) ? -1 : 0));
	 }
	 } );

</script>

<%} %>

<script type="text/javascript">
	function chk() {

		var chkf = "";
		var chkt = "";
		var objFromDate = document.getElementById("data").value;

		var fdate = objFromDate.split("-");
		if (fdate[1] == "Jan") {
			chkf = "01";
		}
		if (fdate[1] == "Feb") {
			chkf = "02";
		}
		if (fdate[1] == "Mar") {
			chkf = "03";
		}
		if (fdate[1] == "Apr") {
			chkf = "04";
		}
		if (fdate[1] == "May") {
			chkf = "05";
		}
		if (fdate[1] == "Jun") {
			chkf = "06";
		}
		if (fdate[1] == "Jul") {
			chkf = "07";
		}
		if (fdate[1] == "Aug") {
			chkf = "08";
		}
		if (fdate[1] == "Sep") {
			chkf = "09";
		}
		if (fdate[1] == "Oct") {
			chkf = "10";
		}
		if (fdate[1] == "Nov") {
			chkf = "11";
		}
		if (fdate[1] == "Dec") {
			chkf = "12";
		}
		var objFromDate1 = "" + fdate[2] + "-" + chkf + "-" + fdate[0] + "";
		var objToDate = document.getElementById("data1").value;
		var tdate = objToDate.split("-");
		if (tdate[1] == "Jan") {
			chkt = "01";
		}
		if (tdate[1] == "Feb") {
			chkt = "02";
		}
		if (tdate[1] == "Mar") {
			chkt = "03";
		}
		if (tdate[1] == "Apr") {
			chkt = "04";
		}
		if (tdate[1] == "May") {
			chkt = "05";
		}
		if (tdate[1] == "Jun") {
			chkt = "06";
		}
		if (tdate[1] == "Jul") {
			chkt = "07";
		}
		if (tdate[1] == "Aug") {
			chkt = "08";
		}
		if (tdate[1] == "Sep") {
			chkt = "09";
		}
		if (tdate[1] == "Oct") {
			chkt = "10";
		}
		if (tdate[1] == "Nov") {
			chkt = "11";
		}
		if (tdate[1] == "Dec") {
			chkt = "12";
		}
		var objToDate1 = "" + tdate[2] + "-" + chkt + "-" + tdate[0] + "";
		// alert("Entry from date > "+objFromDate1+" Todate > "+objToDate1);

		var date1 = new Date(objFromDate1);
		var date2 = new Date(objToDate1);

		//alert("from > "+date1+" Todate > "+date2);

		var date3 = new Date();
		var date4 = date3.getMonth() + "-" + date3.getDay() + "-"
				+ date3.getYear();
		var currentDate = new Date(date4);

		if (date1 > date2) {
			alert("From Date Should be Less Than To Date");
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
}
</style>
</head>
		<%@ include file="MenuNew.jsp"%>

	 <div id="gbox1" style="width: 100%; margin-top: 20px; margin-left: 0;">
		<div id="gbox-top1"></div>
		<div id="gbox-bg1">

			<div id="gbox-grd1"></div>

			<%!
    
    Connection conn, conn1;
	Statement st, st1, st2, st3, st4, st5, stamc1;
	String sql, sql1, sql2, sql3, sql4, today, olddate, username, userrole, today1;
	String fromdate, todate, veh1, code1, dt1;
	int Ocount;
	int days = 0;
	
	%>
	
	
			<%String wrnty="";
			
			Date today = new Date();
			Date yesterday = new Date();
		    long minusaday = 86400000L;
		    long todaymills = today.getTime();
		    long yestrdaymills = todaymills - minusaday;
		    yesterday.setTime(yestrdaymills);
		    Format frt1 = new SimpleDateFormat("yyyy-MM-dd");
		    Format frt2 = new SimpleDateFormat("dd-MMM-yyyy");
		    String now = frt1.format(yesterday);
		    String now1 = frt2.format(yesterday);
		    
		    
		    System.out.println("now==>" + now);
					try {
						Class.forName(MM_dbConn_DRIVER);
						conn = DriverManager.getConnection(MM_dbConn_STRING, MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
						conn1 = DriverManager.getConnection(MM_dbConn_STRING1, MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
						st = conn.createStatement();
						st1 = conn.createStatement();
						st2 = conn1.createStatement();
						st3 = conn1.createStatement();
						st4 = conn1.createStatement();
						st5 = conn1.createStatement();
						stamc1 = conn1.createStatement();
						Statement strec=conn.createStatement();
				%>

			

			<!--- code start here ------>
			<% %>
			

<table width="750px" align="center">
				<tr>
					<td>
						<table border="0" width="100%">
							<tr>
								<td align="center"><font color="" size="3">CSD <%=complaint %> Report  <%=now1 %>
										</font></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			
<table align="center">

<tr>
<td  style="align:left">
<form name="form1" id="form1" action="" method="post">
<input type="radio" name="radio1" id="Customer"   value="Customer" <% if(complaint.equals("Customer")) { out.print("CHECKED"); }%>  onclick="fun2();"/>Customer
<input type="radio" name="radio1" id="Vehicle" value="Vehicle"  <% if(complaint.equals("Vehicle")) { out.print("CHECKED"); }%> onclick="fun2();"/>Vehicle
<%-- <input type="radio" name="radio1" id="Technician" value="Technician"  <% if(complaint.equals("Technician")) { out.print("CHECKED"); }%> onclick="fun2();"/> Technician								
<input type="radio" name="radio1" id="Service" value="Service"  <% if(complaint.equals("Service")) { out.print("CHECKED"); }%> onclick="fun2();"/> Service --%>

</td>
</tr>
</table>

<% 
if(complaint.equals("Customer")){
	
%>
				<table id="example" class="display" style="width: 100%">
					<thead>
						<tr>
							<th>Sr.No</th>
							<th align="center">Date</th>
							<th align="center">Total Transporter</th>
							<th align="center">Active Transporter(data within 30 days)</th>
							<th align="center">Vehicles with 7 days old data</th>
							<th align="center">New Installations Pending</th>
							<th align="center">New Installations Done</th>
							<th align="center">Outgoing Calls</th>
							<th align="center">Incoming Calls</th>
							<th align="center">Not Called Active Transporters</th>
							<th align="center">SLA > 85% MTD Days</th>
							<th align="center">SLA 75-85% MTD Days</th>
							<th align="center">SLA 50-75% MTD Days</th>
							<th align="center">SLA <50% MTD Days</th>
							
						</tr>
					</thead>

					<tbody>

<% 
int Transporter=0,ActiveTransporterByOnline=0,InactiveFrom7Days=0;

String sql1 = "select count(Distinct (OwnerName)) as count1 from db_gps.t_vehicledetails";
ResultSet rs1 = st1.executeQuery(sql1);
if (rs1.next()) {
  Transporter = rs1.getInt("count1");
}
String sqlActive = "select count(distinct(Transporter)) as onlineCount from db_gps.t_onlinedata where TheDate>=DATE_SUB(CURRENT_DATE(),INTERVAL 30 DAY) ";
ResultSet rsActive = st1.executeQuery(sqlActive);
if (rsActive.next()) {
  ActiveTransporterByOnline = rsActive.getInt("onlineCount");
}
System.out.println("111==>");

String sqlActive7Days = "select count(*) as InactiveFrom7Days from db_gps.t_onlinedata where Transporter in (select distinct(Transporter) as Transporter from db_gps.t_onlinedata \t where TheDate>=DATE_SUB(CURRENT_DATE(),INTERVAL 30 DAY)) \tand TheDate<DATE_SUB(CURRENT_DATE(),INTERVAL 7 DAY) and  `VehicleCode` IN ( SELECT VehicleCode FROM db_gps.t_vehicledetails WHERE STATUS='-') ";

ResultSet rsActive7Days = st1.executeQuery(sqlActive7Days);
if (rsActive7Days.next()) {
  InactiveFrom7Days = rsActive7Days.getInt("InactiveFrom7Days");
}
System.out.println("@@@@@==>");

int pendingNewInstallationsfinal=0;
int     NewInstallations=0;
int	ougoing=0;
int	incoming=0;
int	notCalled=0;
int	SLAGreaterThan80=0;
int     SLAGreaterThan70=0;
int	SLAGreaterThan50=0;
int	SLALessThan50=0;
//DoneInstallations,outgoing,incoming,NotCalled,SLA85,SLA75to85,SLA50to75,SLA50
String CustDetails="select * from db_CustomerComplaints.t_CustInformationCSD order by Srno desc limit 1";
ResultSet rsCust=st2.executeQuery(CustDetails);
if(rsCust.next())
{
	pendingNewInstallationsfinal=rsCust.getInt("PendingInst");
	NewInstallations=rsCust.getInt("DoneInstallations");
			ougoing=rsCust.getInt("outgoing");
			incoming=rsCust.getInt("incoming");
			notCalled=rsCust.getInt("NotCalled");
			SLAGreaterThan80=rsCust.getInt("SLA85");
			SLAGreaterThan70=rsCust.getInt("SLA75to85");
			SLAGreaterThan50=rsCust.getInt("SLA50to75");
			SLALessThan50=rsCust.getInt("SLA50");
			
}

int i=1;
%>
<tr>

							<td align="right"><%=i %></td>
							<td align="right"><%=rsCust.getString("Date")%></td>
							<td align="right"><%=Transporter%></td>
							<td align="right"><%=ActiveTransporterByOnline %></td>
							<td align="right"><%=InactiveFrom7Days %></td>
							<td align="right"><%=pendingNewInstallationsfinal%></td>
							<td align="right"><%=NewInstallations %></td>
							<td align="right"><%=ougoing %></td>
							<td align="right"><%=incoming%></td>
							<td align="right"><%=notCalled %></td>
							<td align="right"><%=SLAGreaterThan80 %></td>
							<td align="right"><%=SLAGreaterThan70%></td>
							<td align="right"><%=SLAGreaterThan50 %></td>
							<td align="right"><%=SLALessThan50 %></td>
							
							
							
</tr>							



					</tbody>
					<tfoot>
					<tr>
							<th>Sr.No</th>
							<th align="center">Date</th>
							<th align="center">TotalTransporter</th>
							<th align="center">Active Transporter(data within 30 days)</th>
							<th align="center">Vehicles with 7 days old data</th>
							<th align="center">New Installations Pending</th>
							<th align="center">New Installations Done</th>
							<th align="center">Outgoing Calls</th>
							<th align="center">Incoming Calls</th>
							<th align="center">Not Called Active Transporters</th>
							<th align="center">SLA > 85% MTD Days</th>
							<th align="center">SLA 75-85% MTD Days</th>
							<th align="center">SLA 50-75% MTD Days</th>
							<th align="center">SLA <50% MTD Days</th>
						</tr>
					</tfoot>
					
				</table>
				
				<%} %>
				
					
			<% 
if(complaint.equals("Vehicle")){
	
%>
			
			
			<table id="example" class="display" style="width: 100%">
					<thead>
						<tr>
							<th>Sr.No</th>
							<th align="center">Date</th>
							<th align="center">Total Configured Vehicles</th>
							<th align="center">Total Active Configured Vehicles</th>
							<th align="center">Temp Removal(Total/Active)</th>
							<th align="center">DeActivate(Total/Active)</th>
							<th align="center">Inactive(Total/Active)</th>
							<th align="center">Complaints Not Allocated Data older than 3 to 7 Days</th>
							<th align="center">Complaints Not Allocated Data older that 7 Days</th>
							<th align="center">Complaints Pending 1-7 Days</th>
							<th align="center">Complaints Pending 7-15 Days</th>
							<th align="center">Complaints Pending >15 Days</th>
							<th align="center">Complaints Pending (Creation) >15 Days</th>
							<th align="center">Reallocation of Complaints Done</th>
							
							<th align="center">Reallocation of Open Complaints</th>
							<th align="center">Out of Warranty Vehicle Attended ?</th>
							<th align="center">complaint closed of out of warranty / not inspection</th>
							
							<th align="center">Out Of Warranty Email</th>
							<th align="center">Special Report Email</th>
							<th align="center">Vehicle Availability Email</th>
							
							<th align="center">Vehicle Not Attended Email</th>
							<th align="center">Device Dispatched Email</th>
							<th align="center">Special Report Generated</th>
							
							<th align="center">Special comment visible in fleetview</th>
							<th align="center">Special comment Not Closed</th>
							
							
						</tr>
					</thead>

					<tbody>
					<%
					String vhregno = "-";String sqcmp1 = "";String vhregno33 = "-";String thdat = "";String vhrg1 = "-";
					int newcnt = 0;int newcnt1 = 0;
					int i=1;
					
					 int TotalVehicleInstalled=0;
					 int TotalVehicleInstalledActive=0;
					 int TotalVehicleTempRemovedActive=0;
					 int TotalVehicleTempRemoved=0;
					 int TotalVehicleDeActivatedActive=0;
					 int TotalVehicleDeActivated=0;
					 int TotalVehicleinactiveForActive=0;
					 int TotalVehicleinactive=0;
					String sqltotalvehicles = "select count(VehicleCode) as Tatalvehicles from db_gps.t_vehicledetails where Status not in ('Deleted','Del')";
				      ResultSet rstotalvehicle = st1.executeQuery(sqltotalvehicles);
				      if (rstotalvehicle.next()) {
				        TotalVehicleInstalled = rstotalvehicle.getInt("Tatalvehicles");
				      }
				      String sqltotalvehicles1 = "select count(VehicleCode) as Tatalvehicles from db_gps.t_vehicledetails \t\t\t\t\twhere Status not in ('Deleted' ,'Del') \t\t\t\t\tand vehiclecode in (select vehiclecode \t\t\t\t\tfrom db_gps.t_onlinedata where TheDate>=DATE_SUB(CURRENT_DATE(),INTERVAL 30 DAY))";
				      
				      ResultSet rstotalvehicle1 = st1.executeQuery(sqltotalvehicles1);
				      if (rstotalvehicle1.next()) {
				        TotalVehicleInstalledActive = rstotalvehicle1.getInt("Tatalvehicles");
				      }
				      String sqltotalvehicles11 = "select count(VehicleCode) as Tatalvehicles from db_gps.t_vehicledetails \t\t\t\t\twhere Status='Removed'\t\t\t\t\tand vehiclecode in (select vehiclecode \t\t\t\t\tfrom db_gps.t_onlinedata where TheDate>=DATE_SUB(CURRENT_DATE(),INTERVAL 30 DAY) and Transporter <> 'test' )";
				      
				      ResultSet rstotalvehicle11 = st1.executeQuery(sqltotalvehicles11);
				      if (rstotalvehicle11.next()) {
				        TotalVehicleTempRemovedActive = rstotalvehicle11.getInt("Tatalvehicles");
				      }
				      String sqltotalvehicles111 = "select count(VehicleCode) as Tatalvehicles from db_gps.t_vehicledetails \t\t\t\t\twhere Status='Removed'  ";
				      
				      ResultSet rstotalvehicle111 = st1.executeQuery(sqltotalvehicles111);
				      if (rstotalvehicle111.next()) {
				        TotalVehicleTempRemoved = rstotalvehicle111.getInt("Tatalvehicles");
				      }
				      String sqltotalvehicles1111 = "select count(VehicleCode) as Tatalvehicles from db_gps.t_vehicledetails \t\t\t\t\twhere Status='DeActivated'\t\t\t\t\tand vehiclecode in (select vehiclecode \t\t\t\t\tfrom db_gps.t_onlinedata where TheDate>=DATE_SUB(CURRENT_DATE(),INTERVAL 30 DAY) and Transporter <> 'test')";
				      
				      ResultSet rstotalvehicle1111 = st1.executeQuery(sqltotalvehicles1111);
				      if (rstotalvehicle1111.next()) {
				        TotalVehicleDeActivatedActive = rstotalvehicle1111.getInt("Tatalvehicles");
				      }
				      String sqltotalvehicles11111 = "select count(VehicleCode) as Tatalvehicles from db_gps.t_vehicledetails \t\t\t\t\twhere Status='DeActivated'  ";
				      
				      ResultSet rstotalvehicle11111 = st1.executeQuery(sqltotalvehicles11111);
				      if (rstotalvehicle11111.next()) {
				        TotalVehicleDeActivated = rstotalvehicle11111.getInt("Tatalvehicles");
				      }
				      String sqltotalvehiclesinactvie = "select count(*) as Tatalvehicles  from db_gps.t_vehicledetails\t\t\t\t\t\t where  VehicleCode not in (select VehicleCode from db_gps.t_onlinedata) \t\t\t\t\t\tand   vehiclecode in (select vehiclecode \t\t\t\t\tfrom db_gps.t_onlinedata where TheDate>=DATE_SUB(CURRENT_DATE(),INTERVAL 30 DAY)  and Transporter <> 'test')";
				      
				      ResultSet rstotalvehinactive = st1.executeQuery(sqltotalvehiclesinactvie);
				      if (rstotalvehinactive.next()) {
				        TotalVehicleinactiveForActive = rstotalvehinactive.getInt("Tatalvehicles");
				      }
				      String sqltotalvehiclesinactvie1 = "select count(*) as Tatalvehicles  from db_gps.t_vehicledetails\t\t\t\t\t\t where  VehicleCode not in (select VehicleCode from db_gps.t_onlinedata)";
				      
				      ResultSet rstotalvehinactive1 = st1.executeQuery(sqltotalvehiclesinactvie1);
				      if (rstotalvehinactive1.next()) {
				        TotalVehicleinactive = rstotalvehinactive1.getInt("Tatalvehicles");
				      }
				      
				      String sql99 = "select  VehicleRegNo,thedate  from db_gps.t_onlinedata where VehicleRegNo  in (SELECT  VehicleRegNumber from db_gps.t_vehicledetails where status ='-') and TheDate>=DATE_SUB(CURRENT_DATE(),INTERVAL 7 DAY) and TheDate<=DATE_SUB(CURRENT_DATE(),INTERVAL 3 DAY) ";
				      
				      System.out.println(">sql99>>>>" + sql99);
				      ResultSet rst_99 = st5.executeQuery(sql99);
				      System.out.println(">sql99>>after>>" + sql99);
				      while (rst_99.next())
				      {
				        vhregno = rst_99.getString("VehicleRegNo");
				        thdat = rst_99.getString("thedate");
				        
				        sqcmp1 = "SELECT VehicleNo FROM db_CustomerComplaints.t_complaints1 WHERE  tdydate>='" + thdat + "' and   `Result` = 'Unsolved' and status not in ('solved','Attended') and VehicleNo ='" + vhregno + "'  ";
				        
				        ResultSet rst_95 = st3.executeQuery(sqcmp1);
				        if (rst_95.next()) {
				          vhregno33 = rst_95.getString("VehicleNo");
				        }
				        if ((vhregno33 == "-") || (vhregno33.equalsIgnoreCase("-")))
				        {
				          newcnt++;
				          
				          vhrg1 = vhrg1 + "," + vhregno33;
				        }
				      }
				      
				      String vhregno1 = "-";String sqcmp = "";String vhregno22 = "-";String thdat1 = "";String vhrg = "-";
				      
				      String sql999 = "\tselect  VehicleRegNo,thedate  from db_gps.t_onlinedata where VehicleRegNo  in (SELECT  VehicleRegNumber from db_gps.t_vehicledetails where status ='-')  and   TheDate<=DATE_SUB(CURRENT_DATE(),INTERVAL 7 DAY)";
				      ResultSet rst_999 = st5.executeQuery(sql999);
				      System.out.println(">sql999>>>>" + sql999);
				      while (rst_999.next())
				      {
				        vhregno1 = rst_999.getString("VehicleRegNo");
				        thdat1 = rst_999.getString("thedate");
				        
				        sqcmp = "SELECT VehicleNo FROM db_CustomerComplaints.t_complaints1 WHERE  tdydate>='" + thdat1 + "' and `Result` = 'Unsolved' and status not in ('solved','Attended') and VehicleNo ='" + vhregno1 + "'  ";
				        ResultSet rst_92 = st3.executeQuery(sqcmp);
				        if (rst_92.next()) {
				          vhregno22 = rst_92.getString("VehicleNo");
				        }
				        if ((vhregno22 == "-") || (vhregno22.equalsIgnoreCase("-")))
				        {
				          newcnt1++;
				          vhrg = vhrg + "," + vhregno22;
				        }
				      }
				      
				      int CompPending1to7=0; 	 
				      int CompPending7=0; 	 
				      int CompPending15=0; 	 
				      int CompCreation=0; 	 
				      int ReCompDone=0; 	 
				      int ReOfOpenComp=0; 	 
				      int OutOfWarrantyVehicle=0; 	 
				      int outOfWarrantyEmail=0; 	 
				      int SpecialEmail=0; 	 
				      int ReportGenerate=0; 
				     
				      int pendingComplaintAllocate=0;
				      int vehicleavailableMailSend=0;
				      String specialReportGenerated="";
				      String specialcmntfleetview="";
				      int spcmntclosed=0;
				      int vehiclenotattendedMailSend=0;
				      int devicedispatchedMailSend=0;
				    
				      String sql36 = "SELECT count(*) as count36 FROM db_CustomerComplaints.t_complaints1 WHERE `Result` = 'Unsolved' AND `TdyDate` < DATE_SUB( CURRENT_DATE( ) , INTERVAL 15 DAY ) and Customer in (select distinct(Transporter) \t\tfrom db_gps.t_onlinedata where TheDate>=DATE_SUB(CURRENT_DATE(),INTERVAL 30 DAY))";
				      
				      ResultSet rs36 = st1.executeQuery(sql36);
				      if (rs36.next()) {
				        pendingComplaintAllocate = rs36.getInt("count36");
				      }
				      
				      String sql142 = "SELECT count(*) as count40 FROM db_CustomerComplaints.t_emailmaster WHERE `template` = 'Vehicle Availability' AND UpdatedDateTime >= '" + 
				    	        now + " 00:00:00' " + 
				    	        "AND UpdatedDateTime <= '" + now + " 23:59:59'" + 
				    	        " and transporter in (select distinct(Transporter) " + 
				    	        "\t\tfrom db_gps.t_onlinedata where TheDate>=DATE_SUB(CURRENT_DATE(),INTERVAL 30 DAY))";
				    	      ResultSet rs142 = st1.executeQuery(sql142);
				    	      if (rs142.next()) {
				    	        vehicleavailableMailSend = rs142.getInt("count40");
				    	      }
				    	      String sql39 = "SELECT count(*) as count39 FROM t_specialreports WHERE EnterDate >= '" + 
				    	        now + " 00:00:00' " + 
				    	        "AND EnterDate <= '" + now + " 23:59:59'" + 
				    	        " and Transporter in (select distinct(Transporter) " + 
				    	        " from db_gps.t_onlinedata where TheDate>=DATE_SUB(CURRENT_DATE(),INTERVAL 30 DAY))";
				    	      ResultSet rs39 = st1.executeQuery(sql39);
				    	      if (rs39.next()) {
				    	        specialReportGenerated = rs39.getString("count39");
				    	      }
				    	      String sqlvisiblefleet = " SELECT count(*) as spcommntfleetview FROM db_CustomerComplaints.t_techspecialrep  WHERE visibleInFleetview = 'Yes' AND Closed = 'No' and cmmt_type ='Vehicle' and Transp in (select distinct(Transporter) \t\tfrom db_gps.t_onlinedata where TheDate>=DATE_SUB(CURRENT_DATE(),INTERVAL 30 DAY))";
				    	      
				    	      System.out.println(sqlvisiblefleet);
				    	      ResultSet rsvisiblefleet = st1.executeQuery(sqlvisiblefleet);
				    	      if (rsvisiblefleet.next()) {
				    	        specialcmntfleetview = rsvisiblefleet.getString("spcommntfleetview");
				    	      }
				    	      String sqlvisiblefleet1 = " SELECT EntDateTime,VehRegNo FROM db_CustomerComplaints.t_techspecialrep \t\tWHERE visibleInFleetview = 'Yes' AND Closed = 'No' and cmmt_type ='Vehicle' \t\tand Transp in (select distinct(Transporter) \t\tfrom db_gps.t_onlinedata where TheDate>=DATE_SUB(CURRENT_DATE(),INTERVAL 30 DAY))";
				    	      
				    	      System.out.println(sqlvisiblefleet1);
				    	      ResultSet rsvisiblefleet1 = st1.executeQuery(sqlvisiblefleet1);
				    	      ResultSet rsonlinedetails;
				    	      for (; rsvisiblefleet1.next(); rsonlinedetails.next())
				    	      {
				    	        String EntDateTime = rsvisiblefleet1.getString("EntDateTime");
				    	        String VehRegNo = rsvisiblefleet1.getString("VehRegNo");
				    	        String onlinedetails = "select * from db_gps.t_onlinedata where VehicleRegNo='" + VehRegNo + "' and concat(TheDate,TheTime) > '" + EntDateTime + "'";
				    	        rsonlinedetails = st2.executeQuery(onlinedetails);
				    	        
				    	        spcmntclosed += 1;
				    	      }
				    	      
				    	      String sql140 = "SELECT count(*) as count40 FROM db_CustomerComplaints.t_emailmaster WHERE `template`='Vehicle Not Attended' AND UpdatedDateTime >= '" + 
				    	    	        now + " 00:00:00' " + 
				    	    	        "AND UpdatedDateTime <= '" + now + " 23:59:59'" + 
				    	    	        " and transporter in (select distinct(Transporter) " + 
				    	    	        "\t\tfrom db_gps.t_onlinedata where TheDate>=DATE_SUB(CURRENT_DATE(),INTERVAL 30 DAY))";
				    	    	      ResultSet rs140 = st1.executeQuery(sql140);
				    	    	      if (rs140.next()) {
				    	    	        vehiclenotattendedMailSend = rs140.getInt("count40");
				    	    	      }
				    	    	      
				    	    	      String sql141 = "SELECT count(*) as count40 FROM db_CustomerComplaints.t_emailmaster WHERE `template`='Devices Dispatched' AND UpdatedDateTime >= '" + 
				    	    	    	        now + " 00:00:00' " + 
				    	    	    	        "AND UpdatedDateTime <= '" + now + " 23:59:59'" + 
				    	    	    	        " and transporter in (select distinct(Transporter) " + 
				    	    	    	        "\t\tfrom db_gps.t_onlinedata where TheDate>=DATE_SUB(CURRENT_DATE(),INTERVAL 30 DAY))";
				    	    	    	      ResultSet rs141 = st1.executeQuery(sql141);
				    	    	    	      if (rs141.next()) {
				    	    	    	        devicedispatchedMailSend = rs141.getInt("count40");
				    	    	    	      }
				    	    	    	      
				    	    	    	      
				    	    	    	      
				    	    	    	      
				    	    	    	      
				      String vehdetails="select * from db_CustomerComplaints.t_vehicleInformation order by Srno desc limit 1";
				      ResultSet rsveh=st3.executeQuery(vehdetails);
				    		  if(rsveh.next())
				    		  {
				    			 
				    			  CompPending1to7=rsveh.getInt("CompPending1to7"); 	 
				    			  CompPending7=rsveh.getInt("CompPending7"); 	 
				    			  CompPending15=rsveh.getInt("CompPending15"); 	 
				    			  CompCreation=rsveh.getInt("CompCreation"); 	 
				    			  ReCompDone=rsveh.getInt("ReCompDone"); 	 
				    			  ReOfOpenComp=rsveh.getInt("ReOfOpenComp"); 	 
				    			  OutOfWarrantyVehicle=rsveh.getInt("OutOfWarrantyVehicle"); 	 
				    			  outOfWarrantyEmail=rsveh.getInt("outOfWarrantyEmail"); 	 
				    			  SpecialEmail=rsveh.getInt("SpecialEmail"); 	 
				    			  ReportGenerate=rsveh.getInt("ReportGenerate"); 
				    		 
					
					
%>
<tr>

							<td align="right"><%=i %></td>
							<td align="right"><%=rsveh.getString("Date")%></td>
							<td align="right"><%=TotalVehicleInstalled %></td>
							<td align="right"><%=TotalVehicleInstalledActive %></td>
							<td align="right"><%=TotalVehicleTempRemovedActive %></td>
							<td align="right"><%=TotalVehicleDeActivated %></td>
							<td align="right"><%=TotalVehicleinactive %></td>
							<td align="right"><%=newcnt %></td>
							<td align="right"><%=newcnt1 %></td>
							<td align="right"><%=CompPending1to7 %></td>
							<td align="right"><%=CompPending7 %></td>
							<td align="right"><%=CompPending15 %></td>
							<td align="right"><%=CompCreation %></td>
							<td align="right"><%=ReCompDone %></td>
							<td align="right"><%=ReOfOpenComp %></td>
							<td align="right"><%=OutOfWarrantyVehicle %></td>
							<td align="right"><%=ReOfOpenComp %></td>
							<td align="right"><%=outOfWarrantyEmail %></td>
							<td align="right"><%=SpecialEmail %></td>
							<td align="right"><%=vehicleavailableMailSend %></td>
							<td align="right"><%=vehiclenotattendedMailSend %></td>
							<td align="right"><%=devicedispatchedMailSend %></td>
							<td align="right"><%=ReportGenerate %></td>
							<td align="right"><%=specialcmntfleetview %></td>
							<td align="right"><%=spcmntclosed %></td>
							</tr>
							
					<% }%> 
					
					<tfoot>
					<tr>
					
							<th>Sr.No</th>
							<th align="center">Date</th>
							<th align="center">Total Configured Vehicles</th>
							<th align="center">Total Active Configured Vehicles</th>
							<th align="center">Temp Removal(Total/Active)</th>
							<th align="center">DeActivate(Total/Active)</th>
							<th align="center">Inactive(Total/Active)</th>
							<th align="center">Complaints Not Allocated Data older than 3 to 7 Days</th>
							<th align="center">Complaints Not Allocated Data older that 7 Days</th>
							<th align="center">Complaints Pending 1-7 Days</th>
							<th align="center">Complaints Pending 7-15 Days</th>
							<th align="center">Complaints Pending >15 Days</th>
							<th align="center">Complaints Pending (Creation) >15 Days</th>
							<th align="center">Reallocation of Complaints Done</th>
							<th align="center">Reallocation of Open Complaints</th>
							<th align="center">Out of Warranty Vehicle Attended ?</th>
							<th align="center">complaint closed of out of warranty / not inspection</th>
							<th align="center">Out Of Warranty Email</th>
							<th align="center">Special Report Email</th>
							<th align="center">Vehicle Availability Email</th>
							<th align="center">Vehicle Not Attended Email</th>
							<th align="center">Device Dispatched Email</th>
							<th align="center">Special Report Generated</th>
							<th align="center">Special comment visible in fleetview</th>
							<th align="center">Special comment Not Closed</th>
							
					</tr>
					</tfoot>
					</tbody>
<%} %>
				<%
	
}catch(Exception e)
{	
	out.print("Exception -->"+e);

}
finally
{
	conn.close();
	conn1.close();

}
%>

				<!-- code end here --->

		<%@ include file="footer.jsp"%>	
			
</body>
</html>
