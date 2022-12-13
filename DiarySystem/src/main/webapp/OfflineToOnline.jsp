<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="org.apache.poi.util.SystemOutLogger"%>
<%@ page contentType="text/html; charset=iso-8859-1" language="java"
	import="java.sql.*" import=" java.text.*" import=" java.util.*"
	errorPage=""%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ include file="header.jsp"%>
<%@ page import="java.util.Date"%>

<%@page import="java.sql.ResultSet"%>

<html>
<head>
<title>Seven Day Diary System.</title>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="css/css.css" type="text/css"
	charset="utf-8" />
<script src="sorttable.js" type="text/javascript"></script>

<style type="text/css">
@import url(jscalendar-1.0/calendar-win2k-1.css);
</style>

<script type="text/javascript" src="jscalendar-1.0/calendar.js"></script>
<script type="text/javascript" src="jscalendar-1.0/lang/calendar-en.js"></script>
<script type="text/javascript" src="jscalendar-1.0/calendar-setup.js"></script>


<script language="javascript">
	function fun2() {
		document.form1.submit();
	}
</script>


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
<script
	src=" https://cdn.datatables.net/buttons/1.5.1/js/buttons.flash.min.js "></script>
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


<script type="text/javascript">
	$(document).ready(
			function() {
				$('#example').DataTable(
						{
							//	"pagingType": "full_numbers",

							dom : 'Blfrtip',
							"bLengthChange" : false,
							buttons : [

							{
								extend : 'collection',

								text : 'Export',
								buttons : [ {
									extend : 'excel',
									title : 'AutoClosed Ticket Report'

								}, {
									extend : 'pdf',
									orientation : 'landscape',
									pageSize : 'LEGAL',
									title : 'AutoClosed Ticket Report'

								}, {
									extend : 'csv',
									title : 'AutoClosed Ticket Report'
								}, {
									extend : 'print',
									title : 'AutoClosed Ticket Report'
								}, {
									extend : 'copy',
									title : 'AutoClosed Ticket Report'
								},

								/* 'copy', 'csv', 'excel', 'pdf', 'print' */

								]
							},

							'colvis', 'pageLength' ],

							"oLanguage" : {
								"sSearch" : "Search"
							},

							lengthMenu : [
									[ 10, 25, 50, -1 ],
									[ '10 Rows', '25 Rows', '50 Rows',
											'Show all' ],

							],

							"aoColumns" : [ null, null, null, null, null, null,
									null, null, null, null ]

						});
			});
	
	 /*  { "sType": "date-uk" }, */
	  
	jQuery.extend(jQuery.fn.dataTableExt.oSort, {
		"date-uk-pre" : function(a) {
			var ukDatea = a.split('/');
			return (ukDatea[2] + ukDatea[1] + ukDatea[0]) * 1;
		},

		"date-uk-asc" : function(a, b) {
			return ((a < b) ? -1 : ((a > b) ? 1 : 0));
		},

		"date-uk-desc" : function(a, b) {
			return ((a < b) ? 1 : ((a > b) ? -1 : 0));
		}
	});
</script>

<script type="text/javascript">
	$(document).ready(
			function() {
				$('#example2').DataTable(
						{
							//	"pagingType": "full_numbers",

							dom : 'Blfrtip',
							"bLengthChange" : false,
							buttons : [

							{
								extend : 'collection',

								text : 'Export',
								buttons : [ {
									extend : 'excel',
									title : 'ManulClosed Ticket Report'

								}, {
									extend : 'pdf',
									orientation : 'landscape',
									pageSize : 'LEGAL',
									title : 'ManulClosed Ticket Report'

								}, {
									extend : 'csv',
									title : 'ManulClosed Ticket Report'
								}, {
									extend : 'print',
									title : 'ManulClosed Ticket Report'
								}, {
									extend : 'copy',
									title : 'ManulClosed Ticket Report'
								},

								/* 'copy', 'csv', 'excel', 'pdf', 'print' */

								]
							},

							'colvis', 'pageLength' ],

							"oLanguage" : {
								"sSearch" : "Search"
							},

							lengthMenu : [
									[ 10, 25, 50, -1 ],
									[ '10 Rows', '25 Rows', '50 Rows',
											'Show all' ],

							],

							"aoColumns" : [ null, null, null, null, null, null,
									null, null, null, null ]

						});
			});
	jQuery.extend(jQuery.fn.dataTableExt.oSort, {
		"date-uk-pre" : function(a) {
			var ukDatea = a.split('/');
			return (ukDatea[2] + ukDatea[1] + ukDatea[0]) * 1;
		},

		"date-uk-asc" : function(a, b) {
			return ((a < b) ? -1 : ((a > b) ? 1 : 0));
		},

		"date-uk-desc" : function(a, b) {
			return ((a < b) ? 1 : ((a > b) ? -1 : 0));
		}
	});
