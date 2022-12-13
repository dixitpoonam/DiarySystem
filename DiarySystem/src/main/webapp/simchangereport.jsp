<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java"
	import="java.sql.*" import=" java.text.*" import=" java.util.*"
	errorPage=""%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ include file="header.jsp"%>

<style type="text/css">
@import url(jscalendar-1.0/calendar-win2k-1.css);
</style>

<script type="text/javascript" src="jscalendar-1.0/calendar.js"></script>
<script type="text/javascript" src="jscalendar-1.0/lang/calendar-en.js"></script>
<script type="text/javascript" src="jscalendar-1.0/calendar-setup.js"></script>



<%@page import="java.sql.ResultSet"%>
<%!Connection conn;
	Statement st1, st2, st3, st4, st5;
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
									title : 'Sim change Report',

								}, {
									extend : 'pdf',
									title : 'Sim change Report',
									pageSize : 'A2',
								}, {
									extend : 'csv',
									title : 'Sim change Report',
								}, {
									extend : 'print',
									title : 'Sim change Report',
								}, {
									extend : 'copy',
									title : 'Sim change Report',
								},

								/* 'copy', 'csv', 'excel', 'pdf', 'print' */
								]
							} ],
							lengthMenu : [ [ -1, 10, 25, 50, 100 ],
									[ "All", 10, 25, 50, 100 ] ],

						});
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
		//          else if(date1 > currentDate)
		//          {
		//              alert("From Date should be less than current date");
		//              return false; 
		//          }
		//          else if(date2 > currentDate) 
		//          {
		//              alert("To Date should be less than current date");
		//              return false; 
		//          }

		return true;

	}
</script>



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
		


				<table border="0" width="750px" bgcolor="#E6E6E6" align="center">
					<tr>
						<td>
							<table border="0" width="100%">
								<tr>
									<td align="center"><font color="black" size="3">Sim Change
											Report</font></td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
				<br /> <br />
				<!--- code start here ------>
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

								datex1 = request.getParameter("data");
								datex2 = request.getParameter("data1");
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

						System.out.println(" datex1 " + datex1 + " datex2 " + datex2);

						String data = new SimpleDateFormat("yyyy-MM-dd")
								.format(new SimpleDateFormat("dd-MMM-yyyy").parse(datex1));

						String data0 = new SimpleDateFormat("yyyy-MM-dd")
								.format(new SimpleDateFormat("dd-MMM-yyyy").parse(datex2));

						System.out.println(" dt :-  " + data + " dt1 :-  " + data0);

						int details = 0;
				%>
<% 
 try{
	Class.forName(MM_dbConn_DRIVER);
	con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	con2 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);

	Statement stmt1 = con2.createStatement();
	Statement stmt2 = con1.createStatement();
	Statement stmt3 = con1.createStatement();
	Statement stmt4 = con2.createStatement();
	Statement stmt5 = con2.createStatement();
	Statement stmt6 = con2.createStatement();
	Statement stmt7 = con2.createStatement();
	Statement stmt8 = con2.createStatement();
	Statement stmt9 = con2.createStatement();
	Statement stmt10 = con2.createStatement();
	
	
	//ResultSet rs1=null,rs2=null, rs3=null, rs4=null, rs5=null, rs6=null,rs7=null,rs8=null,rs9=null,rs10=null,rs11=null;
	String sql="",sql1="",sql2="", sql3="", sql4="", sql5="", sql6="",sql7="",sql8="",sql9="",sql10="",sql11="";
	String Date="",unitid="",oldmobno="",oldsimno="",oldoperator=""/* data="",data1="" */,oldstatus="",newmobno="",OtherCorrections="";
	String newsimno="",newoperator="",newstatus="",EntBy="";
	String user=session.getAttribute("username").toString();
	
	%>
			<table border="0" width="750px" align="center">
					<tr>
						<td>
							<form name="form1" id="form1" action="" method="post">
								<table border="1" width="100%" align="center">
									<tr>
										<td align="center"><font face="Arial" color="black"
											size="2"><b>From </b></font>&nbsp;&nbsp; <input type="text"
											id="data" height="10px" name="data" value="<%=datex1%>"
											size="13px" readonly class="element text medium"
											style="width: 125px; font-size: 12px; height: 29px; color: black" />
											<script type="text/javascript">
												Calendar.setup({
													inputField : "data", // ID of the input field
													ifFormat : "%d-%b-%Y", // the date format
													button : "data" // ID of the button
												});
											</script></td>


										<td align="center"><font face="Arial" color="black"
											size="2"><b>To </b></font>&nbsp;&nbsp; <input type="text"
											id="data1" name="data1" value="<%=datex2%>" size="13px"
											readonly class="element text medium"
											style="width: 125px; font-size: 12px; height: 29px; color: black" />
											<script type="text/javascript">
												Calendar.setup({
													inputField : "data1", // ID of the input field
													ifFormat : "%d-%b-%Y", // the date format
													button : "data1" // ID of the button
												});
											</script></td>


										<td><input type="submit" name="button" id="button"
											value="Submit" class="formElement" onclick="chk()"></td>
									</tr>
								</table>
								
								
								<table border="0" width="750px" bgcolor="#E6E6E6" align="center">
					<tr>
						<td>
							<table border="0" width="100%">
								<tr>
									<td align="center"><font color="black" size="3">Sim Change
											Report from <%=datex1%> to <%=datex2%></font></td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
								
								
								
								
								
							</form>
							<form name="SimmasterReport" id="SimmasterReport" action=""
								method="post">

								<%-- <%
									String exportFileName = "Incident_report.xls";
								%> --%>
								
								</form>
								<%-- <table width="750px" border="0" align="center">
									<tr>


										<td><input type="hidden" id="tableHTML" name="tableHTML"
											value="" /> <input type="hidden" id="fileName"
											name="fileName" value="<%=exportFileName%>" </td> 
									</tr>
								</table> --%>
								
								
								
								<div class="form" style="width: 750px; color: black;">
									<table id="example" width="750px" border="0" align="center">


										<thead>
											<tr>
											
											
											
                <td  style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: left; background-color: #e6e6e6; color: black;"> Sr.</td>
				<td style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: left; background-color: #e6e6e6; color: black;"> Date</td>
				<td style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: left; background-color: #e6e6e6; color: black;"> Unit ID</td>
				<td style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: left; background-color: #e6e6e6; color: black;"> Old Sim </td>
				<td style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: left; background-color: #e6e6e6; color: black;"> Old Mob</td>
				<td style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: left; background-color: #e6e6e6; color: black;"> Status </td>
				<td style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: left; background-color: #e6e6e6; color: black;"> Old Operator</td>
				<td style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: left; background-color: #e6e6e6; color: black;"> New Sim </td>
				<td style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: left; background-color: #e6e6e6; color: black;"> New Mob</td>
				<td style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: left; background-color: #e6e6e6; color: black;"> Status</td>
				<td style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: left; background-color: #e6e6e6; color: black;"> corrections</td>
				<td style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: left; background-color: #e6e6e6; color: black;"> Entry</td>
				
				</tr>
				</thead>
				
				<%! 
