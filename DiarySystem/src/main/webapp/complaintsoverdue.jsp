<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java"
	import="java.sql.*" import=" java.text.*" import=" java.util.*"
	errorPage=""%>
<%@ page import="java.util.Date"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ include file="header.jsp"%>

<%@page import="java.sql.ResultSet"%>

<%!Connection conn, conn1;
	Statement st, st1;%>
	
<html>
<head>

<title>Seven Day Diary System</title>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="style.css" type="text/css" charset="utf-8" />
<link rel="stylesheet" href="css/css.css" type="text/css"
	charset="utf-8" />
	
<style type="text/css">
@import url(jscalendar-1.0/calendar-win2k-1.css);
</style>

<script type="text/javascript" src="jscalendar-1.0/calendar.js"></script>
<script type="text/javascript" src="jscalendar-1.0/lang/calendar-en.js"></script>
<script type="text/javascript" src="jscalendar-1.0/calendar-setup.js"></script>

<link rel="stylesheet" href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css">	
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	

<!-- Export Options Links of DataTables -->

<link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.5.1/css/buttons.dataTables.min.css ">
	
<script type="text/javascript" src="datatablejs/bootstrap.js"></script>

<script src=" https://cdn.datatables.net/buttons/1.5.1/js/buttons.flash.min.js "></script>
	 
<script src=" https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js "></script>
	
<script src=" https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js "></script>
	
<script src=" https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js "></script>
	
<script src=" https://cdn.datatables.net/buttons/1.5.1/js/buttons.html5.min.js "></script>
	
