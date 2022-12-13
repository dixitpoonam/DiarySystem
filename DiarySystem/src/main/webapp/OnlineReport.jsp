<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java"
	import="java.sql.*" import=" java.text.*" import=" java.util.*"
	errorPage=""%>
<%@ page import="java.util.Date"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ include file="header.jsp"%>

<%@page import="java.sql.ResultSet"%>


<html>
<head>

<title>Seven Day Diary System</title>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="style.css" type="text/css" charset="utf-8" />
<link rel="stylesheet" href="css/css.css" type="text/css"
	charset="utf-8" />


<style>
.popup {
	background-color: #98AFC7;
	position: absolute;
	visibility: hidden;
}
</style>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript"
	src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>


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
	        		
	        		text: 'Export',
	        		buttons: [
	        			{
	                        extend: 'excel',
	                        title: 'Online Vehicle Report ', 

							 exportOptions: {
					                columns: [0,1,2,4,5,6,7,8,9,10,11,12,13,14]
					            },
	                        
	                    },
	                    {
	                        extend: 'pdf',
	                        orientation: 'landscape',
	                        pageSize: 'LEGAL',
	                        title: 'Online Vehicle Report ', 
	                        
	                        exportOptions: {
				                columns: [0,1,2,4,5,6,7,8,9,10,11,12,13,14]
				            },
	                     },
	                    {
	                        extend: 'csv',
	                        title: 'Online Vehicle Report ', 
	                        exportOptions: {
				                columns: [0,1,2,4,5,6,7,8,9,10,11,12,13,14]
				            },
	                    },
	                    {
	                        extend: 'print',
	                        title: 'Online Vehicle Report ', 
	                        exportOptions: {
				                columns: [0,1,2,4,5,6,7,8,9,10,11,12,13,14]
				            },
	                    },
	                    {
	                        extend: 'copy',
	                        title: 'Online Vehicle Report ', 
	                        exportOptions: {
				                columns: [0,1,2,4,5,6,7,8,9,10,11,12,13,14]
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

<script language="javascript">
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
function toggleDetails1(id, show)
{
	var popupx = document.getElementById("popupx"+id);
	if (show) {
		popupx.style.visibility = "visible";
		popupx.setfocus();
		
	} else {
		popupx.style.visibility = "hidden";
	}
}
 function showtextarea(a,b,c)
{
	document.getElementById("div"+a).innerHTML="<form action='callinfo.jsp' method='get'><TEXTAREA name='callinfo' id='callinfo'class='formElement'></TEXTAREA><br><input type='Submit' name='Submit' value='Submit' class='formElement'><input type='button' value='Cancel' onclick='canceldiv("+a+");' class='formElement'><br><input type='hidden' name='rname' value='"+b+"'><br><input type='hidden' name='transporter' value='"+c+"'><br><input type='hidden' name='pagename' value='currentdata.jsp'></form>";
}
function canceldiv(A)
{
	document.getElementById("div"+A).innerHTML="<a href='javascript:showtextarea("+A+");'>Edit</a>";
}
</script> 

</head>


<body style="background-color: #FFFFFF;">
	
		<%@ include file="MenuNew.jsp"%> 
		
	<div id="gbox1" style="width: 100%; margin-top: 20px; margin-left: 0;">
		<div id="gbox-top1"></div>
		<div id="gbox-bg1">
  
   <div id="gbox-grd1"></div>

		</div>
		<table border="0" width=750px bgcolor="" align="center">
			<tr>
				<td>
					<table border="0" width=750px>
						<tr>
							<td align="center"><font color="black" size="3">Online
									Vehicle Report</font></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<br>

		<%
					try{
						
						Class.forName(MM_dbConn_DRIVER);
		                Connection con1,conn1=null;
						con1 = DriverManager.getConnection(MM_dbConn_STRING, MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
						conn1 = DriverManager.getConnection(MM_dbConn_STRING1, MM_dbConn_USERNAME, MM_dbConn_PASSWORD);

						
						Statement smt = con1.createStatement();
						Statement stmt = con1.createStatement();
						Statement stmt1 = con1.createStatement();
						Statement stmt2 = con1.createStatement();
						Statement stmt3 = con1.createStatement();
						Statement stmt4 = con1.createStatement();
						Statement stmt5 = con1.createStatement();
						Statement stmt6 = con1.createStatement();
						Statement stmt7 = con1.createStatement();
						Statement stmt8= con1.createStatement();
						Statement stmt9= con1.createStatement();
						Statement stmt10= con1.createStatement();
						Statement stmt11= con1.createStatement();
						Statement stmt12= con1.createStatement();
						Statement stmt13= con1.createStatement();
						Statement stt = conn1.createStatement();
						Statement stwar3 = con1.createStatement();


						
						ResultSet res = null;
						ResultSet res1 = null;
						ResultSet res2 = null;
						ResultSet res3 = null;
						ResultSet res4 = null;
						ResultSet res5 = null;
						ResultSet res6 = null;
						ResultSet res7 = null;
						ResultSet res8 = null;
						ResultSet res9 = null;
						ResultSet res10 = null;
						ResultSet res11 =null;
						ResultSet res12 = null;
						ResultSet res13 =null;
						
						
						int num=0;
						int num1=0;
						int num2=0;
						int num3=0;
						
					    
					   %>

		<div>
                
                 
    <table id="example" class="display" style="width: 100%">
				<thead>
					<tr>
						<th>Sr.No</th>
						<th align="center">Unit ID</th>
						<th align="center">Customer Name</th>
						<th align="center">Vehicle No</th>
						<th align="center" style="display: none;">Vehicle No</th>
						<th align="center">User Name</th>
						<th align="center">User Mobile Number</th>
						<th align="center">User email id</th>
						<th align="center">State</th>
						<th align="center">City</th>
						<th align="center">Updated Date Time</th>
						<th align="center">Last attended</th>
						<th align="center">Last Call</th>
						<th align="center">Last Allocation</th>
						<th align="center">Provider</th>

					</tr>
				</thead>
				<tbody>
					
			<%
					
        	 int i=1;
        	 String veh="";
        	 String vehreg="";
        	 String owner="";
        
        	String sql1="select distinct(vehiclecode) from db_gps.t_onlinedata where thedate =DATE(now())and vehiclecode in (select distinct(vehiclecode) from db_gps.t_vehicledetails where status='-' and ownername in (select distinct(TypeValue) from db_gps.t_transporter where OperationalStatus='Active')) order by transporter";
        	
        	res1 = stmt1.executeQuery(sql1);
        	while(res1.next())
        	{
        
        		veh=res1.getString("vehiclecode");
        		System.out.println("Vechile code " + veh);
        		
        
        	String sql2="select VehicleRegNumber, OwnerName,unitid from  db_gps.t_vehicledetails where vehiclecode='"+veh+"' ";
        	System.out.println(sql2);
        	res2 = stmt2.executeQuery(sql2);
        	if(res2.next())
        	{
        		vehreg=res2.getString("VehicleRegNumber");
        		System.out.println("regno " + vehreg);
        		owner=res2.getString("OwnerName");
        		System.out.println("Owner " + owner);
        	}    
        	
        	String username="";
        	String fname="";
        	String lname="";
        	String email="";
        	String mobno="";
        	
        	String sql3="select FirstName,LastName,MobNo,Email from db_gps.t_userdetails where vehid='"+veh+"' order by UpdatedDate desc limit 1";
        			res3 =stmt3.executeQuery(sql3);
        			if(res3.next())
        			{
        				fname=res3.getString("FirstName");
        				lname=res3.getString("LastName");
        				username=fname+" "+lname;
        				email=res3.getString("Email");
        				mobno=res3.getString("MobNo");
        				
               				
        				System.out.println("username " + username);
	
        			}else{
        				username = "-";
        				email = "-";
        				mobno = "-";
        			}

        			String Unit="";
        			String sql4="select unitid from db_gps.t_vehicledetails where vehiclecode='"+veh+"' ";
        			System.out.println("sqlllll " + sql4);
        			res4=stmt4.executeQuery(sql4);
        			if(res4.next())
        			{
        				Unit=res4.getString("unitid");
       
        		     }
        			else{
        				Unit="-";
        			}
        			System.out.println("unit " + Unit);
        			
        			String serviceProvider="";
        			
        			String sql5="select SimCompany from db_gps.t_unitmaster where UnitID='"+Unit+"' ";
        			res5=stmt5.executeQuery(sql5);
        			if(res5.next())
        			{
        				serviceProvider=res5.getString("SimCompany");
        			}else{
        				serviceProvider="-";
        			}
        			System.out.println("service provider " + serviceProvider);
        			

					 String state="";
					 String city="";
					 String sql11="select State,City from  db_gps.t_VehMst where VehId='"+ veh +"'";
					 System.out.println("sql11 " + sql11);
					 res11 = stmt11.executeQuery(sql11); 
					 
				    if(res11.next())
					{
						state=res11.getString("State");
						city=res11.getString("City");
						System.out.println("State " + state + "City" + city);
					}else
					{
						state="-";
						city="-";
					}
       			

        	
        			
        			String datetime="";
        	        String location="";
        			String dtnew="";
       
         			String sql6="select CONCAT(TheDate,' ',TheTime) as DateTime,Location from db_gps.t_onlinedata where vehiclecode='"+veh+"' ";
                    System.out.println("sql6 " + sql6);
        			res6=stmt6.executeQuery(sql6);
        			if(res6.next()){
        				
        				
        					
        				datetime=res6.getString("DateTime");
        				System.out.println("datetime" + datetime);
        				location=res6.getString("Location");
        				System.out.println("loc" + location);
        			}
        			else{
        				datetime="-";
        				location="-";
        			}
        			
        			dtnew = new SimpleDateFormat("d-MMM-yyyy HH:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(datetime));
        			System.out.println("date new"+dtnew);        			
        			
        			
        			String Callid="";
        			        			
        		   String sql7="select calllogid from db_CustomerComplaints.t_calllogvehlist where vehcode='"+veh+"' order by Srno desc limit 1";
        		   System.out.println("sql7 " + sql7);
        		   res7=stmt7.executeQuery(sql7);
        		   if(res7.next())
        		   {
        			   Callid=res7.getString("calllogid");
        			   System.out.println("Call id " + Callid);
        		   }   
        		   
        		   String Dt="";
        		   String nm="";
        			   String sql8="select TheDate, TheTime  from db_CustomerComplaints.t_callinformation where Sr= '" + Callid + "' and CallType='OutGoing'";
            		   System.out.println("sql8" + sql8);
            		   res8=stmt8.executeQuery(sql8);
    
            		   
            		   if(res8.next()){
            			   
            			   Dt=res8.getString("TheDate");
            			   nm=res8.getString("TheTime");
            		   }else{
            			   Dt="-";
            			   nm="-";
            		   }
       
        		   
        		    String tickno="";
        		    String sql9="select Tno from t_complaints1 where VehicleNo='"+vehreg+"' order by Tno desc limit 1";
        			res9=stmt9.executeQuery(sql9);
        			
        			System.out.println("Ticket sql9 " + sql9);
        			
        			if(res9.next()){
        				
     
        				tickno=res9.getString("Tno");
        				System.out.println("Ticket Number " + tickno);
        		
        			}
        			    String  allocdate="";
        			    
        			    String ReAllocate="select NewAvailableDate from t_reallocated where Tno='"+tickno+"'";
        			    ResultSet rsReAllocate=stmt10.executeQuery(ReAllocate);
        			    
        			    if(rsReAllocate.next())
        			    {
        			    	allocdate=rsReAllocate.getString("NewAvailableDate");
        			    }else{
        				String sql10="select DofAllocation from t_callocation1 where Tno='"+tickno+"' and DofAllocation >='"+ datetime +"' order by DofAllocation desc limit 1 ";
        			    res10=stmt10.executeQuery(sql10);
        			
        			    System.out.println("Ticket sql10 " + sql10);
        			    
        				if(res10.next())
        				{
        					
        					allocdate=res10.getString("DofAllocation");
        					System.out.println("Date Of Allocation " + allocdate);
        					
        				}		
        				else{
        					allocdate="-";
        				}
        				
        			
        			    }
        			      
        			          		
						 String Date="";
						 if(nm.equals("-")){
							 Date=" -"; 
						 }
						 if(Dt.equals("-")){
							 Date=" -";
						 }
						 else{
							 String dt2 = new SimpleDateFormat("dd-MMM-yyyy")
										.format(new SimpleDateFormat("yyyy-MM-dd").parse(Dt));
							 Date=dt2+" "+nm;
						 }
        			    
						 /*LASt Allocation */
        			    String DoA = "";
						
						 if(allocdate.equals("-"))
						 {
							 DoA = " Not Allocated ";
						 }else
						 {
							 DoA = "Allocated on " + (new SimpleDateFormat("dd-MMM-yyyy")
										.format(new SimpleDateFormat("yyyy-MM-dd").parse(allocdate))); 
						 }
						 
						 
						//==========//
						  String transporter = "All Transporter";
						    
						    String tctegory = "";
							String tid = "";

							String sqltct = "select * from db_gps.t_livetickettest where vehid ='"
									+ veh + "' ";
							ResultSet tct = stwar3.executeQuery(sqltct);
							System.out.println(">>>sqlbt>>>>*******" + sqltct);
							if (tct.next()) {

								tctegory = tct.getString("tcategory");
								tid = tct.getString("tid");

							} else {
								tctegory = "-";
								tid = "-";
							}
							
							//==========//
						 
						 /*for Special Comment */
                         /* String sql11="select distinct(vehiclecode),Thedate,unitid,VehicleRegNo,Transporter from db_gps.t_onlinedata where thedate!=DATE(now())  and vehiclecode in (select distinct(vehiclecode) from db_gps.t_vehicledetails where status='-' and ownername in (select distinct(TypeValue) from db_gps.t_transporter where OperationalStatus='Active')) order by Transporter";						
						 String vechno="";
			             String vecCode="";
			             String datee="";
			             String spccmnt="";
			             System.out.println("Sql 11 " + sql11);
						res11 = stmt11.executeQuery(sql11); 
						
						while(res11.next())
						{
						       vechno=res11.getString("VehicleRegNo");
				              vecCode=res11.getString("vehiclecode");
				              datee=res11.getString("Thedate");

				             System.out.println("vechnoo " + vechno);
				             System.out.println("vechcode " + vecCode);
				             System.out.println("date " + datee);

						
						
						
						String sql12="select * from db_CustomerComplaints.t_techspecialrep where VehId='" + vecCode + "' and EntDateTime >='" + datee + "'  and Closed='No' order by SrNo desc  limit 1"; 
						System.out.println("Sqll 12 " + sql12);
						res12=stmt12.executeQuery(sql12);
						if(res12.next())
						{
							spccmnt=res12.getString("SpComment");
						    System.out.println("Special Comment " + spccmnt);	
							}
						else{
					     spccmnt="-";
						}

					}
 */         			
        	%>


					<tr>
						<td style="text-align: right"><%=i%></td>
						<td style="text-align: right"><%=Unit%></td>
						<td style="text-align: left"><%=owner%></td>


						<td style="text-align: right"><a
							href="javascript:toggleDetails(<%=i%>,true);" title="Click Here"><%=vehreg%>
						</a> <br />
							<div class="popup" id="popup<%=i%>">
								<table border="0">
									<tr>
									<tr>
										<td><a
											href="addcomplaint.jsp?vid=<%=veh%>&tid=<%=tid %>&category=<%=tctegory %>"
											onclick="toggleDetails(<%=i%>,false);">Allocate</a></td>
									</tr>


									<td><a
										href="sendmail.jsp?vehno=<%=vehreg%>&tid=<%=tid%>&category=<%=tctegory%>&unitid=<%=Unit%>&transp=<%=transporter%>"
										onclick="toggleDetails(<%=i%>,false);">Send Mail</a></td>
									</tr>
									<tr>
										<td><a href="javascript:toggleDetails(<%=i%>,false);">Close</a></td>
									</tr>
								</table>
							</div></td>


                      <td style="text-align: left; display: none;"><%=vehreg%></td>

						<td style="text-align: left"><%=username%></td>
						<td style="text-align: right"><%=mobno%></td>
						<td style="text-align: left"><%=email%></td>
						<td style="text-align: left"><%=state%></td>
						<td style="text-align: left"><%=city%></td>
						<td style="text-align: right"><%=dtnew%></td>
						<td style="text-align: right">
							<%
												String d11 = "N.A";

																String sql = "select * from t_unitreplacement where VehRegNo='"
																			+ vehreg	
																			+ "' and VehRegNo not in('-','0','0000') and InstType='Rep'  order by InstDate desc";
																	ResultSet rsgett = stt.executeQuery(sql);
																	if (rsgett.next()) {

																		d11 = rsgett.getString("InstDate");
																		if (d11 == "0000-00-00" || d11 == "-") {
																			out.print(d11);
																		} else {
																			String d2 = new SimpleDateFormat("dd-MMM-yyyy")
																					.format(new SimpleDateFormat("yyyy-MM-dd").parse(d11));
																			out.print(d2);
																		}
																	} else {
																		out.print(d11);
																	}
											%>
											
						</td>

						<td style="text-align: right"><%=Date%></td>
						<td style="text-align: right"><%=DoA%></td>
						<td style="text-align: left"><%=serviceProvider%></td>

</tr>

					<%
					
		i++;
			}
		
	    }
		catch(Exception p)
		{
			System.out.println("Exception " + p);
		}
		%>
					</tbody>
	<tfoot>
			
					<tr>
						<th>Sr.No</th>
						<th align="center">Unit ID</th>
						<th align="center">Customer Name</th>
						<th align="center">Vehicle No</th>
						<th align="center" style="display: none;">Vehicle No</th>
						<th align="center">User Name</th>
						<th align="center">User Mobile Number</th>
						<th align="center">User email id</th>
						<th align="center">State</th>
						<th align="center">City</th>
						<th align="center">Updated Date Time</th>
						<th align="center">Last attended</th>
						<th align="center">Last Call</th>
						<th align="center">Last Allocation</th>
						<th align="center">Provider</th>


					</tr>
				</tfoot>
			</table>
		</div>
		<%@ include file="footer.jsp"%>	
</body>
</html>