Connection con1;
Connection con2;
String refno=null;

%>
				
				<%
							
				int i=0;
				sql="select distinct(UnitID),EntDate ,EntBy,OtherCorrections from db_gps.t_unitmasterhistory where  EntDate between '"+data+"' and '"+data0+"'  and OtherCorrections in('simcard', 'sim change')";
				ResultSet rs=stmt1.executeQuery(sql);
				System.out.println("ist querry  "  +sql);
				while(rs.next())
				{
					i++;
					OtherCorrections=rs.getString("OtherCorrections");
					Date=rs.getString("EntDate");
					Date=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rs.getString("EntDate")));
					unitid=rs.getString("UnitID");
					System.out.println("unitid  "  +unitid);
					EntBy=rs.getString("EntBy");
					System.out.println("unitid  "  +EntBy);
				%>
				<tr>
				
				
				
				<td><%=i%></td>
				<td><%= Date%></td>
				<td><%=unitid %></td>
				
				<%
				sql1="select MobNo from db_gps.t_unitmasterhistory where UnitID='"+unitid+"' and EntDate<'"+rs.getString("EntDate")+"' and MobNo<>'-'  order by EntDate desc limit 1";	
				ResultSet rs1=stmt2.executeQuery(sql1);
				System.out.println("2nd querry  "  +sql1);
				if(rs1.next())
				{
					oldmobno=rs1.getString("MobNo");
				}
				
				sql2="select Simno,Service_provider,Status from db_gps.t_simmaster where Mobno='"+oldmobno+"' ";
				ResultSet rs2=stmt3.executeQuery(sql2);
				while(rs2.next())
				{
					oldsimno=rs2.getString("Simno");
					oldoperator=rs2.getString("Service_provider");
					oldstatus=rs2.getString("Status");
				}
				
				sql3="select MobNo from db_gps.t_unitmasterhistory where UnitID='"+unitid+"' and OtherCorrections in('simcard', 'sim change') order by MobNo desc limit 1";
				ResultSet rs3=stmt4.executeQuery(sql3);
				System.out.println("3rd querry  "  +sql3);
				if(rs3.next())
				{
					newmobno=rs3.getString("MobNo");
				}
				sql4="select Simno,Service_provider,Status from db_gps.t_simmaster where Mobno='"+newmobno+"' ";
				ResultSet rs4=stmt5.executeQuery(sql4);
				while(rs4.next())
				{
					newsimno=rs4.getString("Simno");
					newoperator=rs4.getString("Service_provider");
					newstatus=rs4.getString("Status");
				}
				/*sql5="select EntBy from db_gps.t_unitmasterhistory  where EntDate between '"+data+"' and '"+data1+"'  and OtherCorrections='sim change'";
				ResultSet rs5=stmt5.executeQuery(sql5);
				System.out.println("last querry  "  +sql5);
				if(rs5.next())
				{
					EntBy=rs5.getString("EntBy");
				}*/
				%>
				
				<td><%=oldsimno %></td>
				<td><%=oldmobno%></td>
				<td><%=oldstatus %></td>
				<td><%=oldoperator %></td>
				<td><%=newsimno%></td>
				<td><%=newmobno %></td>
				<td><%=newstatus %></td>
				<td><%=OtherCorrections%></td>
				<td><%=EntBy %></td>
				</tr>
			<%
				}
			%>	
		</table>
		</div>
	<%
 
 }
	catch(Exception e) 
	{ 
		System.out.println("Exception----->"+e); 
	
	}

	finally
	{
	con1.close();
	con2.close();
	}
	%>



  </div>
   		 </div>
 		 
		<div id="gbox-bot1"> </div></div>
      </div>
    </div>
  </div>
  
  <div id="copyright">
   Copyright @ 2008 by Transworld Compressor Technologies Ltd. All Rights Reserved.
  </div>
</body>
</html>		