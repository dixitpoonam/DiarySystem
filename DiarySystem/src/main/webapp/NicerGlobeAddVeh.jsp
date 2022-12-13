<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java"
	import="java.sql.*" import=" java.text.*" import=" java.util.*"
	errorPage=""%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>

<%@ page contentType="text/html; charset=iso-8859-1" language="java"
	import="java.sql.*" import=" java.text.*" import=" java.util.*"
	errorPage=""%>
	
<%@include file="header.jsp"%>
<%@page import="java.sql.ResultSet"%>

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

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

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
	                        title: 'All Transporters List Report ', 
	                        exportOptions: {
	                        	 columns: [0,1,2,4,5]
	                        }

							
	                    },
	                    {
	                        extend: 'pdf',
	                        orientation: 'landscape',
	                        pageSize: 'LEGAL',
	                        title: 'All Transporters List Report', 
	                        exportOptions: {
	                        	 columns: [0,1,2,4,5]
	                        }
	                       
	                     },
	                    {
	                        extend: 'csv',
	                        title: 'All Transporters List Report', 	 
	                        exportOptions: {
	                        	 columns: [0,1,2,4,5]
	                        }
	                    },
	                    {
	                        extend: 'print',
	                        title: 'All Transporters List Report',
	                        exportOptions: {
	                        	 columns: [0,1,2,4,5]
	                        }
	                    },
	                    {
	                        extend: 'copy',
	                        title: 'All Transporters List Report',
	                        exportOptions: {
	                        	 columns: [0,1,2,4,5]
	                        }
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


</head>

<body style="background-color: #FFFFFF;">
<%@ include file="MenuNew.jsp"%>

<%!
Connection conn;
%>
<%

final String userName=session.getAttribute("username").toString();
System.out.println("in connection created");	
	final String userRole=session.getAttribute("userrole").toString();
	System.out.println("in connection created");	
	String transporterlist=session.getAttribute("TransporterList").toString();

	//final String us1=userName.toUpperCase();
	System.out.println("in connection created");	
	Class.forName(MM_dbConn_DRIVER);
	conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	Statement st=conn.createStatement();
	Statement st1=conn.createStatement();
	Statement st2=conn.createStatement();
	//String selectedvalue="";
	
	String Status=request.getParameter("status");
	if(Status==null){
		Status="All";
	}
	
	System.out.println("in connection created");	
%>

<form action="" method="post">
<table border="0" width="750px" bgcolor="" align="center">
	<tr bgcolor=""><td align="center"><font color="#2A0A12" size="3">TRANSPORTERS VEHICLE LIST</font></td></tr>
	<tr> 
		<td>
			<div align="center"><font color="red"><B><I>Note:</I></B>Select Transporter whose vehicle you want to add/remove from  Nicer Globe.</font></div>
		</td>
	</tr>
	<tr> 
		<td>
			<font size="3">Transporter</font>
			<select id="status" name="status" style="width:100px; height: 30px" >                                
                                
                               
                                       <%
                                       String sql1="";
                                        sql1 = "select distinct(TypeValue) from db_gps.t_transporter where OperationalStatus='Active' order by TypeValue";
                                        System.out.println("The query is :"+sql1);
                                         ResultSet rs1 = st1.executeQuery(sql1);
                                         while(rs1.next())
                                          { %>
                                          <option value="<%=rs1.getString("TypeValue") %>" ><%=rs1.getString("TypeValue")%></option>
                                         <%  }%>
    
                            </select>
                            
                             <button type="submit" value="Submit">Submit</button>
		</td>
	</tr>	
	</table>
</form>

<script>
const mySel = document.getElementById("status"); 
mySel.addEventListener("change",function() 
		{ 
			localStorage.setItem("selValue",this.value); // save it 
		}); 

let val = localStorage.getItem("selValue"); 
if (val) 
	mySel.value=val; // set the dropdown 
    // trigger the change in case there are other events on the select 
mySel.onchange(); 
</script>


<table id="example" class="display" style="width: 100%">
<thead>
<tr>
<th>Sr</th>
<th>Asset ID</th>
<th>UnitID</th>
<th>Action</th>
<th>Updated</th>
<th>Location</th>
</tr>
</thead>
<tbody>
<%
String Svehlist="(0";
String veh_code="", location="", veh_reg_no = "", updated = "", unit_id = "",time="",ng_status="",status="";
java.util.Date dt=null;
String Lat="",Lon="";

String typevalue=request.getParameter("status");

String SqlVehList="select * from db_gps.t_vehicledetails where OwnerName='"+typevalue+"'";
System.out.println("vehlist sql:-->" + SqlVehList);
ResultSet res1 = st.executeQuery(SqlVehList);
while (res1.next()){
	veh_code = res1.getString("VehicleCode");
	Svehlist=Svehlist+",'"+veh_code+"'"; //adding each vehicle code to string list
}
Svehlist += ")";    //This consists of  list of all vehicle codes under a transporter


String sqldata="select distinct(a.vehiclecode) as VehicleCode,b.thedate,b.thetime,b.UnitID,b.Location,b.geofencelat,b.geofencelon,a.VehicleRegNumber from  db_gps.t_vehicledetails  a , db_gps.t_onlinedata b where a.vehiclecode=b.Vehiclecode and a.VehicleCode in "+Svehlist+" order by thedate desc,thetime desc";
System.out.println("main sql:-->"+sqldata);
ResultSet res2 =st1.executeQuery(sqldata);
int i=1;
while(res2.next())
{
  dt = 	res2.getDate("TheDate");
  time = res2.getString("TheTime");
  updated = new SimpleDateFormat("dd-MMM-yyyy").format(dt)+" "+time;
  veh_code=res2.getString("VehicleCode");	
  unit_id = res2.getString("UnitID");
  veh_reg_no = res2.getString("VehicleRegNumber");
  location = res2.getString("Location");
  Lat=res2.getString("geofencelat");
  Lon=res2.getString("geofencelon");
  
  ng_status="select * from db_gps.t_NicerGlobeVehiclelist where vehiclecode='"+veh_code+"'";
  System.out.println("NicerGlobe Status query-->"+ng_status);
  ResultSet res_ngstatus = st2.executeQuery(ng_status);
  if(res_ngstatus.next()){
	  status=res_ngstatus.getString("status");
	  }
  System.out.println("Status:" +status);
		  
%>
<tr>
<td align="right"><%=i%></td>
<td align="left"><%=veh_reg_no%></td>
<td align="right"><%=unit_id%></td>
<td align="center">
<%
if(status.equalsIgnoreCase("Active")){%>
	<input type="button" value="Remove" onclick="javascript:window.open('VehAction.jsp?VehicleCode=<%=veh_code%>&action=remove','win3','resizeable=0')">
<%}else{ %>
	<input type="button" value="Add" onclick="javascript:window.open('VehAction.jsp?VehicleCode=<%=veh_code%>&action=add','win3','resizeable=0')">
<%}%>
</td>
<td align="right"><%=updated%></td>
<td align="left"><a href="shownewmap.jsp?lat=<%=Lat%>&long=<%=Lon%>&discription=<%=location%>" onclick="popWin=open('shownewmap.jsp?lat=<%=Lat%>&long=<%=Lon%>&discription=<%=location%>', 'myWin','width=500, height=500'); popWin.focus(); return false">&nbsp;&nbsp;<font color="blue"><b><%=location%></b></font></a></td>
</tr>
<%
i++;
}
%>
</tbody>
<tfoot>
<tr>
<th>Sr</th>
<th>Asset ID</th>
<th>UnitID</th>
<th>Action</th>
<th>Updated</th>
<th>Location</th>
</tr>
</tfoot>
</table>
</body>
</html>