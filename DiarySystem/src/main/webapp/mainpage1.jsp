<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 4.01 Strict//EN""http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@page import="com.transworld.diary.framework.UnitData"
	import="com.transworld.diary.framework.ConsolidatedUnitDataProvider"
	import="com.transworld.diary.framework.ConsolidatedUnitData"
	import="com.transworld.diary.framework.UnitDetailsDao"%>
<%@ include file="header.jsp"%>

<jsp:useBean id="unitDetailsDao"
	type="com.transworld.diary.framework.UnitDetailsDao"
	scope="application"></jsp:useBean>

<jsp:useBean id="consolidatedUnitDataProvider"
	type="com.transworld.diary.framework.ConsolidatedUnitDataProvider"
	scope="application"></jsp:useBean>


<html>

<head>
	
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	
	<link rel="stylesheet" href="style.css" type="text/css" charset="utf-8" />
	<link rel="stylesheet" href="css/css.css" type="text/css"
		charset="utf-8" />
	<script src="sorttable.js" type="text/javascript"></script>
	
	
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
	
	
	
	
	<style></style>
	
	
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
																		title : 'MainPage '
																				/* + $(
																						"#data")
																						.val()
																				+ '-'
																				+ $(
																						"#data1")
																						.val(), */
																	},
																	{
																		extend : 'pdf',
																		orientation : 'landscape',
																		pageSize : 'LEGAL',
																		title : 'MainPage '
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
																		title : 'MainPage '
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
																		title : 'MainPage '
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
																		title : 'MainPage '
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
	
														'colvis', 'pageLength' ],
	
												"oLanguage" : {
													"sSearch" : "Search"
												},
	
												lengthMenu : [
														[ 10, 25, 50, -1 ],
														[ '10 Rows', '25 Rows',
																'50 Rows',
																'Show all' ],
	
												],
	
												"aoColumns" : [ null, null, null, null, null, null, null,
														null, null,null,null,null,null,null,null,null,null,null,null
	
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
	
	
	<style type="text/css">
	
		.exTable{
		
			margin-left: 399px;
			
			
		}
	
	</style>
	
	
	
	
	
	<title>Seven Day Diary System.</title>
	
	<script type="text/javascript">
	
		function toggleDetails(id, show) {
			var popup = document.getElementById("popup" + id);
			if (show) {
				popup.style.visibility = "visible";
				popup.setfocus();
	
			} else {
				popup.style.visibility = "hidden";
			}
		}
	
		function toggleDetails1(id, show) {
			var popupx = document.getElementById("popupx" + id);
			if (show) {
				popupx.style.visibility = "visible";
				popupx.setfocus();
	
			} else {
				popupx.style.visibility = "hidden";
			}
		}
	</script>
	
	<style>
	/* .ScrollStyle
	{
	    max-height: 500px;
	    overflow-y: scroll;
	     width: 800px;
	    overflow-x: scroll;
	}
	
	table.mytable {
		font: 13px arial, sans-serif;
		border-collapse: collapse;
		border: 1px solid #839E99;
		background: #f8fcff;
	}
	
	.popup {
		background-color: #98AFC7;
		position: absolute;
		visibility: hidden;
	}
	
	.popupx {
		background-color: #98AFC7;
		position: absolute;
		visibility: hidden;
	}
	
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
	 */
	
	</style>

</head>
<%@ include file="MenuNew.jsp" %>
<br></br>
<br></br>

<body>
	<!-- <div id="outer">
		<div id="wrapper">
			<div id="body-bot">
				<div id="body-top"> -->
					<!-- <div id="logo">
						<h1>
							<img src="images/Transworld.gif">
						</h1>
						<p>We care about your Vehicles</p>
					</div> -->
					<p></p>

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
					<%-- <%@ include file="header1.jsp"%> --%>

					<%
						}
					%>

				</div>
				<div id="gbox1">
					<div id="gbox-bg1">
						<div id="gbox-grd1">

							<%@page import="java.sql.ResultSet"%>
							<%!Connection conn;
	Statement st1, st2, st3, st4, st5, st6, st7, st8, stwar3, stamc1;
	String query1, query2, query3, query4, query5;%>

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

