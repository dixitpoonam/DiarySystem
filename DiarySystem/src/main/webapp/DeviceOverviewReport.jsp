
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>

<%@ include file="header.jsp" %>
<%!
Connection con, con2;
Statement stmt1,stmt2,stmt3,stmt4,stmt5,stmt6,stmt7,stmt8,stmt9,stmt10,stmt11,stmt12;
String exportFileName="";
String transporter="";
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>


<title>Seven Day Diary System</title>
<link rel="stylesheet" href="style.css" type="text/css" charset="utf-8" />
<link rel="stylesheet" href="css/css.css" type="text/css" charset="utf-8" />
<script src="sorttable.js" type="text/javascript"></script>
<style type="text/css">@import url(jscalendar-1.0/calendar-win2k-1.css);</style>
<script type="text/javascript" src="jscalendar-1.0/calendar.js"></script>
<script type="text/javascript" src="jscalendar-1.0/lang/calendar-en.js"></script>
<script type="text/javascript" src="jscalendar-1.0/calendar-setup.js"></script>


<link rel="stylesheet" href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css"></script>
<link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.5.1/css/buttons.dataTables.min.css ">
<script type="text/javascript" src="datatablejs/bootstrap.js"></script>
<script src=" https://cdn.datatables.net/buttons/1.5.1/js/buttons.flash.min.js "></script>
<script src=" https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js "></script>
<script src=" https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js "></script>
<script src=" https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js "></script>
<script src=" https://cdn.datatables.net/buttons/1.5.1/js/buttons.html5.min.js "></script>
<script src=" https://cdn.datatables.net/buttons/1.5.1/js/buttons.print.min.js "></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="datatablejs/buttons.colVis.min.js"></script>
</head>

<body>

<%@ include file="MenuNew.jsp"%>
          
<!--- code start here ------>