</script>

<script type="text/javascript">
	$(document).ready(
			function() {
				$('#example3').DataTable(
						{
							//	"pagingType": "full_numbers",

							dom : 'Blfrtip',
							"bLengthChange" : false,
							buttons : [

							{
								extend : 'collection',

								text : 'Export',
								buttons : [ {
									extend : 'excel',
									title : 'ComplaintSloved Ticket Report'

								}, {
									extend : 'pdf',
									orientation : 'landscape',
									pageSize : 'LEGAL',
									title : 'ComplaintSloved Ticket Report'

								}, {
									extend : 'csv',
									title : 'ComplaintSloved Ticket Report'
								}, {
									extend : 'print',
									title : 'ComplaintSloved Ticket Report'
								}, {
									extend : 'copy',
									title : 'ComplaintSloved Ticket Report'
								},

								/* 'copy', 'csv', 'excel', 'pdf', 'print' */

								]
							},

							'colvis', 'pageLength' ],

							"oLanguage" : {
								"sSearch" : "Search"
							},

							lengthMenu : [
									[ 10, 25, 50, -1 ],
									[ '10 Rows', '25 Rows', '50 Rows',
											'Show all' ],

							],

							"aoColumns" : [ null, null, null, null, null, null,
									null, null, null, null ]

						});
			});
	jQuery.extend(jQuery.fn.dataTableExt.oSort, {
		"date-uk-pre" : function(a) {
			var ukDatea = a.split('/');
			return (ukDatea[2] + ukDatea[1] + ukDatea[0]) * 1;
		},

		"date-uk-asc" : function(a, b) {
			return ((a < b) ? -1 : ((a > b) ? 1 : 0));
		},

		"date-uk-desc" : function(a, b) {
			return ((a < b) ? 1 : ((a > b) ? -1 : 0));
		}
	});
</script>

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