<style type=text/css>
	table.mytable {
		font: 13px arial, sans-serif;
		border-collapse: collapse;
		border: 1px solid #839E99;
		background: #f8fcff;
	}
</style>

<style type="text/css">

.exTable{

	

}


</style>


<title>Main Page</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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


<script type="text/javascript">
	function confirmSubmit() {

		var operator = document.getElementById("operator").options[document
				.getElementById("operator").selectedIndex].value;
		//var status= document.getElementById("status").options[document.getElementById("status").selectedIndex].value;

		if (operator == "select") {
			alert("Please select  Transporter!");
			return false;
		}

		return true;
	}
</script>

<script type="text/javascript">
	function goToFullExcel(operator, calender, calender1) {
		alert(">>>>" + operator + ">>>>>>>>" + status + ">>>>>>");

		window.location.href = "SimmasterReportFullExcelReport.jsp?date1="
				+ date1 + "&date2=" + date2 + "Operator=" + operator;
	}

	function gotoExcel(elemId, frmFldId) {
		alert(">>>>");
		var obj = document.getElementById(elemId);
		var oFld = document.getElementById(frmFldId);
		oFld.value = obj.innerHTML;
		document.SimmasterReport.action = "excel.jsp";
		document.forms["SimmasterReport"].submit();
	}
</script>

<script type="text/javascript">
	function fun() {

		//alert("Hi");

		var chkf = "";
		var chkt = "";
		var objFromDate = document.getElementById("calender").value;
		//alert(objFromDate);
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
		var objToDate = document.getElementById("calender1").value;
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
		//         else if(date1 > currentDate)
		//         {
		//             alert("From Date should be less than current date");
		//             return false; 
		//         }
		//         else if(date2 > currentDate) 
		//         {
		//             alert("To Date should be less than current date");
		//             return false; 
		//         }

		return true;
	}
</script>




</head>


<body>
	<!-- <div id="wrapper">