<form id="device" name="device" method="post" action="" onSubmit= "return validate();" >
              <table border="0" width="750px"  align="center">
		<tr>
			<td colspan="4" align="center"><font size="3" ><b>Device Overview Report</b>  </font></td>
		</tr>
	</table>
	
	<script type="text/javascript">
 $(document).ready(function() {
	    $('#DeviceOverview').DataTable( {
	    	"pagingType": "full_numbers",
	    	
	        dom: 'Blfrtip',
	        "bLengthChange" : false,
	        buttons: [
	        	{
	        		extend: 'collection',
	        		text: 'Export',
	        		buttons: [
	        			{
	                        extend: 'excel',
	                        title: 'Device Overview Report', 
	                    },
	                    {
	                        extend: 'pdf',
	                        orientation: 'landscape',
	                        pageSize: 'LEGAL',
	                        title: 'Device Overview Report', 
	                    },
	                    {
	                        extend: 'csv',
	                        title: 'Device Overview Report', 
	                    },
	                    {
	                        extend: 'print',
	                        title: 'Device Overview Report', 
	                    },
	                    {
	                        extend: 'copy',
	                        title: 'Device Overview Report', 
	                    }
	                    
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
	            
	        ]
	        	 	    	
	    } );
		var table = $('#DeviceOverview').DataTable();
	     
	    $('#DeviceOverview tbody').on('mouseenter', 'td', function () {
	            var colIdx = table.cell(this).index().column;
	 
	            $( table.cells().nodes() ).removeClass( 'highlight' );
	            $( table.column( colIdx ).nodes() ).addClass( 'highlight' );
	        } );
	});
</script>
	
<% 		
   try
     {
	    Class.forName(MM_dbConn_DRIVER);
	    con=DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	    
	    con2 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	    
	    exportFileName = "CodeVersionReport.xls";
	      
	    stmt1=con.createStatement();
        stmt2=con.createStatement();
             
        
	    String sql,sql1; 
	    ResultSet rs1,rs2;
       String Deviceoverview = request.getParameter("Deviceoverview");
        
       System.out.println("Deviceoverview is :- "+Deviceoverview);  


%>

<table border="0" width="750px" align="center">
	   <tr>
       		<td align="center" colspan="2">
       			<b></b>
       		</td>
       </tr>
       <tr>
       		<td> <font color="black"> <b>Select Options</b> </font> </td>
      		<td colspan="1">
   	   		<select name="Deviceoverview" id="Deviceoverview">  
             <option value="Select">Select</option>
  <%            
             if(!(Deviceoverview == null))
 					{
%>
 						<option value="<%=Deviceoverview %>" selected="selected"><%=Deviceoverview %></option>
<%
 					}
%>
             
      		 <option value="SimCompany">SimCompany</option>
      		 <option value="Module">Module</option>
      		 <option value="GPS">GPS</option>
      		 <option value="typeunit">typeunit</option>
      		 <option value="SwVer">CodeVersion</option>
      		 <option value="Peripherals">Peripherals</option>
      		       		 
		</select> 
		
   	   </td>
   	      	      	   
   	   <td> <input type="submit" name="SUBMIT" id="SUBMIT" value="Submit"></input></td>
 </tr>
</table>


<%
   
  if(!(Deviceoverview == null) && !(Deviceoverview.equalsIgnoreCase("select")))
  {
			
	System.out.println("inside of if block and the Deviceoverview is :- "+Deviceoverview);	
		
	%>
	
	
	<br>
	<br>
	
	<table   class="display" style="width: 100%" id="DeviceOverview">
	<thead>
	  <tr>
	   <th>Sr.</th>
	   <th>Peripherals</th>
	   <th>Total No. Of Devices</th>
	  </tr>
	</thead>
	   <tbody>
	   <%
	   int i=1;
	   String Type="",TotalnoofDevices="";
	   int srno=0;
	   String sql_unit = "select "+Deviceoverview+",count(*) as TotalDevice from db_gps.t_unitmaster group by "+Deviceoverview+" order by count(*) desc";
		System.out.println("sql_unit is :- "+sql_unit);
		ResultSet rst = stmt2.executeQuery(sql_unit);
		while(rst.next()){
		
		srno=i;
		System.out.println("inside block");
		Type=rst.getString(Deviceoverview);
		TotalnoofDevices=rst.getString("TotalDevice");
		System.out.println("Type orignally is:-"+Type);
		
		//Type=Type.replaceAll("\\+","+");
		//Type=Type.replaceAll(" "," ");
		System.out.println("Type with replacement:-"+Type);
		 //String sql2="select UnitId from db_gps.t_unitmaster where Deviceoverview='L50'";
	   %>
	<tr>
	<td align="right"> <%=srno%></td>
	<td align="left"><a href="# " onclick="window.open('multiplesearch.jsp?Type=<%=Type %>&Deviceoverview=<%=Deviceoverview %>'); popWin.focus(); return false"><b> <font color ="blue" ><%=Type%> </font> </b> </a> </td> 
	<td align="right"><%=TotalnoofDevices%></td>
	</tr>
 <%i++;
  }  
  %>
  </tbody>
	<tfoot>
	<tr>
	   <th>Sr.</th>
	   <th>Peripherals</th>
	   <th>Total No. Of Devices</th>
	</tr>
	</tfoot>
  
<% 
	 }
else
{
	System.out.println("the Deviceoverview has not select ed yet ");   
							
			
}
}catch(Exception e)
{
	System.out.println("the exception is :- "+e.getMessage());
	e.printStackTrace();
} 
finally
{
	
	stmt1.close();
    stmt2.close();
    con.close();
    con2.close();

}
%>
</table>

<!-- code end here --->

 							
 						 
  <table border="0" width="100%">
<tr><td bgcolor="#98AFC7" class="copyright" width="100%" align="center">Copyright &copy; 2008 by Transworld Compressor Technologies Ltd. All Rights Reserved.
</td></tr>
</table>
</body>
</html>