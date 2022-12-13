<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>

<%@ include file="header.jsp" %>
<%! 
Connection con1;
Statement stmt1,st,st3,stmt2, stmt4;
ResultSet rs1=null,rs2=null,rs3=null, rs4=null;
String sql1="",sql,sql2,sql3, sql4;
String srchtext="",thename;
%>

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<title>Seven Day Diary System.</title>
	<link rel="stylesheet" href="style.css" type="text/css" charset="utf-8" />
	<link rel="stylesheet" href="css/css.css" type="text/css" charset="utf-8" />
	
	
	
	

	
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript"
	src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>


<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- Export Options Links of DataTables -->

<link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.5.1/css/buttons.dataTables.min.css">
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
	                        title: 'FtpLastDump' 

							
	                    },
	                    {
	                        extend: 'pdf',
	                        orientation: 'landscape',
	                        pageSize: 'LEGAL',
	                        title: 'FtpLastDump' 
	                        
	                       
	                     },
	                    {
	                        extend: 'csv',
	                        title: 'FtpLastDump'
	                       
	                    },
	                    {
	                        extend: 'print',
	                        title: 'FtpLastDump'
	                        
	                    },
	                    {
	                        extend: 'copy',
	                        title: 'FtpLastDump' 
	                       
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
	                        title: 'FtpLastDump' 

							
	                    },
	                    {
	                        extend: 'pdf',
	                        orientation: 'landscape',
	                        pageSize: 'LEGAL',
	                        title: 'FtpLastDump' 
	                        
	                       
	                     },
	                    {
	                        extend: 'csv',
	                        title: 'FtpLastDump'
	                       
	                    },
	                    {
	                        extend: 'print',
	                        title: 'FtpLastDump'
	                        
	                    },
	                    {
	                        extend: 'copy',
	                        title: 'FtpLastDump' 
	                       
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
function validate()
{
	var cmnt=document.multsrch.srchbx.value;

	if(cmnt.length <= 2)
	{
		alert("Please enter Unit Id ");
		return false;
	}

	
	var iChars = "!@#$%^&*()+=-[]\\\';./{}|\":<>?";
	
	for (var i = 0; i < cmnt.length; i++) 
	{
  		if (iChars.indexOf(cmnt.charAt(i)) != -1) 
		{
		  	alert ("Special Characters are not allowed");
		  	return false;
  		}
  	}

}
function fun2()
{	
	document.multsrch.submit();
}	

</script>
<style>
.popup {
background-color: #98AFC7;
position: absolute;
visibility: hidden;

</style>

	
</head>

<%@ include file="MenuNew.jsp"%>

	<div id="gbox1" style="width: 100%; margin-top: 20px; margin-left: 0;">
		<div id="gbox-top1"></div>
		<div id="gbox-bg1">
  
   <div id="gbox-grd1"></div>

 <form name="multsrch" method="post" action="" onSubmit="return validate();">
<%		
try
{
   Class.forName(MM_dbConn_DRIVER);
	con1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	stmt1=con1.createStatement();	
	thename=request.getParameter("radio1");
	if(null==thename)
	{
	
	thename="simmaster";
	}
	%>
<table border="0" width="750px" style="padding-left: 525px;">	<tr>
		<td align="center" colspan="2"> <font color="maroon" size="2"> <b> Search FTP Last Dump</b> </font> </td>
	
			<input type="radio" name="radio1" value="simmaster"  <% if(thename.equals("simmaster")) { out.print("CHECKED"); } %> onclick="fun2();" >From FTPlastdump Table
		   <input type="radio" name="radio1" value="manufacture" <% if(thename.equals("manufacture")) { out.print("CHECKED"); } %> onclick="fun2();">From Manufatured Table	
		
</table>
	

 
<%

if(!(null==thename))
{
	if(thename.equals("simmaster"))
	{ 


	String rad=request.getParameter("src");
	String getunit="";
	if(rad==null)
	{
		
		rad="mobile";
		
	}
	else
	{
	 	getunit=request.getParameter("srchbx");
	 	session.setAttribute("srchtext",getunit);
		try
		{
			srchtext=session.getValue("srchtext").toString();
		} catch(Exception e)
	  	{
			srchtext="";
	  	}	
	}
%>


	


 <font color="maroon"><center><B> Note:</B> Multiple entries has to be separated by comma only. </center></font>  
<table border="0" width="350px" style="padding-left: 470px;">
<tr> 
<td align="center">
	<table border="1" width="350px" align="center">
		<tr>
			<td align="center" colspan="2"> <font color="maroon" size="2"> <B> Multiple Search For FTP Last Dump</B> </font> </td>
		</tr>	
				
		<tr>
			<td> <font color="maroon"> Search </font></td>
			<td>
			
				<input type="radio" name="src" value="mobile" checked><B>Unit ID</B></input>
	            <input type="radio" name="src" value="sim"><B>Sim No</B></input>	
			</td>
		</tr>
		<tr>
			<td> <font color="maroon"> Enter</font> </td>
			<td colspan="" align=""> <textarea name="srchbx" class="formElement"><%=srchtext%> </textarea> </td>
		</tr>
		<tr>
			<td colspan="2" align="center"> <input type="submit" name="submit" value="Submit" class="formElement"  onclick="document.getElementById('multsrch').submit()" /> </td>
		</tr>
	</table>
 </td>
 <td> 
		
	
</td>
</tr>
</table>
<%
			
if(rad==null)
{
}
else
{
	

	java.util.Date d = new java.util.Date();
	Format formatter1 = new SimpleDateFormat("yyyy-MM-dd");
	String tdydte=formatter1.format(d);


	 String nextstr="";
	 int i=1;

StringTokenizer strtok = new StringTokenizer(getunit,","); 
%>

	<table id="example" class="display" style="width: 100%">
		<thead>
			<tr>
				<th >Sr.No</th>
				<th align="center">Unit Id</th>
				
				<th align="center">Location </th>
				<th align="center">RMC Date & Time</th>
				<th align="center">File date & time</th>
				<th align="center">File Name</th>
				<th align="center">WMSN No</th>
				<th align="center">Sim No</th>		
				<th align="center">Unit Type</th>	
				<th align="center">User name</th>
				<th align="center">Code Version</th>
				
			</tr>
		</thead>
		<tbody>
<%
 while (strtok.hasMoreTokens())
 {

	if(rad.equals("mobile"))	
   	{	
		nextstr="'%"+strtok.nextToken()+"%'";
		sql1="select * from t_ftplastdump where UnitID like "+nextstr+"  order by Filedatetime desc";
   	}
	 else
		// if(rad.equals("Unit"))
   	{
			 nextstr="'%"+strtok.nextToken()+"%'";
		sql1="select * from t_ftplastdump where Simno like "+nextstr+"  order by Filedatetime desc";
	
	}  	
	 rs1=stmt1.executeQuery(sql1);
	  while(rs1.next())
	  { 

%>
		<tr>
			
			<td align="right"><%=i %> </td>
			<td align="right"> <%=rs1.getString("UnitID") %> </td>
			<td align="left"> <%=rs1.getString("Location") %></td>
			<td align="center"> <%=rs1.getString("rmcdate") %> 
			</br> <%=rs1.getString("rmctime") %> </td>
			<td align="center"> <%=rs1.getString("Filedatetime") %> </td>
			<td align="left"> <%=rs1.getString("FileName") %> </td>
			<td align="right"> <%=rs1.getString("WMSN") %> </td>
			<td align="right"> <%=rs1.getString("SimNo") %> </td>
			<td align="left"> <%=rs1.getString("UnitType") %></td>
			<td align="left"><%=rs1.getString("Username") %> </td>
			<td align="left"> <%=rs1.getString("CodeVersion") %></td>

		
 	</tr>
 	
<%
		i++;
	} //close of while
} //close of string tokenizer

       
%>		
		
		</tbody>
 	<tfoot>
 	
 	<tr>
				<th >Sr.No</th>
				<th align="center">Unit Id</th>
				
				<th align="center">Location </th>
				<th align="center">RMC Date & Time</th>
				<th align="center">File date & time</th>
				<th align="center">File Name</th>
				<th align="center">WMSN No</th>
				<th align="center">Sim No</th>		
				<th align="center">Unit Type</th>	
				<th align="center">User name</th>
				<th align="center">Code Version</th>
				
 	</tr>
 	</tfoot>	
		</table>
<%
} //colse of else

	}
	else
	{


		String rad=request.getParameter("src");
		String getunit="";
		if(rad==null)
		{
			
			rad="mobile";
			
		}
		else
		{
		 	getunit=request.getParameter("srchbx");
		 	session.setAttribute("srchtext",getunit);
			try
			{
				srchtext=session.getValue("srchtext").toString();
			} catch(Exception e)
		  	{
				srchtext="";
		  	}	
		}
	%>
	
	
		
		
	
	 <font color="maroon"><center><B> Note:</B> Multiple entries has to be separated by comma only. </center></font>  
	<table border="0" width="750px" style="padding-left: 470px;">
	<tr> 
	<td align="center" >
		<table border="10" width="350px" align="center">
			<tr>
				<td align="center" colspan="2"> <font color="maroon" size="2"> <B> Multiple Search For FTP Last Dump</B> </font> </td>
			</tr>	
					
			<tr>
				<td> <font color="maroon"> Search </font> </td>
				<td>
		<input type="radio" name="src" value="mobile" checked><B>Unit ID.</B></input>
		<input type="radio" name="src" value="sim"><B>Sim No.</B></input>	
				</td>
			</tr>
			<tr>
				<td> <font color="maroon"> Enter</font> </td>
				<td colspan="" align=""> <textarea name="srchbx" class="formElement"><%=srchtext%> </textarea> </td>
			</tr>
			<tr>
				<td colspan="2" align="center"> <input type="submit" name="submit" value="Submit" class="formElement" /> </td>
			</tr>
		</table>
	 </td>
	 <td> 
			
		
	</td>
	</tr>
	</table>
	<%

	if(rad==null)
	{
	}
	else
	{
		

		java.util.Date d = new java.util.Date();
		Format formatter1 = new SimpleDateFormat("yyyy-MM-dd");
		String tdydte=formatter1.format(d);


	
	 	 String nextstr="";
		 int i=1;

	StringTokenizer strtok = new StringTokenizer(getunit,","); 
	%>

<table id="example1" class="display" style="width: 100%">
		<thead>
			<tr>
				<th align="center">Sr.No</th>
				<th align="center">Date </th>
				<th align="center">Unit Id</th>
				<th align="center">Sim No</th>
				<th align="center">Mobile No</th>
				<th align="center">Installation Type</th>
				<th align="center">WMSN</th>
				<th align="center">Sim Company</th>
				<th align="center"> Unit Type</th>
				<th align="center">Software Version</th>		
				<th align="center">Peripherals</th>
				<th align="center">Status</th>
				
			</tr>
		</thead>		
		<tbody>
	<%
	 while (strtok.hasMoreTokens())
	 {

		if(rad.equals("mobile"))	
	   	{	
			nextstr="'%"+strtok.nextToken()+"%'";
			sql1="select * from t_unitmasterhistory where UnitID like "+nextstr+"  order by UnitID Desc";
	   	}
		 else
			// if(rad.equals("Unit"))
	   	{
				 nextstr="'%"+strtok.nextToken()+"%'";
			sql1="select * from t_unitmasterhistory where Simno like "+nextstr+"  order by UnitID Desc";
		
		}  	
		ResultSet rst1=stmt1.executeQuery(sql1);
		  while(rst1.next())
		  { 

	%>
			<tr>
						<td align="right"><%=i%></td>
						<%
					    try{
                        %>
                        <td align="center" ><%=new SimpleDateFormat("dd-MMM-yyyy").format(rst1.getDate("EntDate"))%></td>
                     
                        <%
                        }catch(Exception e)
                           {
	                    out.print("-");
                        }
                                %>
				
                        <td align="right"><%=rst1.getString("UnitID")%></td>
						<td align="right"><%=rst1.getString("SimNo")%></td>
						<td align="right"><%=rst1.getString("MobNo")%></td>
						<td align="right"><%=rst1.getString("164.68.105.216")%></td>
						<td align="right"><%=rst1.getString("WMSN")%></td>
						<td align="left"><%=rst1.getString("SimCompany")%></td>
						<td align="left"><%=rst1.getString("typeunit")%></td>
						<td align="left"><%=rst1.getString("SwVer")%></td>
						<td align="left"><%=rst1.getString("Peripherals")%></td>
						<td align="left"><%=rst1.getString("Status")%></td>
                        

			
	 	</tr>
	 	
	<%
			i++;
		} //close of while
	} //close of string tokenizer

	       
	%>		
			
			</tbody>
	 	<tfoot>
	 	
	 	<tr>
				
				<th align="center">Sr.No</th>
				<th align="center">Date </th>
				<th align="center">Unit Id</th>
				<th align="center">Sim No</th>
				<th align="center">Mobile No</th>
				<th align="center">Installation Type</th>
				<th align="center">WMSN</th>
				<th align="center">Sim Company</th>
				<th align="center"> Unit Type</th>
				<th align="center">Software Version</th>		
				<th align="center">Peripherals</th>
				<th align="center">Status</th>
				
			</tr>
				
			</tr>
	 	
	 	</tfoot>
	 		
			</table>
	<%
	} //colse of else
	}
}

}catch(Exception e)
{
	out.print("Exception -->"+e);

}
finally
{
	con1.close();
}
%>

<!-- code end here --->

 		
  
  
  <%@ include file="footer.jsp"%>

</body>
</html>