<div id="logo">
<h1><img src="images/Transworld.gif"></h1>
<p>We care about your Vehicles</p>
</div>
<P></p> -->
	<!-- <div id="gbox1"> -->
		<!-- <div id="gbox-top1"> </div> -->
		<!-- <div id="gbox-bg1"> -->
			<!-- <div id="gbox-grd1"> -->
				<!--- code start here ------>

				<%
					java.util.Date td = new java.util.Date();
					Format fmt = new SimpleDateFormat("dd-MM-yyyy");
					Format fmt1 = new SimpleDateFormat("dd-MMM-yyyy HH:mm");
					Format fmt2 = new SimpleDateFormat("yyyy-MM-dd");
					String sdt = fmt.format(td);

					////System.out.println("----------------------------------------------------------------------???<_>"+inputtype);

					java.util.Date dte11 = new java.util.Date();
					Format formatter12 = new SimpleDateFormat("yyyy-MM-dd");
					String today11 = formatter12.format(dte11);

					System.out.println("Todays is:" + today11);

					java.util.Date dte = new java.util.Date();
					Format formatter = new SimpleDateFormat("dd-MM-yyyy");
					String today = formatter.format(dte);

					java.util.Date dte1 = new java.util.Date();
					Format formatter1 = new SimpleDateFormat("yyyy-MM-dd");
					String today1 = formatter.format(dte);

					String operator = request.getParameter("operator");
					String datenew1 = "";
					String datenew2 = "";
					String dataDate11 = "";

					//datenew1=datenew2=new SimpleDateFormat("dd-MMM-yyyy").format(new java.util.Date());
					/* String dt = new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(datenew1));
					dt=dt;
					
					String dt1 = new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(datenew2));
					
					dt1=dt1; */

					String fromdate = request.getParameter("calender");

					String todate = request.getParameter("calender1");

					if (request.getParameter("calender") != null) {
						datenew1 = request.getParameter("calender");
						datenew2 = request.getParameter("calender1");
					} else
						datenew1 = datenew2 = new SimpleDateFormat("dd-MMM-yyyy").format(new java.util.Date());

					try {
						System.out.println("Creating Connection");
						Class.forName(MM_dbConn_DRIVER);
						conn = DriverManager.getConnection(MM_dbConn_STRING, MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
						st1 = conn.createStatement();
						st2 = conn.createStatement();
						st3 = conn.createStatement();
						st4 = conn.createStatement();
						st5 = conn.createStatement();
						st6 = conn.createStatement();
						st7 = conn.createStatement();
						st8 = conn.createStatement();
						stwar3 = conn.createStatement();
						stamc1 = conn.createStatement();

					} catch (Exception E) {
						System.out.println("" + E);
					}
					ResultSet rsPagination = null;
					ResultSet rsRowCnt = null;

					PreparedStatement psPagination = null;
					PreparedStatement psRowCnt = null;

					int iShowRows = 10; // Number of records show on per page
					int iTotalSearchRecords = 10; // Number of pages index shown

					int iTotalRows = nullIntconv(request.getParameter("iTotalRows"));
					int iTotalPages = nullIntconv(request.getParameter("iTotalPages"));
					int iPageNo = nullIntconv(request.getParameter("iPageNo"));
					int cPageNo = nullIntconv(request.getParameter("cPageNo"));

					int iStartResultNo = 0;
					int iEndResultNo = 0;

					if (iPageNo == 0) {
						iPageNo = 0;
					} else {
						iPageNo = Math.abs((iPageNo - 1) * iShowRows);
					}

					System.out.println("Connection Created");
				%>

				<table class="exTable" width="100%"  bgcolor="#E6E6E6" align="center">
					<tr>
						<td>
							<table border="0" width="100%">
								<tr>
									<td align="center"><font color="black" size="3"><b>Main Page</b></font></td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
				<br /> <br />
			</div>

			<div id="gbox-bot1"></div>
		</div>
	</div>
	<%
		System.out.println("The Date 1 is  :" + fromdate);
		System.out.println("The Date 2 is :" + todate);
		System.out.println("operator is :" + operator);

		System.out.println("Selected Value is:" + operator);

		DateFormat df123 = new SimpleDateFormat("dd-MMM-yyyy");
		DateFormat df1234 = new SimpleDateFormat("yyyy-MM-dd");
		String dataDate1 = df1234.format(df123.parse(datenew1));
		String dataDate2 = df1234.format(df123.parse(datenew2));

		String dt = new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(datenew1));
		dt = dt;

		String dt1 = new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(datenew2));

		dt1 = dt1;

		System.out.println("Date1 After Format : " + dt);
		System.out.println("Date2 After Format : " + dt1);
	%>

	<%
		String Action1 = "" + operator + " Sim Billable Report From " + fromdate + " To " + todate;

		System.out.println("DAte is :" + fromdate);
		System.out.println("Todate is :" + todate);

		String btnvalue = request.getParameter("sub");
		System.out.println("----------------->" + btnvalue);
		int i = 1;
		try {
	%>
	
	
		<table class="display" id="example" width="100%" >
			<thead>
				<tr>

					<th>Sr.</th>
					<th>Transporter</th>
					<th>Open</th>
					<th>closed</th>
					<th>Total</th>
					<th>Install</th>
					<th>Current</th>
					<th>No
						GPS</th>
					<th>1
						to 2 Days</th>
					<th>3
						to 5 Days</th>
					<th>6
						Days</th>
					<th
						>Disconnected</th>
					<th>Removed</th>
					<th>DeActiv
						<br />ation <br /> Req
					</th>
					<!-- <th style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: left; background-color: #e6e6e6; color: black;">In-Active</th> -->
					<th>Missing</th>
					<th>Comp.-Allocated</th>
					<th>Comp.Not
						Re- Allocated</th>
					<!-- <th style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: left; background-color: #e6e6e6; color: black;"> Assign to</th> -->
					<th>
						Today's Call/s (Transp)</th>
					<th>
						Today's Call/s (Techs)</th>

				</tr>
			</thead>
			
			<tbody>


				<%
					int k = 0;
						int total1 = 0, open1 = 0, closed1 = 0;
						String sqlcnt2 = "select count(*) as cnt8  from db_gps.t_ticketmastertest  ";
						ResultSet rs157 = st1.executeQuery(sqlcnt2);
						System.out.println(">>>sqlcnt2<<<" + sqlcnt2);

						if (rs157.next()) {
							total1 = rs157.getInt("cnt8");

						}

						String sqlcnt1 = "select count(*) as cnt9  from db_gps.t_ticketmastertest where status ='open'  ";
						ResultSet rs151 = st2.executeQuery(sqlcnt1);
						System.out.println(">>>sqlcnt2<<<" + sqlcnt1);

						if (rs151.next()) {
							open1 = rs151.getInt("cnt9");

						}

						String sqlcnt = "select count(*) as cnt9  from db_gps.t_ticketmastertest where status ='closed' or  status ='AutoClosed'  ";
						ResultSet rs152 = st3.executeQuery(sqlcnt);
						System.out.println(">>>sqlcnt2<<<" + sqlcnt);

						if (rs152.next()) {
							closed1 = rs152.getInt("cnt9");

						}

						String total = "";
						String close = "";
						String open = "";

						String Qu = "SELECT a.OwnerName,CASE WHEN d.Representative IS NULL THEN '' ELSE d.Representative END AS Representative,CASE WHEN b.InstalledCount IS NULL     THEN a.InstalledCount ELSE b.InstalledCount END AS InstalledCount,CASE WHEN b.CurrentCount IS NULL THEN 0 ELSE b.CurrentCount END AS CurrentCount,CASE WHEN b.NoGPSCount IS NULL THEN 0 ELSE b.NoGPSCount END AS NoGPSCount,CASE WHEN b.TwoDaysDelayCount IS NULL            THEN 0 ELSE b.TwoDaysDelayCount END AS TwoDaysDelayCount,CASE WHEN b.FiveDaysDelayCount IS NULL THEN 0 ELSE b.FiveDaysDelayCount END AS FiveDaysDelayCount,    CASE WHEN b.SixDaysDelayCount IS NULL THEN 0 ELSE b.SixDaysDelayCount END AS SixDaysDelayCount,CASE WHEN b.DisConnectedCount IS NULL THEN 0 ELSE b.DisConnectedCount END AS DisConnectedCount,a.RemovedCount,a.DeActivationCount,CASE WHEN c.MissingCount IS NULL THEN 0 ELSE c.MissingCount END AS MissingCount,CASE WHEN f.ComplaintsAllocatedCount IS NULL THEN 0 ELSE f.ComplaintsAllocatedCount END AS ComplaintsAllocatedCount,CASE WHEN f.ComplaintsUnAllocatedCount IS NULL THEN 0 ELSE f.ComplaintsUnAllocatedCount END AS ComplaintsUnAllocatedCount,CASE WHEN e.TransporterCallCount IS NULL THEN 0 ELSE e.TransporterCallCount END AS TransporterCallCount,    CASE WHEN e.TechnicianCallCount IS NULL THEN 0 ELSE e.TechnicianCallCount END AS TechnicianCallCount,  CASE WHEN g.IsDataBlocked IS NULL THEN 'false' ELSE 'true' END AS IsDataBlocked FROM  (SELECT OwnerName, COUNT(VehicleCode) AS InstalledCount,SUM(CASE WHEN Status = 'Removed' THEN 1 ELSE 0 END) AS RemovedCount,SUM(CASE WHEN Status = 'DeActivated' THEN 1 ELSE 0 END) AS DeActivationCount   FROM db_gps.t_vehicledetails WHERE OwnerName NOT LIKE '%del' and status='-' GROUP BY OwnerName) a LEFT OUTER JOIN ( SELECT b1.Transporter AS OwnerName,     NULL AS InstalledCount, SUM(CASE WHEN b11.Status='-' AND b1.Location NOT LIKE 'No GPS%' AND TheDate = CURRENT_DATE() THEN 1 ELSE 0 END) AS CurrentCount,SUM(CASE WHEN b11.Status NOT IN ('Removed','DeActivated') AND b1.Location NOT LIKE 'NO GPS%' AND TheDate< CURRENT_DATE() AND TheDate>= DATE_SUB(CURRENT_DATE(),INTERVAL 2 DAY) THEN 1 ELSE 0 END) AS TwoDaysDelayCount,SUM(CASE WHEN b11.Status NOT IN ('Removed','DeActivated') AND b1.Location NOT LIKE 'NO GPS%' AND TheDate< DATE_SUB(CURRENT_DATE(),INTERVAL 2 DAY) AND TheDate>= DATE_SUB(CURRENT_DATE(),INTERVAL 5 DAY) THEN 1 ELSE 0 END) AS FiveDaysDelayCount,SUM(CASE WHEN b11.Status NOT IN ('Removed','DeActivated') AND b1.Location NOT LIKE 'NO GPS%'AND TheDate= DATE_SUB(CURRENT_DATE(),INTERVAL 6 DAY) THEN 1 ELSE 0 END) AS SixDaysDelayCount, SUM(CASE WHEN b11.Status NOT IN ('Deleted', 'Removed', 'DeActivated') AND b1.Location LIKE 'No GPS%' THEN 1 ELSE 0 END) AS NoGPSCount,               SUM(CASE WHEN b11.Status NOT IN ('Removed', 'DeActivated') AND b1.Location NOT LIKE 'No GPS%' AND TheDate< DATE_SUB(CURRENT_DATE(),INTERVAL 6 DAY) THEN 1 ELSE 0 END) AS DisConnectedCount    FROM db_gps.t_onlinedata b1    INNER JOIN db_gps.t_vehicledetails b11 ON (b1.VehicleCode=b11.VehicleCode AND b1.Transporter=b11.OwnerName and b11.status='-') GROUP BY b1.Transporter UNION SELECT b2.Transporter AS Ownername,COUNT(b2.VehicleCode) AS InstalledCount,SUM(CASE WHEN b2.Location NOT LIKE 'No GPS%' AND b2.TheDate =CURRENT_DATE() THEN 1 ELSE 0 END) AS CurrentCount,SUM(CASE WHEN b12.Status NOT IN ('Removed','DeActivated') AND b2.Location NOT LIKE 'NO GPS%' AND b2.TheDate< CURRENT_DATE() AND b2.TheDate>= DATE_SUB(CURRENT_DATE(),INTERVAL 2 DAY)    THEN 1 ELSE 0 END) AS TwoDaysDelayCount,SUM(CASE WHEN b12.Status NOT IN ('Removed','DeActivated') AND b2.Location NOT LIKE 'NO GPS%' AND b2.TheDate< DATE_SUB(CURRENT_DATE(),INTERVAL 2 DAY) AND b2.TheDate>= DATE_SUB(CURRENT_DATE(),INTERVAL 5 DAY)    THEN 1 ELSE 0 END) AS FiveDaysDelayCount,SUM(CASE WHEN b12.Status NOT IN ('Removed','DeActivated') AND b2.Location NOT LIKE 'NO GPS%' AND b2.TheDate= DATE_SUB(CURRENT_DATE(),INTERVAL 6 DAY)    THEN 1 ELSE 0 END) AS SixDaysDelayCount,SUM(CASE WHEN b12.Status IN ('Deleted', 'Removed', 'DeActivated') AND b2.Location LIKE 'No GPS%' THEN 1 ELSE 0 END) AS NoGPSCount,                SUM(CASE WHEN b12.Status NOT IN ('Removed', 'DeActivated') AND b2.Location NOT LIKE 'No GPS%' AND b2.TheDate<DATE_SUB(CURRENT_DATE(),INTERVAL 6 DAY) THEN 1 ELSE 0 END) AS DisConnectedCount FROM db_gps.t_onlinedataotherservers b2 INNER JOIN db_gps.t_vehicledetails b12 ON (b2.VehicleCode=b12.VehicleCode AND b12.status='-' and b2.Transporter IN ('HPCL','Topsline','Ujjain')) GROUP BY b2.Transporter) b ON (a.OwnerName = b.OwnerName)    LEFT OUTER JOIN    (SELECT Owner AS OwnerName, SUM(CASE WHEN Status='Missing' THEN 1 ELSE 0 END) AS MissingCount    FROM db_CustomerComplaints.t_unitmissing GROUP BY Owner) c ON (a.OwnerName = c.OwnerName) LEFT OUTER JOIN (SELECT Transporter AS OwnerName, MAX(Representative) AS Representative    FROM db_CustomerComplaints.t_asgndtranstoreps GROUP BY Transporter) d ON (a.OwnerName = d.OwnerName)    LEFT OUTER JOIN (SELECT e1.Transporter AS OwnerName,SUM(CASE WHEN e1.CallerType='transporter' AND e1.TheDate=CURRENT_DATE() THEN 1 ELSE 0 END) AS TransporterCallCount,     SUM(CASE WHEN e1.CallerType='Technician' AND e1.TheDate=CURRENT_DATE() THEN 1 ELSE 0 END) AS TechnicianCallCount    FROM db_CustomerComplaints.t_callinformation e1    GROUP BY e1.Transporter    ) e ON (a.OwnerName = e.OwnerName)    LEFT OUTER JOIN    (    SELECT Customer AS OwnerName,        SUM(CASE WHEN f1.VehAvaildate >= CURRENT_DATE() AND f1.Status IN ('Allocated', 'Attended')            THEN 1 ELSE 0 END) AS ComplaintsAllocatedCount,        SUM(CASE WHEN f1.VehAvaildate < CURRENT_DATE() AND f1.Status IN ('Allocated', 'Attended')      THEN 1 ELSE 0 END) AS ComplaintsUnAllocatedCount    FROM db_CustomerComplaints.t_complaints1 f1    GROUP BY Customer    ) f ON (a.OwnerName = f.OwnerName)    LEFT OUTER JOIN     ( SELECT UserTypeValue AS OwnerName, 1 AS IsDataBlocked     FROM db_gps.t_usermessage     WHERE MessageId IN ('4','5') AND DisplayStatus='yes'    GROUP BY UserTypeValue    )g ON (a.OwnerName=g.OwnerName) limit 3";
						ResultSet rsQu = st4.executeQuery(Qu);

						while (rsQu.next()) {
							rsQu.getString("InstalledCount");
							String Svehlist = "";
							String Vehlist = "select distinct(vehiclecode) as vehid from db_gps.t_vehicledetails where ownername ='"
									+ rsQu.getString("OwnerName") + "' and status='-'";
							ResultSet rsVehlist = st7.executeQuery(Vehlist);

							while (rsVehlist.next()) {

								Svehlist = Svehlist + "," + rsVehlist.getString("vehid");
							}

							Svehlist = Svehlist.substring(1);
							System.out.println(">>>Svehlist Svehlist <<<" + Svehlist.substring(1));

							String All = "select count(*) as cnt5  from db_gps.t_ticketmastertest WHERE STATUS = 'open' and vehid in ("
									+ Svehlist + ")";
							System.out.println(">>>sqlcnt4<<<" + All);
							ResultSet rs158 = st5.executeQuery(All);
							System.out.println(">>>sqlcnt4<<<" + All);

							if (rs158.next()) {
								open = rs158.getString("cnt5");

							} else {
								open = "0";

							}

							String All2 = "select count(*) as cnt6  from db_gps.t_ticketmastertest WHERE  vehid in (" + Svehlist
									+ ") and STATUS = 'AutoClosed' or STATUS = 'Closed'";
							ResultSet rs1581 = st6.executeQuery(All2);
							System.out.println(">>>sqlcnt4<<<" + All2);

							if (rs1581.next()) {
								close = rs1581.getString("cnt6");

							} else {
								close = "0";

							}

							String All1 = "select count(tcategory) as cnt7  from db_gps.t_ticketmastertest where vehid in ("
									+ Svehlist + ")";
							ResultSet rs1582 = st7.executeQuery(All1);
							System.out.println(">>>sqlcnt4<<<" + All1);

							if (rs1582.next()) {
								total = rs1582.getString("cnt7");

							} else {
								total = "0";

							}
				%>

				<tr>
					<td align="right"><%=i%></td>
					<td align="left"><%=rsQu.getString("OwnerName")%></td>
					<td align="right"><%=open%></td>
					<td align="right"><%=close%></td>
					<td align="right"><%=total%></td>
					<td align="right"><%=rsQu.getString("InstalledCount")%></td>
					<td align="right"><%=rsQu.getString("CurrentCount")%></td>
					<td align="right"><%=rsQu.getString("NoGPSCount")%></td>
					<td align="right"><%=rsQu.getString("TwoDaysDelayCount")%></td>
					<td align="right"><%=rsQu.getString("FiveDaysDelayCount")%></td>
					<td align="right"><%=rsQu.getString("SixDaysDelayCount")%></td>
					<td align="right"><%=rsQu.getString("DisConnectedCount")%></td>
					<td align="right"><%=rsQu.getString("RemovedCount")%></td>
					<td align="right"><%=rsQu.getString("DeActivationCount")%></td>
					<td align="right"><%=rsQu.getString("MissingCount")%></td>
					<td align="right"><%=rsQu.getString("ComplaintsAllocatedCount")%></td>
					<td align="right"><%=rsQu.getString("ComplaintsUnAllocatedCount")%></td>
					<td align="right"><%=rsQu.getString("TransporterCallCount")%></td>
					<td align="right"><%=rsQu.getString("TechnicianCallCount")%></td>

				</tr>


				<%
					i++;
						}
				%>
			
			</tbody>
		</table>
	

	<%
		try {
				NumberFormat nf = NumberFormat.getNumberInstance();
				nf.setMaximumFractionDigits(2);
	%>

	<br>
	<br>
	<table  width="100%" class=""  border="1">
		<tr>
			<td colspan="14">
				<div align="center">
					<b> <i>Performance </i>
					</b>
				</div>
			</td>
		</tr>
		<tr>
			<td><b>Open</b></td>
			<td><b>closed </b></td>
			<td><b> Total</b></td>
			<td><b>Installed</b></td>
			<td><b>Current</b></td>
			<td><b>No GPS</b></td>
			<td><b> 1 to 2<br /> Days <br /></b></td>
			<td><b> 3 to 5<br /> Days <br /></b></td>
			<td><b> 6 Days</b></td>
			<td><b>Disconn<br />ected <br />
			</b></td>
			<td><b>Rem<br /> oved <br /></b></td>
			<td><b>DeActiva <br />tion Req <br /></b></td>
			<td><b>In Active</b></td>
			<td><b>Miss<br /> ing<br /></b></td>
			<td><b>Comp All<br /> ocated<br /></b></td>
			<td><b>Comp UnAll<br /> ocated<br /></b></td>
			<td><b>Today's Calls <br /> (Transp)<br /></b></td>
			<td><b>Today's Calls <br /> (Techs)<br /></b></td>
			<td><b>Delay<br /> %age <br /></b></td>
		</tr>


		<%
			final String userName = session.getAttribute("username").toString();

					final String userRole = session.getAttribute("userrole").toString();
					final String us1 = userName.toUpperCase();
					List<ConsolidatedUnitData> consolidatedData = null;
					int numRecords = 0;
					List<UnitData> transporterWiseUnitData = null;
					try {
						transporterWiseUnitData = unitDetailsDao.getUnitData(userRole, userName);
						consolidatedData = consolidatedUnitDataProvider
								.getConsolidatedViewData(transporterWiseUnitData);
						numRecords = transporterWiseUnitData.size();
					} catch (Exception e) {
						e.printStackTrace();
					}

					String chk = "ToCheck", stg1 = "Stage1Ticket", stg2 = "Stage2Ticket", stg3 = "Stage3Ticket",
							stg4 = "Stage4Ticket", status = "Closed", status1 = "AutoClosed", closed = "close",
							opentct = "open", opened = "opened", closedtot = "closedtot", totaltc = "totaltc";
					String opent = "All", closet = "All", totalt = "All";

					for (final ConsolidatedUnitData currentRecord : consolidatedData) {
		%>
		<tr>


			<td><div align="right">
					<font color="#660033"><a
						href="liveticket.jsp?owner=<%=opent%>&opened=<%=opened%>"> <%=open1%></a></font>
				</div></td>
			<td><div align="right">
					<font color="#660033"><a
						href="liveticket.jsp?owner=<%=closet%>&closedtot=<%=closedtot%>">
							<%=closed1%></a></font>
				</div></td>
			<td><div align="right">
					<font color="#660033"><a
						href="liveticket.jsp?owner=<%=totalt%>&totaltc=<%=totaltc%>">
							<%=total1%></a></font>
				</div></td>


			<td><div align="right">
					<font color="#660033"><a href="totinstalled.jsp"> <%=currentRecord.getInstalledCount()%></a></font>
				</div></td>
			<td><div align="right">
					<font color="#660033"><a href="totalcurrentvehs.jsp"> <%=currentRecord.getCurrentCount()%>
					</a> </font>
				</div></td>
			<td><div align="right">
					<font color="#660033"><a href="nogpstotal.jsp"> <%=currentRecord.getNoGpsCount()%>
					</a></font>
				</div></td>
			<td><div align="right">
					<font color="#660033"><a href="tot1to2delayvehs.jsp"> <%=currentRecord.getTwoDaysCount()%>
					</a></font>
				</div></td>
			<td><div align="right">
					<font color="#660033"><a href="tot3to6delayvehs.jsp"> <%=currentRecord.getFiveDaysCount()%>
					</a></font>
				</div></td>
			<td><div align="right">
					<font color="#660033"><a href="totsixdays.jsp"> <%=currentRecord.getSixDaysCount()%>
					</a></font>
				</div></td>
			<td><div align="right">
					<font color="#660033"><a href="totdisconnected.jsp"> <%=currentRecord.getDisconnectedCount()%>
					</a></font>
				</div></td>
			<td><div align="right">
					<font color="#660033"><a href="totremovedvehs.jsp"> <%=currentRecord.getRemovedCount()%>
					</a></font>
				</div></td>
			<td><div align="right">
					<font color="#660033"><%=currentRecord.getDeactivationCount()%></font>
				</div></td>
			<td><div align="right">
					<font color="#660033"><%=currentRecord.getNoActiveCount()%></font>
				</div></td>
			<td><div align="right">
					<font color="#660033"><%=currentRecord.getMissingCount()%></font>
				</div></td>
			<td><div align="right">
					<font color="#660033"><%=currentRecord.getComplaintAllocatedCount()%></font>
				</div></td>
			<td><div align="right">
					<font color="#660033"> <%=currentRecord.getComplaintUnallocatedCount()%></font>
				</div></td>
			<td><div align="right">
					<font color="#660033"><%=currentRecord.getTransporterCallCount()%></font>
				</div></td>
			<td><div align="right">
					<font color="#660033"><%=currentRecord.getTechnicianCallCount()%></font>
				</div></td>
			<td><div align="right">
					<font color="#660033"><%=nf.format(currentRecord.getPercentageDelay())%></font>
				</div></td>
		</tr>
		<%
			}
				} catch (Exception e) {
					out.println("<tr><td colspan=16>");
					out.println("Exception :" + e.getMessage());
					out.println("Cause : " + e.getCause());
					out.println("</td></tr>");
					e.printStackTrace();
				} finally {
		%>
	</table>
	
		<%
			}
	
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("Hello");
			}
		%>


	<div id="copyright">Copyright &copy; 2008 by Transworld
		Compressor Technologies Ltd. All Rights Reserved.</div>
		
<%@ include file="footer.jsp"%>
		
  </body>
</html>


							<%
								try {
									if (psPagination != null) {
										psPagination.close();
									}
									if (rsPagination != null) {
										rsPagination.close();
									}

									if (psRowCnt != null) {
										psRowCnt.close();
									}
									if (rsRowCnt != null) {
										rsRowCnt.close();
									}

									if (conn != null) {
										conn.close();
									}
								} catch (Exception e) {
									e.printStackTrace();
								}
							%>

							
							
			
			
			
							
							