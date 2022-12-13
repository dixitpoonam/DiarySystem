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
<%@ include file="header.jsp"%>
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

<style type=text/css>
</style>
<title>Seven Day Diary System</title>
<script type="text/javascript" src="jscalendar-1.0/calendar.js"></script>
<script type="text/javascript" src="jscalendar-1.0/lang/calendar-en.js"></script>
<script type="text/javascript" src="jscalendar-1.0/calendar-setup.js"></script>


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
	        		
	        		
	        		text : 'Export',
					buttons : [ {
						extend : 'excel',
                        title: 'DragonDroid Report' +$("#data").val()+'-'+$("#data1").val(),
						
                      
                       
						
					},
	        		
					{
                        extend: 'pdf',
                        orientation: 'landscape',
                        pageSize: 'LEGAL',
                        title: 'DragonDroid Report',                       
                     },
	        		
	                    {
	                        extend: 'csv',
	                        title: 'DragonDroid Report',	                       
	                       
	                        
	                    },
	                    
	                    {
	                        extend: 'print',
	                        title: 'DragonDroid Report',	                       
	                       
	                    },
	                    
	                    {
	                        extend: 'copy',
	                        title: 'DragonDroid Report',	                       
	                       
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
</head>

<body style="background-color: #FFFFFF;">
	<div id="wrapper" style="width: 100%">
		<div id="logo" style="padding-left: 250px; width: min-content;">
			<h1>
				<img src="images/Transworld.gif">
			</h1>
			<p>We care about your Vehicles</p>
		</div>


		<%@ include file="header1.jsp"%>




		<%!Connection con1;
	Connection con2;
	String refno = null;%>

		<%
					System.out.println("in the QuickTestReport jsp page ");
					Class.forName(MM_dbConn_DRIVER);
					con1 = DriverManager.getConnection(MM_dbConn_STRING, MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
					con2 = DriverManager.getConnection(MM_dbConn_STRING1, MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
					Statement stmt = con1.createStatement();
					Statement st = con2.createStatement();
					Statement st2 = con2.createStatement();
					Statement st1 = con2.createStatement();
					Statement stmt1 = con2.createStatement();
					Statement stmt2 = con1.createStatement();
					Statement stmt3 = con1.createStatement();
					Statement stmt4 = con1.createStatement();
					Statement stmt19 = con2.createStatement();
					Statement stmt6 = con2.createStatement();
					Statement stmt7 = con2.createStatement();
					Statement stmt8 = con2.createStatement();
					Statement stmt9 = con2.createStatement();
					Statement stmt10 = con2.createStatement();
					Statement stmt11 = con1.createStatement();
					Statement stmt13 = con1.createStatement();
					Statement stmt14 = con1.createStatement();
					Statement stmt12 = con1.createStatement();
					Statement stmt51 = con1.createStatement();
					Statement stmt81 = con1.createStatement();
				%>




		<%
					String datex1, datex2, data1, data2;
					String departmentNew = "";

					int details = 0;
					String d = "";

					System.out.println("Date---->" + d);
					String dtt1 = "";
					int i = 1;
					ResultSet res8 = null;
					ResultSet res81 = null;

					String dt111 = "";
					ResultSet res = null;
					ResultSet res2 = null;
					String unitid = "", OwnerName = "", GPName = "", UnitID = "", version = "", VehicleCode = "", dt5 = "",
							WMSN = "", VehicleRegNumber = "", InsertDate = "", OTP = "", imei = "", MailDate = "",
							MailTime = "", km = "", runninghours = "";
					String CompanyCode = "", imeiNo = "", UserName = "", MobileNo = "", Address = "", EmailId = "";
					ResultSet rs1 = null, rs2 = null, rs3 = null, rs4 = null, rs5 = null, rs6 = null, rs7 = null, rs8 = null,
							rs9 = null, rs10 = null, rs11 = null, rs99 = null;
					String data = "", data11 = "", vendor = "", Statustype = "", technician = "";
					String user = session.getAttribute("username").toString();
				%>



		<%
					String date = request.getParameter("value");
					String date1 = request.getParameter("value1");
					String ui = request.getParameter("value2");
					String user1 = request.getParameter("value3");

					System.out.println("date " + date);
					System.out.println("date1  " + date1);
					System.out.println("Unit Id " + ui);
				%>

		<br> <br>







		<%
					String exportFileName = "Dragondroid_report.xls";
				%>
		<table width="750px" border="0" align="center">
			<tr>


				<td><input type="hidden" id="tableHTML" name="tableHTML"
					value="" /> <input type="hidden" id="fileName" name="fileName"
					value="<%=exportFileName%>" />
			</tr>
		</table>




		<table id="example" class="display" style="width: 100%">
			<thead>
				<tr>
					<th style="width:5%;">Sr.No</th>
					<th  style="width:70%; text-align:center;">User Name</th>
					<th style="width:25%; text-align:center;">OTP</th>

				</tr>
			</thead>
			<tbody>







				<%
								String owner = request.getParameter("owner");

								System.out.println(">>>>>>>owner>>>>>>" + owner);

								//sql2="Select * from db_CustomerComplaints.hwunittest where TheDate between '"+data+"' and '"+data1+"' and TypeValue='2' order by TheDate desc";
								int VehCode = 0, RD = 0, OS = 0, cnt1 = 0, RA = 0, cnt = 0, cnt3 = 0, cnt2 = 0, cnt5 = 0, cnt9 = 0,
										cnt8 = 0;
								int todaykm = 0, cumulative = 0;
								int TotalImgCam2 = 0, TotalImgCam3 = 0, TotalVidCam1 = 0, TotalVidCam2 = 0, cnt4 = 0, TotalAdCount5 = 0,
										TotalAdCounthr = 0;
								int c1 = 0, c2 = 0, c3 = 0, c4 = 0, c5 = 0;

								String ddd = "";
								String TheDate = "", TheTime = "", Location = "", concat = "";
								String sql = "select OTP from db_gps.t_dragondroiduserreg where InsertDate>='" + date + "00:00:00"
										+ "' and InsertDate <='" + date1 + "23:59:00" + "' and imeino='" + ui + "'";
								res2 = stmt.executeQuery(sql);
								while (res2.next()) {

									OTP = res2.getString("OTP");
							%>

				<tr>
					<td align="right"><font face=Arial><%=i%></font></td>
					<td align="left"><font face=Arial><%=user1%></font></td>
					<td align="right"><font face=Arial><%=OTP%></font></td>

				</tr>


				<%
								i++;
								}
							%>
			</tbody>
			<tfoot>
				<tr>
				<th style="width:5%;">Sr.No</th>
					<th  style="width:70%; text-align:center;">User Name</th>
					<th style="width:25%; text-align:center;">OTP</th>
				</tr>

			</tfoot>
		</table>
	</div>



</body>
</html>
<%@ include file="footer.jsp"%>

