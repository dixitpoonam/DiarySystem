<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java"
	import="java.sql.*" import=" java.text.*" import=" java.util.*"
	errorPage=""%>
<%@ page import="java.util.Date"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ include file="header.jsp"%>

<style type="text/css">
@import url(jscalendar-1.0/calendar-blue.css);
</style>
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
	                        title: 'Special Comment Report ', 
	                    },
	                    {
	                        extend: 'pdf',
	                        orientation: 'landscape',
	                        pageSize: 'LEGAL',
	                        title: 'Special Comment Report ', 	                  
	                     },
	                    {
	                        extend: 'csv',
	                        title: 'Special Comment Report ', 	                 
	                    },
	                    {
	                        extend: 'print',
	                        title: 'Special Comment Report ', 
	                    },
	                    {
	                        extend: 'copy',
	                        title: 'Special Comment Report ', 
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


<body style="background-color: #FFFFFF;">
<%@ include file="MenuNew.jsp"%> 

	<div id="gbox1" style="width: 100%; margin-top: 20px; margin-left: 0;">
		<div id="gbox-top1"></div>
		<div id="gbox-bg1">
  
   <div id="gbox-grd1"></div>

		</div>
		
		
		<% 

try{

						
						Class.forName(MM_dbConn_DRIVER);
					    Connection con = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
						Statement stmt = con.createStatement();

						Statement stmt2 = con.createStatement();
						Statement stmt3 = con.createStatement();
						Statement stmt4 = con.createStatement();
						Statement st = con.createStatement();
						Statement st1 = con.createStatement();
						Statement st2 = con.createStatement();

						Statement stmt8 = con.createStatement();
						Statement stmt9 = con.createStatement();
						Statement stmt10 = con.createStatement();
						Statement stmt11 = con.createStatement();
						Statement stmt12 = con.createStatement();
						Statement stmt13 = con.createStatement();
						Statement stmt14 = con.createStatement();
						Statement stmt51 = con.createStatement();
						Statement stmt19 = con.createStatement();
						Statement stmt20 = con.createStatement();
						
			
						%>
		
		
		<div style="padding-right: 50px">
							<table border="0" width="750px" bgcolor="" align="center">

								<tr>
									<td>
										<table border="0" width="100%">
											<tr>
												<td align="center"><font color="black" size="3">Special Comment Report</font></td>
														
											</tr>
										</table>
									</td>
								</tr>
							</table>
						</div>
						
						
				<table id="example" class="display" style="width: 100%">
				<thead>
					<tr>
						<th>Sr.No</th>
						<th align="center">Vehicle No</th>
						<th align="center">EntryDateTime</th>
						<th align="center">Technician</th>
						<th align="center">Transporter</th>
						<th align="center">Spc_Comment</th>
						<th align="center">Extra_Comment</th>
						<th align="center">ActionToBeTakenBy</th>
						<th align="center">Closed</th>
						
					</tr>
				</thead>
				<tbody>
				
				<%
                int i=1;
                String fdt="",veh="",datetime="",Tech="",Trans="",SpComment="",extcommt="",ActionToBeTakenBy="",Closed="";

String sql = "select distinct(VehRegNo), max(EntDateTime) as DateTime,TechName,Transp,SpComment,Extra_comment,ActionToBeTakenBy,Closed from db_CustomerComplaints.t_techspecialrep where Closed='No' and cmmt_type='Vehicle' and EntDateTime IS Not NULL and VehRegNo in (select distinct(vehicleregnumber) from db_gps.t_vehicledetails where status='-') group by VehRegNo order by EntDateTime desc";
// System.out.println("Running: " + sql);
 ResultSet res = stmt.executeQuery(sql);
while (res.next()) {			
	
	veh=res.getString("VehRegNo");
	datetime=res.getString("DateTime");
	if (datetime.equals("-")) {
		datetime = "-";
	} else {
		
		
		
 		datetime = new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(datetime));
 	}
	
	String query=" select SpComment,Extra_comment from db_CustomerComplaints.t_techspecialrep where Closed='No' and cmmt_type='Vehicle' and EntDateTime IS Not NULL and VehRegNo like '%"+veh+"%'  group by VehRegNo,SpComment order by max(EntDateTime) desc limit 1";
	ResultSet rsquery=stmt20.executeQuery(query);
	if(rsquery.next())
	{
		SpComment=rsquery.getString("SpComment");
		extcommt=rsquery.getString("Extra_comment");
	}
	else {
		SpComment=res.getString("SpComment");
		extcommt=res.getString("Extra_comment");
	}
	
	System.out.println("SpComment :-"+SpComment);
	
	Tech=res.getString("TechName");
	Trans=res.getString("Transp");
	
	ActionToBeTakenBy=res.getString("ActionToBeTakenBy");
	Closed=res.getString("Closed");

	%>
	<tr>
	<td style="text-align:right"><%=i%></td>
	<td style="text-align:right"><%=veh%></td>
	<td style="text-align:right"><%=datetime%></td>
	<td style="text-align:left"><%=Tech%></td>
	<td style="text-align:left"><%=Trans%></td>
	<td style="text-align:left"><%=SpComment%></td>
	<td style="text-align:left"><%=extcommt%></td>
	<td style="text-align:left"><%=ActionToBeTakenBy %></td>
	<td style="text-align:left"><%=Closed %></td>
	

<% 
i++;
}
}catch(Exception e)
{
System.out.println("Exception " + e);	
}


%>
</tr>
</tbody>
<tfoot>
			
					
				<tr>
						<th>Sr.No</th>
						<th align="center">Vehicle No</th>
						<th align="center">EntryDateTime</th>
						<th align="center">Technician</th>
						<th align="center">Transporter</th>
						<th align="center">Spc_Comment</th>
						<th align="center">Extra_Comment</th>
						<th align="center">ActionToBeTakenBy</th>
						<th align="center">Closed</th>
						
					</tr>
					</tfoot>
					</table>
					</div>
					<%@ include file="footer.jsp"%>	
					</body>
					</html>
					
					
						



