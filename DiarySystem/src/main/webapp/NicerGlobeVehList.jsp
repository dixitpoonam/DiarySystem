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
	                        	 columns: [0,1,2,3,4]
	                        }
							
	                    },
	                    {
	                        extend: 'pdf',
	                        orientation: 'landscape',
	                        pageSize: 'LEGAL',
	                        title: 'All Transporters List Report',
	                        exportOptions: {
	                        	 columns: [0,1,2,3,4]
	                        }
	                       
	                     },
	                    {
	                        extend: 'csv',
	                        title: 'All Transporters List Report',
	                        exportOptions: {
	                        	 columns: [0,1,2,3,4]
	                        }
	                    },
	                    {
	                        extend: 'print',
	                        title: 'All Transporters List Report', 
	                        exportOptions: {
	                        	 columns: [0,1,2,3,4]
	                        }
	                    },
	                    {
	                        extend: 'copy',
	                        title: 'All Transporters List Report',
	                        exportOptions: {
	                        	 columns: [0,1,2,3,4]
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
	Statement st3=conn.createStatement();
	Statement st4=conn.createStatement();

	
	String Status=request.getParameter("status");
	if(Status==null){
		Status="All";
	}
	
	System.out.println("in connection created");	
%>
<br>
<br>
<div align="center">
<b>NICER GLOBE VEHICLE LIST</b>
</div>
<div align="left">
<!-- <input type="button" value="Add Vehicle" onclick="javascript:window.open('VehAction.jsp','win3','resizeable=0, width=800, height=480')"> -->
<a href=# onclick="javascript:window.open('VehAction.jsp','win3','resizeable=0, width=800, height=480')">Add Vehicle</a>
</div>
<br>

<table id="example" class="display" style="width: 100%">
<thead>
<tr>
<th>Sr</th>
<th>Asset ID</th>
<th>Fleetview Updated</th>
<th>Nicer Updated</th>
<th>UnitID</th>
<th>Owner Name</th>

<!-- <th>Location</th> -->
<!-- <th>Remove</th> -->
</tr>
</thead>
<tbody>
<%

String veh_code="", location="", veh_reg_no = "", unit_id = "",time="",lastupdate="",updated="";
java.util.Date dt=null;
String Lat="",Lon="";
String ownername="";
String locsql="", sqldata="";
Double latitude,longitude;
String vehcode="";

//sqldata="select distinct(a.vehicles),a.updateddatetime,b.unitid,b.ownername,b.vehicleregnumber from db_gps.t_nicerupdateddata a , db_gps.t_vehicledetails b where a.vehicles = b.vehiclecode and b.status ='-' and a.Vehicles in (select distinct(vehicles) from db_gps.t_NicerGlobeVehiclelist where status='Active' ) order by ownername";
sqldata="select distinct(vehicles),updateddatetime from db_gps.t_nicerupdateddata where Vehicles in (select distinct(vehiclecode) from db_gps.t_NicerGlobeVehiclelist)";
System.out.println("main sql:-->"+sqldata);
ResultSet res2 =st1.executeQuery(sqldata);
int i=1;
while(res2.next())
{
   updated = res2.getString("updateddatetime");
   veh_code="";
   location=""; veh_reg_no = ""; unit_id = "";time="";lastupdate="";ownername="";
    veh_code= res2.getString("vehicles");	
    vehcode="";
    
    
    String vehdata = "select * from db_gps.t_vehicledetails where Vehiclecode= '"+veh_code+"' and status='-'";
    System.out.println("Query for veh details-->"+vehdata);	  
    ResultSet resveh  = st2.executeQuery(vehdata);
    if(resveh.next()){
  	  unit_id = resveh.getString("unitid");
  	  veh_reg_no = resveh.getString("vehicleregnumber");
  	  ownername = resveh.getString("ownername");
  	  vehcode =  resveh.getString("vehiclecode");
  	  
  	String onlinedata="Select * from db_gps.t_onlinedata where vehiclecode='"+vehcode+"' order by thedate desc,thetime desc limit 1";
	System.out.println("Online data Query:------>"+onlinedata);
	ResultSet rsonlinedata=st3.executeQuery(onlinedata);
	if(rsonlinedata.next())
	{
		lastupdate= new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rsonlinedata.getString("thedate")))+" "+rsonlinedata.getString("thetime");	
		
	}/* else{
		
	} */
	  System.out.println("fleetview updated:" +lastupdate);
	  System.out.println("nicer updated:" +updated);
      System.out.println("VehRegNo:" +veh_reg_no);
      System.out.println("unit id:"+unit_id);
      System.out.println("owner name:"+ownername);
      System.out.println("===================================================================================");
    }else{
    	veh_reg_no = veh_code;
    	lastupdate="No Data";
		unit_id="No Data";
		ownername="No Data";
    }
  %>
  <%  

 /* CODE FOR LOCATION DATA - code commented due to inconsistency in location data only 81 out of 120 vehicles  have proper lat long info as of  18/11/2021
 
 String livelocdata = "select Location,geofencelat,geofencelon from db_gps.t_onlinedata where Vehiclecode= '"+veh_code+"'";
  System.out.println("Query for live location-->"+livelocdata);
		  
  ResultSet resloc  = st2.executeQuery(livelocdata);
  if(resloc.next()){
	  
  location = resloc.getString("Location");
  Lat = resloc.getString("geofencelat");
  Lon = resloc.getString("geofencelon");
  System.out.println(" Location:"+location+"\nLatitude:"+Lat+" \nLongitude: "+Lon);
  
  }
  
  latitude = Double.parseDouble(Lat);
  longitude = Double.parseDouble(Lon);
  
   if(latitude<=0||longitude<=0)  //for un-updated lat long in t_onlinedata
   {
		  //get lat long from other table
		  
	  	  locsql="select * from db_gps.t_veh"+veh_code+" where TheFiledTextFileName in ('SI','OF','ON','ST','SP') and (LatinDec !='0' and  LonginDec!='0') order by TheFieldDataDateTime desc limit 1"; 
	      System.out.println("alternate lat long query-->"+locsql);
		  ResultSet resloc1=st3.executeQuery(locsql);
		  
	      if(resloc1.next())
	      {
	      System.out.println("alternateeeeeeeeee locationnnnnn.................");	  
	      latitude=Double.parseDouble(resloc1.getString("LatinDec"));
	      longitude=Double.parseDouble(resloc1.getString("LonginDec"));
	      } 
	      else{
	    	  System.out.println("Failing to get lat long data..");
	      }
	      System.out.println("Alternate Latitude:"+latitude+" & Longitude: "+longitude);

   }
 */  
%>
<tr>
  <td align="right"><%=i%></td>   
  <td align="left"><%=veh_reg_no%></td>   <!--Asset ID  -->
  <td align="right"><%=lastupdate%></td>  <!-- Fleetview Updated from onlinedata  -->
  <td align="right"><%=new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(updated)) %></td>
  <!-- Nicer Updated datetime from nicerupdateddata -->
  <td align="right"><%=unit_id%></td>   <!-- Unit ID  -->
  <td align="left"><%=ownername%></td>  <!-- Owner Name -->
  </tr>
  
  <%i++;
  }  //end of while
  %>
<%-- 
<% if(latitude==0.00||longitude==0.00){%>
<td align="left"><%=location%></td>
<%}else{%>
<td align="left"><a href="shownewmap.jsp?lat=<%=latitude%>&long=<%=longitude%>&discription=<%=location%>" onclick="popWin=open('shownewmap.jsp?lat=<%=latitude%>&long=<%=longitude%>&discription=<%=location%>', 'myWin','width=500, height=500'); popWin.focus(); return false">&nbsp;&nbsp;<font color="blue"><b><%=location%></b></font></a></td>
<%}%>
</tr> 
--%>
<%-- <td align="center"><input type="button" value="Remove" onclick="javascript:window.open('VehAction.jsp?VehicleCode=<%=veh_code%>&action=remove','win3','resizeable=0')"></td> --%>
</tbody>
<tfoot>
<tr>
<th>Sr</th>
<th>Asset ID</th>
<th>Fleetview Updated</th>
<th>Nicer Updated</th>
<th>UnitID</th>
<th>Owner Name</th>

<!-- <th>Location</th> -->
<!-- <th>Remove</th> -->

</tfoot>
</table>
</body>
</html>