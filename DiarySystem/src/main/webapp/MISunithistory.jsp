
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<%@ page contentType="text/html; charset=iso-8859-1" language="java"
	import="java.sql.*" import=" java.text.*" import=" java.util.*"
	errorPage=""%>
<%@ include file="header.jsp"%>
<%!
Connection conn,conn1;
Statement st,st1,st2,st3,st4,stQuickTest;
String data,data1;
String sql,sql1,sql2,sql3,sql4;
String userrole1="";
%>
<%
 userrole1=session.getAttribute("userrole").toString();

%>

<html>
<head>

<style type=text/css>
table.mytable {
	font: 13px arial, sans-serif;
	border-collapse: collapse;
	
	background: #f8fcff;
}
</style>
<title>Seven Day Diary System</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />



<link rel="stylesheet" href="style.css" type="text/css" charset="utf-8" />
<link rel="stylesheet" href="css/css.css" type="text/css"
	charset="utf-8" />
<script src="sorttable.js" type="text/javascript"></script>
<script language="javascript">
 			function validate()
  			{
                           var v1=document.unit.data.value;
                           var validChar='0123456789';   // legal chars
                           var   strlen=v1.length;       // test string length
                          
                           if(strlen==0||strlen>20)
                               {
                               //    alert("Invalid Unit ID length" );
                               //    return false;
                               }
                               
                               v1=v1.toUpperCase(); // case insensitive
                                                             

                           for(var ic=0;ic<strlen;ic++) //now scan for illegal characters
                                {
                                    
                                    if(validChar.indexOf(v1.charAt(ic))<0)
                                        {		
                                            alert("please enter a valid Unit ID!");
                                            return false;
                                        }
                                } // end scanning
                           return true;       
                        }
  				
		
 		/*	function ShowHide(id)
 			{
 				if(id==0)
 				{
 					document.getElementById("uid").style.display="";
 					document.getElementById("wmsn").style.display='none';
 					document.getElementById("sim").style.display='none';
 					document.getElementById("mobile").style.display='none';
 					document.getElementById("submitbutton").style.display="";
 				}else if(id==1){
 					document.getElementById("uid").style.display='none';
 					document.getElementById("wmsn").style.display="";
 					document.getElementById("sim").style.display='none';
 					document.getElementById("mobile").style.display='none';
 					document.getElementById("submitbutton").style.display="";
 				}else if(id==2)
 				{
 					document.getElementById("uid").style.display='none';
 					document.getElementById("wmsn").style.display='none';
 					document.getElementById("sim").style.display="";
 					document.getElementById("mobile").style.display='none';
 					document.getElementById("submitbutton").style.display="";
 				}
 				else if(id==3)
 				{
 					document.getElementById("uid").style.display='none';
 					document.getElementById("wmsn").style.display='none';
 					document.getElementById("sim").style.display='none';
 					document.getElementById("mobile").style.display="";
 					document.getElementById("submitbutton").style.display="";
 				}else{
 					document.getElementById("uid").style.display='none';
 					document.getElementById("wmsn").style.display='none';
 					document.getElementById("sim").style.display='none';
 					document.getElementById("mobile").style.display='none';
 					document.getElementById("submitbutton").style.display='none';
 				}
 			} */
