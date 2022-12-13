<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java"
	import="java.sql.*" import=" java.text.*" import=" java.util.*"
	errorPage=""%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page contentType="text/html; charset=iso-8859-1" language="java"
	import="java.sql.*" import=" java.text.*" import=" java.util.*"
	errorPage=""%>
<%@ include file="header.jsp"%>
<%@page import="java.sql.ResultSet"%>

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
<style type="text/css">
.popup {
	background-color: #98AFC7;
	position: absolute;
	visibility: hidden;
}
</style>
<title>Seven Day Diary System.</title>
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
									title : '1 to 2 Days Vechile Delay Data',

									 exportOptions: {
							                columns: [0,1,2,3,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]
							            },
									
								}, {
									extend : 'pdf',
									title : '1 to 2  Days Vechile Delay Data',
									pageSize :'A0',
									exportOptions: {
						                columns: [0,1,2,3,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]
						            },
								}, {
									extend : 'csv',
									title : '1 to 2 Days Vechile Delay Data',
									exportOptions: {
						                columns: [0,1,2,3,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]
						            },
								}, {
									extend : 'print',
									title : '1 to 2 Days Vechile Delay Data',
									exportOptions: {
						                columns: [0,1,2,3,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]
						            },
								}, {
									extend : 'copy',
									title : '1 to 2  Days Vechile Delay Data',
									exportOptions: {
						                columns: [0,1,2,3,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]
						            },
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
<script language="javascript">
function toggleDetails(id, show)
{
	var popup = document.getElementById("popup"+id);
	if (show) {
		popup.style.visibility = "visible";
		popup.setfocus();
		
	} else {
		popup.style.visibility = "hidden";
	}
}
function toggleDetails1(id, show)
{
	var popupx = document.getElementById("popupx"+id);
	if (show) {
		popupx.style.visibility = "visible";
		popupx.setfocus();
		
	} else {
		popupx.style.visibility = "hidden";
	}
}
function showtextarea(a,b,c)
{
	document.getElementById("div"+a).innerHTML="<form action='callinfo.jsp' method='get'><TEXTAREA name='callinfo' id='callinfo'class='formElement'></TEXTAREA><br><input type='Submit' name='Submit' value='Submit' class='formElement'><input type='button' value='Cancel' onclick='canceldiv("+a+");' class='formElement'><br><input type='hidden' name='rname' value='"+b+"'><br><input type='hidden' name='transporter' value='"+c+"'><br><input type='hidden' name='pagename' value='currentdata.jsp'></form>";
}
function canceldiv(A)
{
	document.getElementById("div"+A).innerHTML="<a href='javascript:showtextarea("+A+");'>Edit</a>";
}
</script>


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

		<p></p>


		<%!Connection conn, conn1;
	Statement st, st1, st2, st3, st01, st4, st5, st7, st8, st9, st10, st11, stmt9, strt, stt, stat, stmt20, sst, sstt,
			stwar3, stt1,stt2;
	String sql, sql1, sql2;
	String transporter, today, Svehlist, username, warranty;
	String Vehcode = "", unitid = "", instdate = "";%>
		<%
			String userrole1 = session.getAttribute("userrole").toString();
		%>


		<%
			if (userrole1.equalsIgnoreCase("supertech")) {
		%>

		<%@ include file="headertech.jsp"%>

		<%
			} else {
		%>
		<%@ include file="header1.jsp"%>

		<%
			}
		%>



		<%
			transporter = "All Transporter";
			java.util.Date defoultdate = new java.util.Date();
			Format formatter = new SimpleDateFormat("yyyy-MM-dd");
			String tdydate = formatter.format(defoultdate);
			long miliseconds = defoultdate.getTime();
			miliseconds = miliseconds - 4000 * 60 * 60 * 24;
			defoultdate.setTime(miliseconds);
			miliseconds = miliseconds + 1000 * 60 * 60 * 24;
			defoultdate.setTime(miliseconds);
			String today3 = formatter.format(defoultdate);
			miliseconds = miliseconds + 1000 * 60 * 60 * 24;
			defoultdate.setTime(miliseconds);
			today = formatter.format(defoultdate);
			miliseconds = miliseconds - 5000 * 60 * 60 * 24;
			defoultdate.setTime(miliseconds);
			String today4 = formatter.format(defoultdate);

			miliseconds = miliseconds + 1000 * 60 * 60 * 24;
			defoultdate.setTime(miliseconds);
			String sdays = formatter.format(defoultdate);
			Svehlist = "(0";
			username = session.getAttribute("username").toString();

			String userrole2 = session.getAttribute("userrole").toString();

			try {
				Class.forName(MM_dbConn_DRIVER);
				conn = DriverManager.getConnection(MM_dbConn_STRING, MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
				conn1 = DriverManager.getConnection(MM_dbConn_STRING1, MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
				st = conn.createStatement();
				st01 = conn.createStatement();
				st1 = conn1.createStatement();
				st2 = conn1.createStatement();
				st4 = conn1.createStatement();
				st5 = conn1.createStatement();
				st3 = conn1.createStatement();

				st8 = conn1.createStatement();
				st9 = conn1.createStatement();
				st10 = conn1.createStatement();
				st11 = conn1.createStatement();
				stmt9 = conn1.createStatement();
				strt = conn1.createStatement();
				stt = conn1.createStatement();
				stat = conn1.createStatement();
				stmt20 = conn1.createStatement();
				sst = conn1.createStatement();
				sstt = conn.createStatement();
				stwar3 = conn1.createStatement();
				stt1 = conn.createStatement();
				stt2 = conn.createStatement();
			} catch (Exception e) {
				out.print("Exception --->" + e);
			}
		%>

		<%
			String userrole = session.getAttribute("userrole").toString();
		%>

		<br> <br>
		<div style="padding-right: 50px">
			<table border="0" width="750px" bgcolor="#E6E6E6" align="center">
				<tr>
					<td>
						<table border="0" width="100%">
							<tr>
								<td align="center"><font color="black" size="3">List
										of All Vehicles Showing 1 To 2 Days Data Delay.</font></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</div>


                         
                         
                         
                         
                         
                         <div class="form" style="width: 750px; color: black;">
							<table id="example" width="750px" border="0" align="center">
								<thead>
									<tr>

										<th
											style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: left; background-color: #e6e6e6; color: black;">Sr.</th>
										<th
											style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: left; background-color: #e6e6e6; color: black;">Group</th>
										<th
											style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: left; background-color: #e6e6e6; color: black;">Transporter
										</th>
										<th
											style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: left; background-color: #e6e6e6; color: black;">Tr.Status</th>
										<th
											style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: left; background-color: #e6e6e6; color: black;">VehicleID</th>
											
											
											
											<th
											style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: left; background-color: #e6e6e6; color: black; display: none;">Vehicle Id</th>
											 <!-- This coloumn is hidden beacuse thsi coloumn is used from export only  -->
										<th
											style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: left; background-color: #e6e6e6; color: black;">User Name</th>
											
										 <th
											style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: left; background-color: #e6e6e6; color: black;">User Contact</th>
											
										<th
											style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: left; background-color: #e6e6e6; color: black;">Updated</th>
									<th
										style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: left; background-color: #e6e6e6; color: black;">Allocation</th>
										<th
											style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: left; background-color: #e6e6e6; color: black;">Unit
											ID</th>
											
											
										
										<th
											style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: left; background-color: #e6e6e6; color: black;">Special
											Comment</th>

										<th
											style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: left; background-color: #e6e6e6; color: black;">Spl
											Comment Ent date</th>

										<th
											style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: left; background-color: #e6e6e6; color: black;">Status
										</th>
										<th
											style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: left; background-color: #e6e6e6; color: black;">Carrier
										</th>
										<th
											style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: left; background-color: #e6e6e6; color: black;">Mobile</th>

										<th
											style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: left; background-color: #e6e6e6; color: black;">IMSI
										</th>
										<th
											style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: left; background-color: #e6e6e6; color: black;">Installed</th>
										<th
											style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: left; background-color: #e6e6e6; color: black;">Warranty</th>
										<th
											style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: left; background-color: #e6e6e6; color: black;">Serviced</th>
										<th
											style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: left; background-color: #e6e6e6; color: black;">Location</th>


									</tr>
								</thead>
                         
                         
                                                  				<tbody>
					<%
						try {

							if (userrole2.equalsIgnoreCase("supertech")) {

								String sqlas = "", trns = "", rep = "";

								String us = username.toUpperCase();
								sql = "select a.*,b.UnitID,b.installeddate,b.OwnerName from t_onlinedata a, t_vehicledetails b where a.TheDate < '"
										+ tdydate + "' and a.TheDate > '" + today3
										+ "' and a.VehicleCode= b.VehicleCode and b.status ='-' and a.Location not like 'No GPS %' order by b.ownername, a.TheDate Desc";
								//out.print(sql);
								ResultSet rst1 = st1.executeQuery(sql);
								int i = 1;

								while (rst1.next()) {
									unitid = rst1.getString("b.UnitID");

									trns = rst1.getString("OwnerName");

									sqlas = "select * from db_CustomerComplaints.t_asgndtranstoreps where Transporter='" + trns
											+ "'";
									ResultSet agnt = st3.executeQuery(sqlas);
									System.out.println(">>>>>>sql 3>>sqlas>>" + sqlas);

									if (agnt.next())

									{

										rep = agnt.getString("Representative");

										if (rep == "Kamal Dixit" || rep.equalsIgnoreCase("Kamal Dixit")) {

											String simno = "-", mobno = "-", group1 = "", simcomp = "-";
											try {
												instdate = new SimpleDateFormat("dd-MMM-yyyy")
														.format(rst1.getDate("InstalledDate"));
												sql = "select TO_DAYS('" + tdydate + "')-TO_DAYS('" + rst1.getDate("InstalledDate")
														+ "') as days";
												ResultSet rstwar = st2.executeQuery(sql);
												if (rstwar.next()) {
													if (rstwar.getInt("days") <= 365) {

														warranty = "Yes";
													} else {
														warranty = "No";
													}
												}
											} catch (Exception x) {
												instdate = "-";
												warranty = "-";
											}
											sql = "select * from t_group where VehCode='" + rst1.getString("VehicleCode") + "' ";
											ResultSet rs6 = st2.executeQuery(sql);
											if (rs6.next()) {
												group1 = rs6.getString("GPName");
											} else {
												group1 = "NA";
											}

											//==========//

											String tctegory = "";
											String tid = "";

											String sqltct = "select * from db_gps.t_livetickettest where vehid ='"
													+ rst1.getString("VehicleCode") + "' ";
											ResultSet tct = stwar3.executeQuery(sqltct);
											System.out.println(">>>sqlbt>>>>*******" + sqltct);
											if (tct.next()) {

												tctegory = tct.getString("tcategory");
												tid = tct.getString("tid");

											} else {
												tctegory = "-";
												tid = "-";
											}

											//==========//
					%>

					<tr>
												<%
							sql = "select * from t_unitmaster where UnitID='" + unitid + "'";
												ResultSet rs5 = st2.executeQuery(sql);
												if (rs5.next()) {
													mobno = rs5.getString("MobNo");
													simno = rs5.getString("SimNo");
													simcomp = rs5.getString("SimCompany");
												}
						%>
						
												<td><%=warranty%></td>

						<%
							System.out.println("Vechile Code " + rst1.getString("VehicleCode"));
												System.out.println("Vechile Number " + rst1.getString("VehicleRegNo"));

												String UserName = "";
												String fname = "";
												String lname = "";
												String UserMob="";
														

												String sql6 = "select FirstName,LastName,MobNo,Email from db_gps.t_userdetails where vehid='"
														+ rst1.getString("VehicleCode") + "' order by UpdatedDate desc limit 1";
												ResultSet rt = st8.executeQuery(sql6);
												if (rt.next()) {
													fname = rt.getString("FirstName");
													lname = rt.getString("LastName");
													UserName = fname + " " + lname;
													UserMob=rt.getString("MobNo");

													System.out.println("UserName " + UserName);

												} else {
													UserName = "-";
													UserMob="-";
													
												}
						%>
						

						<%
							String Trstatus = "";
												String sqltr = "select distinct(TransporterStatus),ActiveStatus from db_gps.t_transporter where TypeValue='"
														+ rst1.getString("OwnerName") + "' ";
												System.out.println("sqltr " + sqltr);
												ResultSet restr = strt.executeQuery(sqltr);
												if (restr.next()) {
													Trstatus = restr.getString("TransporterStatus");
												}
												if (Trstatus == "Yes" || Trstatus.equals("Yes")) {
													Trstatus = "Active";
												} else {
													Trstatus = "-";
												}
						%>

						

						<%
							String st = "";
												String status = "select distinct(Status) from db_gps.t_vehicledetails where vehiclecode='"
														+ rst1.getString("VehicleCode") + "' ";
												ResultSet sts = stat.executeQuery(status);
												if (sts.next()) {
													st = sts.getString("Status");
												} else {
													st = "-";
												}
						%>




						

												<%
							String datetime = "";
												String sql06 = "select CONCAT(TheDate,' ',TheTime) as DateTime,Location from db_gps.t_onlinedata where vehiclecode='"
														+ rst1.getString("VehicleCode") + "' ";
												System.out.println("sql6 " + sql06);
												ResultSet res6 = st11.executeQuery(sql06);
												if (res6.next()) {

													datetime = res6.getString("DateTime");

												} else {
													datetime = "-";
												}

												String tickno = "";
												String sql9 = "select Tno from t_complaints1 where VehicleNo='"
														+ rst1.getString("VehicleRegNo") + "' order by Tno desc limit 1";
												ResultSet rrt = sstt.executeQuery(sql9);

												System.out.println("Ticket sql9 " + sql9);

												if (rrt.next()) {

													tickno = rrt.getString("Tno");
													System.out.println("Ticket Number " + tickno);

												}

												String allocdate = "";

												String ReAllocate = "select NewAvailableDate from db_CustomerComplaints.t_reallocated where Tno='"
														+ tickno + "'";

												System.out.println("ReAllocate " + ReAllocate);
												ResultSet rsReAllocate = st9.executeQuery(ReAllocate);

												if (rsReAllocate.next()) {
													allocdate = rsReAllocate.getString("NewAvailableDate");
												} else {
													String sql10 = "select DofAllocation from db_CustomerComplaints.t_callocation1 where Tno='"
															+ tickno + "' and DofAllocation >='" + datetime
															+ "' order by DofAllocation desc limit 1 ";
													ResultSet rtt = st10.executeQuery(sql10);

													System.out.println("Ticket sql10 " + sql10);

													if (rtt.next()) {

														allocdate = rtt.getString("DofAllocation");
														System.out.println("Date Of Allocation " + allocdate);

													} else {
														allocdate = "-";
													}

												}
												String DoA = "";

												if (allocdate.equals("-")) {
													DoA = "-";
												} else {
													DoA = new SimpleDateFormat("dd-MMM-yyyy")
															.format(new SimpleDateFormat("yyyy-MM-dd").parse(allocdate));
												}
						%>

						
						
						<%
									String specialcomment="";
									String SpecialcmtDate="";
							  		
							  		String sqlspcommt="SELECT spc.entdatetime as spcdt,spc.vehregno,spc.spcomment as specialcomment		" +
											"       FROM db_CustomerComplaints.t_techspecialrep spc " +
											" 		INNER JOIN " +
											" 		( " +
											" 			SELECT Max(entdatetime) as entdatetime, spcomment,visibleInFleetview,cmmt_type,Closed, vehregno " + 
											" 			FROM db_CustomerComplaints.t_techspecialrep " +
											" 			WHERE visibleInFleetview='Yes'  " +
											" 			AND cmmt_type = 'vehicle' " +
											" 			AND Closed = 'No' " +
											" 			GROUP BY vehregno " +
											" 	) spcd ON (spc.VehRegNo= spcd.VehRegNo AND spc.entdatetime=spcd.entdatetime)" +
											"	where spc.VehRegNo='"+ rst1.getString("VehicleRegNo")+"'";
											ResultSet rscommt = stt1.executeQuery(sqlspcommt);
											if(rscommt.next())
											{ 
												specialcomment = rscommt.getString("specialcomment");
												SpecialcmtDate = rscommt.getString("spcdt");											
											}else
											{
												specialcomment="-";
												SpecialcmtDate="-";
												
												
											}
											

											String SpeCmntEntDate="";
											if(SpecialcmtDate.equals("-")){
												SpeCmntEntDate="-";
											}else{
											
												SpeCmntEntDate = new SimpleDateFormat("dd-MMM-yyyy")
														.format(new SimpleDateFormat("yyyy-MM-dd").parse(SpecialcmtDate));
											}
											
											
											
						%>
						
						 <td><%=i%></td>
									<td><%=group1%></td>
									<td><%=rst1.getString("OwnerName")%></td>
									<td><%=Trstatus%></td>

									<td><a href="javascript:toggleDetails(<%=i%>,true);"
										title="Click Here"><%=rst1.getString("VehicleRegNo")%> </a> <br />
										<div class="popup" id="popup<%=i%>">
											<table border="0">
											
												<tr>
													<td><a
														href="repunit1.jsp?vid=<%=rst1.getString("VehicleCode")%>&tid=<%=tid%>&category=<%=tctegory%>&warranty=<%=warranty%>"
														onclick="toggleDetails(<%=i%>,false);">Reset Device</a></td>
												</tr>
											
											
											
												<tr>
													<td><a
														href="addcomplaint.jsp?vid=<%=rst1.getString("VehicleCode")%>"
														onclick="toggleDetails(<%=i%>,false);">Add Complaint</a></td>
												</tr>
												<tr>
													<td><a
														href="repunit.jsp?vid=<%=rst1.getString("VehicleCode")%>"
														onclick="toggleDetails(<%=i%>,false);">Unit Replace</a></td>
												</tr>
												<tr>
													<td><a href="javascript: toggleDetails(<%=i%>,false);"
														onClick="window.open ('rep_history.jsp?vid=<%=rst1.getString("VehicleCode")%>','win1','width=750,height=400,location=0,menubar=0,scrollbars=0,status=0,toolbar=0,resizable=0')">
															View History</a></td>
												</tr>

												<tr>
													<td><a
														href="inspection.jsp?vid=<%=rst1.getString("VehicleCode")%>&tid=<%=tid%>&category=<%=tctegory%>&tid=<%=tid%>&category=<%=tctegory%>&warranty=<%=warranty%>"
														onclick="toggleDetails(<%=i%>,false);">Inspection</a></td>
												</tr>



												<tr>
													<td><a href="javascript: toggleDetails(<%=i%>,false);"
														onclick="window.open ('CallLogData.jsp?vid=<%=rst1.getString("VehicleRegNo")%>&vehno=<%=rst1.getString("VehicleCode")%>&&transp=<%=transporter%>','win1','width=800,height=600,location=0,menubar=0,scrollbars=0,status=0,toolbar=0,resizable=0')">Call
															Log</a></td>
												</tr>


												<tr>
													<td><a
														href="sendmail.jsp?vehno=<%=rst1.getString("VehicleRegNo")%>&tid=<%=tid%>&category=<%=tctegory%>&unitid=<%=unitid%>&transp=<%=transporter%>"
														onclick="toggleDetails(<%=i%>,false);">Send Mail</a></td>
												</tr>

											 <tr>
													<td><a
														href="remuittemp.jsp?veh=<%=rst1.getString("VehicleRegNo")%>&tid=<%=tid%>&category=<%=tctegory%>&Vehcode=<%=rst1.getString("VehicleCode")%>">
															Temp Removal </a></td>
												</tr> 
												<tr>
													<td><a
														href="reportincident.jsp?vehno=<%=rst1.getString("VehicleRegNo")%>&tid=<%=tid%>&category=<%=tctegory%>&unitid=<%=unitid%>&transp=<%=transporter%>&GPName=<%=group1%>"
														onclick="toggleDetails(<%=i%>,false);">Report Incident</a>
													</td>
												</tr>

												 <tr>
													<td><a
														href="editrecs.jsp?vid=<%=rst1.getString("VehicleCode")%>&tid=<%=tid%>&category=<%=tctegory%>"
														onclick="toggleDetails(<%=i%>,false);">Edit Records</a></td>
												</tr> 

												<%
													if (MANAGER.equalsIgnoreCase(userrole) || SUPERADMIN.equalsIgnoreCase(userrole)
																				|| userrole.equals("MiddleWare")) {
												%>
											<%-- 	<tr>
													<td><a href="editrecs.jsp?vi<d=
														<%=rst1.getString("VehicleCode")%>" onclick="toggleDetails(<%=i%>,false);">Edit
															Records</a></td>
												</tr>
												<tr>
													<td><a
														href="remuittemp.jsp?veh=<%=rst1.getString("VehicleRegNo")%>">
															Temp Removal </a></td>
												</tr>  --%>
												<%
													}
												%>
												<tr>
													<td><a href="javascript: toggleDetails(<%=i%>,false);"
														onClick="window.open ('reprovisionnos.jsp?vid=<%=rst1.getString("VehicleCode")%>&vehno=<%=rst1.getString("VehicleRegNo")%>&unitid=<%=unitid%>&simno=<%=simno%>&mobno=<%=mobno%>&transp=<%=transporter%>','win1','width=750,height=400,location=0,menubar=0,scrollbars=0,status=0,toolbar=0,resizable=0')">
															Re-provisioning </a></td>
												</tr>
												<tr>
													<td><a
														href="techspcomment.jsp?vehno=<%=rst1.getString("VehicleRegNo")%>&comment=veh"
														onclick="toggleDetails(<%=i%>,false);">Special Comment
													</a></td>
												</tr>
												<tr>
													<td><a href="javascript:toggleDetails(<%=i%>,false);">Close</a></td>
												</tr>
											</table>
										</div></td>
									
										<td  style="display: none;"><%=rst1.getString("VehicleRegNo")%></td>
									
									
									<td><%=UserName%></td>
									<td><%=UserMob%></td>
									<td><%=new SimpleDateFormat("dd-MMM-yyyy").format(rst1.getDate("TheDate"))%>
										<%=rst1.getString("TheTime")%></td>



									
									<td><%=DoA%></td>
									<td><%=unitid%></td>

									<td><%=specialcomment%></td>
									<td><%=SpeCmntEntDate%></td>
									<td><%=st%></td>
									<td><%=simcomp%>
									<td><%=mobno%></td>
									<td><%=simno%></td>
									<td><%=instdate%></td>
									<td><%=warranty%></td>



									<td>
										<%
											String d1 = "N.A";

																sql = "select * from t_unitreplacement where VehRegNo='"
																		+ rst1.getString("VehicleRegNo")
																		+ "' and VehRegNo not in('-','0','0000') and InstType='Rep'  order by InstDate desc";
																ResultSet rsgett = stt.executeQuery(sql);
																if (rsgett.next()) {

																	d1 = rsgett.getString("InstDate");
																	if (d1 == "0000-00-00" || d1 == "-") {
																		out.print(d1);
																	} else {
																		String d2 = new SimpleDateFormat("dd-MMM-yyyy")
																				.format(new SimpleDateFormat("yyyy-MM-dd").parse(d1));
																		out.print(d2);
																	}
																} else {
																	out.print(d1);
																}
										%>
									</td>

									<td><%=rst1.getString("Location")%></td>
									
						
						
						
						
						
						
						
						
						
						
						
						




					</tr>

					<%
						i++;

										}
									}
								}

							} else {

								String us = username.toUpperCase();
								sql = "select a.*,b.UnitID,b.installeddate,b.OwnerName from t_onlinedata a, t_vehicledetails b where a.TheDate < '"
										+ tdydate + "' and a.TheDate > '" + today3
										+ "' and a.VehicleCode= b.VehicleCode and b.status ='-' and a.Location not like 'No GPS %' order by b.ownername, a.TheDate Desc";
								//out.print(sql);
								ResultSet rst1 = st1.executeQuery(sql);
								int i = 1;
								while (rst1.next()) {
									unitid = rst1.getString("b.UnitID");
									String simno = "-", mobno = "-", group1 = "", simcomp = "-";
									try {
										instdate = new SimpleDateFormat("dd-MMM-yyyy").format(rst1.getDate("InstalledDate"));
										sql = "select TO_DAYS('" + tdydate + "')-TO_DAYS('" + rst1.getDate("InstalledDate")
												+ "') as days";
										ResultSet rstwar = st2.executeQuery(sql);
										if (rstwar.next()) {
											if (rstwar.getInt("days") <= 365) {

												warranty = "Yes";
											} else {
												warranty = "No";
											}
										}
									} catch (Exception x) {
										instdate = "-";
										warranty = "-";
									}
									sql = "select * from t_group where VehCode='" + rst1.getString("VehicleCode") + "' ";
									ResultSet rs6 = st2.executeQuery(sql);
									if (rs6.next()) {
										group1 = rs6.getString("GPName");
									} else {
										group1 = "NA";
									}

									//==========//

									String tctegory = "";
									String tid = "";

									String sqltct = "select * from db_gps.t_livetickettest where vehid ='"
											+ rst1.getString("VehicleCode") + "' ";
									ResultSet tct = stwar3.executeQuery(sqltct);
									System.out.println(">>>sqlbt>>>>*******" + sqltct);
									if (tct.next()) {

										tctegory = tct.getString("tcategory");
										tid = tct.getString("tid");

									} else {
										tctegory = "-";
										tid = "-";
									}

									//==========//
					%>
					<tr>
												<%
							sql = "select * from t_unitmaster where UnitID='" + unitid + "'";
										ResultSet rs5 = st2.executeQuery(sql);
										if (rs5.next()) {
											mobno = rs5.getString("MobNo");
											simno = rs5.getString("SimNo");
											simcomp = rs5.getString("SimCompany");
										}
						%>
						
										


						<%
							System.out.println("Vechile Code " + rst1.getString("VehicleCode"));
										System.out.println("Vechile Number " + rst1.getString("VehicleRegNo"));

										String UserName = "";
										String fname = "";
										String lname = "";
										String UserMob="-";

										String sql6 = "select FirstName,LastName,MobNo,Email from db_gps.t_userdetails where vehid='"
												+ rst1.getString("VehicleCode") + "' order by UpdatedDate desc limit 1";
										ResultSet rt = st8.executeQuery(sql6);
										if (rt.next()) {
											fname = rt.getString("FirstName");
											lname = rt.getString("LastName");
											UserName = fname + " " + lname;
                                            UserMob=rt.getString("MobNo");
											
											System.out.println("UserName " + UserName);

										} else {
											UserName = "-";
											UserMob="-";
										}
						%>
					




						<%
							String Trstatus = "";
										String sqltr = "select distinct(TransporterStatus),ActiveStatus from db_gps.t_transporter where TypeValue='"
												+ rst1.getString("OwnerName") + "' ";
										System.out.println("sqltr " + sqltr);
										ResultSet restr = strt.executeQuery(sqltr);
										if (restr.next()) {
											Trstatus = restr.getString("TransporterStatus");
										}
										if (Trstatus == "Yes" || Trstatus.equals("Yes")) {
											Trstatus = "Active";
										} else {
											Trstatus = "-";
										}
						%>

						

						<%
							String st = "";
										String status = "select distinct(Status) from db_gps.t_vehicledetails where vehiclecode='"
												+ rst1.getString("VehicleCode") + "' ";
										ResultSet sts = stat.executeQuery(status);
										if (sts.next()) {
											st = sts.getString("Status");
										} else {
											st = "-";
										}
						%>




						
						<%
							String datetime = "";
										String sql06 = "select CONCAT(TheDate,' ',TheTime) as DateTime,Location from db_gps.t_onlinedata where vehiclecode='"
												+ rst1.getString("VehicleCode") + "' ";
										System.out.println("sql6 " + sql06);
										ResultSet res6 = st11.executeQuery(sql06);
										if (res6.next()) {

											datetime = res6.getString("DateTime");

										} else {
											datetime = "-";
										}

										String tickno = "";
										String sql9 = "select Tno from t_complaints1 where VehicleNo='" + rst1.getString("VehicleRegNo")
												+ "' order by Tno desc limit 1";
										ResultSet rrt = sstt.executeQuery(sql9);

										System.out.println("Ticket sql9 " + sql9);

										if (rrt.next()) {

											tickno = rrt.getString("Tno");
											System.out.println("Ticket Number " + tickno);

										}

										String allocdate = "";

										String ReAllocate = "select NewAvailableDate from db_CustomerComplaints.t_reallocated where Tno='"
												+ tickno + "'";

										System.out.println("ReAllocate " + ReAllocate);
										ResultSet rsReAllocate = st9.executeQuery(ReAllocate);

										if (rsReAllocate.next()) {
											allocdate = rsReAllocate.getString("NewAvailableDate");
										} else {
											String sql10 = "select DofAllocation from db_CustomerComplaints.t_callocation1 where Tno='"
													+ tickno + "' and DofAllocation >='" + datetime
													+ "' order by DofAllocation desc limit 1 ";
											ResultSet rtt = st10.executeQuery(sql10);

											System.out.println("Ticket sql10 " + sql10);

											if (rtt.next()) {

												allocdate = rtt.getString("DofAllocation");
												System.out.println("Date Of Allocation " + allocdate);

											} else {
												allocdate = "-";
											}

										}
										String DoA = "";

										if (allocdate.equals("-")) {
											DoA = "-";
										} else {
											DoA = new SimpleDateFormat("dd-MMM-yyyy")
													.format(new SimpleDateFormat("yyyy-MM-dd").parse(allocdate));
										}
						%>

						
						
						
						
						<%
									String specialcomment="";
									String SpecialcmtDate="";
							  		
							  		String sqlspcommt="SELECT spc.entdatetime as spcdt,spc.vehregno,spc.spcomment as specialcomment		" +
											"       FROM db_CustomerComplaints.t_techspecialrep spc " +
											" 		INNER JOIN " +
											" 		( " +
											" 			SELECT Max(entdatetime) as entdatetime, spcomment,visibleInFleetview,cmmt_type,Closed, vehregno " + 
											" 			FROM db_CustomerComplaints.t_techspecialrep " +
											" 			WHERE visibleInFleetview='Yes'  " +
											" 			AND cmmt_type = 'vehicle' " +
											" 			AND Closed = 'No' " +
											" 			GROUP BY vehregno " +
											" 	) spcd ON (spc.VehRegNo= spcd.VehRegNo AND spc.entdatetime=spcd.entdatetime)" +
											"	where spc.VehRegNo='"+ rst1.getString("VehicleRegNo")+"'";
											ResultSet rscommt = stt1.executeQuery(sqlspcommt);
											if(rscommt.next())
											{ 
												specialcomment = rscommt.getString("specialcomment");
												SpecialcmtDate = rscommt.getString("spcdt");											
											}else
											{
												specialcomment="-";
												SpecialcmtDate="-";
												
						
											}

											String SpeCmntEntDate="";
											if(SpecialcmtDate.equals("-")){
												SpeCmntEntDate="-";
											}else{
											
												SpeCmntEntDate = new SimpleDateFormat("dd-MMM-yyyy")
														.format(new SimpleDateFormat("yyyy-MM-dd").parse(SpecialcmtDate));
											}
											
											
						%>
						
						            <td><%=i%></td>
									<td><%=group1%></td>
									<td><%=rst1.getString("OwnerName")%></td>
									<td><%=Trstatus%></td>

									<td><a href="javascript:toggleDetails(<%=i%>,true);"
										title="Click Here"><%=rst1.getString("VehicleRegNo")%> </a> <br/>
										<div class="popup" id="popup<%=i%>">
											<table border="0">
											
												<tr>
													<td><a
														href="repunit1.jsp?vid=<%=rst1.getString("VehicleCode")%>&tid=<%=tid%>&category=<%=tctegory%>&warranty=<%=warranty%>"
														onclick="toggleDetails(<%=i%>,false);">Reset Device</a></td>
												</tr>
											
											
											
												<tr>
													<td><a
														href="addcomplaint.jsp?vid=<%=rst1.getString("VehicleCode")%>"
														onclick="toggleDetails(<%=i%>,false);">Add Complaint</a></td>
												</tr>
												<tr>
													<td><a
														href="repunit.jsp?vid=<%=rst1.getString("VehicleCode")%>"
														onclick="toggleDetails(<%=i%>,false);">Unit Replace</a></td>
												</tr>
												<tr>
													<td><a href="javascript: toggleDetails(<%=i%>,false);"
														onClick="window.open ('rep_history.jsp?vid=<%=rst1.getString("VehicleCode")%>','win1','width=750,height=400,location=0,menubar=0,scrollbars=0,status=0,toolbar=0,resizable=0')">
															View History</a></td>
												</tr>

												<tr>
													<td><a
														href="inspection.jsp?vid=<%=rst1.getString("VehicleCode")%>&tid=<%=tid%>&category=<%=tctegory%>&tid=<%=tid%>&category=<%=tctegory%>&warranty=<%=warranty%>"
														onclick="toggleDetails(<%=i%>,false);">Inspection</a></td>
												</tr>



												<tr>
													<td><a href="javascript: toggleDetails(<%=i%>,false);"
														onclick="window.open ('CallLogData.jsp?vid=<%=rst1.getString("VehicleRegNo")%>&vehno=<%=rst1.getString("VehicleCode")%>&&transp=<%=transporter%>','win1','width=800,height=600,location=0,menubar=0,scrollbars=0,status=0,toolbar=0,resizable=0')">Call
															Log</a></td>
												</tr>


												<tr>
													<td><a
														href="sendmail.jsp?vehno=<%=rst1.getString("VehicleRegNo")%>&tid=<%=tid%>&category=<%=tctegory%>&unitid=<%=unitid%>&transp=<%=transporter%>"
														onclick="toggleDetails(<%=i%>,false);">Send Mail</a></td>
												</tr>

											 <tr>
													<td><a
														href="remuittemp.jsp?veh=<%=rst1.getString("VehicleRegNo")%>&tid=<%=tid%>&category=<%=tctegory%>&Vehcode=<%=rst1.getString("VehicleCode")%>">
															Temp Removal </a></td>
												</tr> 
												<tr>
													<td><a
														href="reportincident.jsp?vehno=<%=rst1.getString("VehicleRegNo")%>&tid=<%=tid%>&category=<%=tctegory%>&unitid=<%=unitid%>&transp=<%=transporter%>&GPName=<%=group1%>"
														onclick="toggleDetails(<%=i%>,false);">Report Incident</a>
													</td>
												</tr>

												 <tr>
													<td><a
														href="editrecs.jsp?vid=<%=rst1.getString("VehicleCode")%>&tid=<%=tid%>&category=<%=tctegory%>"
														onclick="toggleDetails(<%=i%>,false);">Edit Records</a></td>
												</tr> 

												<%
													if (MANAGER.equalsIgnoreCase(userrole) || SUPERADMIN.equalsIgnoreCase(userrole)
																				|| userrole.equals("MiddleWare")) {
												%>
											<%-- 	<tr>
													<td><a href="editrecs.jsp?vi<d=
														<%=rst1.getString("VehicleCode")%>" onclick="toggleDetails(<%=i%>,false);">Edit
															Records</a></td>
												</tr>
												<tr>
													<td><a
														href="remuittemp.jsp?veh=<%=rst1.getString("VehicleRegNo")%>">
															Temp Removal </a></td>
												</tr>  --%>
												<%
													}
												%>
												<tr>
													<td><a href="javascript: toggleDetails(<%=i%>,false);"
														onClick="window.open ('reprovisionnos.jsp?vid=<%=rst1.getString("VehicleCode")%>&vehno=<%=rst1.getString("VehicleRegNo")%>&unitid=<%=unitid%>&simno=<%=simno%>&mobno=<%=mobno%>&transp=<%=transporter%>','win1','width=750,height=400,location=0,menubar=0,scrollbars=0,status=0,toolbar=0,resizable=0')">
															Re-provisioning </a></td>
												</tr>
												<tr>
													<td><a
														href="techspcomment.jsp?vehno=<%=rst1.getString("VehicleRegNo")%>&comment=veh"
														onclick="toggleDetails(<%=i%>,false);">Special Comment
													</a></td>
												</tr>
												<tr>
													<td><a href="javascript:toggleDetails(<%=i%>,false);">Close</a></td>
												</tr>
											</table>
										</div></td>
									
										<td  style="display: none;"><%=rst1.getString("VehicleRegNo")%></td>
									
									
									<td><%=UserName%></td>
									<td><%=UserMob%></td>
									
									<td><%=new SimpleDateFormat("dd-MMM-yyyy").format(rst1.getDate("TheDate"))%>
										<%=rst1.getString("TheTime")%></td>



									
									<td><%=DoA%></td>
									<td><%=unitid%></td>

									<td><%=specialcomment%></td>
									<td><%=SpeCmntEntDate%></td>
									<td><%=st%></td>
									<td><%=simcomp%>
									<td><%=mobno%></td>
									<td><%=simno%></td>
									<td><%=instdate%></td>
									<td><%=warranty%></td>



									<td>
										<%
											String d1 = "N.A";

																sql = "select * from t_unitreplacement where VehRegNo='"
																		+ rst1.getString("VehicleRegNo")
																		+ "' and VehRegNo not in('-','0','0000') and InstType='Rep'  order by InstDate desc";
																ResultSet rsgett = stt.executeQuery(sql);
																if (rsgett.next()) {

																	d1 = rsgett.getString("InstDate");
																	if (d1 == "0000-00-00" || d1 == "-") {
																		out.print(d1);
																	} else {
																		String d2 = new SimpleDateFormat("dd-MMM-yyyy")
																				.format(new SimpleDateFormat("yyyy-MM-dd").parse(d1));
																		out.print(d2);
																	}
																} else {
																	out.print(d1);
																}
										%>
									</td>

									<td><%=rst1.getString("Location")%></td>
								
					</tr>

					<%
	i++;
	}
	
}
	
	
}catch(Exception e)
{
	out.print("Exception --->"+e);
}
finally
{
conn.close();
conn1.close();
}
%>
				
			</table>


			

	<div id="copyright">Copyright © 2008 by Transworld Compressor
		Technologies Ltd. All Rights Reserved.</div>

</body>
</html>
