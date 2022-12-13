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
	                        title: 'Unit Received Details Report' +$("#data").val()+'-'+$("#data1").val(), 

							
	                    },
	                    {
	                        extend: 'pdf',
	                        orientation: 'landscape',
	                        pageSize: 'LEGAL',
	                        title: 'Unit Received Details Report' +$("#data").val()+'-'+$("#data1").val(), 
	                        
	                       
	                     },
	                    {
	                        extend: 'csv',
	                        title: 'Unit Received Details Report' +$("#data").val()+'-'+$("#data1").val(), 
	                       
	                    },
	                    {
	                        extend: 'print',
	                        title: 'Unit Received Details Report' +$("#data").val()+'-'+$("#data1").val(), 
	                        
	                    },
	                    {
	                        extend: 'copy',
	                        title: 'Unit Received Details Report' +$("#data").val()+'-'+$("#data1").val(), 
	                       
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
	            { "sType": "date-uk" },
	            { "sType": "date-uk" },
	           
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

<body style="background-color: #FFFFFF;">
	<div id="wrapper" style="width: 100%">
		<div id="logo" style="padding-left: 250px; width: min-content;">
			<h1>
				<img src="images/Transworld.gif">
			</h1>
			<p>We care about your Vehicles</p>
		</div>
		<%@ include file="header1.jsp"%>

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
	Statement stmt4 = con2.createStatement();
	Statement stmt5 = con2.createStatement();
	Statement stmt6 = con2.createStatement();
	Statement stmt7 = con2.createStatement();
	Statement stmt8 = con2.createStatement();
	Statement stmt9 = con2.createStatement();
	Statement stmt10 = con2.createStatement();
	
	
	ResultSet rs1=null,rs2=null, rs3=null, rs4=null, rs5=null, rs6=null,rs7=null,rs8=null,rs9=null,rs10=null,rs11=null;
	String sql1="",sql2="", sql3="", sql4="", sql5="", sql6="",sql7="",sql8="",sql9="",sql10="",sql11="";
	String data="",data1="",vendor="",Statustype="",technician="",lastdt="";
	String user=session.getAttribute("username").toString();
	
	String today=new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
	%>


		<%
					String datex1, datex2, data2;
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


<br>
<br>


		<form name="form1" id="form1" action="" method="post">
			<div align="center">
				<table>
					<tr>
						<td><font face="Arial" color="black" size="2">From </font>&nbsp;&nbsp;
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


					</tr>
				</table>
			</div>
		</form>

		<%	String dd=request.getParameter("data");
		if(dd==null)
	{
	%>
<table width="750px" align="center">
			<tr>
				<td>
					<table border="0" width="100%">
						<tr>
							<td align="center"><font color="" size="3">Please select option to display the Dispatch Report
							</font></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
						

		<%
	}
	else
	{
	data=request.getParameter("data");
	data1=request.getParameter("data1");
	Statustype=request.getParameter("Statustype");
	vendor=request.getParameter("vendor");
	%>
		
						
						
		<table width="750px" align="center">
			<tr>
				<td>
					<table border="0" width="100%">
						<tr>
							<td align="center"><font color="" size="3">Received Details for <%=datex1%>
	                        to <%=datex2%>
							</font></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
						
				
				<table id="example" class="display" style="width: 100%">
					<thead>
						<tr>
							<th>Sr.No</th>
							<th align="center">Unit ID</th>
							<th align="center">Received Date</th>
							<th align="center"> Dispatch Date</th>
							<th align="center">Receive From Location</th>
							<th align="center">Receive From Tech/Cust</th>
							<th align="center"> Installation Date</th>
							<th align="center">Dispatch From</th>
							<th align="center">Type Of Failure</th>
							<th align="center">WMSN Status</th>
							<th align="center">Sim Status</th>
							<th align="center">Service Provider</th>
							<th align="center">Last Data Date</th>
							<th align="center">PowerSupply Version</th>
							<th align="center">PCB Version</th>
							<th align="center">Code Version</th>
							<th align="center">Life Of Unit</th>
							
						</tr>
					</thead>
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
					
				<%
				
				sql2="Select * from t_unitreceived where Rdate between'"+dt+"' and '"+dt1+"' and Status <> 'Deleted' and InTransit <> 'Yes' and TypeValue='2' and ReceiveFrom <> 'Vendor' order by Rdate desc";
				session.setAttribute("sql",sql2);
				int i=1;
				rs2=stmt2.executeQuery(sql2);
				while(rs2.next())
				{	
					String dispdate=null,dispby=null,typeoffail=null,wmsn=null,simno=null,simcompany=null,pcbversion=null,powersupplyversion=null,codeversion=null;
					String installeddate=null,vehconf=null,current_status=null,replace_date=null,replaced=null,life=null,vehcode=null,lastdatadate=null;

					//Recived Details
					 String unitid,recdate,recloc,recby;
					
					 unitid=rs2.getString("UnitID");
					 recdate=rs2.getString("Rdate");
					 recloc=rs2.getString("Lname");
					 recby=rs2.getString("TechName");
					 if(recby.equals('-'))
					 {
						 recby=rs2.getString("Transporter");
					 }
						 
					sql3="select * from t_unitmasterhistory where UnitID = '"+unitid+"' and DispDate < '"+recdate+"' order by DispDate Desc limit 1";
					rs3=stmt1.executeQuery(sql3);
					if(rs3.next())
					{
						dispdate=new SimpleDateFormat("dd/MM/yyyy").format(rs3.getDate("DispDate"));
						dispby=rs3.getString("user");
					}
					 
					sql4="select * from hwunittest where UnitID = '"+unitid+"' and TheDate >= '"+recdate+"' order by TheDate Asc limit 1";
					rs4=stmt3.executeQuery(sql4);
					if(rs4.next())
					{
						typeoffail=rs4.getString("SWComment");
						pcbversion=rs4.getString("AVLPcbVer");
						powersupplyversion=rs4.getString("PowerSupply");
						codeversion=rs4.getString("SWswver");
					}
					else
					{
						typeoffail="-";
					}
					sql5="select * from t_ftpdump where UnitID = '"+unitid+"' and StoredDateTime between '"+dispdate+"' and '"+recdate+"' limit 1";
					rs5=stmt4.executeQuery(sql5);
					if(rs5.next())
					{
						wmsn="YES";
						simno="YES";
					}
					else
					{
						wmsn="NO";
						simno="NO";
					}
					sql6="select SimCompany from t_unitmasterhistory where UnitId = '"+unitid+"' and EntDate <= '"+dispdate+"' order by EntDate Desc limit 1";
					rs6=stmt5.executeQuery(sql6);
					if(rs6.next())
					{
						simcompany=rs6.getString("SimCompany");
					}
					
				//*****************************
				 sql7="select InstDate,VehCode from t_unitreplacement where NewUnitID= '"+unitid+"' and InstDate between '"+dispdate+"' and '"+recdate+"' order by InstDate asc limit 1";
				 rs7=stmt6.executeQuery(sql7);
				 if(rs7.next())
				 {
					 // installation date after dispatch
					// installeddate=rs7.getString("InstDate");
					 installeddate=  new SimpleDateFormat("dd/MM/yyyy").format(rs7.getDate("InstDate"));
					 
					 vehconf="Yes";
					 current_status="Yes";
					 vehcode=rs7.getString("VehCode");
					
					 //replacement date after istallation
					 sql8="select * from t_unitreplacement where OldUnitID= '"+unitid+"' and InstDate >= '"+installeddate+"' order by InstDate asc limit 1";
					rs8=stmt7.executeQuery(sql8);
					 if(rs8.next())
					 {
						 replace_date=rs8.getString("InstDate");
						 replaced="yes";
						 current_status="No";
					 }
						sql10="select * from t_veh"+vehcode+" where TheFieldDataDate between '"+installeddate+"' and '"+replace_date+"' and TheFiledTextFileName = 'SI'  order by TheFieldDataDate Desc limit 1";
						rs10=stmt9.executeQuery(sql10);
						if(rs10.next())
						{
							lastdatadate=rs10.getString("TheFieldDataDate");
							
							lastdt	=new SimpleDateFormat("dd/MM/yyyy").format(rs10.getDate("TheFieldDataDate"));
						}
							sql9="Select To_days('"+lastdatadate+"')- To_days('"+installeddate+"')";
							rs9=stmt8.executeQuery(sql9);
							if(rs9.next())
							{
								life=rs9.getString(1);
							}
							if(life==null||life.length()==0|| Integer.parseInt(life)<0  )
							{
								life="0";
							}
				 }
				 else
				 {
					 life="NOT DATA ON FIELD";
					 lastdatadate="-";
					 lastdt="-";
				 }
					//*****************************
					
				if (dispdate == "" || dispdate.equals("") || dispdate == " ") {
					dispdate="-";
												}
					
				%>
				
				
				
					<tr>
						<td> <%=i%></td>
						<td><%=unitid%></td>
						<td><%=new SimpleDateFormat("dd/MM/yyyy").format(rs2.getDate("Rdate"))%></td>
						<td><%=dispdate%></td>
						<td><%=recloc%></td>
						<td><%=recby%></td>
						<td><%=installeddate%></td>							
						<td><%=dispby %></td>
						<td><%=typeoffail%></td>
						<td><%=wmsn%></td>
						<td><%=simno%></td>
						<td><%=simcompany%></td>
						<td><%=lastdt%></td>
						<td><%=pcbversion%></td>
						<td><%=powersupplyversion%></td>
						<td><%=codeversion%></td>
						<td><%=life%></td>
						
					</tr>	
				<% i++;
				   } %>
				   
				   <tfoot>
                     <tr>
                     <tr>
							<th>Sr.No</th>
							<th align="center">Unit ID</th>
							<th align="center">Received Date</th>
							<th align="center"> Dispatch Date</th>
							<th align="center">Receive From Location</th>
							<th align="center">Receive From Tech/Cust</th>
							<th align="center"> Installation Date</th>
							<th align="center">Dispatch From</th>
							<th align="center">Type Of Failure</th>
							<th align="center">WMSN Status</th>
							<th align="center">Sim Status</th>
							<th align="center">Service Provider</th>
							<th align="center">Last Data Date</th>
							<th align="center">PowerSupply Version</th>
							<th align="center">PCB Version</th>
							<th align="center">Code Version</th>
							<th align="center">Life Of Unit</th>
							
						</tr>
                     </tr>
				   </tfoot>
				</table>
				<!-- body part come here -->
						<%
						}
	} catch(Exception e) { out.println("Exception----->"+e); }

	finally
	{
	con1.close();
	con2.close();
	}
	%>

  
  
 

</body>
</html>

 		
						