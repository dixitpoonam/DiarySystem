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

<%! 
Connection conn,conn1;
Statement st,st1,st2,st3,st4,st5,strec;
String sql,sql1,sql2,sql3,sql4,today,olddate,username,userrole,today1;
String fromdate,todate,veh1,code1,dt1;
int Ocount;
int days=0;
%>


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
	                        title: 'Unit Replacement Report' +$("#data").val()+'-'+$("#data1").val(), 

							
	                    },
	                    {
	                        extend: 'pdf',
	                        orientation: 'landscape',
	                        pageSize: 'LEGAL',
	                        title: 'Unit Replacement Report' +$("#data").val()+'-'+$("#data1").val(),
	                        
	                       
	                     },
	                    {
	                        extend: 'csv',
	                        title: 'Unit Replacement Report' +$("#data").val()+'-'+$("#data1").val(),
	                       
	                    },
	                    {
	                        extend: 'print',
	                        title: 'Unit Replacement Report' +$("#data").val()+'-'+$("#data1").val(),
	                        
	                    },
	                    {
	                        extend: 'copy',
	                        title: 'Unit Replacement Report' +$("#data").val()+'-'+$("#data1").val(),
	                       
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
	            { "sType": "date-uk" },
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

		<%
java.util.Date defoultdate = new java.util.Date();
Format formatter = new SimpleDateFormat("yyyy-MM-dd");
today = formatter.format(defoultdate);
String s=formatter.format(defoultdate);
long miliseconds=defoultdate.getTime();
miliseconds=miliseconds +7000 * 60 * 60 *24;
defoultdate.setTime(miliseconds);
olddate=formatter.format(defoultdate);
Ocount=0;
try
{
	Class.forName(MM_dbConn_DRIVER);
	conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	st=conn.createStatement();
	st1=conn.createStatement();
	st2=conn1.createStatement();
	st3=conn1.createStatement();
	st4=conn1.createStatement();
	strec=conn.createStatement();
	fromdate=request.getParameter("calender");
	todate=request.getParameter("calender1");
	if(null==fromdate)
	{
		
		fromdate=today;
		todate=today;
	}
	
	%>
	
		<%

	
	
	ResultSet rs1=null,rs2=null, rs3=null, rs4=null, rs5=null, rs6=null,rs7=null,rs8=null,rs9=null,rs10=null,rs11=null;
	String sql1="",sql2="", sql3="", sql4="", sql5="", sql6="",sql7="",sql8="",sql9="",sql10="",sql11="";
	String data="",data1="",vendor="",Statustype="",technician="";
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


		<table width="750px" align="center">
			<tr>
				<td>
					<table border="0" width="100%">
						<tr>
							<td align="center"><font color="" size="3">
									Unit Replacement Report For No Warranty Vehicles <%=datex1%> To <%=datex2%>
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
			
						
					
					<table id="example" class="display" style="width: 100%">
					<thead>
						<tr>
							<th>Sr.No</th>
							<th align="center">Veh Reg No</th>
							<th align="center">Transporter</th>
							<th align="center">Replace Date</th>
							<th align="center">Old Unit</th>
							<th align="center">New Unit</th>
							<th align="center">Peripheral</th>
							<th align="center">Replace Place</th>
							<th align="center">Replace By</th>
							<th align="center">Warranty</th>
							<th align="center">Old Unit Damaged</th>
							<th align="center">Received Status</th>
							<th align="center">Quick Test</th>
							<th align="center">Test Date</th>
							<th align="center">SW Comment</th>
							<th align="center">SW DebitNote</th>
							<th align="center">Physical Damage</th>
							<th align="center">Correction Done</th>
							<th align="center">GPS Antenna Ok</th>
							<th align="center">Power Supply Fail</th>
						</tr>
					</thead>
					<tbody>
					
					
					
						
				<!-- till here -->	
					<%

					sql = "select * from t_unitreplacement where InstDate between '"+dt+"' and '"+dt1+"' and InstType = 'rep'";
					//sql = "select * from t_unitreplacement where InstDate between '"+fromdate+"' and '"+todate+"' ";
					int i=1;
					ResultSet rst=st2.executeQuery(sql);
					while(rst.next())
					{ 
						//System.out.println("in while loop");
						veh1 = rst.getString("VehRegNo");
						java.util.Date repdate=rst.getDate("EntDate");
						sql1 = "select * from t_vehicledetails where VehicleRegNumber='"+rst.getString("VehRegNo")+"'";
						ResultSet rst1=st3.executeQuery(sql1);
							while (rst1.next())
							{
								java.util.Date instdate=rst1.getDate("InstalledDate");
								sql2="select (TO_DAYS('"+repdate+"')-TO_DAYS('"+instdate+"'))";
								ResultSet rst2=st4.executeQuery(sql2);
								if(rst2.next())
								{
									days=rst2.getInt(1);
							        	if(days > 365)
											{
							        		
							        			sql3="select * from hwunittest where UnitID='"+rst.getString("OldUnitID")+"' and Custdb='"+rst1.getString("OwnerName")+"' and TheDate >= '"+rst.getString("EntDate")+ "' ";
							        			ResultSet rst11=st.executeQuery(sql3);
							        		if(rst11.next())
							        		{
					%>
						<tr>
						
							<td align="right"> <%=i %> </td>
							<td align="center"> <%=rst1.getString("VehicleRegNumber")%></td>
							<td align="left">  <%=rst1.getString("OwnerName") %></td>
							<td align="center"> <%=new SimpleDateFormat("dd/MM/yyyy").format(rst.getDate("EntDate"))%></td>
							<td align="right"> <%=rst.getString("OldUnitID") %></td>
							<td align="right"> <%=rst.getString("NewUnitID") %></td>
							<td align="left"> <%=rst.getString("TypeUnit") %></td>
							<td align="left"> <%=rst.getString("InstPlace") %></td>
							<td align="left"> <%=rst.getString("InstBy") %></td>
							
							<td align="center"><%= new SimpleDateFormat("dd/MM/yyyy").format(rst1.getDate("InstalledDate"))%></td>
							<td align="left"> <%=rst.getString("OldUnitDamaged") %></td>
							
							<%
							try{
							String sqlrec="select * from t_unitreceived where Rdate >='"+rst.getString("EntDate")+"' and UnitID='"+rst.getString("OldUnitID")+ "' ";
							ResultSet rsrec=strec.executeQuery(sqlrec);
							if(rsrec.next())
							{
							%>
								<td align="left"><b><font color="Red">YES</font></b></td>
							<%	
							}
							else
							{
							%>
								<td align="left"><b><font color="Red">NO</font></b></td>
							<%	
							}
							}catch(Exception e)
							{
								%>
								<td align="left"><b><font color="Red">-</font></b></td>
							<%	
							}
							
								
							%>
							
							
							
							<td align="left"><a href="quicktest.jsp?uid=<%=rst.getString("OldUnitID")%>&trpt=<%=rst1.getString("OwnerName") %>&dt=<%=rst.getString("EntDate")%>&vrn=<%=rst1.getString("VehicleRegNumber")%>&on=<%=rst1.getString("OwnerName") %>"><font color="Red" size="2"> Done</font></a>	
							</td>
						<!-- change 30 -->
						
							<td align="center"> <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rst11.getString("TheDate"))) %></td>
							<td align="left" ><%=rst11.getString("SWComment") %></td>	
							<td align="left"><%=rst11.getString("SWDebitNote") %></td>		
							<td align="left"><%=rst11.getString("Physicaldamage") %></td>
							<td align="left"><%=rst11.getString("Correctiondone") %></td>
							<td align="left"> <%=rst11.getString("GPSAnt") %></td>
							<td align="left"> <%=rst11.getString("PowerSuppFail") %></td>
							
						<!-- till here -->	
							
						</tr>
					<%	i++;
														}
														else
													{
														%>
							<tr>                                                         
						
							<td align="right"> <%=i %> </td>
							<td align="center"> <%=rst1.getString("VehicleRegNumber")%></td>
							<td align="left"> <%=rst1.getString("OwnerName") %></td>
							<td align="center"> <%=new SimpleDateFormat("dd/MM/yyyy").format(rst.getDate("EntDate"))%></td>
							<td align="right"> <%=rst.getString("OldUnitID") %></td>
							<td align="right"> <%=rst.getString("NewUnitID") %></td>
							<td align="left"> <%=rst.getString("TypeUnit") %></td>
							<td align="left"> <%=rst.getString("InstPlace") %></td>
							<td align="left"> <%=rst.getString("InstBy") %></td>
							<td align="center"><%=new SimpleDateFormat("dd/MM/yyyy").format(rst1.getDate("InstalledDate"))%></td>
							
							<td align="left"> <%=rst.getString("OldUnitDamaged") %></td>
							
							<%
							try{
							String sqlrec="select * from t_unitreceived where Rdate >='"+rst.getString("EntDate")+"' and UnitID='"+rst.getString("OldUnitID")+ "' ";
							ResultSet rsrec=strec.executeQuery(sqlrec);
							if(rsrec.next())
							{
							%>
								<td align="left"><b><font color="Red">YES</font></b></td>
							<%	
							}
							else
							{
							%>
								<td align="left"><b><font color="Red">NO</font></b></td>
							<%	
							}
							}catch(Exception e)
							{
								%>
								<td align="left"><b><font color="Red">-</font></b></td>
							<%	
							}
							
								
							%>
							
							
							<td><a href="quicktest.jsp?uid=<%=rst.getString("OldUnitID")%>&trpt=<%=rst1.getString("OwnerName") %>&dt=<%=rst.getString("EntDate")%>&vrn=<%=rst1.getString("VehicleRegNumber")%>&on=<%=rst1.getString("OwnerName") %>"> Not Done</a> 
							</td>
				
							<!-- change 30 -->
						
							<td>-</td>
							<td>-</td>	
							<td>-</td>		
							<td>-</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
							
						<!-- till here -->
						
						</tr>
													<%	i++;
													}
													
													
							        		
													}	
											}
								}
							
					}
					%>
					</tbody>
					<tfoot>
					<tr>
							<th>Sr.No</th>
							<th align="center">Veh Reg No</th>
							<th align="center">Transporter</th>
							<th align="center">Replace Date</th>
							<th align="center">Old Unit</th>
							<th align="center">New Unit</th>
							<th align="center">Peripheral</th>
							<th align="center">Replace Place</th>
							<th align="center">Replace By</th>
							<th align="center">Warranty</th>
							<th align="center">Old Unit Damaged</th>
							<th align="center">Received Status</th>
							<th align="center">Quick Test</th>
							<th align="center">Test Date</th>
							<th align="center">SW Comment</th>
							<th align="center">SW DebitNote</th>
							<th align="center">Physical Damage</th>
							<th align="center">Correction Done</th>
							<th align="center">GPS Antenna Ok</th>
							<th align="center">Power Supply Fail</th>
						</tr>
					</tfoot>
									
						
					
					
					<table border="2" width="750px" align="center" class="sortable">
										
					<tr>
					<td olspan="13"><font color="red"><b>Total Replacement</b></font></td>
					<td><font color="red"><b><% --i; %> <%=i%></b></font></td>
					
					
					</tr>					
					</table>	
					</table>
					<br>
					<br>
	<%
	
//
}catch(Exception e)
{
	out.print("Exception -->"+e);
	System.out.print("Exception -->"+e);
}
finally
{
	conn.close();
	conn1.close();

}
%>
		
		</table>

<!-- code end here --->

 		
  
  <%@ include file="footer.jsp"%>

</body>
</html>
		
		