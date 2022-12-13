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
	                        title: 'User Validate Report', 

							
	                    },
	                    {
	                        extend: 'pdf',
	                        orientation: 'landscape',
	                        pageSize: 'LEGAL',
	                        title: 'User Validate Report', 
	                        
	                       
	                     },
	                    {
	                        extend: 'csv',
	                        title: 'User Validate Report', 
	                       
	                    },
	                    {
	                        extend: 'print',
	                        title: 'User Validate Report', 
	                        
	                    },
	                    {
	                        extend: 'copy',
	                        title: 'Unit Replacement Report',
	                       
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
<!--

//-->


function submitform()
{
	if(!(document.getElementById("trans").value=="Select"))
	{
		document.form1.submit();
	}
}
function sendMail(user, pass)
{
	//alert("function madhe ala");	
//user="a_kalaskar@transworld-compressor.com";
//pass="1234";
	var ajaxRequest;
	//alert("1");
	try
	{
     // Opera 8.0+, Firefox, Safari
		ajaxRequest = new XMLHttpRequest();
		//alert("2");
	}  
	catch (e)
	{
     // Internet Explorer Browsers
     	try
        {
          ajaxRequest = new ActiveXObject("Msxml2.XMLHTTP");
     	} 
        catch (e)
        {
	    	try
             {
	        	ajaxRequest = new ActiveXObject("Microsoft.XMLHTTP");
	    	 } 
             catch (e)
             {
	           // Something went wrong
                alert("Your browser broke!");
		   		return false;
         	}
     	}
  	}
	//alert("3");
	ajaxRequest.onreadystatechange = function()
	{
    	if(ajaxRequest.readyState == 4)
    	{
          	var reslt=ajaxRequest.responseText;
          	//alert("result is before :- "+reslt);
          	reslt=reslt.replace(/^\s+|\s+$/g,"");
			//alert("result is after :- "+reslt);
          	if(reslt=="Success")
          	{
          		alert("Email has been sent successfully.");
          	}	
          	//alert("the result is:- "+reslt);
		} 
	}
	
	
	ajaxRequest.open("get","sendemail.jsp?UserName="+user+"&Password="+pass,true);
	ajaxRequest.send(null);
}


</script>



</head>

<body>
	
		<%@ include file="MenuNew.jsp"%>
		<%@ include file="Connections/conn.jsp"%>
		<br>
		

		<%! 
Connection con1;
Connection con2;
String refno=null;

%>

		
		<table width="750px" align="center">
			<tr>
				<td>
					<table border="0" width="100%">
						<tr>
							<td align="center"><font color="" size="3">
									Validate User Login Id
							</font></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>



<%!
Statement st, st1;
String sql,trans,conno,conname;
Connection conn;
%>
<%
trans="";
trans=request.getParameter("trans");
if(null==trans)
{
	trans="-";
}


/* Class.forName("org.gjt.mm.mysql.Driver");
conn = DriverManager.getConnection("jdbc:mysql://10.0.10.62/db_gps","site","1@s2te"); */

Class.forName(MM_dbConn_DRIVER);
conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);

try
{
	st=conn.createStatement();
	st1=conn.createStatement();
	sql="select Distinct(TypeValue) from db_gps.t_security where TypeOfUser in ('Transporter','Group','EndUser') order by TypeValue";
	ResultSet rsttrans=st.executeQuery(sql);
	%>
	<form name="form1" action="" method="get">
	<select name="trans" id="trans" onchange="submitform();">	
	<option value="Select">Select</option>
	<option value="ALL">ALL</option>
	<%
	while(rsttrans.next())
	{
	%>
	<option value="<%=rsttrans.getString("TypeValue")%>" <% if(trans.equals(rsttrans.getString("TypeValue"))) {%>Selected<%}%>><%=rsttrans.getString("TypeValue")%></option>
	<%
	}
%>
</select> <font color="red" size="2">&nbsp;&nbsp; Note:-</font> <font color="brown" size="2"> Please select the transporter or group name to show his logins.</font>
</form>
<%
}
catch(Exception e)
{
	out.print("Exception ----"+e);
}
%>
</td></tr>
<%
if(!(trans.equals("-")))
{
%>
<tr>
<td align="center" bgcolor="#2696B8"><font color="white" size="2"><b>
The Login Id's for <%=trans%></b>
</font>
</td>
</tr>
<%
}
%>

<br>
<br>

<table id="example" class="display" style="width: 100%">
<thead>
<tr>

<th>Sr.No</th>
<th align="center">User ID</th>
<th align="center">Full Name</th>
<th align="center">Contact No</th>
<th align="center">Location</th>
<th align="center">Type Value</th>
<th align="center">Type Of User</th>
<th align="center">Active Status</th>
<th align="center">ID Type</th>
<th align="center">Expiry Date</th>
<th align="center">Action</th>



</tr>
</thead>
<tbody>
<%
if(!(trans.equals("-")))
{
	try{
		sql="select * from db_gps.t_security where TypeValue='"+trans+"' order by UserName";
		ResultSet rstlogin=st.executeQuery(sql);
		int i=1;
		while(rstlogin.next())
		{
			sql="select * from db_gps.t_userdetails where UserName='"+rstlogin.getString("UserName")+"' order by MobNo desc";
			ResultSet rstcontact=st1.executeQuery(sql);
			conno="";
			conname="";
			if(rstcontact.next())
			{
				conno=rstcontact.getString("MobNo");
				conname=rstcontact.getString("Location");
			}
			else{
				conno="-";
				conname="-";
			}
			%>
			<tr>
			<td  align="right"><%=i%></td>	
			<td  align="left"><%=rstlogin.getString("UserName")%></td>	
			<td  align="left"><%=rstlogin.getString("FullName")%></td>	
			<td  align="left"><%=conno%></td>
			<td  align="left"><%=conname%></td>
			<td  align="left"><%=rstlogin.getString("TypeValue")%></td>	
			<td  align="left"><%=rstlogin.getString("TypeOfUser")%></td>	
			<td  align="left"><%=rstlogin.getString("ActiveStatus")%></td>	
			<td  align="left"><%=rstlogin.getString("LoginInfo")%></td>
			<td  align="left"><%=rstlogin.getString("ExpiryDate")%></td>
			<td  align="left"><a href="javascript:flase" onclick="sendMail('<%=rstlogin.getString("UserName")%>','<%=rstlogin.getString("Password")%>');" title="Click to Mail User Name and Password"><img src="images/mail.jpg" border="0"></a>&nbsp;&nbsp;<a href="javascript: flase" title="click to edit values" 
			onclick="window.open('edituser.jsp?username=<%=rstlogin.getString("UserName")%>&typevalue=<%=rstlogin.getString("TypeValue")%>&activestatus=<%=rstlogin.getString("ActiveStatus")%>','win1','width=500,height=350,location=0,menubar=0,scrollbars=0,status=0,toolbar=0,resizable=0')"><img src="images/edit1.jpg" border="0"></a></td>
			</tr>	
					
			<%
			i++;
		}
	}catch(Exception e)
	{
		out.print("Exception ---->"+e);
	}finally{
		conn.close();
	}
}
%>
</tbody>
<tfoot>
<tr>

<th>Sr.No</th>
<th align="center">User ID</th>
<th align="center">Full Name</th>
<th align="center">Contact No</th>
<th align="center">Location</th>
<th align="center">Type Value</th>
<th align="center">Type Of User</th>
<th align="center">Active Status</th>
<th align="center">ID Type</th>
<th align="center">Expiry Date</th>
<th align="center">Action</th>

</tr>
</tfoot>
<%@ include file="footer.jsp"%>	
</table>
