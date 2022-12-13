<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java"
	import="java.sql.*" import=" java.text.*" import=" java.util.*"
	errorPage=""%>
<%@ include file="header.jsp"%>
<%!Connection conn, conn1;
	Statement st, st1, st2, st3, st33, st4, st5, st6, st7, st8, st9, st10, st11, st51, st12, st13, st14, st15;
	String sql, sql1, sql2, today, olddate, username, userrole, thename, sql3, sql33, sql4, sql5, sql6, sql7, sql8,
			sql9, sql10;
	String fromdate, todate;
	int Ocount, Icount, CAcount, CAvcount = 0, CScount, CPcount, URcount, NIcount, OCcount, ICcount, NCcount, RCAcount,
			SPcount;%>
<html>
<head>

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

<script language="javascript">
	function fun2() {
		document.form1.submit();
	}
</script>

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
			<script type="text/javascript"
				src="datatablejs/buttons.colVis.min.js"></script>




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
																				title : 'Technician Report'
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
																				title : 'Technician Report'
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
																				title : 'Technician Report'
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
																				title : 'Technician Report'
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
																				title : 'Technician Report'
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
																[ 10, 25, 50,
																		-1 ],
																[
																		'10 Rows',
																		'25 Rows',
																		'50 Rows',
																		'Show all' ],

														],

														"aoColumns" : [ null,
																null, null,
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
																				title : 'Representative Report'
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
																				title : 'Representative Report'
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
																				title : 'Representative Report'
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
																				title : 'Representative Report'
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
																				title : 'Representative Report'
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
																[ 10, 25, 50,
																		-1 ],
																[
																		'10 Rows',
																		'25 Rows',
																		'50 Rows',
																		'Show all' ],

														],

														"aoColumns" : [ null,
																null, null,
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
																				title : 'Transporter Report'
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
																				title : 'Transporter Report'
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
																				title : 'Transporter Report'
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
																				title : 'Transporter Report'
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
																				title : 'Transporter Report'
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
																[ 10, 25, 50,
																		-1 ],
																[
																		'10 Rows',
																		'25 Rows',
																		'50 Rows',
																		'Show all' ],

														],

														"aoColumns" : [ null,
																null, null,
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
					var objFromDate1 = "" + fdate[2] + "-" + chkf + "-"
							+ fdate[0] + "";
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
					var objToDate1 = "" + tdate[2] + "-" + chkt + "-"
							+ tdate[0] + "";
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
	
		</br></br>
		<%
			java.util.Date defoultdate = new java.util.Date();
			Format formatter = new SimpleDateFormat("yyyy-MM-dd");
			today = formatter.format(defoultdate);
			long miliseconds = defoultdate.getTime();
			miliseconds = miliseconds + 7000 * 60 * 60 * 24;
			defoultdate.setTime(miliseconds);
			olddate = formatter.format(defoultdate);
			username = session.getAttribute("username").toString();
			userrole = session.getAttribute("userrole").toString();
			Ocount = 0;
			Icount = 0;
			CAcount = 0;
			CAvcount = 0;
			CScount = 0;
			CPcount = 0;
			URcount = 0;
			NIcount = 0;
			OCcount = 0;
			ICcount = 0;
			NCcount = 0;
			RCAcount = 0;
			SPcount = 0;

			try {
				Class.forName(MM_dbConn_DRIVER);
				conn = DriverManager.getConnection(MM_dbConn_STRING, MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
				conn1 = DriverManager.getConnection(MM_dbConn_STRING1, MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
				st = conn.createStatement();
				st12 = conn.createStatement();
				st13 = conn.createStatement();
				st14 = conn.createStatement();
				st1 = conn.createStatement();
				st2 = conn1.createStatement();
				st3 = conn1.createStatement();
				st33 = conn1.createStatement();
				st4 = conn1.createStatement();
				st5 = conn.createStatement();
				//st6=conn.createStatement();
				//st7=conn.createStatement();
				//st8=conn.createStatement();
				st9 = conn1.createStatement();
				st10 = conn.createStatement();
				st11 = conn.createStatement();
				st15 = conn1.createStatement();
				//st51=conn.createStatement();
				//st51=conn.createStatement();

				thename = request.getParameter("radio1");

				if (null == thename) {

					thename = "Technician";
				}
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
				<td style="align: left; padding-left: 150px;">

					<form name="form1" id="form1" action="" method="post">

						<td><input type="radio" name="radio1" value="Technician"
							<%if (thename.equals("Technician")) {
					out.print("CHECKED");
				}%>
							onclick="fun2();" />Technician <input type="radio" name="radio1"
							value="Representative"
							<%if (thename.equals("Representative")) {
					out.print("CHECKED");
				}%>
							onclick="fun2();" />Representative <input type="radio"
							name="radio1" value="Transporter"
							<%if (thename.equals("Transporter")) {
					out.print("CHECKED");
				}%>
							onclick="fun2();" />Transporter</td>

						<td style="padding-left: 350px;"><font face="Arial"
							color="black" size="2">From </font>&nbsp;&nbsp; <input
							type="text" id="data" height="10px" name="data"
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
						
							




						<%-- 	<td><input type="text" id="calender" name="calender"
									size="13" class="formElement" value="<%=fromdate%>" readonly/>
									
									<input type="button" name="trigger" id="trigger"
									value="From Date" class="formElement">  --%>
						<table>


							</tr>
						</table>
						
						<br>
							<br>

						<%
							if (!(null == thename)) {

									if (thename.equals("Technician")) {
						%>

						<div align="center">
							<font color="brown" size="2">Technician Report from Date <%=datex1%>
							To <%=datex2%></font>
						</div>



						<table id="example" class="display" style="width: 100%">
							<thead>
								<tr>
									<th style="width: 6%;">Sr.No</th>
									<th style="width: 50%;" align="center">Technician Name</th>
									<th style="width: 22%;" align="center">Number of SMS Sent</th>
									<th style="width: 22%;" align="center">Vehicles attended</th>


								</tr>
							</thead>
							<tbody>

								<%
									int total_sms_send = 0;
												int total_veh_attended = 0;
												int i = 1;
												String techsql = "select distinct(TechName)as TechName,MobNo from t_techlist where Available='Yes'";

												ResultSet rs_tech = st10.executeQuery(techsql);
												while (rs_tech.next()) {
								%>
								<tr>
									<td align="right"><%=i++%></td>
									<td align="left"><%=rs_tech.getString("TechName")%></td>
									<%
										////System.out.println("techname------>" +  rs_tech.getString("TechName"));
														String sql = "select count(TechName) as count from t_ComplaintAllocationSMS WHERE Complaint_date BETWEEN '"
																+ dt + "' AND '" + dt1 + "' and TechName like '" + rs_tech.getString("TechName")
																+ "'";
														////System.out.println("sql------>" +  sql);
														ResultSet rst = st.executeQuery(sql);

														if (rst.next()) {
															String sql2 = "select Tno from t_ComplaintAllocationSMS where TechName='"
																	+ rs_tech.getString("TechName") + "' and Complaint_date BETWEEN '" + dt
																	+ "' AND '" + dt1 + "'";
															////System.out.println("sql2--->" + sql2);
															int status_count = 0;
															ResultSet rst2 = st12.executeQuery(sql2);
															while (rst2.next()) {
																int tno = rst2.getInt("Tno");
																String sql3 = "select status from t_complaints1 where Tno = " + tno
																		+ " and (status like 'Attended' or status like 'Solved')";
																////System.out.println("sql3---->" + sql3);
																ResultSet rst3 = st13.executeQuery(sql3);

																while (rst3.next()) {
																	////System.out.println("status_count--->" + status_count);
																	status_count = status_count + 1;
																}

															}
									%>
									<td align="right"><a
										href="Technician_Detail.jsp?tech_name=<%=rs_tech.getString("TechName")%>&date1=<%=dt%>&date2=<%=dt1%>"><%=rst.getString("Count")%></a></td>
									<td align="right"><a
										href="Attended_Vehicle_details_Tech.jsp?tech_name=<%=rs_tech.getString("TechName")%>&date1=<%=dt%>&date 2=<%=dt1%>"><%=status_count%></a></td>


									<%
										total_veh_attended = total_veh_attended + status_count;
															total_sms_send = total_sms_send + Integer.parseInt(rst.getString("Count"));
														} else {
									%>
									<td><%=rst.getString("Count")%></td>
									<td align="center"><%=0%></td>
								</tr>

								<%
									}

												}

												////System.out.println("total_sms_send------>" + total_sms_send);
								%>
								<tr>

									<td align="left">Total</td>
									<td>-</td>

									<td><a
										href="TotalSMSSend.jsp?Type=Technician&total_sms_send=total_sms_send&date1=<%=dt%>&date2=<%=dt1%>"><div
												align="right"><%=total_sms_send%></a></td>
									<td><a
										href="TotalSMSSend.jsp?Type=Technician&total_sms_send=total_veh_attended&date1=<%=dt%>&date2=<%=dt1%>"><div
												align="right"><%=total_veh_attended%></a></td>

								</tr>
							</tbody>
							<tfoot>
								<tr>
									<th style="width: 6%;">Sr.No</th>
									<th style="width: 50%;" align="center">Technician Name</th>
									<th style="width: 22%;" align="center">Number of SMS Sent</th>
									<th style="width: 22%;" align="center">Vehicles attended</th>


								</tr>
							</tfoot>
						</table>





						<%
							}
						%>

						<%
							if (thename.equals("Representative")) {
						%>

						<div align="center">
							<font color="brown" size="2">Representative Report from
							Date <%=datex1%> To <%=datex2%></font>
						</div>



						<table id="example1" class="display" style="width: 100%">
							<thead>
								<tr>
									<th style="width: 6%;">Sr.No</th>
									<th style="width: 50%;" align="center">Representative Name</th>
									<th style="width: 22%;" align="center">Number of SMS Sent</th>
									<th style="width: 22%;" align="center">Vehicles attended</th>


								</tr>
							</thead>
							<tbody>

								<%
									int j = 1;
												int total_sms_send = 0;
												int total_veh_attended = 0;
												String techsql = "select Distinct(Name) as name from t_admin where URole='service'";
												ResultSet rs_tech = st14.executeQuery(techsql);
												String tech;
												while (rs_tech.next()) {
													System.out.println("JJJJJ" + j);
								%>
								<tr>
									<td align="right"><%=j%></td>
									<td align="left"><%=rs_tech.getString("Name")%></td>
									<%
										sql = "SELECT AllotedBy AS Representative, count( AllotedBy ) AS count FROM `t_ComplaintAllocationSMS` WHERE Complaint_date BETWEEN '"
																+ dt + "' AND '" + dt1 + "' and Trim(AllotedBy) like Trim('"
																+ rs_tech.getString("Name") + "')";
														//		//System.out.println("sql---->" + sql);
														ResultSet rst7 = st.executeQuery(sql);
														if (rst7.next()) {
															if (rst7.getString("Representative") != null) {
																int status_count = 0;

																String sql2 = "select Distinct(Tno) from t_ComplaintAllocationSMS where Complaint_date BETWEEN '"
																		+ dt + "' AND '" + dt1 + "' and AllotedBy='"
																		+ rst7.getString("Representative") + "'";
																//		//System.out.println("sql2--->" + sql2);

																ResultSet rst2 = st12.executeQuery(sql2);
																while (rst2.next()) {
																	int tno = rst2.getInt("Tno");
																	String sql3 = "select status from t_complaints1 where Tno = " + tno
																			+ " and (status like 'Attended' or status like 'Solved')";
																	//		//System.out.println("sql3-->" + sql3);
																	ResultSet rst3 = st13.executeQuery(sql3);

																	while (rst3.next()) {
																		status_count = status_count + 1;
																	}
																}
									%>
									<td align="right"><a
										href="Representative_Detail.jsp?representative=<%=rst7.getString("Representative")%>&date1=<%=dt%>&date2=<%=dt1%>"><%=rst7.getString("count")%></a></td>
									<td align="right"><a
										href="Attended_Vehicle_details_Repre.jsp?representative=<%=rst7.getString("Representative")%>&date1=<%=dt%>&date2=<%=dt1%>"><%=status_count%></a></td>

									<%
										total_veh_attended = total_veh_attended + status_count;
																total_sms_send = total_sms_send + Integer.parseInt(rst7.getString("Count"));
															} else {
																//	//System.out.println("i am in else");
									%>
									<td align="right"><%=rst7.getString("Count")%></td>
									<td align="right"><%=0%></td>


									<%
										}
														}
														j++;
													}
									%>
								</tr>
							</tbody>
							<tbody>
								<tr>
									<td align="left">Total</td>
									<td>-</td>

									<td><a
										href="TotalSMSSend.jsp?Type=Representative&total_sms_send=total_sms_send&date1=<%=dt%>&date2=<%=dt1%>"><div
												align="right">

												<%=total_sms_send%></a></td>
									<td><a
										href="TotalSMSSend.jsp?Type=Representative&total_sms_send=total_veh_attended&date1=<%=dt%>&date2=<%=dt1%>"><div
												align="right"><%=total_veh_attended%></a></td>
								</tr>
							</tbody>
							<tfoot>
								<tr>
									<th style="width: 6%;">Sr.No</th>
									<th style="width: 50%;" align="center">Representative Name</th>
									<th style="width: 22%;" align="center">Number of SMS Sent</th>
									<th style="width: 22%;" align="center">Vehicles attended</th>


								</tr>
							</tfoot>
						</table>

						<%
							}
						%>

						<%
							if (thename.equals("Transporter")) {
						%>

						<div align="center">
							<font color="brown" size="2">Transporter Report from Date
							<%=datex1%> To <%=datex2%></font>
						</div>



						<table id="example2" class="display" style="width: 100%">
							<thead>
								<tr>
									<th style="width: 6%;">Sr.No</th>
									<th style="width: 50%;" align="center">Transporter Name</th>
									<th style="width: 22%;" align="center">Number of SMS Sent</th>
									<th style="width: 22%;" align="center">Vehicles attended</th>


								</tr>
							</thead>

							<tbody>




								<%
									int k = 1;
												int total_sms_send = 0;
												int total_veh_attended = 0;
												String techsql = "SELECT DISTINCT (Ownername) as Ownername FROM db_gps.t_vehicledetails WHERE Ownername NOT LIKE '% del' order by Ownername";
												ResultSet rs_tech = st15.executeQuery(techsql);
												while (rs_tech.next()) {

													sql = "SELECT Transporter, count(Transporter) AS count FROM `t_ComplaintAllocationSMS` WHERE Complaint_date BETWEEN '"
															+ dt + "' AND '" + dt1 + "' and Transporter like '" + rs_tech.getString("Ownername")
															+ "'";
													////System.out.println("sql--->" + sql);
													ResultSet rst7 = st.executeQuery(sql);

													while (rst7.next()) {
								%>
								<tr>
									<td align="right"><%=k%></td>
									<td align="left"><%=rs_tech.getString("Ownername")%></td>

									<%
										String sql2 = "select Tno from t_ComplaintAllocationSMS where Complaint_date BETWEEN '"
																	+ dt + "' AND '" + dt1 + "' and  Transporter='" + rs_tech.getString("Ownername")
																	+ "'";
															////System.out.println("sql2--->" + sql2);
															int status_count = 0;
															ResultSet rst2 = st12.executeQuery(sql2);
															while (rst2.next()) {
																int tno = rst2.getInt("Tno");
																////System.out.println("tno---->" + tno);

																String sql3 = "select status from t_complaints1 where Tno = " + tno
																		+ " and (status like 'Attended' or status like 'Solved')";

																////System.out.println("sql3--->" +  sql3);
																ResultSet rst3 = st13.executeQuery(sql3);

																while (rst3.next()) {
																	status_count = status_count + 1;
																}
																////System.out.println("status_count--->" + status_count);

															}
									%>
									<td align="right"><a
										href="Transporter_Detail.jsp?transporter=<%=rst7.getString("Transporter")%>&date1=<%=dt%>&date2=<%=dt1%>"><%=rst7.getString("count")%></a></td>
									<td align="right"><a
										href="Attended_Vehicles_details_Tran.jsp?transporter=<%=rst7.getString("Transporter")%>&date1=<%=dt%>&date2=<%=dt1%>"><%=status_count%></a></td>

									<%
										total_veh_attended = total_veh_attended + status_count;
															total_sms_send = total_sms_send + Integer.parseInt(rst7.getString("Count"));

															k++;
														}
													}
									%>
								</tr>
							</tbody>
							<tbody>
								<tr>

									<td align="left">Total</td>
									<td>-</td>
									<td><a
										href="TotalSMSSend.jsp?Type=Transporter&total_sms_send=total_sms_send&date1=<%=dt%>&date2=<%=dt1%>"><div
												align="right"><%=total_sms_send%></a></td>


									<td align="right"><a
										href="TotalSMSSend.jsp?Type=Transporter&total_sms_send=total_veh_attended&date1=<%=dt%>&date2=<%=dt1%>"><div
												align="right"><%=total_veh_attended%></a></td>


								</tr>

							</tbody>
							<tfoot>
								<tr>
									<th style="width: 6%;">Sr.No</th>
									<th style="width: 50%;" align="center">Transporter Name</th>
									<th style="width: 22%;" align="center">Number of SMS Sent</th>
									<th style="width: 22%;" align="center">Vehicles attended</th>


								</tr>
							</tfoot>

						</table>
						<%
							}
						%>
						
						<%
							}

							} catch (Exception e) {
								System.out.println("Exception e " + e);
							}
						%>

						<%@ include file="footer.jsp"%>
</body>
</html>