</script>




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
	                        title : 'Unit History Report',

							
	                    },
	                    {
	                        extend: 'pdf',
	                        orientation: 'landscape',
	                        pageSize: 'LEGAL',
	                        title : 'Unit History Report',
	                        
	                       
	                     },
	                    {
	                        extend: 'csv',
	                        title : 'Unit History Report',
	                       
	                    },
	                    {
	                        extend: 'print',
	                        title : 'Unit History Report',
	                        
	                    },
	                    {
	                        extend: 'copy',
	                        title : 'Unit History Report',
	                       
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
	            { "sType": "date-uk" },
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
	                        title : 'New Unit Installations ',

							
	                    },
	                    {
	                        extend: 'pdf',
	                        orientation: 'landscape',
	                        pageSize: 'LEGAL',
	                        title : 'New Unit Installations ',
	                        
	                       
	                     },
	                    {
	                        extend: 'csv',
	                        title : 'New Unit Installations ',
	                       
	                    },
	                    {
	                        extend: 'print',
	                        title : 'New Unit Installations ',
	                        
	                    },
	                    {
	                        extend: 'copy',
	                        title : 'New Unit Installations ',
	                       
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
	        	    { "sType": "date-uk" },
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
	    $('#example2').DataTable( {
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
	                        title : 'Units Received Report',

							
	                    },
	                    {
	                        extend: 'pdf',
	                        orientation: 'landscape',
	                        pageSize: 'LEGAL',
	                        title : 'Units Received Report',
	                        
	                       
	                     },
	                    {
	                        extend: 'csv',
	                        title : 'Units Received Report',
	                       
	                    },
	                    {
	                        extend: 'print',
	                        title : 'Units Received Report',
	                        
	                    },
	                    {
	                        extend: 'copy',
	                        title : 'Units Received Report', 
	                       
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
	        	    { "sType": "date-uk" },
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


<script type="text/javascript">
 $(document).ready(function() {
	    $('#example3').DataTable( {
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
	                        title : 'Units Dispatched Report',

							
	                    },
	                    {
	                        extend: 'pdf',
	                        orientation: 'landscape',
	                        pageSize: 'LEGAL',
	                        title : 'Units Dispatched Report',
	                        
	                       
	                     },
	                    {
	                        extend: 'csv',
	                        title : 'Units Dispatched Report',
	                       
	                    },
	                    {
	                        extend: 'print',
	                        title : 'Units Dispatched Report',
	                        
	                    },
	                    {
	                        extend: 'copy',
	                        title : 'Units Dispatched Report',
	                       
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
	        	    { "sType": "date-uk" },
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
	    $('#example4').DataTable( {
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
	                        title : 'Quick Test History ',

							
	                    },
	                    {
	                        extend: 'pdf',
	                        orientation: 'landscape',
	                        pageSize: 'LEGAL',
	                        title : 'Quick Test History ',
	                        
	                       
	                     },
	                    {
	                        extend: 'csv',
	                        title : 'Quick Test History ',
	                       
	                    },
	                    {
	                        extend: 'print',
	                        title : 'Quick Test History ',
	                    },
	                    {
	                        extend: 'copy',
	                        title : 'Quick Test History ',
	                       
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

 <%
        if(userrole1.equalsIgnoreCase("supertech"))
        {%>
        	
        	<%@ include file="headertech.jsp" %>
        	
       <%  }else{
        %>
    	  	<%@ include file="MenuNew.jsp"%>

    	   
    <% 
        }
       %>


<%
try{
	Class.forName(MM_dbConn_DRIVER);
    conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
    conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
    st=conn1.createStatement();
    Statement stwmsn=conn1.createStatement();
	st1=conn1.createStatement();
    st2=conn.createStatement();
    st3=conn1.createStatement();
    st4=conn.createStatement();
    stQuickTest=conn.createStatement();




%>
<br>
	<br>

 <table border="0" width="750px"  align="center" >
	<tr>
		<td>
			<table border="0" width="100%">
				<tr><td align="center"><font color="black" size="3">UNIT HISTORY DETAIL. </font></td></tr>
			</table>
		</td>
	</tr>
</table>
   
           
<form name="unit" method="get" action="" onsubmit="return validate();" >
      <table border="0" width="750px" bgcolor="#77D7D4" align="center">
		<tr>
			
		<td> 
				<input type="radio" name="dataFilter" value="unit" id="a1"
				  onClick="ShowHide(0);"  CHECKED> <font color="black" size="2" >UnitID</font>	
				<input type="radio" name="dataFilter" value="wmsn"  id="b1"
				 onClick="ShowHide(1);"><font color="black" size="2">WMSN No </font>	
				<input type="radio" name="dataFilter" value="sim"  id="c1"
				 onClick="ShowHide(2);"> <font color="black" size="2">SIM No </font>	
				 <input type="radio" name="dataFilter" value="mobile" id="d1"
				 onClick="ShowHide(3);"> <font color="black" size="2">Mobile No </font>
				 
			</td>
		</tr>
		<tr id="a">
	        <td><font color="black" size="2"><b>Unit ID </b></font>
	             <input type="text" id="data" name="data" size="20"/>
	            
	        </td>
	   </tr>
	   <tr id="b" style="display:none">
	        <td><font color="black" size="2"><b>WMSN No  </b></font>
	             <input type="text" id="wmsnno" name="wmsnno"  size="20"/>
	            
	        </td>
	   </tr>
	   <tr id="c" style="display:none">
	        <td><font color="black" size="2"><b>SIM No </b></font>
	             <input type="text" id="sim" name="sim"  size="20"/>
	            
	        </td>
	   </tr>
	   <tr id="d" style="display:none">
	        <td><font color="black" size="2"><b>Mobile No </b></font>
	             <input type="text" id="mobile" name="mobile"   size="20"/>
	            
	        </td>
	   </tr>
	        <tr id="e">
			<td align="center" >
				<input type="submit" name="submit" id="submit" value="submit"  />
			</td>
		</tr>
	</table>
</form>


<%
String dd=request.getQueryString();
if(dd==null)
{
%>
<table border="0" width="750px" bgcolor="#77D7D4" align="center">
<tr><td align="center">
<font color="black"><b>Please enter the Unit ID to display the Unit History Report</b></font>
</td></tr>
</table>

<%
}
else
{
data1=request.getParameter("data");
String dataFilter=request.getParameter("dataFilter");
System.out.println(dataFilter);

%>

<br></br>
			 <table border="0" width="750px" align="center">
				<tr>
					<td  align="center" class="sorttable_nosort">
						<div id="report_heding"><font color="black" size="3">Unit History Report for Unit ID&nbsp;<%=data1%></font></div>
				<%-- 		<div align="right">
						<a href="MISunithistoryexcel.jsp?data1=<%=data1%>" title="Export to Excel">
						<img src="images/excel.jpg" width="15px" height="15px" border="0"/></a>
						<font color="black" size="2"><%=new SimpleDateFormat("dd/MM/yyyy HH:mm:ss").format(new java.util.Date())%>
						</font></div>
	 --%>				</td>
				</tr>
			</table>
			
			<br>
<%
if("unit".equalsIgnoreCase(dataFilter)){    
sql="select * from t_unitmasterhistory where UnitID='"+data1+"' order by EntDate asc";
                        ResultSet rst1=st.executeQuery(sql);
                        int i=1;
                    

                        
%>

			<table id="example" width="100%" border="0" align="center" class="display">
				<!-- <tr><th  colspan="13" bgcolor="#77D7D4"> <font color="black">Unit History</font></th></tr> -->
				<thead>
			<tr>
				<th>Sr No</th>
				<th align="center">Date</th>
				<th align="center">Unit Id</th>
				<th align="center">Sim No</th>
				<th align="center">Mob No</th>
				<th align="center">Installation Type</th>
				<th align="center">WMSN</th>
				<th align="center">Ps No</th>
				<th align="center">PCB No</th>
				<th align="center">Box No</th>
				<th align="center">Battery No</th>
				<th align="center">Sim Company</th>
				<th align="center">Module</th>
				<th align="center">GPS</th>
				<th align="center">Unit Type</th>
				<th align="center">Software Version</th>

				<th align="center">Peripherals</th>
				<th align="center">Status</th>
				<th align="center">FirmWareChanged</th>
				<th align="center">ModulePCBChanged</th>
				<th align="center">PCBModification</th>
				<th align="center">PowerSupplyChanged</th>
				<th align="center">GPSMouseChanged</th>
				<th align="center">GPSAntennaChanged</th>

				<th align="center">SoftwareSimCorrections</th>
				<th align="center">OtherCorrections</th>
				<th align="center">Ent.By</th>


			</tr>
		</thead>
        <tbody>
                         <% while(rst1.next())
                         {
                        %>	
				<tr>
                    <td align="center"><%=i%></td>
						<%
					    try{
                        %>
                    <td><%=new SimpleDateFormat("dd/MM/yyyy").format(rst1.getDate("EntDate"))%></td>
                     
                        <%
                        }catch(Exception e)
                           {
	                    out.print("-");
                        }
                                %>
                        
                    <td><div align="right"><%=rst1.getString("UnitID")%></div></td>
					<td><div align="right"><%=rst1.getString("SimNo")%></div></td>
					<td><div align="right"><%=rst1.getString("MobNo")%></div></td>
					<td><div align="left"><%=rst1.getString("InstType")%></div></td>
					<td><div align="right"><%=rst1.getString("WMSN")%></div></td>
					<td><div align="right"><%=rst1.getString("PSNo")%></div></td>
					<td><div align="right"><%=rst1.getString("PCBNo")%></div></td>
					<td><div align="right"><%=rst1.getString("BoxNo")%></div></td>
					<td><div align="right"><%=rst1.getString("BatteryNo")%></div></td>
					<td><div align="left"><%=rst1.getString("SimCompany")%></div></td>
                    <td><div align="left"><%=rst1.getString("Module")%></div></td>
                    <td><div align="left"><%=rst1.getString("GPS")%></div></td>
					<td><div align="left"><%=rst1.getString("typeunit")%></div></td>
					<td><div align="left"><%=rst1.getString("SwVer")%></div></td>
					<td><div align="left"><%=rst1.getString("Peripherals")%></div></td>
					<td><div align="left"><%=rst1.getString("Status")%></div></td>
                    <td><div align="left"><%=rst1.getString("FirmwareChanged")%></div></td>
                    <td><div align="left"><%=rst1.getString("ModulePCBChanged")%></div></td>
                    <td><div align="left"><%=rst1.getString("PCBmodification")%></div></td>
                    <td><div align="left"><%=rst1.getString("PowerSupplyChanged")%></div></td>
                    <td><div align="left"><%=rst1.getString("GPSMouseChanged")%></div></td>
                    <td><%=rst1.getString("GSMAntennaChanged")%></td>
                    <td><div align="left"><%=rst1.getString("SoftwareSimCorrections")%></div></td>
                    <td><div align="left"><%=rst1.getString("OtherCorrections")%></div></td>
                    <td><div align="left"><%=rst1.getString("EntBy")%></div></td>
                  </tr>
                       
                        <%
                          i++;
                          }
                        
                         %>
                         </tbody>
		<tfoot>
			<tr>
				<th>Sr No</th>
				<th align="center">Date</th>
				<th align="center">Unit Id</th>
				<th align="center">Sim No</th>
				<th align="center">Mob No</th>
				<th align="center">Installation Type</th>
				<th align="center">WMSN</th>
				<th align="center">Ps No</th>
				<th align="center">PCB No</th>
				<th align="center">Box No</th>
				<th align="center">Battery No</th>
				<th align="center">Sim Company</th>
				<th align="center">Module</th>
				<th align="center">GPS</th>
				<th align="center">Unit Type</th>
				<th align="center">Software Version</th>

				<th align="center">Peripherals</th>
				<th align="center">Status</th>
				<th align="center">FirmWareChanged</th>
				<th align="center">ModulePCBChanged</th>
				<th align="center">PCBModification</th>
				<th align="center">PowerSupplyChanged</th>
				<th align="center">GPSMouseChanged</th>
				<th align="center">GPSAntennaChanged</th>

				<th align="center">SoftwareSimCorrections</th>
				<th align="center">OtherCorrections</th>
				<th align="center">Ent.By</th>
		</tfoot>
                         
                     
                        </table>
			

                        <br>
                         <%
                          sql1="select * from t_unitreplacement where NewUnitID='"+data1+"'order by EntDate asc";
                        ResultSet rst2=st1.executeQuery(sql1);
                        int j=1;
                    

                       
%>
<table border="0" width="750px" bgcolor="" align="center">
		<tr>
			<td align="center" class="sorttable_nosort">
				<div id="report_heding">
					<font color="black" size="3"> New Unit Installations </font>
			</td>
		</tr>
	</table>

						<table  id="example1" width="100%" border="0" align="center" class="display" >
							<!-- <tr>
							 <th  colspan="20" ><font color="black">New Unit Installations</font>
							 </th>
							 </tr>
					 -->	
							<thead>
			<tr>
				<th>Sr No</th>
				<th align="center">Date</th>
				<th align="center">Installation Time</th>
				<th align="center">Vehical No</th>
				<th align="center">Transporter</th>
				<th align="center">Installation Type</th>
				<th align="center">Old Unit Id</th>
				<th align="center">New Unit Id</th>
				<th align="center">Installation By</th>
				<th align="center">Installation place</th>
				<th align="center">Entry By</th>
				<th align="center">Sim No</th>
				<th align="center">Mobile No</th>
				<th align="center">Type Unit</th>
				<th align="center">Voice Call No 1</th>
				<th align="center">Voice Call No 2</th>
				<th align="center">Old Unit Damaged</th>
				<th align="center">New Unit Run On</th>
				<th align="center">Old Unit With</th>
				<th align="center">Entry Date</th>

			</tr>
		</thead>

		<tbody>

                         <% while(rst2.next())
                         {
                            %>	
							<tr>
                        		<td><div align="center"><%=j%></div></td>
			 <%
                        try{
                            %>
               			        <td><%=new SimpleDateFormat("dd/MM/yyyy").format(rst2.getDate("InstDate"))%></td>
                     
                        <%
                        }catch(Exception e)
                           {
	                    out.print("-");
                        }
                                %>
                     		   <td><div align="center"><%=rst2.getString("InstTime")%></div></td>
		        			   <td><div align="center"><%=rst2.getString("VehRegNo")%></div></td>
							   <td><div align="left"><%=rst2.getString("OwnerName")%></div></td>
							   <td><div align="left"><%=rst2.getString("InstType")%></div></td>
							   <td><div align="right"><%=rst2.getString("OldUnitID")%></div></td>
							   <td><div align="right"><%=rst2.getString("NewUnitID")%></div></td>
                        	   <td><div align="left"><%=rst2.getString("InstBy")%></div></td>
							   <td><div align="left"><%=rst2.getString("InstPlace")%></div></td>
                        	   <td><div align="left"><%=rst2.getString("EntBy")%></div></td>
							   <td><div align="right"><%=rst2.getString("SimNo")%></div></td>
							   <td><div align="left"><%=rst2.getString("MobNo")%></div></td>
							   <td><div align="right"><%=rst2.getString("TypeUnit")%></div></td>
							   <td><div align="right"><%=rst2.getString("VoiceCallNo1")%></div></td>
							   <td><div align="right"><%=rst2.getString("VoiceCallNo2")%></div></td>
							   <td><div align="left"><%=rst2.getString("OldUnitDamaged")%></div></td>
							   <td><div align="left"><%=rst2.getString("NewUnitRunOn")%></div></td>
							   <td><div align="left"><%=rst2.getString("OldUnitWith")%></div></td>
                         <%
                        try{
                            %>
                        <td><div align="left"><font color="black"><%=new SimpleDateFormat("dd/MM/yyyy").format(rst2.getDate("EntDate"))%></font></div></td>
                     
                        <%
                        }catch(Exception e)
                           {
	                    out.print("-");
                        }
                                %>
                               
			</tr>	
			<%
                          j++;
                          }
                        
                         %>
                         	</tbody>
		<tfoot>
			<tr>
				<th>Sr No</th>
				<th align="center">Date</th>
				<th align="center">Installation Time</th>
				<th align="center">Vehical No</th>
				<th align="center">Transporter</th>
				<th align="center">Installation Type</th>
				<th align="center">Old Unit Id</th>
				<th align="center">New Unit Id</th>
				<th align="center">Installation By</th>
				<th align="center">Installation place</th>
				<th align="center">Entry By</th>
				<th align="center">Sim No</th>
				<th align="center">Mobile No</th>
				<th align="center">Type Unit</th>
				<th align="center">Voice Call No 1</th>
				<th align="center">Voice Call No 2</th>

				<th align="center">Old Unit Damaged</th>
				<th align="center">New Unit Run On</th>
				<th align="center">Old Unit With</th>
				<th align="center">Entry Date</th>

			</tr>
		</tfoot>
                         
                        </table>
			

                        <br>

			<!-- body part come here -->
                      <%
                          sql2="select * from t_unitreceived where UnitID="+data1+" and Rcevd<>'Partially' order by Rdate asc";
                        ResultSet rst3=st2.executeQuery(sql2);
                        int k=1;
                        
                            
                         %>
                         
       <table border="0" width="750px" bgcolor="" align="center">
		<tr>
			<td align="center" class="sorttable_nosort">
				<div id="report_heding">
					<font color="black" size="3"> Units Received </font>
			</td>
		</tr>
	 </table>

                        <table  id="example2" width="100%" border="0" align="center" class="display">
							<!-- <tr><th  colspan="14" ><font color="black">Units Received</font></th></tr> -->
							<thead>
			<tr>
				<th>Sr No</th>
				<th align="center">Date</th>
				<th align="center">Time</th>
				<th align="center">Receive From</th>
				<th align="center">Courier</th>
				<th align="center">Courier DC No</th>
				<th align="center">Unit Type</th>
				<th align="center">Unit Id</th>
				<th align="center">Transporter</th>
				<th align="center">Location</th>
				<th align="center">Faulty</th>
				<th align="center">Technician Name</th>
				<th align="center">Ent.By</th>
				<th align="center">Dc_No</th>

			</tr>
		</thead>

		<tbody>

  
                         <% while(rst3.next())
                         {
                        %>	
							<tr>
                        		<td><div align="center"><%=k%></div></td>
                         <%
                        try{
                            %>
                      		    <td><div align="center"><%=new SimpleDateFormat("dd/MM/yyyy").format(rst3.getDate("Rdate"))%></div></td>
                     
                        <%
                        }catch(Exception e)
                           {
	                    out.print("-");
                        }
                                %>
                        		<td><div align="left"><%=rst3.getString("Rtime")%></div></td>
                  				<td><div align="left"><%=rst3.getString("ReceiveFrom")%></div></td>
								<td><div align="left"><%=rst3.getString("Courier")%></div></td>
                    		    <td><div align="left"><%=rst3.getString("CourierDCNo")%></div></td>
								<td><div align="left"><%=rst3.getString("Utype")%></div></td>
                     		    <td><div align="right"><%=rst3.getString("UnitID")%></div></td>
                       			<td><div align="left"><%=rst3.getString("Transporter")%></div></td>
                       			<td><div align="left"><%=rst3.getString("Location")%></div></td>
                      			<td><div align="left"><%=rst3.getString("Faulty")%></div></td>
                       			<td><div align="left"><%=rst3.getString("TechName")%></div></td>
                       			<td><div align="left"><%=rst3.getString("EntBy")%></div></td>
                       			<td><div align="right"><%=rst3.getString("DC_NO")%></div></td>
                      		</tr>	
			<%
                          k++;
                          }
                         
                         %>	
                         </tbody>
		<tfoot>
			<tr>
				<th>Sr No</th>
				<th align="center">Date</th>
				<th align="center">Time</th>
				<th align="center">Receive From</th>
				<th align="center">Courier</th>
				<th align="center">Courier DC No</th>
				<th align="center">Unit Type</th>
				<th align="center">Unit Id</th>
				<th align="center">Transporter</th>
				<th align="center">Location</th>
				<th align="center">Faulty</th>
				<th align="center">Technician Name</th>
				<th align="center">Ent.By</th>
				<th align="center">Dc_No</th>

			</tr>
		</tfoot>
					</table>
			
                        <br>
			<%
                          sql3="select * from t_unitmasterhistory where UnitId='"+data1+"' and Status in ('Dispatched','InterDisp') order by DispDate asc";
                        ResultSet rst4=st3.executeQuery(sql3);
                        int n=1;
                        
                        %>
 				<table border="0" width="750px" bgcolor="" align="center">
		<tr>
			<td align="center" class="sorttable_nosort">
				<div id="report_heding">
					<font color="black" size="3">Units Dispatched </font>
			</td>
		</tr>
	</table>


	<table id="example3" class="display" style="width: 100%">
		<thead>
			<tr>
				<th>Sr No</th>
				<th align="center">Dispatch Date</th>
				<th align="center">Unit Id</th>
				<th align="center">Dispatch Address</th>
				<th align="center">Order No</th>
				<th align="center">Mode of Dispatch</th>
				<th align="center">Dispatch Name</th>
				<th align="center">Courier Date</th>
				<th align="center">Chalan No</th>
				<th align="center">Dispatched Id</th>
				<th align="center">User</th>
				<th align="center">Entry By</th>
				<th align="center">Status</th>


			</tr>
		</thead>
		<tbody>
       	
                         
                          <% while(rst4.next())
                         {
                        %>	
						<tr>
                       		   <td><div align="center"><%=n%></div></td>
			
                    
                                               
                         <%
                        try{
                            %>
                        	  <td><div align="center"><%=new SimpleDateFormat("dd/MM/yyyy").format(rst4.getDate("DispDate"))%></div></td>
                     
                        <%
                        }catch(Exception e)
                           {
	                    out.print("-");
                        }
                                %>
                        
                      		  <td><div align="right"><%=rst4.getString("UnitID")%></div></td>     
                        	  <td><div align="left"><%=rst4.getString("DisAdd")%></div></td>
                              <td><div align="right"><%=rst4.getInt("OrderNo")%></div></td>
							  <td><div align="left"><%=rst4.getString("ModeofDispatch")%></div></td>
							  <td><div align="left"><%=rst4.getString("DisName")%></div></td>
                        
                         <%
                        try{
                            %>
                              <td><div align="left"><%=new SimpleDateFormat("dd/MM/yyyy").format(rst4.getDate("CourierDate"))%></div></td>
                     
                        <%
                        }catch(Exception e)
                           {
	                    out.print("-");
                        }
                                %>
                        
			                  <td><div align="right"><%=rst4.getString("ChalanNo")%></div></td>
			                  <td><div align="right"><%=rst4.getInt("DispId")%></div></td>
                              <td><div align="right"><%=rst4.getString("User")%></div></td>
                              <td><div align="left"><%=rst4.getString("EntBy")%></div></td>
			    		      <td><div align="left"><%=rst4.getString("Status")%></div></td>
			               </tr>	
			<%
                          n++;
                          }
                               
			%>
                        
                        </tbody>
		<tfoot>
			<tr>
				<th>Sr No</th>
				<th align="center">Dispatch Date</th>
				<th align="center">Unit Id</th>
				<th align="center">Dispatch Address</th>
				<th align="center">Order No</th>
				<th align="center">Mode of Dispatch</th>
				<th align="center">Dispatch Name</th>
				<th align="center">Courier Date</th>
				<th align="center">Chalan No</th>
				<th align="center">Dispatched Id</th>
				<th align="center">User</th>
				<th align="center">Entry By</th>
				<th align="center">Status</th>


			</tr>
		</tfoot>
                        
					</table>
					<br></br>
					<%
					String sqlquicktest="select * from hwunittest where UnitID='"+data1+"'";	
					ResultSet rsQuickTest=stQuickTest.executeQuery(sqlquicktest);
					int a=1;
					%>
					<table border="0" width="750px" bgcolor="" align="center">
		<tr>
			<td align="center" class="sorttable_nosort">
				<div id="report_heding">
					<font color="black" size="3">Quick Test History </font>
			</td>
		</tr>
	</table>

	<table id="example4" class="display" style="width: 100%">
		<thead>
			<tr>
				<th>Sr No</th>
				<th align="center">The Date</th>
				<th align="center">The Time</th>
				<th align="center">Customer</th>
				<th align="center">Unit Id</th>
				<th align="center">AVLPcbver</th>
				<th align="center">PowPcbver</th>
				<th align="center">WMSN</th>
				<th align="center">Module</th>
				<th align="center">Firmware</th>
				<th align="center">RLED</th>
				<th align="center">GLED</th>
				<th align="center">Power Supply</th>

				<th align="center">PCBModReq</th>
				<th align="center">PCBMod</th>
				<th align="center">GLEDBlink</th>
				<th align="center">SWswver</th>
				<th align="center">SWComment</th>
				<th align="center">SWDebitNote</th>
				<th align="center">User</th>
				<th align="center">Peripheral type.</th>

				<th align="center">Manufacture By</th>
				<th align="center">Correction Done</th>


			</tr>
		</thead>
        <tbody>
                         <% while(rsQuickTest.next())
                         {
                        %>	
				<tr>
                    <td><div align="center"><%=a%></div></td>
						<%
					    try{
                        %>
                    <td><div align="center"><%=new SimpleDateFormat("dd/MM/yyyy").format(rsQuickTest.getDate("TheDate"))%></div></td>
                     
                        <%
                        }catch(Exception e)
                           {
	                    out.print("-");
                        }
                                %>
                        
                    <td><div align="left"><%=rsQuickTest.getString("TheTime")%></div></td>
					<td><div align="left"><%=rsQuickTest.getString("Cust")%></div></td>
					<td><div align="right"><%=rsQuickTest.getString("UnitID")%></div></td>
					<td><div align="left"><%=rsQuickTest.getString("AVLPcbVer")%></div></td>
					<td><div align="left"><%=rsQuickTest.getString("PowPcbVer")%></div></td>
					<td><div align="right"><%=rsQuickTest.getString("WMSN")%></div></td>
                    <td><div align="center"><%=rsQuickTest.getString("Module")%></div></td>
                    <td><div align="center"><%=rsQuickTest.getString("Firmware")%></div></td>
					<td><div align="left"><%=rsQuickTest.getString("RLED")%></div></td>
					<td><div align="left"><%=rsQuickTest.getString("GLED")%></div></td>
					<td><div align="left"><%=rsQuickTest.getString("PowerSupply")%></div></td>
					<td><div align="left"><%=rsQuickTest.getString("PCBModReq")%></div></td>
                    <td><div align="left"><%=rsQuickTest.getString("PCBMod")%></div></td>
                    <td><div align="left"><%=rsQuickTest.getString("GLEDBlink")%></div></td>
                    <td><div align="left"><%=rsQuickTest.getString("SWswver")%></div></td>
                    <td><div align="left"><%=rsQuickTest.getString("SWComment")%></div></td>
                    <td><div align="left"><%=rsQuickTest.getString("SWDebitNote")%></div></td>
                    <td><div align="right"><%=rsQuickTest.getString("User")%></div></td>
                    <td><div align="left"><%=rsQuickTest.getString("Peritype")%></div></td>
                    <td><div align="right"><%=rsQuickTest.getString("ManufactBy")%></div></td>
                    <td><div align="left"><%=rsQuickTest.getString("Correctiondone")%></div></td>
                  </tr>
                       
                        <%
                          a++;
                          }
                         %>
                         </tbody>
		<tfoot>
			<tr>
				<th>Sr No</th>
				<th align="center">The Date</th>
				<th align="center">The Time</th>
				<th align="center">Customer</th>
				<th align="center">Unit Id</th>
				<th align="center">AVLPcbver</th>
				<th align="center">PowPcbver</th>
				<th align="center">WMSN</th>
				<th align="center">Module</th>
				<th align="center">Firmware</th>
				<th align="center">RLED</th>
				<th align="center">GLED</th>
				<th align="center">Power Supply</th>

				<th align="center">PCBModReq</th>
				<th align="center">PCBMod</th>
				<th align="center">GLEDBlink</th>
				<th align="center">SWswver</th>
				<th align="center">SWComment</th>
				<th align="center">SWDebitNote</th>
				<th align="center">User</th>
				<th align="center">Peripheral type.</th>

				<th align="center">Manufacture By</th>
				<th align="center">Correction Done</th>
			</tr>
		</tfoot>
                         
                         </table>
                         <%
}else if("wmsn".equalsIgnoreCase(dataFilter)){
	%>
	<table width="100%" border="2" align="center" class="sortable">
	<tr><td><b>WMSN number is in following unitid.Please check one UnitID to display MIS unit report of that perticular unit</b></td></tr>
	<%
	
	String wmsn1=request.getParameter("wmsnno");
	String sqlwmsn="select Distinct(UnitID) as UnitID from t_unitmasterhistory where WMSN='"+wmsn1+"'";
	System.out.println(sqlwmsn);
	ResultSet rswmsn=stwmsn.executeQuery(sqlwmsn);
	while(rswmsn.next()){
		%>
			<tr><td><a href="#" onClick="window.open ('MISunithistory.jsp?dataFilter=unit&data=<%=rswmsn.getString("UnitID")%>','win1','width=900,height=550,location=0,menubar=0,scrollbars=1,status=0,toolbar=0,resizable=0')"><%=rswmsn.getString("UnitID")%></a></td>
			</tr>
		
		
		<%
	}
	%>
	</table>
						<%
						
}else if("sim".equalsIgnoreCase(dataFilter)){
	%>
	<table width="100%" border="2" align="center" class="sortable">
	<tr><td><b>SIM number is in following unitid.Please check one UnitID to display MIS unit report of that perticular unit</b></td></tr>
	<%
	
	String sim=request.getParameter("sim");
	String sqlwmsn="select Distinct(UnitID) as UnitID from t_unitmasterhistory where SimNo='"+sim+"'";
	System.out.println(sqlwmsn);
	ResultSet rswmsn=stwmsn.executeQuery(sqlwmsn);
	while(rswmsn.next()){
		%>
			<tr><td><a href="#" onClick="window.open ('MISunithistory.jsp?dataFilter=unit&data=<%=rswmsn.getString("UnitID")%>','win1','width=900,height=550,location=0,menubar=0,scrollbars=1,status=0,toolbar=0,resizable=0')"><%=rswmsn.getString("UnitID")%></a></td>
			</tr>
		
		
		<%
	}
	%>
	</table>
						<%
}else if("mobile".equalsIgnoreCase(dataFilter)){
	%>
	<table width="100%" border="2" align="center" class="sortable">
	<tr><td><b>Mobile number is in following unitid.Please check one UnitID to display MIS unit report of that perticular unit</b></td></tr>
	<%
	
	String mobile=request.getParameter("mobile");
	String sqlwmsn="select Distinct(UnitID) as UnitID from t_unitmasterhistory where MobNo='"+mobile+"'";
	System.out.println(sqlwmsn);
	ResultSet rswmsn=stwmsn.executeQuery(sqlwmsn);
	while(rswmsn.next()){
		%>
			<tr><td><a href="#" onClick="window.open ('MISunithistory.jsp?dataFilter=unit&data=<%=rswmsn.getString("UnitID")%>','win1','width=900,height=550,location=0,menubar=0,scrollbars=1,status=0,toolbar=0,resizable=0')"><%=rswmsn.getString("UnitID")%></a></td>
			</tr>
		
		
		<%
	}
	%>
	</table>
						<%
}else{
	
}
                         %>
                     
                        
			
<%
}}catch(Exception e)
{
    out.print("Exception -->"+e);

}
finally
{
    conn.close();
    conn1.close();

}
%>



<br>
<br>


<!--Code for SIM Radio Button Issue IN JQuery  -->
<script type="text/javascript">
	$(function() {
	    $("input[type='radio']").on('click', function() {
	    	if ($("#a1").is(":checked")) {							//a1,b1,c1,d1 are id of radio buttons
	    															//a,b,c,d,e are id of input text boxes
	        	$('#a').show();						
	            $('#d').hide();
	            $('#b').hide();
	            $('#c').hide();
	            $('#e').show();
	           
	        }
	       else if ($("#b1").is(":checked")) {
	        	 
	    	   	$('#a').hide();
	            $('#d').hide();
	            $('#b').show();
	            $('#c').hide();
	            $('#e').show();
	          
	           
	        }
	        else if ($("#c1").is(":checked")) {
	        	 
	        	$('#a').hide();
	            $('#d').hide();
	            $('#b').hide();
	            $('#c').show();
	            $('#e').show();
	          
	           
	        }
	        else if ($("#d1").is(":checked")) {
	        	 
	        	$('#a').hide();
	            $('#d').show();
	            $('#b').hide();
	            $('#c').hide();
	            $('#e').show();
	          
	           
	        }
	    });
	});
	
	
</script> 

<%@ include file="footer.jsp"%>
</body>

</html>


