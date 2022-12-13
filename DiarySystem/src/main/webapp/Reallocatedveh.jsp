<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java"
	import="java.sql.*" import=" java.text.*" import=" java.util.*"
	errorPage=""%>
<%@ include file="header.jsp"%>

<%!Connection conn, conn1;
	Statement st, st1, st2, st22, st3, st5, sttrans;
	String sql, sql1, sql2, sql3, sqltrans, today, olddate, username, userrole, thename;
	String fromdate, todate;
	int Ocount, Icount, CAcount, CScount, URcount, NIcount, OCcount, ICcount, NCcount, RCAcount, SPcount;%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<title>Seven Day Diary System.</title>
<link rel="stylesheet" href="style.css" type="text/css" charset="utf-8" />
<link rel="stylesheet" href="css/css.css" type="text/css"
	charset="utf-8" />
<script src="sorttable.js" type="text/javascript"></script>
<style type="text/css">
@import url(jscalendar-1.0/calendar-win2k-1.css);
</style>
<script type="text/javascript" src="jscalendar-1.0/calendar.js"></script>
<script type="text/javascript" src="jscalendar-1.0/lang/calendar-en.js"></script>
<script type="text/javascript" src="jscalendar-1.0/calendar-setup.js"></script>


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


		<script type="text/javascript">
			$(document)
					.ready(
							function() {
								$('#example')
										.DataTable(
												{
													//	"pagingType": "full_numbers",

													dom : 'Blfrtip',
													"bLengthChange" : false,
													buttons : [

															{
																extend : 'collection',

																text : 'Export',
																buttons : [
																		{
																			extend : 'excel',
																			title : 'Re-Allocated Vehicle  Report'
																					+ $(
																							"#data")
																							.val()
																					+ '-'
																					+ $(
																							"#data1")
																							.val(),

																		},
																		{
																			extend : 'pdf',
																			orientation : 'landscape',
																			pageSize : 'LEGAL',
																			title : 'Re-Allocated Vehicle  Report'
																					+ $(
																							"#data")
																							.val()
																					+ '-'
																					+ $(
																							"#data1")
																							.val(),

																		},
																		{
																			extend : 'csv',
																			title : 'Re-Allocated Vehicle  Report'
																					+ $(
																							"#data")
																							.val()
																					+ '-'
																					+ $(
																							"#data1")
																							.val(),

																		},
																		{
																			extend : 'print',
																			title : 'Re-Allocated Vehicle  Report'
																					+ $(
																							"#data")
																							.val()
																					+ '-'
																					+ $(
																							"#data1")
																							.val(),

																		},
																		{
																			extend : 'copy',
																			title : 'Re-Allocated Vehicle  Report'
																					+ $(
																							"#data")
																							.val()
																					+ '-'
																					+ $(
																							"#data1")
																							.val(),

																		},

																/* 'copy', 'csv', 'excel', 'pdf', 'print' */

																]
															},

															'colvis',
															'pageLength' ],

													"oLanguage" : {
														"sSearch" : "Search"
													},

													lengthMenu : [
															[ 10, 25, 50, -1 ],
															[ '10 Rows',
																	'25 Rows',
																	'50 Rows',
																	'Show all' ],

													],

													"aoColumns" : [ null, null,
															null,

															null, null, null,
															null, null,

															null, null, null,
															null

													]

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
			$(document)
					.ready(
							function() {
								$('#example1')
										.DataTable(
												{
													//	"pagingType": "full_numbers",

													dom : 'Blfrtip',
													"bLengthChange" : false,
													buttons : [

															{
																extend : 'collection',

																text : 'Export',
																buttons : [
																		{
																			extend : 'excel',
																			title : 'Available Vehicle Report'
																					+ $(
																							"#data")
																							.val()
																					+ '-'
																					+ $(
																							"#data1")
																							.val(),

																		},
																		{
																			extend : 'pdf',
																			orientation : 'landscape',
																			pageSize : 'LEGAL',
																			title : 'Available Vehicle Report'
																					+ $(
																							"#data")
																							.val()
																					+ '-'
																					+ $(
																							"#data1")
																							.val(),

																		},
																		{
																			extend : 'csv',
																			title : 'Available Vehicle Report'
																					+ $(
																							"#data")
																							.val()
																					+ '-'
																					+ $(
																							"#data1")
																							.val(),

																		},
																		{
																			extend : 'print',
																			title : 'Available Vehicle Report'
																					+ $(
																							"#data")
																							.val()
																					+ '-'
																					+ $(
																							"#data1")
																							.val(),

																		},
																		{
																			extend : 'copy',
																			title : 'Available Vehicle Report'
																					+ $(
																							"#data")
																							.val()
																					+ '-'
																					+ $(
																							"#data1")
																							.val(),

																		},

																/* 'copy', 'csv', 'excel', 'pdf', 'print' */

																]
															},

															'colvis',
															'pageLength' ],

													"oLanguage" : {
														"sSearch" : "Search"
													},

													lengthMenu : [
															[ 10, 25, 50, -1 ],
															[ '10 Rows',
																	'25 Rows',
																	'50 Rows',
																	'Show all' ],

													],

													"aoColumns" : [
															null,
															null,
															null,

															null,
															{
																"sType" : "date-uk"
															},
															null,
															{
																"sType" : "date-uk"
															},
															{
																"sType" : "date-uk"
															},

															null,
															{
																"sType" : "date-uk"
															}, null, null,
															null, null

													]

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
			$(document)
					.ready(
							function() {
								$('#example2')
										.DataTable(
												{
													//	"pagingType": "full_numbers",

													dom : 'Blfrtip',
													"bLengthChange" : false,
													buttons : [

															{
																extend : 'collection',

																text : 'Export',
																buttons : [
																		{
																			extend : 'excel',
																			title : 'Vehicle Not Attended Report'
																					+ $(
																							"#data")
																							.val()
																					+ '-'
																					+ $(
																							"#data1")
																							.val(),

																		},
																		{
																			extend : 'pdf',
																			orientation : 'landscape',
																			pageSize : 'LEGAL',
																			title : 'Vehicle Not Attended Report'
																					+ $(
																							"#data")
																							.val()
																					+ '-'
																					+ $(
																							"#data1")
																							.val(),

																		},
																		{
																			extend : 'csv',
																			title : 'Vehicle Not Attended Report'
																					+ $(
																							"#data")
																							.val()
																					+ '-'
																					+ $(
																							"#data1")
																							.val(),

																		},
																		{
																			extend : 'print',
																			title : 'Vehicle Not Attended Report'
																					+ $(
																							"#data")
																							.val()
																					+ '-'
																					+ $(
																							"#data1")
																							.val(),

																		},
																		{
																			extend : 'copy',
																			title : 'Vehicle Not Attended Report'
																					+ $(
																							"#data")
																							.val()
																					+ '-'
																					+ $(
																							"#data1")
																							.val(),

																		},

																/* 'copy', 'csv', 'excel', 'pdf', 'print' */

																]
															},

															'colvis',
															'pageLength' ],

													"oLanguage" : {
														"sSearch" : "Search"
													},

													lengthMenu : [
															[ 10, 25, 50, -1 ],
															[ '10 Rows',
																	'25 Rows',
																	'50 Rows',
																	'Show all' ],

													],

													"aoColumns" : [
															null,
															null,
															null,

															null,
															{
																"sType" : "date-uk"
															},
															null,
															{
																"sType" : "date-uk"
															},
															{
																"sType" : "date-uk"
															},

															null,
															{
																"sType" : "date-uk"
															}, null, null,
															null, null

													]

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
			$(document)
					.ready(
							function() {
								$('#example3')
										.DataTable(
												{
													//	"pagingType": "full_numbers",

													dom : 'Blfrtip',
													"bLengthChange" : false,
													buttons : [

															{
																extend : 'collection',

																text : 'Export',
																buttons : [
																		{
																			extend : 'excel',
																			title : 'Action By Technician Report'
																					+ $(
																							"#data")
																							.val()
																					+ '-'
																					+ $(
																							"#data1")
																							.val(),

																		},
																		{
																			extend : 'pdf',
																			orientation : 'landscape',
																			pageSize : 'LEGAL',
																			title : 'Action By Technician Report'
																					+ $(
																							"#data")
																							.val()
																					+ '-'
																					+ $(
																							"#data1")
																							.val(),

																		},
																		{
																			extend : 'csv',
																			title : 'Action By Technician Report'
																					+ $(
																							"#data")
																							.val()
																					+ '-'
																					+ $(
																							"#data1")
																							.val(),

																		},
																		{
																			extend : 'print',
																			title : 'Action By Technician Report'
																					+ $(
																							"#data")
																							.val()
																					+ '-'
																					+ $(
																							"#data1")
																							.val(),

																		},
																		{
																			extend : 'copy',
																			title : 'Action By Technician Report'
																					+ $(
																							"#data")
																							.val()
																					+ '-'
																					+ $(
																							"#data1")
																							.val(),

																		},

																/* 'copy', 'csv', 'excel', 'pdf', 'print' */

																]
															},

															'colvis',
															'pageLength' ],

													"oLanguage" : {
														"sSearch" : "Search"
													},

													lengthMenu : [
															[ 10, 25, 50, -1 ],
															[ '10 Rows',
																	'25 Rows',
																	'50 Rows',
																	'Show all' ],

													],

													"aoColumns" : [ null, null,
															null, null, null,
															null, null, null,
															null, null, null,
															null, null, null

													]

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
			$(document)
					.ready(
							function() {
								$('#example4')
										.DataTable(
												{
													//	"pagingType": "full_numbers",

													dom : 'Blfrtip',
													"bLengthChange" : false,
													buttons : [

															{
																extend : 'collection',

																text : 'Export',
																buttons : [
																		{
																			extend : 'excel',
																			title : 'Vehicles Report'
																					+ $(
																							"#data")
																							.val()
																					+ '-'
																					+ $(
																							"#data1")
																							.val(),

																		},
																		{
																			extend : 'pdf',
																			orientation : 'landscape',
																			pageSize : 'LEGAL',
																			title : 'Vehicles Report'
																					+ $(
																							"#data")
																							.val()
																					+ '-'
																					+ $(
																							"#data1")
																							.val(),

																		},
																		{
																			extend : 'csv',
																			title : 'Vehicles Report'
																					+ $(
																							"#data")
																							.val()
																					+ '-'
																					+ $(
																							"#data1")
																							.val(),

																		},
																		{
																			extend : 'print',
																			title : 'Vehicles Report'
																					+ $(
																							"#data")
																							.val()
																					+ '-'
																					+ $(
																							"#data1")
																							.val(),

																		},
																		{
																			extend : 'copy',
																			title : 'Vehicles Report'
																					+ $(
																							"#data")
																							.val()
																					+ '-'
																					+ $(
																							"#data1")
																							.val(),

																		},

																/* 'copy', 'csv', 'excel', 'pdf', 'print' */

																]
															},

															'colvis',
															'pageLength' ],

													"oLanguage" : {
														"sSearch" : "Search"
													},

													lengthMenu : [
															[ 10, 25, 50, -1 ],
															[ '10 Rows',
																	'25 Rows',
																	'50 Rows',
																	'Show all' ],

													],

													"aoColumns" : [ null, null,
															null,

															null, null, null,
															null, null,

															null, null, null,
															null, null, null

													]

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
				var objFromDate1 = "" + fdate[2] + "-" + chkf + "-" + fdate[0]
						+ "";
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
				var objToDate1 = "" + tdate[2] + "-" + chkt + "-" + tdate[0]
						+ "";
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


<%@ include file="MenuNew.jsp"%>





		<!--- code start here ------>
		<%
			/* java.util.Date defoultdate = new java.util.Date();
			Format formatter = new SimpleDateFormat("yyyy-MM-dd");
			today = formatter.format(defoultdate);
			//out.println(today);
			long miliseconds = defoultdate.getTime();
			miliseconds = miliseconds + 7000 * 60 * 60 * 24;
			defoultdate.setTime(miliseconds);
			olddate = formatter.format(defoultdate); */
			username = session.getAttribute("username").toString();
			userrole = session.getAttribute("userrole").toString();
			//out.println(olddate);

			try {
				Class.forName(MM_dbConn_DRIVER);
				conn = DriverManager.getConnection(MM_dbConn_STRING, MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
				conn1 = DriverManager.getConnection(MM_dbConn_STRING1, MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
				st = conn.createStatement();
				st1 = conn.createStatement();
				st2 = conn1.createStatement();
				st3 = conn1.createStatement();
				sttrans = conn1.createStatement();
				st5 = conn1.createStatement();
				
				String thename = request.getParameter("radio1");
				
				
				
				if (null == thename) {
					thename = "available";
				}
				int i = 1;
		%>

		<%
					String datex1, datex2, data1, data2;
						String departmentNew = "";
						String ddx = request.getQueryString();

						if (ddx == null) {

							System.out.println(" In First If  ");

							datex1 = datex2 = new SimpleDateFormat("dd-MMM-yyyy").format(new java.util.Date());

							data1 = data2 = new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());

							Calendar c = Calendar.getInstance(); // this takes current date
							c.set(Calendar.DAY_OF_MONTH, 1);
							System.out.println(" current date " + new SimpleDateFormat("dd-MMM-yyyy").format(c.getTime()));
							
							datex1 = new SimpleDateFormat("dd-MMM-yyyy").format(c.getTime());

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

								Calendar c = Calendar.getInstance(); // this takes current date
								c.set(Calendar.DAY_OF_MONTH, 1);
								System.out.println(" current date " + new SimpleDateFormat("dd-MMM-yyyy").format(c.getTime()));
								datex1 = new SimpleDateFormat("dd-MMM-yyyy").format(c.getTime());
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

							
								<td style="padding-right: 25px";><input type="radio"
									name="radio1" value="available"
									<%if (thename.equals("available")) {
					out.print("CHECKED");
				}%>
									onclick="" />Available Vehicle <input type="radio"
									name="radio1" value="notattend"
									<%if (thename.equals("notattend")) {
					out.print("CHECKED");
				}%>
									onclick="" />Vehicle Not Attended <input type="radio"
									name="radio1" value="reallocated"
									<%if (thename.equals("reallocated")) {
					out.print("CHECKED");
				}%>
									onclick="" />Re-Allocated Vehicle <input type="radio"
									name="radio1" value="action"
									<%if (thename.equals("action")) {
					out.print("CHECKED");
				}%>
									onclick="" />Action By Technician</td> &nbsp;&nbsp;&nbsp;&nbsp;


								<form name="form1" id="form1" action="" method="post">
								<td style="padding-left: 50px;"><font face="Arial" color="black" size="2">From </font>&nbsp;&nbsp;
									<input type="text" id="data" height="10px" name="data"
									value="<%=datex1%>" size="13px" readonly
									class="element text medium"
									style="width: 75px; font-size: 12px; height: 23px;" /> <script
										type="text/javascript">
												Calendar.setup({
													inputField : "data", // ID of the input field
													ifFormat : "%d-%b-%Y", // the date format
													button : "data" // ID of the button
												});
											</script></td>



								<td  style="padding-left: 50px;"><font face="Arial" color="black" size="2">To</font>&nbsp;&nbsp;
									<input type="text" id="data1" name="data1" value="<%=datex2%>"
									size="13px" readonly class="element text medium"
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

						String dt = new SimpleDateFormat("yyyy-MM-dd")
								.format(new SimpleDateFormat("dd-MMM-yyyy").parse(datex1));

						String dt1 = new SimpleDateFormat("yyyy-MM-dd")
								.format(new SimpleDateFormat("dd-MMM-yyyy").parse(datex2));

						System.out.println(" dt :-  " + dt + " dt1 :-  " + dt1);
						%>




								<td style="padding-left: 65px;" align="center"><input
									type="submit" name="button" id="button" value="Submit"
									class="formElement" onclick="chk()"
									style="width: 70px; height: 29px"></td>


							</tr>
							</table>


							<br> <%
 	if (!(null == thename)) {
 			if (thename.equals("reallocated")) {
 %>





								<table id="example" class="display" style="width: 100%">
									<thead>
										<tr>
											<th>Sr.No</th>
											<th align="center">Transporter</th>
											<th align="center">Vehicle Reg. No</th>
											<th align="center">Reason</th>
											<th align="center">New Available Date</th>
											<th align="center">New Location</th>
											<th align="center">New Technician</th>
											<th align="center">Allocation Date/Time</th>
											<th align="center">OldAvailable Date</th>
											<th align="center">Old Location</th>
											<th align="center">OldTechnician</th>
											<th align="center">Allocated By</th>
										</tr>
									</thead>
									<tbody>



										<%
												sqltrans = "select * from t_reallocated where AlocationDateTime >='" + dt
																	+ "' and AlocationDateTime <='" + dt1 + "' order by NewAvailableDate Desc ";
															ResultSet rsttrans = st.executeQuery(sqltrans);
															while (rsttrans.next()) {
											%>
										<tr>
											<td align="right"><%=i%></td>
											<td align="right"><%=rsttrans.getString("Transporter")%></td>
											<td align="center"><%=rsttrans.getString("VehRegNo")%></td>
											<td align="left"><%=rsttrans.getString("Reason")%></td>
											<%
													try {
												%>
											<td align="center"><font color="red"><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd")
										.parse(rsttrans.getString("NewAvailableDate")))%></font></td>
											<%
													} catch (Exception e) {
																		out.println("-");
																	}
												%>
											<td align="left"><font color="red"><%=rsttrans.getString("NewLocation")%></font></td>
											<td align="left"><font color="red"><%=rsttrans.getString("NewTechnician")%></font></td>
											<%
													try {
												%>
											<td align="center"><%=rsttrans.getString("AlocationDateTime")%></td>
											<%
													} catch (Exception e) {
																		out.println("-");
																	}
																	try {
												%>
											<td align="center"><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd")
										.parse(rsttrans.getString("OldAvailableDate")))%></td>
											<%
													} catch (Exception e) {
																		out.println("-");
																	}
												%>
											<td align="left"><%=rsttrans.getString("OldLocation")%></td>
											<td align="left"><%=rsttrans.getString("OldTechnician")%></td>
											<td align="left"><%=rsttrans.getString("AllocatedBy")%></td>



											<%
													i++;
																}
												%>
										</tr>
										<tfoot>
											<tr>
												<th>Sr.No</th>
												<th align="center">Transporter</th>
												<th align="center">Vehicle Reg. No</th>
												<th align="center">Reason</th>
												<th align="center">New Available Date</th>
												<th align="center">New Location</th>
												<th align="center">New Technician</th>
												<th align="center">Allocation Date/Time</th>
												<th align="center">OldAvailable Date</th>
												<th align="center">Old Location</th>
												<th align="center">OldTechnician</th>
												<th align="center">Allocated By</th>
											</tr>
										</tfoot>
								</table> <%
 	}

 			else if (thename.equals("available")) {
 %>



								<table id="example1" class="display" style="width: 100%">
									<thead>
										<tr>
											<th>Sr.No</th>
											<th align="center">Transporter</th>
											<th align="center">Vehicle Reg. No</th>
											<th align="center">Unit ID</th>
											<th align="center">Updated</th>
											<th align="center">Location</th>
											<th align="center">Date Of Allocation</th>
											<th align="center">Date Of Complaint</th>
											<th align="center">Complaint Description</th>
											<th align="center">Available Date</th>
											<th align="center">Available Location</th>
											<th align="center">Allocated To Technician</th>
											<th align="center">Status</th>
											<th align="center">Entered By</th>

										</tr>
									</thead>





									<%
											sqltrans = "select Distinct * from t_complaints1 where VehAvaildate >='" + dt
																+ "' and VehAvaildate <='" + dt1 + "' order by VehAvaildate Desc ";
														ResultSet rsttrans = st.executeQuery(sqltrans);
														//out.println(sqltrans);
														while (rsttrans.next()) {
															sql = "select * from t_callocation1 where Tno='" + rsttrans.getString("Tno") + "' ";
															ResultSet rst = st1.executeQuery(sql);
															if (rst.next()) {

																sql1 = "select * from t_onlinedata where VehicleRegNo='"
																		+ rsttrans.getString("VehicleNo") + "'";
																ResultSet rst2 = st2.executeQuery(sql1);
																if (rst2.next()) {
										%>
									<tr>
										<td align="right"><%=i%></td>
										<td align="left"><%=rsttrans.getString("Customer")%></td>
										<td align="center"><%=rsttrans.getString("VehicleNo")%></td>
										<td align="right"><%=rsttrans.getString("UnitNo")%></td>
										<td align="center"><%=new SimpleDateFormat("dd/MM/yyyy").format(rst2.getDate("TheDate"))%>
											<br><%=rst2.getString("TheTime")%></br></td>
										<td><font color="red"><%=rst2.getString("Location")%></font></td>
										<%
												try {
											%>

										<td align="center"><%=new SimpleDateFormat("dd/MM/yyyy").format(rsttrans.getDate("TdyDate"))%></td>
										<%
												} catch (Exception e) {
																			out.println("-");
																		}
																		try {
											%>

										<td align="center"><%=new SimpleDateFormat("dd/MM/yyyy").format(rsttrans.getDate("CDate"))%></td>
										<%
												} catch (Exception e) {
																			out.println("-");
																		}
											%>
										<td align="left"><%=rsttrans.getString("Complaint")%></td>

										<td align="center" style="color: red"><%=new SimpleDateFormat("dd/MM/yyyy")
											.format(rsttrans.getDate("VehAvaildate"))%></td>
										<td align="left"><%=rsttrans.getString("VehAttLoc")%></td>
										<td align="left" style="color: red";><%=rst.getString("Technicion")%></td>
										<td align="left"><%=rst.getString("Status")%></td>
										<td align="left"><%=rsttrans.getString("RegBy")%></td>




										<%
												i++;
																	}
																}
															}
											%>
									</tr>
									<tfoot>
										<tr>
											<th>Sr.No</th>
											<th align="center">Transporter</th>
											<th align="center">Vehicle Reg. No</th>
											<th align="center">Unit ID</th>
											<th align="center">Updated</th>
											<th align="center">Location</th>
											<th align="center">Date Of Allocation</th>
											<th align="center">Date Of Complaint</th>
											<th align="center">Complaint Description</th>
											<th align="center">Available Date</th>
											<th align="center">Available Location</th>
											<th align="center">Allocated To Technician</th>
											<th align="center">Status</th>
											<th align="center">Entered By</th>

										</tr>
									</tfoot>
								</table> <%
 	} else if (thename.equals("notattend"))

 			{
 %>



								<table id="example2" class="display" style="width: 100%">
									<thead>
										<tr>
											<th>Sr.No</th>
											<th align="center">Transporter</th>
											<th align="center">Vehicle Reg. No</th>
											<th align="center">Unit ID</th>
											<th align="center">Updated</th>
											<th align="center">Location</th>
											<th align="center">Date Of Allocation</th>
											<th align="center">Date Of Complaint</th>
											<th align="center">Complaint Description</th>
											<th align="center">Available Date</th>
											<th align="center">Available Location</th>
											<th align="center">Allocated To Technician</th>
											<th align="center">Status</th>
											<th align="center">Entered By</th>

										</tr>
									</thead>


									<%
											sqltrans = "select * from t_complaints1 where VehAvaildate >='" + dt + "' and VehAvaildate <='"
																+ dt1 + "' and Result='UnSolved' order by VehAvaildate Desc ";
														//out.println(sqltrans);
														ResultSet rsttrans = st.executeQuery(sqltrans);
														while (rsttrans.next()) {
															sql = "select * from t_callocation1 where Tno='" + rsttrans.getString("Tno")
																	+ "' and status='UnSolved'";
															ResultSet rst = st1.executeQuery(sql);
															if (rst.next()) {

																sql1 = "select * from t_onlinedata where VehicleRegNo='"
																		+ rsttrans.getString("VehicleNo") + "'";
																ResultSet rst2 = st2.executeQuery(sql1);
																if (rst2.next()) {
										%>
									<tr>
										<td align="right"><%=i%></td>
										<td align="left"><%=rsttrans.getString("Customer")%></td>
										<td align="center"><%=rsttrans.getString("VehicleNo")%></td>
										<td align="right"><%=rsttrans.getString("UnitNo")%></td>


										<td align="center"><%=new SimpleDateFormat("dd/MM/yyyy").format(rst2.getDate("TheDate"))%>
											<br><%=rst2.getString("TheTime")%></br></td>



										<td align="left"><font color="red"><%=rst2.getString("Location")%></font></td>
										<%
												try {
											%>

										<td align="center"><%=new SimpleDateFormat("dd/MM/yyyy").format(rsttrans.getDate("TdyDate"))%></td>
										<%
												} catch (Exception e) {
																			out.println("-");
																		}
																		try {
											%>

										<td align="center"><%=new SimpleDateFormat("dd/MM/yyyy").format(rsttrans.getDate("CDate"))%></td>
										<%
												} catch (Exception e) {
																			out.println("-");
																		}
											%>
										<td align="left"><%=rsttrans.getString("Complaint")%></td>

										<td align="center" style="color: red"><%=new SimpleDateFormat("dd/MM/yyyy")
											.format(rsttrans.getDate("VehAvaildate"))%></td>

										<td align="left"><%=rsttrans.getString("VehAttLoc")%></td>
										<td align="left"><font color="red"><%=rst.getString("Technicion")%></font></td>
										<td align="left"><%=rst.getString("Status")%></td>
										<td align="left"><%=rsttrans.getString("RegBy")%></td>




										<%
												i++;
																	}
																}
															}
											%>
									</tr>
									<tfoot>
										<tr>
											<th>Sr.No</th>
											<th align="center">Transporter</th>
											<th align="center">Vehicle Reg. No</th>
											<th align="center">Unit ID</th>
											<th align="center">Updated</th>
											<th align="center">Location</th>
											<th align="center">Date Of Allocation</th>
											<th align="center">Date Of Complaint</th>
											<th align="center">Complaint Description</th>
											<th align="center">Available Date</th>
											<th align="center">Available Location</th>
											<th align="center">Allocated To Technician</th>
											<th align="center">Status</th>
											<th align="center">Entered By</th>
										</tr>
									</tfoot>
								</table> <%
 	}

 			else if (thename.equals("action"))

 			{
 %>



								<table id="example3" class="display" style="width: 100%">
									<thead>
										<tr>
											<th>Sr.No</th>
											<th align="center">Transporter</th>
											<th align="center">Vehicle Reg. No</th>
											<th align="center">Unit ID</th>
											<th align="center">Updated</th>
											<th align="center">Location</th>
											<th align="center">Date Of Allocation</th>

											<th align="center">Complaint Description</th>
											<th align="center">Available Date</th>
											<th align="center">Available Location</th>
											<th align="center">Allocated To Technician</th>
											<th align="center">Status</th>
											<th align="center">Solved Date</th>
											<th align="center">Entered By</th>

										</tr>
									</thead>










									<%
											sqltrans = "select * from t_complaints1 where PSolDate >='" + dt + "' and PSolDate <='" + dt1
																+ "' and status='Solved' order by PSolDate Desc ";
														ResultSet rsttrans = st.executeQuery(sqltrans);
														while (rsttrans.next()) {
															sql = "select * from t_callocation1 where Tno='" + rsttrans.getString("Tno") + "' ";
															ResultSet rst = st1.executeQuery(sql);
															if (rst.next()) {

																sql1 = "select * from t_onlinedata where VehicleRegNo='"
																		+ rsttrans.getString("VehicleNo") + "'";
																ResultSet rst2 = st2.executeQuery(sql1);
																if (rst2.next()) {
										%>
									<tr>
										<td align="right"><%=i%></td>
										<td align="left"><%=rsttrans.getString("Customer")%></td>
										<td align="center"><%=rsttrans.getString("VehicleNo")%></td>
										<td align="right"><%=rsttrans.getString("UnitNo")%></td>
										<td align="center"><font color="red"><%=rst2.getString("TheDate")%>
											<br><%=rst2.getString("TheTime")%></br></font></td>



										<td align="left"><font color="red"><%=rst2.getString("Location")%></font></td>
										<%
												try {
											%>

										<%-- 					<td align="center"><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rsttrans.getString("TdyDate"))) %></td>
 --%>
										<td align="center"><%=new SimpleDateFormat("dd/MM/yyyy").format(rsttrans.getDate("TdyDate"))%></td>
										<%
												} catch (Exception e) {
																			out.println("-");
																		}
											%>
										<td align="center"><%=rsttrans.getString("Complaint")%></td>
										<%
												try {
											%>
										<%-- 					<td align="center"><font color="red"><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rsttrans.getString("VehAvaildate"))) %></font></td>
 --%>

										<td align="center" style="color: red"><%=new SimpleDateFormat("dd/MM/yyyy")
												.format(rsttrans.getDate("VehAvaildate"))%></td>

										<%
												} catch (Exception e) {
																			out.println("-");
																		}
											%>
										<td align="left"><%=rsttrans.getString("VehAttLoc")%></td>
										<td align="left"><%=rst.getString("Technicion")%></td>
										<td align="left"><font color="red"><%=rst.getString("ActualProb")%></font></td>
										<%
												try {
											%>



										<td align="center" style="color: red"><%=new SimpleDateFormat("dd/MM/yyyy")
												.format(rsttrans.getDate("PSolDate"))%></td>


										<%
												} catch (Exception e) {
																			out.println("-");
																		}
											%>
										<td align="left"><%=rsttrans.getString("RegBy")%></td>




										<%
												i++;
																	}
																}
															}
											%>
									</tr>
									<tfoot>
										<tr>
											<th>Sr.No</th>
											<th align="center">Transporter</th>
											<th align="center">Vehicle Reg. No</th>
											<th align="center">Unit ID</th>
											<th align="center">Updated</th>
											<th align="center">Location</th>
											<th align="center">Date Of Allocation</th>

											<th align="center">Complaint Description</th>
											<th align="center">Available Date</th>
											<th align="center">Available Location</th>
											<th align="center">Allocated To Technician</th>
											<th align="center">Status</th>
											<th align="center">Solved Date</th>
											<th align="center">Entered By</th>
										</tr>
									</tfoot>
								</table> <%
 	}
 		}

 		else {
 %>




								<table id="example4" class="display" style="width: 100%">
									<thead>
										<tr>
											<th>Sr.No</th>
											<th align="center">Transporter</th>
											<th align="center">Vehicle Reg. No</th>
											<th align="center">Unit ID</th>
											<th align="center">Updated</th>
											<th align="center">Location</th>
											<th align="center">Date Of Allocation</th>
											<th align="center">Date Of Complaint</th>
											<th align="center">Complaint Description</th>
											<th align="center">Available Date</th>
											<th align="center">Available Location</th>
											<th align="center">Allocated To Technician</th>
											<th align="center">Status</th>
											<th align="center">Entered By</th>

										</tr>
									</thead>

									<%
											sqltrans = "select Distinct * from t_complaints1 where VehAvaildate >='" + dt
															+ "' and VehAvaildate <='" + dt1 + "' group by VehicleNo order by VehAvaildate Desc ";
													ResultSet rsttrans = st.executeQuery(sqltrans);
													//out.println(sqltrans);
													while (rsttrans.next()) {
														sql = "select * from t_callocation1 where Tno='" + rsttrans.getString("Tno") + "' ";
														ResultSet rst = st1.executeQuery(sql);
														if (rst.next()) {

															sql1 = "select * from t_onlinedata where VehicleRegNo='" + rsttrans.getString("VehicleNo")
																	+ "'";
															ResultSet rst2 = st2.executeQuery(sql1);
															if (rst2.next()) {
										%>
									<tr>
										<td><%=i%></td>
										<td><%=rsttrans.getString("Customer")%></td>
										<td><%=rsttrans.getString("VehicleNo")%></td>
										<td><%=rsttrans.getString("UnitNo")%></td>
										<td><font color="red"><%=rst2.getString("TheDate")%>
											<br><%=rst2.getString("TheTime")%></br></font></td>
										<td><font color="red"><%=rst2.getString("Location")%></font></td>
										<%
												try {
											%>
										<td><%=new SimpleDateFormat("dd-MMM-yyyy").format(
											new SimpleDateFormat("yyyy-MM-dd").parse(rsttrans.getString("TdyDate")))%></td>
										<%
						} catch (Exception e) {
												out.println("-");
											}
											try {
					%>
										<td><%=new SimpleDateFormat("dd-MMM-yyyy").format(
											new SimpleDateFormat("yyyy-MM-dd").parse(rsttrans.getString("CDate")))%></td>
										<%
						} catch (Exception e) {
												out.println("-");
											}
					%>
										<td><%=rsttrans.getString("Complaint")%></td>
										<td><font color="red"><%=new SimpleDateFormat("dd-MMM-yyyy").format(
										new SimpleDateFormat("yyyy-MM-dd").parse(rsttrans.getString("VehAvaildate")))%></font></td>
										<td><%=rsttrans.getString("VehAttLoc")%></td>
										<td><font color="red"><%=rst.getString("Technicion")%></font></td>
										<td><%=rst.getString("Status")%></td>
										<td><%=rsttrans.getString("RegBy")%></td>




										<%
						i++;
										}
									}
								}
					%>
									</tr>
									<tfoot>
										<tr>
											<th>Sr.No</th>
											<th align="center">Transporter</th>
											<th align="center">Vehicle Reg. No</th>
											<th align="center">Unit ID</th>
											<th align="center">Updated</th>
											<th align="center">Location</th>
											<th align="center">Date Of Allocation</th>
											<th align="center">Date Of Complaint</th>
											<th align="center">Complaint Description</th>
											<th align="center">Available Date</th>
											<th align="center">Available Location</th>
											<th align="center">Allocated To Technician</th>
											<th align="center">Status</th>
											<th align="center">Entered By</th>
										</tr>

									</tfoot>
								</table> 
								<%
 	}
 %> <%
 	} catch (Exception e) {
 		out.print("Exception -->" + e);

 	} finally {
 		conn.close();
 		conn1.close();

 	}
 %> <%@ include file="footer.jsp"%>
</body>
</html>