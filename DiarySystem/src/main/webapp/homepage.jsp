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
	                        title: 'All Transporters List Report ', 

							
	                    },
	                    {
	                        extend: 'pdf',
	                        orientation: 'landscape',
	                        pageSize: 'LEGAL',
	                        title: 'All Transporters List Report', 	                        
	                       
	                     },
	                    {
	                        extend: 'csv',
	                        title: 'All Transporters List Report', 	                       
	                    },
	                    {
	                        extend: 'print',
	                        title: 'All Transporters List Report', 	                        
	                    },
	                    {
	                        extend: 'copy',
	                        title: 'All Transporters List Report', 	                       
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
<%@ include file="MenuNew.jsp"%>

<%!
Connection conn;


%>
<%
System.out.println("in homepage");	
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

	<br>
	<br>
			
<table border="0" width="750px" bgcolor="" align="center">
	<tr bgcolor=""><td align="center"><font color="#2A0A12" size="3">ALL TRANSPORTERS LIST</font></td></tr>
	<tr> 
		<td>
			<div align="center"><font color="red"><B><I>Note:</I></B>Click On Transporter To Go On It's FullFleet Page.</font></div>
		</td>
	</tr>	
	</table>
	
	<form action="" method="post" >
	<table>
	<tr>
	<td style=" padding-left:500px;"> 
	   <div >  <font size="3">
	   <label>Status</label></font> </div>
	   	
	</td>
	<td>
	
	
	<select id="status" name="status" style="width:100px; height: 30px;" >                                
                                
                                <option value="All">All</option>
                                       <%
                                       String sql1="";
                                        		sql1 = "select distinct(OperationalStatus) from db_gps.t_transporter order by  OperationalStatus";
                                        System.out.println("The query is :"+sql1);
                                         ResultSet rs1 = st1.executeQuery(sql1);
                                         while(rs1.next())
                                          { %>
                                          
                                          
                                          <option value="<%=rs1.getString("OperationalStatus") %>" ><%=rs1.getString("OperationalStatus")%></option><%
                                            
                                          
                                          }
                                        
                                    
                                    %>
                                       <option value="All">All</option>
                            </select>
                            <button type="submit" value="Submit">Submit</button>
                            
	
	  <%--  <select name="xyz" id="xyz">
	   
	   <% String sql1="select distinct(OperationalStatus) from db_gps.t_transporter order by  OperationalStatus";
          ResultSet rs1=st1.executeQuery(sql1);
	      while(rs1.next())
	      {
	   %>
	   <option  value="<%=rs1.getString("OperationalStatus")%>" selected="selected" ><%=rs1.getString("OperationalStatus")%></option>
	   
	   <%} %>  
	  </select> --%>
	</td>
	</tr>
	</table>
	</form>
	<!-- Finished with Adding code -->
	
	
			
			
			<table>
			<tr>
			<td> <a href="fullfleet.jsp?transporter=Vehall " >Export All Vehicles </a> </td>
			</tr>
			</table>
			

			<table id="example" class="display" style="width: 100%">
					<thead>
						<tr>
							
							<th style="width:5%;">Sr.No</th>
							<th  style="width:70%; text-align:center;">Transporter</th>
							<th style="width:25%; text-align:center;">Status</th>
						</tr>
					</thead>
							<tbody>
							
							<%
	try
	{
		int i=1;
		//String Status=request.getParameter("status");
		/* transporterlist=transporterlist.substring(3,transporterlist.length()-1);
		transporterlist=transporterlist.replace(",","','");
		String sql="select Distinct(OwnerName) from db_gps.t_vehicledetails where Status='-' and OwnerName in ('"+transporterlist+"') order by OwnerName";

		ResultSet rs=st.executeQuery(sql);
		while(rs.next()){ */
		/* String sql2="select distinct(TypeValue) from db_gps.t_transporter where OperationalStatus = 'Active' order by typevalue"; */
		Status=request.getParameter("status");
		System.out.println("selected value >>>>>>>>"+Status);
		
		if(Status==null)
	    {
	    	Status="All";
	    }
	    %>
	    
	    <script>
	    document.getElementById("status").value='<% out.print(Status); %>';
	    
	    </script>
	    
	    <% 
	    /* String fromdate= request.getParameter("data");
	    System.out.println("-------------------------------->"+fromdate);
	    
	    String todate= request.getParameter("data1");
	    System.out.println("-------------------------------->"+todate);
	     */
		
	     if(Status.equals("All"))
		 {
	    	 Status="%%";
		 }
		
		String sql2="select distinct(TypeValue),OperationalStatus from db_gps.t_transporter where OperationalStatus like '"+Status+"' order by typevalue";
		System.out.println("sql2 is-->>" + sql2);
		ResultSet rs2=st2.executeQuery(sql2);
		while(rs2.next())
		{

%>			
	<tr>					
	    	<td width="5%"><div align="right"><%=i%></div></td>
	    	<%
					/* String trans=rs.getString("OwnerName");
	    	        String trans1=rs.getString("OwnerName");
					trans=trans.replace("&","..."); */
					String tvalue=rs2.getString("TypeValue");
					
	    	        //String tvalue1=tvalue.trim(); 
	    	        String tvalue1=rs2.getString("TypeValue");
	    	        tvalue=tvalue.replace("&","...");
	    	        String Status1=rs2.getString("OperationalStatus");
					%>
					
    	    <td width="20%">
    	    
    	    <div align="left">
    	    <%-- <a href="fullfleet.jsp?transporter=<%=trans%>"><%=trans1%></a></div> --%>
    	    <%-- <a href="fullfleet.jsp?transporter=<%=tvalue1%>"><%=tvalue%></a></div> --%>
    	    <a href="fullfleet.jsp?transporter=<%=tvalue%>"><%=tvalue1%></a></div>
    	    </td>
    	    <td width="5%"><div align="left"><%=Status1%></div></td>
    	    
	</tr>
	
	
<%
		i++;}
	}catch (Exception e) {
			out.println("<tr><td colspan=2>");
			out.println("Exception :" + e.getMessage());
			out.println("Cause : " + e.getCause());
			out.println("</td></tr>");
			e.printStackTrace();
	}finally{
		
		

		try
		{
			conn.close();
		}catch(Exception e)
		{
			System.out.println("Exception e " + e);
		}
			
			}	
		%>

</tbody>
 <tfoot>
<tr>
							<th style="width:5%;">Sr.No</th>
							<th  style="width:70%; text-align:center;">Transporter</th>
							<th style="width:25%; text-align:center;">Status</th>
						</tr>
</tfoot> 
	</table>
<%@ include file="footer.jsp"%>
</body>
</html>
							
							