<script src=" https://cdn.datatables.net/buttons/1.5.1/js/buttons.print.min.js "></script>
	
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
                        title: 'Complaints Over-due Report' +$("#thedate").val()+'-'+$("#thedate1").val(),
						
                        exportOptions: {
			                columns: [0,2,3,4,5,6,7,8]
			            },
                       
						
					},
	        		
					{
                        extend: 'pdf',
                        orientation: 'landscape',
                        pageSize: 'LEGAL',
                        title: 'Complaints Over-due Report' +$("#thedate").val()+'-'+$("#thedate1").val(),
                        exportOptions: {
			                columns: [0,2,3,4,5,6,7,8]
			            },
                     },
	        		
	                    {
	                        extend: 'csv',
	                        title: 'Complaints Over-due Report' +$("#thedate").val()+'-'+$("#thedate1").val(),
	                       
	                        exportOptions: {
				                columns: [0,2,3,4,5,6,7,8]
				            },
	                        
	                    },
	                    
	                    {
	                        extend: 'print',
	                        title: 'Complaints Over-due Report' +$("#thedate").val()+'-'+$("#thedate1").val(),
	                       
	                        exportOptions: {
				                columns: [0,2,3,4,5,6,7,8]
				            },
	                    },
	                    
	                    {
	                        extend: 'copy',
	                        title: 'Complaints Over-due Report' +$("#thedate").val()+'-'+$("#thedate1").val(),
	                       
	                        exportOptions: {
				                columns: [0,2,3,4,5,6,7,8]
				            },
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
 $(document).ready(function() {
	    $('#example1').DataTable( {
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
	                        title: 'Complaints Over-due Report ' +$("#thedate").val()+' to '+$("#thedate1").val(), 

							
	                    },
	                    {
	                        extend: 'pdf',
	                        orientation: 'landscape',
	                        pageSize: 'LEGAL',
	                        title: 'Complaints Over-due Report' +$("#thedate").val()+'-'+$("#thedate1").val(),
	                        
	                       
	                     },
	                    {
	                        extend: 'csv',
	                        title: 'Complaints Over-due Report' +$("#thedate").val()+'-'+$("#thedate1").val(),
	                       
	                    },
	                    {
	                        extend: 'print',
	                        title: 'Complaints Over-due Report' +$("#thedate").val()+'-'+$("#thedate1").val(),
	                        
	                    },
	                    {
	                        extend: 'copy',
	                        title: 'Complaints Over-due Report' +$("#thedate").val()+'-'+$("#thedate1").val(),
	                       
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

<script language="javascript">
	function fun1()
	{
		document.form1.submit();
	}	
	
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

function validate()
{
	
	var date1=document.getElementById("thedate").value;
	var date2=document.getElementById("thedate1").value;

	var dm1,dd1,dy1,dm2,dd2,dy2;
	dy1=date1.substring(0,4);
	dy2=date2.substring(0,4);
	dm1=date1.substring(5,7);
	dm2=date2.substring(5,7);
	dd1=date1.substring(8,10);
	dd2=date2.substring(8,10);

	var date=new Date();
	var month=date.getMonth()+1;
	var day=date.getDate();
	var year=date.getFullYear();
	
	if(dy1>year || dy2>year)
	{
		alert("Selected date should not be greater than Todays date (Year)");
		//document.getElementById("calender").value="";
		//document.getElementById("calender1").value="";
		//document.getElementById("calender").focus;

		return false;
	
	}
	else if(year==dy1 && year==dy2) 
	{
		if(dm1>month || dm2>month)
		{
			alert("Selected date should not be greater than Todays date (Month)");
			//document.getElementById("calender").value="";
			//document.getElementById("calender1").value="";
			//document.getElementById("calender").focus;

			return false;
		}
	}

	if(dm1==month)
	{
		if(dd1>day || dd2>day)
		{
			alert("Selected date should not be greater than Todays date (Day)");
			//document.getElementById("calender").value="";
			//document.getElementById("calender1").value="";
			//document.getElementById("calender").focus;
	
			return false;
	
		}
	}

	if(dy1>dy2)
	{
		alert("From date year should not be greater than To date year");
		//document.getElementById("data").value="";
		//document.getElementById("data1").value="";
		//document.getElementById("data").focus;

		return false;
	}
	
	else if(year==dy1 && year==dy2) 
	{
		if(dm1>dm2)
		{
			alert("From date month should not be greater than To date month");
			//document.getElementById("data").value="";
			//document.getElementById("data1").value="";
			//document.getElementById("data").focus;

			return false;
		}
	}
	
	if(dm1==dm2)
	 {
		if(dd1 > dd2)
		{
			alert("From date should not be greater than To date");
			//document.getElementById("data").value="";
			//document.getElementById("data1").value="";
			//document.getElementById("data").focus;

			return false;
		}
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

		<!-- Checking request from tech type or not, and making headers available accordingly-->

		<%
			String tech = request.getParameter("tech");
			if (tech == null) {
		%>
	<%@ include file="MenuNew.jsp"%>

		<%
			} else {
		%>
		<%@ include file="headertech.jsp"%>
		<%
			}
		%>
		<br>
	
				<!--- code start here ------>
				<form name="comoverdue" method="post" action=""
					onSubmit="return validate();">
					<%
						try {
							Class.forName(MM_dbConn_DRIVER);
							conn = DriverManager.getConnection(MM_dbConn_STRING, MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
							conn1 = DriverManager.getConnection(MM_dbConn_STRING1, MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
							st = conn.createStatement();
							st1 = conn.createStatement();

							String sql = "", sql1 = "";
							String username = "", userrole = "", today = "", olddate = "", sevdaybfre = "", msg = "";

							java.util.Date tdydte = new java.util.Date();
							Format formatter = new SimpleDateFormat("yyyy-MM-dd");
							today = formatter.format(tdydte);

							java.util.Date tdydte1 = new java.util.Date();
							long ms = tdydte.getTime();
							ms = ms - 1000 * 60 * 60 * 24 * 7;
							tdydte1.setTime(ms);

							sevdaybfre = formatter.format(tdydte1);

							String firstdate = request.getParameter("thedate");

							if (firstdate == null) {
								msg = "Complaints Over-due since last week";
							} else {
								String thedate1 = request.getParameter("thedate1");
								sevdaybfre = firstdate;
								today = thedate1;

								msg = "Complaints Over-due since "
										+ new SimpleDateFormat("dd-MMM-yyyy")
												.format(new SimpleDateFormat("yyyy-MM-dd").parse(sevdaybfre))
										+ " till " + new SimpleDateFormat("dd-MMM-yyyy")
												.format(new SimpleDateFormat("yyyy-MM-dd").parse(today));
							}
					%>

					<%-- <div class="popup" id="popupsumry">
	<table border="0" >
	<tr><td><a href='summaryrptpendingtra.jsp?tno=<%=%>&tech=<%=%>&vehno=<%=%>' onclick="toggleDetails(<%=%>,false);">Summary Report</a></td></tr>
	<tr><td><a href='summaryrptpendingtra.jsp' onclick="toggleDetails(false);">Summary Report</a></td></tr> 
	</table>
</div> --%>

					<table border="0" width="100%" align="center">
						<tr>
							<td align="center"><font color="maroon" size="2"> <b>
									<%=msg%></b> </font></td>
						</tr>
					</table>
					<table border="0" width="100%">
						<tr>
							<td><a href='Technician.jsp' onclick="toggleDetails(false);">Summary
									Report </a></td>
								
								
							<td align="right" style="padding-right:450px" >
							<input type="text" id="thedate"
								name="thedate" size="13" class="formElement"
								value="<%=sevdaybfre%>" readonly /> 
								
								<input type="button"
								name="trigger" id="trigger" value="From Date"
								class="formElement"> <script type="text/javascript">
								
             Calendar.setup(
             {
                 inputField  : "thedate",         // ID of the input field
                 ifFormat    : "%Y-%m-%d",     // the date format
                 button      : "trigger"       // ID of the button
             }
                           );
             </script> &nbsp;&nbsp;&nbsp; <input type="text" id="thedate1"
									name="thedate1" size="13" class="formElement"
									value="<%=today%>" readonly /> <input type="button"
									name="trigger1" id="trigger1" value="To Date"
									class="formElement" /> <script type="text/javascript">
             Calendar.setup(
             {
                 inputField  : "thedate1",         // ID of the input field
                 ifFormat    : "%Y-%m-%d",     // the date format
                 button      : "trigger1"       // ID of the button
             }
                           );
             </script> 
							 &nbsp;&nbsp;&nbsp;
							
							<input  type="submit" name="Submit" value="Submit" class="formElement"/></td>		
									
									</td>
						</tr>
					</table>
					<%
						if (tech == null) {
					%>




					<table id="example" class="display" style="width: 100%">
						<thead>
							<tr>
								<th>Sr.No</th>
								<th align="center">Veh Reg No</th>
								<th align="center" style="display: none;">Veh Reg No</th>
 								<th align="center">Transporter</th>
								<th align="center">Location</th>
								<th align="center">Available Date</th>
								<th align="center">Technician</th>
								<th align="center">Over-due Comment</th>
								<th align="center">Ent. By</th>
							</tr>
						</thead>
						
						

						<%
							int i = 1;
									sql = "select * from t_complaints1 where VehAvaildate >='" + sevdaybfre + "' and VehAvaildate <='"
											+ today + "' and Status in ('Allocated') ";

									ResultSet rst = st.executeQuery(sql);
									while (rst.next()) {
										String technician = "";

										sql = "select * from t_callocation1 where Tno='" + rst.getString("Tno") + "'";
										ResultSet rst1 = st1.executeQuery(sql);
										if (rst1.next()) {
											technician = rst1.getString("Technicion");
										}
						%>
						<tr>
							<td align="right"><%=i%></td>
							<td align="center"><a href="javascript:toggleDetails(<%=i%>,true);"
								title="Click Here"> <%=rst.getString("VehicleNo")%>
							</a> <br />
								<div class="popup" id="popup<%=i%>">
									<table border="0">
										<tr>
											<td><a
												href='action.jsp?tno=<%=rst.getString("Tno")%>&tech=<%=technician%>&vehno=<%=rst.getString("VehicleNo")%>'
												onclick="toggleDetails(<%=i%>,false);">Action By
													Technician</a></td>
										</tr>
										<tr>
											<td><a
												href='reallocate.jsp?tno=<%=rst.getString("Tno")%>'
												onclick="toggleDetails(<%=i%>,false);">Re-Allocate</a></td>
										</tr>
										<tr>
											<td><a href="#"
												onClick="window.open ('compoverduecmnt.jsp?vehno=<%=rst.getString("VehicleNo")%>&tno=<%=rst.getString("Tno")%>', 'win1', 'width=500, height=350, location=0, menubar=0, scrollbars=1, status=0,toolbar=0,resizable=0'); javascript:toggleDetails(<%=i%>,false);">
													Comment for Over-due </a></td>
										</tr>
										<tr>
											<td><a href="javascript:toggleDetails(<%=i%>,false)">Close</a></td>
										</tr>
									</table>

								</div></td>
							<td align="center" style="display:none"><%=rst.getString("VehicleNo")%></td>
							<td align="left"><%=rst.getString("Customer")%></td>
							<td align="left"><%=rst.getString("VehAttLoc")%></td>
							<td align="center"><%=new SimpleDateFormat("dd/MM/yyyy").format(rst.getDate("VehAvaildate"))%></td>
							<td align="left"><%=technician%></td>
							<td align="left"><%=rst.getString("CompOverdueCmnt")%></td>
							<td align="left"><%=rst.getString("RegBy")%></td>
						</tr>
						<%
							i++;
									}
						%>
						<tfoot>
						<tr>
								<th>Sr.No</th>
								<th align="center">Veh Reg No</th>
								<th align="center">Transporter</th>
								<th align="center">Location</th>
								<th align="center">Available Date</th>
								<th align="center">Technician</th>
								<th align="center">Over-due Comment</th>
								<th align="center">Ent. By</th>
							</tr>
						</tfoot>
					</table>
					
					<%
						} else {
								String techname = session.getValue("DisplayName").toString();
					%>
					
						
						
					<table id="example1" class="display" style="width: 100%">
						<thead>
							<tr>
								<th>Sr.No</th>
								<th align="center">Veh Reg No</th>
								<th align="center">Transporter</th>
								<th align="center">Location</th>
								<th align="center">Available Date</th>
								<th align="center">Ent. By</th>
							</tr>
						</thead>
						
						
						<%
							int i = 1;
									//sql="select * from t_complaints1 where VehAvaildate >='"+sevdaybfre+"' and VehAvaildate <='"+today+"' and Status in ('Allocated') ";

									sql = "select b.VehicleNo,a.Customer,b.VehAttLoc,a.VehAvaildate,b.RegBy,a.Technicion from db_CustomerComplaints.t_callocation1 a, db_CustomerComplaints.t_complaints1 b where a.Technicion='"
											+ techname + "' and a.Status <> 'Solved' and a.VehAvaildate >= '" + sevdaybfre
											+ "' and a.VehAvaildate <=  '" + today + "' and a.Tno=b.Tno order by a.VehAvaildate desc";

									ResultSet rst = st.executeQuery(sql);
									while (rst.next()) {
						%>
						<tr>
							<td><%=i%></td>
							<td><%=rst.getString("b.VehicleNo")%></td>
							<td><%=rst.getString("a.Customer")%></td>
							<td><%=rst.getString("b.VehAttLoc")%></td>
							<td><%=new SimpleDateFormat("dd-MMM-yyyy").format(rst.getDate("a.VehAvaildate"))%></td>
							<td><%=rst.getString("b.RegBy")%></td>
						</tr>
						<%
							i++;
									}
						%>
						
						<tfoot>
						<tr>
								<th>Sr.No</th>
								<th align="center">Veh Reg No</th>
								<th align="center">Transporter</th>
								<th align="center">Location</th>
								<th align="center">Available Date</th>
								<th align="center">Ent. By</th>
							</tr>
						</tfoot>
						
					</table>
					</form>
					
					<input type="hidden" name="tech" value="Yes" />
					<%
						}

						} catch (Exception e) {
							out.print("Exception -->" + e);

						} finally {
							conn.close();
							conn1.close();

						}
					%>
					

					<!-- code end here --->
			</div>
	<%@ include file="footer.jsp"%>

</body>
</html>
