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

<%@include file="Connections/conn.jsp"%>
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
	                        title: 'List of Users Who are Currently Online', 

							
	                    },
	                    {
	                        extend: 'pdf',
	                        orientation: 'landscape',
	                        pageSize: 'LEGAL',
	                        title: 'List of Users Who are Currently Online',	                        
	                       
	                     },
	                    {
	                        extend: 'csv',
	                        title: 'List of Users Who are Currently Online',	                       
	                    },
	                    {
	                        extend: 'print',
	                        title: 'List of Users Who are Currently Online',	                        
	                    },
	                    {
	                        extend: 'copy',
	                        title: 'List of Users Who are Currently Online',	                       
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

</head>

<body>
	
		<%@ include file="MenuNew.jsp"%>

		
		<table width="750px" align="center">
			<tr>
				<td>
					<table border="0" width="100%">
						<tr>
							<td align="center"><font color="" size="3">
									List of Users Who are Currently Online
							</font></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>

<br>


<table id="example" class="display" style="width: 100%">
					<thead>
						<tr>
							<th>Sr.No</th>
							<th align="center">Login Id</th>
							<th align="center">Owner Name</th>
							<th align="center">Contact No</th>
							<th align="center">Location</th>
							<th align="center">Last Activity Time</th>
							<th align="center">User Ip</th>
							<th align="center">Release Session</th>
							<th align="center">Logout </th>
							
						</tr>
					</thead>

					<tbody>






<%!
Statement st,st1;
String sql,thedate,trans,conno,conname;
Connection conn;

%>
<%

	Class.forName(MM_dbConn_DRIVER);
	conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	try{
	st=conn.createStatement();
	st1=conn.createStatement();
	java.util.Date dt= new java.util.Date();
	long mils=dt.getTime();
	long mins=20*60*1000;
	mils=mils-mins;
	dt.setTime(mils);
	thedate=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(dt);
	sql="select * from t_sessions where Updated >='"+thedate+"' and ActiveStatus='Yes' order by Updated desc";
	ResultSet rst=st.executeQuery(sql);
	int i=1;
	while(rst.next())
	{
		sql="select * from t_security where UserName='"+rst.getString("UserName")+"'";
		ResultSet rst1=st1.executeQuery(sql);
		if(rst1.next())
		{
			trans=rst1.getString("TypeValue");
		}
		sql="select * from t_userdetails where UserName='"+rst.getString("UserName")+"' order by MobNo desc";
		ResultSet rstcontact=st1.executeQuery(sql);
		conno="";
		conname="";
		if(rstcontact.next())
		{
			conno=rstcontact.getString("MobNo");
			conname=rstcontact.getString("Location");
		}
		%>
		<tr>
		<td align="right"><%=i%></td>
		<td align="left"><%=rst.getString("UserName")%></td>
		<td align="left"><%=trans%></td>
		<td align="right"><%=conno%></td>
		<td align="left"><%=conname%></td>
		<td align="center"><%=new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(rst.getString("Updated")))%></td>
		<td align="right"><%=rst.getString("UserIp")%></td>
		<td  align="center"><a href="javascript: flase" title="click to Unblock User" onclick="window.open('release.jsp?typevalue=<%=rst.getString("UserName")%>','win1','width=500,height=300,location=0,menubar=0,scrollbars=0,status=0,toolbar=0,resizable=0')"><img src="images/unblock.jpg" border="0"></a></td>
		<td  align="center"><a href="javascript: flase" title="click to Unblock User" onclick="window.open('logoutuser.jsp?typevalue=<%=rst.getString("UserName")%>','win1','width=500,height=300,location=0,menubar=0,scrollbars=0,status=0,toolbar=0,resizable=0')"><img src="images/unblock.jpg" border="0"></a></td>
		</tr>		
		<%
		i++;
	}
	}catch(Exception e)
	{
		out.print("Exception---->"+e);
	}finally{
		conn.close();
	}

%>
</tbody>
<tfoot>
<tr>
<tr>
							<th>Sr.No</th>
							<th align="center">Login Id</th>
							<th align="center">Owner Name</th>
							<th align="center">Contact No</th>
							<th align="center">Location</th>
							<th align="center">Last Activity Time</th>
							<th align="center">User Ip</th>
							<th align="center">Release Session</th>
							<th align="center">Logout </th>
							
						</tr>

</tr>
</tfoot>
</table>

</table>
<br>
<br>
<%@ include file="footer.jsp"%>	




		