</head>
<body style="background-color: #FFFFFF;">
	<div id="wrapper" style="width: 100%">
		<div id="logo" style="padding-left: 250px; width: min-content;">
			<h1>
				<img src="images/Transworld.gif">
			</h1>
			<p>We care about your Vehicles</p>
		</div>

		<%@ include file="header1.jsp"%></div>

	<div id="gbox1" style="width: 100%; margin-top: 20px; margin-left: 0;">
		<div id="gbox-top1"></div>
		<div id="gbox-bg1">

			<div id="gbox-grd1"></div>

			<%
				String complaint = "";

				complaint = request.getParameter("radio1");

				if (null == complaint) {
					complaint = "auto";
				}
			%>


			<%
				String datex1, datex2, data1, data2;
				String departmentNew = "";
				String ddx = request.getQueryString();

				Format frt1 = new SimpleDateFormat("yyyy-MM-dd");
				Date prevday = new Date();
				long todaymils = prevday.getTime();
				long prevmils = todaymils - 60 * 60 * 1000 * 24;
				prevday.setTime(prevmils);
				String previousday = frt1.format(prevday);

				System.out.println(" For Dateeeee   " + previousday);

				if (ddx == null) {

					System.out.println(" In First If  ");

					datex1 = datex2 = new SimpleDateFormat("dd-MMM-yyyy").format(new java.util.Date());

					data1 = data2 = new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());

					/* Calendar c = Calendar.getInstance(); // this takes current date
					c.set(Calendar.DAY_OF_MONTH, 1);
					System.out.println(" current date " + new SimpleDateFormat("dd-MMM-yyyy").format(c.getTime()));
					datex1 = new SimpleDateFormat("dd-MMM-yyyy").format(c.getTime()); */

					datex1 = new SimpleDateFormat("dd-MMM-yyyy")
							.format(new SimpleDateFormat("yyyy-MM-dd").parse(previousday));

				} else {

					System.out.println(" In First Else  ");

					String fromdate = request.getParameter("chkdate");
					String todate = request.getParameter("chkdate1");

					System.out.println(" In First Else chkdate  " + fromdate);

					System.out.println(" In First Else  chkdate 1" + todate);

					if (fromdate != null && todate != null) {

						data1 = fromdate;
						data2 = todate;

						datex1 = fromdate;
						datex2 = todate;

					} else {

						data1 = new SimpleDateFormat("yyyy-MM-dd")
								.format(new SimpleDateFormat("dd-MMM-yyyy").parse(request.getParameter("data")));
						data2 = new SimpleDateFormat("yyyy-MM-dd")
								.format(new SimpleDateFormat("dd-MMM-yyyy").parse(request.getParameter("data1")));

						System.out.println("Here DAtes");

						System.out.println("1" + data1);
						System.out.println("2" + data2);

						datex1 = request.getParameter("data");
						datex2 = request.getParameter("data1");
						System.out.println("3" + datex1);
						System.out.println("4" + datex2);
					}
				}

				String Bt = request.getParameter("button");
				System.out.println(" Button :- " + Bt);

				if (Bt == null || Bt == " " || Bt == "") {

					String fromdate = request.getParameter("chkdate");
					String todate = request.getParameter("chkdate1");

					System.out.println(" In Button Null   " + fromdate);

					System.out.println(" In Button Null   chkdate 1" + todate);

					if (fromdate != null && todate != null) {

						datex1 = new SimpleDateFormat("dd-MMM-yyyy")
								.format(new SimpleDateFormat("yyyy-MM-dd").parse(fromdate));

						datex2 = new SimpleDateFormat("dd-MMM-yyyy")
								.format(new SimpleDateFormat("yyyy-MM-dd").parse(todate));

						data1 = fromdate;

						data2 = todate;

						departmentNew = request.getParameter("departmentNew");

					} else {
						datex1 = datex2 = new SimpleDateFormat("dd-MMM-yyyy").format(new java.util.Date());
						data1 = data2 = new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());

						/* Calendar c = Calendar.getInstance(); // this takes current date
						c.set(Calendar.DAY_OF_MONTH, 1);
						System.out.println(" current date " + new SimpleDateFormat("dd-MMM-yyyy").format(c.getTime()));
						datex1 = new SimpleDateFormat("dd-MMM-yyyy").format(c.getTime());
						*/

						datex1 = new SimpleDateFormat("dd-MMM-yyyy")
								.format(new SimpleDateFormat("yyyy-MM-dd").parse(previousday));

						datex2 = new SimpleDateFormat("dd-MMM-yyyy")
								.format(new SimpleDateFormat("yyyy-MM-dd").parse(previousday));

					}
				} else {
					data1 = new SimpleDateFormat("yyyy-MM-dd")
							.format(new SimpleDateFormat("dd-MMM-yyyy").parse(request.getParameter("data")));
					data2 = new SimpleDateFormat("yyyy-MM-dd")
							.format(new SimpleDateFormat("dd-MMM-yyyy").parse(request.getParameter("data1")));

					datex1 = request.getParameter("data");
					datex2 = request.getParameter("data1");
				}

				int details = 0;
			%>


			<table>

				<tr>
					<td style="align: left; padding-left:25px;">

						<form name="form1" id="form1" action="" method="post">

							<input type="radio" name="radio1" id="autocomplaint" value="auto"
								<%if (complaint.equals("auto")) {
				out.print("CHECKED");
			}%>
								onclick="fun2();" />Auto Closed Ticket <input type="radio"
								name="radio1" id="manualcomplaint" value="manual"
								<%if (complaint.equals("manual")) {
				out.print("CHECKED");
			}%>
								onclick="fun2();" /> Manual Closed Ticket <input type="radio"
								name="radio1" id="slovedcomplaint" value="slove"
								<%if (complaint.equals("slove")) {
				out.print("CHECKED");
			}%>
								onclick="fun2();" /> Complaint Closed Ticket
					</td>

					<td style="padding-left: 280px"><font face="Arial"
						color="black" size="2">From </font>&nbsp;&nbsp; <input type="text"
						id="data" height="10px" name="data" value="<%=datex1%>"
						size="13px" readonly class="element text medium"
						style="width: 75px; font-size: 12px; height: 23px;" /> <script
							type="text/javascript">
							Calendar.setup({
								inputField : "data", // ID of the input field
								ifFormat : "%d-%b-%Y", // the date format
								button : "data" // ID of the button
							});
						</script></td>



					<td style="padding-left: 50px;"><font face="Arial"
						color="black" size="2">To</font>&nbsp;&nbsp; <input type="text"
						id="data1" name="data1" value="<%=datex2%>" size="13px" readonly
						class="element text medium"
						style="width: 75px; font-size: 12px; height: 23px;" /> <script
							type="text/javascript">
							Calendar.setup({
								inputField : "data1", // ID of the input field
								ifFormat : "%d-%b-%Y", // the date format
								button : "data1" // ID of the button
							});
						</script></td>
					<%
						System.out.println(" datex1 " + datex1 + " datex2 " + datex2);

						String dt = new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(datex1));

						String dt1 = new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(datex2));

						System.out.println(" dt :-  " + dt + " dt1 :-  " + dt1);
					%>




					<td style="padding-left: 65px;" align="center"><input
						type="submit" name="button" id="button" value="Submit"
						class="formElement" onclick="chk()"
						style="width: 70px; height: 29px"></td>


				</tr>




			</table>

			<%
				Connection conn, conn1;
				Statement st, st1, st2, st3, st4, st5, stt1, stt2, stamc1;

				try {
					Class.forName(MM_dbConn_DRIVER);
					conn = DriverManager.getConnection(MM_dbConn_STRING, MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
					conn1 = DriverManager.getConnection(MM_dbConn_STRING1, MM_dbConn_USERNAME, MM_dbConn_PASSWORD);

					st = conn1.createStatement();
					st1 = conn1.createStatement();
					st2 = conn1.createStatement();
					st3 = conn1.createStatement();
					st4 = conn1.createStatement();
					stt1 = conn.createStatement();
					stt2 = conn.createStatement();
					Statement stt3 = conn.createStatement();
			%>


			<%
				if (complaint.equals("auto")) {
			%>
			<table width="750px" align="center">
				<tr>
					<td>
						<table border="0" width="100%">
							<tr>
								<td align="center"><font color="" size="3"> Auto
										Closed Ticket Report From <%=datex1%> To <%=datex2%></font></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>



			<table id="example" class="display" style="width: 100%">
				<thead>
					<tr>
						<th>Sr.No</th>
						<th align="center">Ticket ID</th>
						<th align="center">Vehicle no.</th>
						<th align="center">Customer Name</th>
						<th align="center">Ticket date time</th>
						<th align="center">Ticket Raised by</th>
						<th align="center">Technician Name</th>
						<th align="center">Veh Available Date Time</th>
						<th align="center">Ticket Closed Date Time</th>
						<th align="center">TAT</th>

					</tr>
				</thead>
				<tbody>
					<%
						int i = 1;
								String tickno = "";
								String date = "";
								String time = "";
								String vehiclecode = "";
								String DateTime = "";
								String raisedby = "";
								String tickclstime = "";
								String Vehregno = "";
								String Ownername = "";

								String sql = "";
								if (Bt == null || Bt == " " || Bt == "") {

									sql = "select * from db_gps.t_ticketmastertest where  status in ('AutoClosed') and tdate =DATE(NOW() - INTERVAL 1 Day)  order by tid desc ";

								} else {

									sql = "select * from db_gps.t_ticketmastertest where  status in ('AutoClosed') and tdate between '"
											+ dt + "' and '" + dt1 + "' ";

									System.out.println(" sqllllll auto " + sql);

								}
					%>

					<%
						ResultSet rt = st.executeQuery(sql);
								while (rt.next()) {
									tickno = rt.getString("tid");
									date = rt.getString("tdate");
									String dt0 =new SimpleDateFormat("dd/MM/yyyy").format(rt.getDate("tdate"));
 
									 
									time = rt.getString("ttime");
									DateTime = dt0 + " " + time;
									raisedby = rt.getString("status");
									vehiclecode = rt.getString("vehid");
									tickclstime = rt.getString("CreationDateTime");

									String substr=tickclstime.substring(0, 19);
									
									
									/* System.out.println(" ticket nooo " + tickno);
									System.out.println(" Datetimeeeee " + DateTime );
									System.out.println(" Raisedbyyyy " + raisedby);
									System.out.println(""); */

									String sql1 = "select VehicleRegNumber, OwnerName from db_gps.t_vehicledetails where vehiclecode= '"
											+ vehiclecode + "' ";
									ResultSet rt1 = st1.executeQuery(sql1);
									if (rt1.next()) {
										Vehregno = rt1.getString("VehicleRegNumber");
										Ownername = rt1.getString("OwnerName");
									}

									String TAT1 = "";
									String tat1 = "SELECT DATEDIFF('" + tickclstime + "','" + date + "') as tat1";
									ResultSet rtt = st1.executeQuery(tat1);
									if (rtt.next()) {
										TAT1 = rtt.getString("tat1");

									}

									System.out.println("tat1 " + TAT1 + "days");
					%>
					<tr>
						<td align="right"><%=i%></td>
						<td align="right"><%=tickno%></td>
						<td align="center"><%=Vehregno%></td>
						<td align="left"><%=Ownername%></td>
						<td align="center"><%=DateTime%></td>
						<td align="left"><%=raisedby%></td>
						<td>-</td>
						<td>-</td>
						<td align="center"><%=substr%></td>
						<td><%=TAT1 + " days"%></td>

					</tr>
					<%
						i++;
								}
					%>
					</tbody>
					<tfoot>
					<tr>
		<th>Sr.No</th>
						<th align="center">Ticket ID</th>
						<th align="center">Vehicle no.</th>
						<th align="center">Customer Name</th>
						<th align="center">Ticket date time</th>
						<th align="center">Ticket Raised by</th>
						<th align="center">Technician Name</th>
						<th align="center">Veh Available Date Time</th>
						<th align="center">Ticket Closed Date Time</th>
						<th align="center">TAT</th>
						</tr>
					</tfoot>
					</table>
					
					

					<%
						}
					%>

					<%
						if (complaint.equals("manual")) {
					%>


					<table width="750px" align="center">
						<tr>
							<td>
								<table border="0" width="100%">
									<tr>
										<td align="center"><font color="" size="3"> 
												Manual Closed Ticket Report From <%=datex1%> To <%=datex2%></font></td>
									</tr>
								</table>
							</td>
						</tr>
					</table>

					<table id="example2" class="display" style="width: 100%">
						<thead>
							<tr>
								<th>Sr.No</th>
								<th align="center">Ticket ID</th>
								<th align="center">Vehicle no.</th>
								<th align="center">Customer Name</th>
								<th align="center">Ticket date time</th>
								<th align="center">Ticket Raised by</th>
								<th align="center">Technician Name</th>
								<th align="center">Veh Available Date Time</th>
								<th align="center">Ticket Closed Date Time</th>
								<th align="center">TAT</th>


							</tr>
						</thead>

						<tbody>
							<%
								int j = 1;
										String TicketID = "";
										String VehRegNo = "";
										String Customer = "";
										String DofTicket = "";
										String Status = "";
										String Technicion = "";
										String VehAvailDate = "";

										String sql3 = "";

										if (Bt == null || Bt == " " || Bt == "") {

											sql3 = "select * from db_CustomerComplaints.t_callocation1 where Status='Solved' and DofComplaint =DATE(NOW() - INTERVAL 1 Day) order by Tno desc";

										} else {

											sql3 = "select * from db_CustomerComplaints.t_callocation1 where Status='Solved' and DofComplaint between '"
													+ dt + "' and '" + dt1 + "' ";
											System.out.println("sqll3333 manual" + sql3);

										}
							%>

							<%
								ResultSet rt2 = stt1.executeQuery(sql3);
										while (rt2.next()) {

											TicketID = rt2.getString("TicketID");
											VehRegNo = rt2.getString("VehRegNo");
											Customer = rt2.getString("Customer");
											DofTicket = rt2.getString("DofComplaint");
											Status = rt2.getString("Status");
											Technicion = rt2.getString("Technicion");
											VehAvailDate = rt2.getString("VehAvailDate");

											String TAT2 = "";
											String tat1 = "SELECT DATEDIFF('" + VehAvailDate + "','" + DofTicket + "') as tat2";
											ResultSet rtt = st1.executeQuery(tat1);
											if (rtt.next()) {
												TAT2 = rtt.getString("tat2");

											}
											
											if(TAT2.startsWith("-"))
											{
												TAT2="0 days";
											}

											System.out.println("tat2 " + TAT2 + " days");
							%>

							<tr>
								<td align="right"><%=j%></td>
								<td align="right"><%=TicketID%></td>
								<td align="center"><%=VehRegNo%></td>
								<td align="left"><%=Customer%></td>
								<td align="center"><%=DofTicket%></td>
								<td align="left"><%=Status%></td>
								<td align="left"><%=Technicion%></td>
								<td align="center"><%=VehAvailDate%></td>
								<td align="center">-</td>
								<td align="right"><%=TAT2 + " days"%></td>
							</tr>
							<%
								j++;
										}
							%>
</tbody>
<tfoot>
<tr>
<th>Sr.No</th>
						<th align="center">Ticket ID</th>
						<th align="center">Vehicle no.</th>
						<th align="center">Customer Name</th>
						<th align="center">Ticket date time</th>
						<th align="center">Ticket Raised by</th>
						<th align="center">Technician Name</th>
						<th align="center">Veh Available Date Time</th>
						<th align="center">Ticket Closed Date Time</th>
						<th align="center">TAT</th>
						</tr>
</tfoot>



							<%
								}
							%>
							
							<%
								if (complaint.equals("slove")) {
		
								%>
								<div>
							<table width="750px" align="center">
								<tr>
									<td>
										<table border="0" width="100%">
											<tr>
												<td align="center"><font color="" size="3">
														Complaint Closed Report From <%=datex1%> To <%=datex2%>
												</font></td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
							<table id="example3" class="display" style="width: 100%">
								<thead>
									<tr>
										<th>Sr.No</th>
										<th align="center">Ticket ID</th>
										<th align="center">Vehicle no.</th>
										<th align="center">Description</th>
										<th align="center">Ticket date time</th>
										<th align="center">Ticket Raised by</th>
										<th align="center">Technician Name</th>
										<th align="center">Veh Available Date Time</th>
										<th align="center">Ticket Closed Date Time</th>
										<th align="center">TAT</th>
									</tr>
								</thead>

								<tbody>

									<%
										int k = 1;
												String ComplaintID = "";
												String vehicleregno = "";
												String EntBy = "";
												String ComplaintDateTime = "";
												String Name = "";
												String Closeddatetime = "";
												String description="";

												String sql4 = "";
												if (Bt == null || Bt == " " || Bt == "") {
													sql4 = "select *   from db_gps.t_ComplaintDetail where status = 'closed'  and DATE(ComplaintDateTime) =DATE(NOW() - INTERVAL 1 Day)order by ComplaintID desc ";

												} else {

													sql4 = "select *  from db_gps.t_ComplaintDetail where status = 'closed'  and ComplaintDateTime between '"
															+ dt + "' and '" + dt1 + "' ";
													System.out.println("sql4444 complaint" + sql4);
												}
												ResultSet rt3 = st3.executeQuery(sql4);
												while (rt3.next()) {
													ComplaintID = rt3.getString("ComplaintID");
													vehicleregno = rt3.getString("vehicleregno");
													EntBy = rt3.getString("EntBy");
													ComplaintDateTime = rt3.getString("ComplaintDateTime");
													Name = rt3.getString("Name");
													Closeddatetime = rt3.getString("Closeddatetime");
													description=rt3.getString("Description");

													
													String substr1=ComplaintDateTime.substring(0, 19);
													String substr2=Closeddatetime.substring(0, 19);
													
													
													
													String TAT3 = "";
													String tat1 = "SELECT DATEDIFF('" + Closeddatetime + "','" + ComplaintDateTime + "') as tat3";
													ResultSet rtt = st1.executeQuery(tat1);
													if (rtt.next()) {
														TAT3 = rtt.getString("tat3");

													}
													
													if(TAT3.startsWith("-"))
													{
														TAT3="0 days";
													}


													System.out.println("tat3 " + TAT3 + "days");
									%>
									<tr>
										<td align="right"><%=k%></td>
										<td align="right"><%=ComplaintID%></td>
										<td align="center"><%=vehicleregno%></td>
										<td align="left"><%=description%></td>
										<td align="center"><%=substr1%></td>
										<td align="left"><%=EntBy%></td>
										<td align="center">-</td>
										<td align="center">-</td>
										<td align="center"><%=substr2%></td>
										<td><%=TAT3 + " days"%></td>
									</tr>

									<%
										k++;
												}
											
									%>

								</tbody>
								<tfoot>
									<tr>
									 	<th>Sr.No</th>
										<th align="center">Ticket ID</th>
										<th align="center">Vehicle no.</th>
										<th align="center">Description</th>
										<th align="center">Ticket date time</th>
										<th align="center">Ticket Raised by</th>
										<th align="center">Technician Name</th>
										<th align="center">Veh Available Date Time</th>
										<th align="center">Ticket Closed Date Time</th>
										<th align="center">TAT</th>


									</tr> 
								
								</tfoot>
							</table>
							<% 
							}
							%>

</div>



							<%
								} catch (Exception e) {
									System.out.println("Exception " + e);
								}
							%>
							<%@ include file="footer.jsp"%>
</body>
</html>







