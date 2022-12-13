<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java"
	import="java.sql.*" import=" java.text.*" import=" java.util.*"
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
	                        title : 'Incident Detail Report', 

							
	                    },
	                    {
	                        extend: 'pdf',
	                        orientation: 'landscape',
	                        pageSize: 'LEGAL',
	                        title : 'Incident Detail Report',
	                        
	                       
	                     },
	                    {
	                        extend: 'csv',
	                        title : 'Incident Detail Report',
	                       
	                    },
	                    {
	                        extend: 'print',
	                        title : 'Incident Detail Report',
	                        
	                    },
	                    {
	                        extend: 'copy',
	                        title : 'Incident Detail Report',
	                       
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
	            { "sType": "date-uk" },
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
	            { "sType": "date-uk" },
	            null,
	            { "sType": "date-uk" },
	            { "sType": "date-uk" },
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
	



			<%!
    
    Connection conn, conn1;
	Statement st, st1, st2, st3, st4, st5, stamc1;
	String sql, sql1, sql2, sql3, sql4, today, olddate, username, userrole, today1;
	String fromdate, todate, veh1, code1, dt1;
	int Ocount;
	int days = 0;
	
	%>

			<%String wrnty="";
					try {
						Class.forName(MM_dbConn_DRIVER);
						conn = DriverManager.getConnection(MM_dbConn_STRING, MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
						conn1 = DriverManager.getConnection(MM_dbConn_STRING1, MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
						st = conn.createStatement();
						st1 = conn.createStatement();
						st2 = conn1.createStatement();
						st3 = conn1.createStatement();
						st4 = conn1.createStatement();
						stamc1 = conn1.createStatement();
						Statement strec=conn.createStatement();
				%>

			

			<!--- code start here ------>
			<%
					String datex1, datex2, data1, data2;
						String departmentNew = "";
						String ddx = request.getQueryString();

						int i = 1; 
						
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

 <table width="750px" align="center">
				<tr>
					<td>
						<table border="0" width="100%">
							<tr>
								<td align="center"><font color="" size="3">Incident Detail Report  From  <%=datex1%>
										To <%=datex2%>
										</font></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>




			<form name="form1" id="form1" action="" method="post">
				<div align="center">
					<table>
						<tr>
							<td><font face="Arial" color="black" size="2">From </font>&nbsp;&nbsp;
								<input type="text" id="data" height="10px" name="data"
								value="<%=datex1%>" size="13px" readonly
								class="element text medium"
								style="width: 75px; font-size: 12px; height: 23px;"/> <script
									type="text/javascript">
												Calendar.setup({
													inputField : "data", // ID of the input field
													ifFormat : "%d-%b-%Y", // the date format
													button : "data" // ID of the button
												});
											</script></td>
											


							<td style="padding-left: 50px;"><font face="Arial" color="black" size="2">To</font>&nbsp;&nbsp;
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


							

							<td  style="padding-left: 65px;" align="center"> <input type="submit" name="button"
								id="button" value="Submit" class="formElement" onclick="chk()"
								style="width: 70px; height: 29px"></td>


						</tr>
					</table>
				</div>
			</form>



  




			<form name="SimmasterReport" id="SimmasterReport" action=""
				method="post">

				<%
									String exportFileName = "Incident_report.xls";
								%>
				<table width="750px" border="0" align="center">
					<tr>



					</tr>
				</table>

				<table id="example" class="display" style="width: 100%">
					<thead>
						<tr>
							<th align="center"
													>SrNo.</th>

												<th align="center"
													>Edit</th>


												<th align="center"
													>Incident
													ID</th>

												<th align="center"
													>Vehicle
													No</th>

												<th align="center"
													>Transporter</th>

												<th align="center"
													>UnitID</th>

												<th align="center"
													>Incident
													Recieved By Mail Date</th>

												<th align="center"
													>Incident
													Recieved By Mail time</th>

												<th align="center"
													>Received
													By</th>

												<th align="center"
													>Received
													From</th>

												<th align="center"
													>Data
													Downloaded By</th>

												<th align="center"
													>Reported
													Through</th>

												<th align="center"
													>Observation
													of Incident</th>

												<th align="center"
													>Driver
													Training Details</th>

												<th align="center"
													>Incident
													Location Map</th>

												<th align="center"
													>Incident
													Location Satelite</th>

												<th align="center"
													`		>Last
													Trip Journey Map</th>

												<th align="center"
													>Entrey
													By</th>

												<th align="center"
													>Updated
													Date Time</th>


												<th align="center"
													>Data
													Download</th>


												<th align="center"
													>Incident
													Date New</th>

												<th align="center">Incident Date</th>

												<th align="center"
													>Incident
													Time</th>
							
							
						</tr>
					</thead>

															<tbody>
											<%
												    
													String IncidentId = "";
													String VehicleRegNo = "";
													String Transporter = "";
													String UnitId = "";
													String ReceivedMailDate = "";
													String ReceivedMailTime = "";
													String IncidentDate = "";
													String IncidentTime = "";
													String ReceivedBy = "";
													String ReceivedFrom = "";
													String DateDownloadedBy = "";
													String ReportedThrough = "";
													String ObservationOffIncident = "";
													String DriverTrainingDetails = "";
													String IncidentLocationMap = "";
													String IncidentLocationSatellite = "";
													String LastTripJourneyMap = "";
													String EntryBy = "";
													String DataDownload = "";
													String UpDatedTime = "";
													String IncidentDateNew = "";

													if (Bt == null || Bt.equals("null")) {

													} else {

														Statement stmt0 = conn1.createStatement();

														String sql = "select a.IncidentID,trim(a.VehicleRegNo) as VehicleNo,trim(a.Transporter) as Transporter,a.UnitID,DATE_FORMAT(IncidentRecievedByMailDate,'%d-%b-%Y') as IncidentRecievedByMailDate,IncidentRecievedByMailTime,ReceivedBy,ReceivedFrom ,DataDownloadedBy,ReportedThrough,Concat(ObservationOFIncident1,ObservationOFIncident2,ObservationOFIncident3,ObservationOFIncident4) as ObservationofIncident,DriverTrainingDetails,IncidentLocationMap,IncidentLocationSatelite,LastTripJourneyMap,a.EntBy,DATE_FORMAT(a.UpdatedDateTime,'%d-%b-%Y %H:%i') as UpdatedDateTime,b.datadownload,DATE_FORMAT(a.IncidentDate,'%d-%b-%Y %H:%i') as IncidentDateNew,a.IncidentDate,a.IncidentTime from db_gps.t_incidentreport a left join db_gps.t_incidentsms b on a.UnitID=b.unitid and a.IncidentID=b.IncidentID and a.IncidentDate >='"
																+ dt + "00:00:00" + "' and a.IncidentDate <= '" + dt1 + "23:59:00"
																+ "'  order by a.IncidentDate desc ";

														System.out.println(sql);

														ResultSet result = stmt0.executeQuery(sql);
														while (result.next()) {

															IncidentId = result.getString("IncidentID");
															VehicleRegNo = result.getString("VehicleNo");
															Transporter = result.getString("Transporter");
															UnitId = result.getString("UnitID");
															ReceivedMailDate = result.getString("IncidentRecievedByMailDate");
															ReceivedMailTime = result.getString("IncidentRecievedByMailTime");
															IncidentDate = result.getString("IncidentDate");
															IncidentTime = result.getString("IncidentTime");
															ReceivedBy = result.getString("ReceivedBy");
															ReceivedFrom = result.getString("ReceivedFrom");
															DateDownloadedBy = result.getString("DataDownloadedBy");
															ReportedThrough = result.getString("ReportedThrough");
															ObservationOffIncident = result.getString("ObservationofIncident");
															DriverTrainingDetails = result.getString("DriverTrainingDetails");
															IncidentLocationMap = result.getString("IncidentLocationMap");
															IncidentLocationSatellite = result.getString("IncidentLocationSatelite");
															EntryBy = result.getString("EntBy");
															DataDownload = result.getString("datadownload");
															UpDatedTime = result.getString("UpdatedDateTime");
															LastTripJourneyMap = result.getString("LastTripJourneyMap");
															IncidentDateNew = result.getString("IncidentDateNew");

															
															
															if (UpDatedTime == null || UpDatedTime.equals(null)) {
																UpDatedTime = "-";
															}else{
																UpDatedTime=new SimpleDateFormat("dd/MM/yyyy")
																		.format(new SimpleDateFormat("dd-MMM-yyyy").parse(result.getString("UpdatedDateTime")));
															}
															
															
															if (ReceivedMailDate == null || ReceivedMailDate.equals(null)) {
																ReceivedMailDate = "-";
															}else{
																ReceivedMailDate = new SimpleDateFormat("dd/MM/yyyy")
																		.format(new SimpleDateFormat("dd-MMM-yyyy").parse(ReceivedMailDate));
																
																//ReceivedMailDate =new SimpleDateFormat("dd/MM/yyyy").format(ReceivedMailDate);
															}

															if (IncidentDate == null || IncidentDate.equals(null)) {
																IncidentDate = "-";
															}
															
														     	String id = "";
															
															 if(IncidentDate.equals("-"))
															 {
																  id = "-";
															 }else
															 {
																id = new SimpleDateFormat("dd/MM/yyyy").format(result.getDate("IncidentDate"));
																
																
															 }

															 if(IncidentDateNew== null || IncidentDateNew.equals(null))
															 {
																 IncidentDateNew="-";
															 }else{
																 IncidentDateNew=new SimpleDateFormat("dd/MM/yyyy")
																	.format(new SimpleDateFormat("dd-MMM-yyyy").parse(result.getString("IncidentDateNew")));
															 }
																
															 
															 if(ObservationOffIncident== null || ObservationOffIncident.equals(null) || ObservationOffIncident.equals(" ") || ObservationOffIncident.equals(""))
															 {
																 ObservationOffIncident="-";
															 }
															 
															 if(DriverTrainingDetails== null || DriverTrainingDetails.equals(null) || DriverTrainingDetails.equals(" ") || DriverTrainingDetails.equals(""))
															 {
																 DriverTrainingDetails="-";
															 }
															 
															 if(IncidentLocationMap== null || IncidentLocationMap.equals(null) || IncidentLocationMap.equals(" ") || IncidentLocationMap.equals(""))
															 {
																 IncidentLocationMap="-";
															 }
															 
															 if(IncidentLocationSatellite== null || IncidentLocationSatellite.equals(null) || IncidentLocationSatellite.equals(" ") || IncidentLocationSatellite.equals(""))
															 {
																 IncidentLocationSatellite="-";
															 }
															 
															 if(LastTripJourneyMap== null || LastTripJourneyMap.equals(null) || LastTripJourneyMap.equals(" ") || LastTripJourneyMap.equals(""))
															 {
																 LastTripJourneyMap="-";
															 }
															 
															 if(DataDownload== null || DataDownload.equals(null) || DataDownload.equals(" ") || DataDownload.equals(""))
															 {
																 DataDownload="-";
															 }
															 
											%>
											<tr>

												<td><%=i%></td>
												<td style="face: san-serif;" align="left"><a
													  href="detailsOfIncident.jsp?transp=<%=result.getString("Transporter")%>&vehno=<%=result.getString("VehicleNo")%>&unitid=<%=result.getString("UnitId")%>"
													onclick="toggleDetails(<%=i%>,false);" target="_blank"
													style="color: blue;">Edit</a></td>
												<td><%=IncidentId%></td>
												<td><%=VehicleRegNo%></td>
												<td><%=Transporter%></td>
												<td><%=UnitId%></td>
												<td><%=ReceivedMailDate%></td>
												<td><%=ReceivedMailTime%></td>
												<td><%=ReceivedBy%></td>
												<td><%=ReceivedFrom%></td>
												<td><%=DateDownloadedBy%></td>
												<td><%=ReportedThrough%></td>
												<td><%=ObservationOffIncident%></td>
												<td><%=DriverTrainingDetails%></td>
												<td><%=IncidentLocationMap%></td>
												<td><%=IncidentLocationSatellite%></td>
												<td><%=LastTripJourneyMap%></td>
												<td><%=EntryBy%></td>
												<td><%=UpDatedTime%></td>
												<td><%=DataDownload%></td>
												<td><%=IncidentDateNew%></td>
												<td><%=id%></td>
												<td><%=IncidentTime%></td>

											</tr>

											<%
												i++;
														}

													}
					

				} catch (Exception e) {
					e.printStackTrace();
				}
											%>


</tbody>

					<tfoot>
					<tr>
							<th align="center"
													>SrNo.</th>

												<th align="center"
													>Edit</th>


												<th align="center"
													>Incident
													ID</th>

												<th align="center"
													>Vehicle
													No</th>

												<th align="center"
													>Transporter</th>

												<th align="center"
													>UnitID</th>

												<th align="center"
													>Incident
													Recieved By Mail Date</th>

												<th align="center"
													>Incident
													Recieved By Mail time</th>

												<th align="center"
													>Received
													By</th>

												<th align="center"
													>Received
													From</th>

												<th align="center"
													>Data
													Downloaded By</th>

												<th align="center"
													>Reported
													Through</th>

												<th align="center"
													>Observation
													of Incident</th>

												<th align="center"
													>Driver
													Training Details</th>

												<th align="center"
													>Incident
													Location Map</th>

												<th align="center"
													>Incident
													Location Satelite</th>

												<th align="center"
													`		>Last
													Trip Journey Map</th>

												<th align="center"
													>Entrey
													By</th>

												<th align="center"
													>Updated
													Date Time</th>


												<th align="center"
													>Data
													Download</th>


												<th align="center"
													>Incident
													Date New</th>

												<th align="center">Incident Date</th>

												<th align="center"
													>Incident
													Time</th>
						</tr>
					</tfoot>
					
				</table>
				


				<!-- code end here --->

				<div id="copyright">Copyright � 2008 by Transworld Compressor
					Technologies Ltd. All Rights Reserved.</div>
		</div>
		
</body>
</html>
