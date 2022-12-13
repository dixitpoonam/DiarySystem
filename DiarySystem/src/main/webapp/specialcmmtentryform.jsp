<%@ page language="java"%>
    <%@include file="MenuNew.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Seven Day Diary System</title>
<link rel="stylesheet" href="css/css.css" type="text/css" charset="utf-8" />
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
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

    <script src="sorttable.js" type="text/javascript"></script>
	<style type="text/css">@import url(jscalendar-1.0/calendar-win2k-1.css);</style>
	<script type="text/javascript" src="jscalendar-1.0/calendar.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/lang/calendar-en.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/calendar-setup.js"></script>
	
	<!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">


<script>
function showType(id)
{
	//alert(id);
	if(id==0)
	{
		document.getElementById("radioSelected").value="tech";
		document.getElementById("techrow").style.display="";
		document.getElementById("unitrow").style.display="none";
		document.getElementById("vehiclerow").style.display="none";
		document.getElementById("closingvehiclerow").style.display="none";
	}
	else if(id==1)
	{
		document.getElementById("radioSelected").value="unit";
		document.getElementById("unitrow").style.display="";
		document.getElementById("techrow").style.display="none";
		document.getElementById("vehiclerow").style.display="none";
		document.getElementById("closingvehiclerow").style.display="none";
	}
	else if(id==2)
	{
		document.getElementById("radioSelected").value="vehicle";
		document.getElementById("vehiclerow").style.display="";
		document.getElementById("unitrow").style.display="none";
		document.getElementById("techrow").style.display="none";
		document.getElementById("closingvehiclerow").style.display="none";
	}
	else if(id==3)
	{
		document.getElementById("radioSelected").value="ClosingVehicle";
		document.getElementById("unitrow").style.display="none";
		document.getElementById("techrow").style.display="none";
		document.getElementById("vehiclerow").style.display="none";
		document.getElementById("closingvehiclerow").style.display="";
	}
	//document.spcomment1.submit();
}

function validate()
{ 
	//alert("in validation");
	//alert(document.getElementById("radioSelected").value);
	var radioSelected=document.getElementById("radioSelected").value;
	if(radioSelected=="tech")
	{
		var comm=document.getElementById("techcomment").value;
		if(comm=="")
		{
			alert("Please Enter Comments for technician");
			return false;
		}
	}

	if(radioSelected=="unit")
	{
		var comm=document.getElementById("unitcomment").value;
		if(comm=="")
		{
			alert("Please Enter Comments for unit");
			return false;
		}
	}
	if(radioSelected=="vehicle")
	{
		var comm=document.getElementById("vehiclecomment").value;
		if(comm=="")
		{
			alert("Please Enter Comments for Vehicle");
			return false;
		}
	}
	if(radioSelected=="ClosingVehicle")
	{
		var comm=document.getElementById("closingvehiclecomment").value;
		if(comm=="")
		{
			alert("Please Enter Closing Comments for Vehicle");
			return false;
		}
	}

	
		
		return true;
		
}
</script>

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
	                        title: 'Special Comments', 

							
	                    },
	                    {
	                        extend: 'pdf',
	                        orientation: 'landscape',
	                        pageSize: 'LEGAL',
	                        title: 'Special Comments', 	                        
	                       
	                     },
	                    {
	                        extend: 'csv',
	                        title: 'Special Comments', 	                       
	                    },
	                    {
	                        extend: 'print',
	                        title: 'Special Comments', 	                        
	                    },
	                    {
	                        extend: 'copy',
	                        title: 'Special Comments', 	                       
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
Class.forName(MM_dbConn_DRIVER);

Connection conn = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
Statement st = conn.createStatement();

final String result=request.getParameter("result");
final String comment=request.getParameter("comment");
final String inserted=request.getParameter("inserted");

%>

<div align="center">
<h2>Special Comment Report</h2>
</div>


<br>
<br>
		<%if(inserted!=null)
	{
 %>
		<table border="0" width="800px" align="center">
			<tr>	
				<td align="center"> <font color="maroon"> Successfully Inserted </font> </td>
			</tr>
		</table>
<% 	}
	if(result!=null)
	{ 
%>
		<table border="0" width="800px"  align="center">
			<tr>	
				<td align="center"> <font color="maroon"> Comment <%=result %> Successfully</font> </td>
			</tr>
		</table>
<% 	
	}
%>
<br>

  <button type="button" data-toggle="modal" data-target="#AddCommentModal">Add New Comment</button>
<br>
<br>
<table id="example" class="display">
<thead>
<tr>
<th>Sr.No</th>
<th>Category</th>
<th>Comment</th>
<th>Billable</th>
</tr>
</thead>
<tbody>
<%
int i=0;
String sqlcomments = "select * from  db_CustomerComplaints.t_commentlist where Modulename='DiarySystem' order by Listname";
System.out.println("comments query:"+sqlcomments);
ResultSet rscom = st.executeQuery(sqlcomments);
while(rscom.next()){
	%><tr>
	<td align="right"><%=i++%></td>
	<td align="left"><%=rscom.getString("Listname")%></td>
	<td align="left"><%=rscom.getString("Comment")%></td>
	<td align="left"><%=rscom.getString("Billable")%></td>
	</tr>
<%}
%>
</tbody>
<tfoot>
<tr>
<th>Sr.No</th>
<th>Category</th>
<th>Comment</th>
<th>Billable</th>
</tr>
</tfoot>
</table>

	<div class="modal fade" id="AddCommentModal" role="dialog"> <!-- 1 -->
		<div class="modal-dialog">                              <!-- 2 -->
			<div class="modal-content" style="width: 900px">   <!-- 3 -->

				<!-- Modal Header -->
				<div class="modal-header">   <!-- Model header -->
					<h4 class="modal-title text-center">
						<b>Special Comment Entry Form</b>
					</h4>
				</div>
				<div class="modal-body">
					<table width="100%" border="0">
						<tr>
							<td align="center">
								<form name="spcomment11" method="get">
									<input type="hidden" name="commentfor" value="<%=comment%>" />
									<input type="radio" name="type" value="Tech" checked
										onClick="showType(0);"><font><b>Tech</b></font>&nbsp;&nbsp;&nbsp;
									<input type="radio" name="type" value="Unit"
										onClick="showType(1);"><font><b>Unit</b></font>&nbsp;&nbsp;&nbsp;<input
										type="radio" name="type" value="Vehicle"
										onClick="showType(2);"><font><b>Vehicle</b></font>&nbsp;&nbsp;&nbsp;<input
										type="radio" name="type" value="ClosingVehicle"
										onClick="showType(3);"><font><b>Vehicle
											Closing Comment</b></font>
								</form>
							</td>

						</tr>
					</table>
					<br>
					<table border="0" width="350px" align="center">
						<form name="spcomment" method="get" action="spcommentinsrt.jsp"
							onSubmit="return validate();">
							<input type="hidden" name="radioSelected" id="radioSelected"
								value="tech">
							<tr id="techrow">
								<td align="center"><b>Techinician Comment</b></td>
								<td align="left"><input type="text" name="techcomment"
									id="techcomment"></input></td>
							</tr>
							<tr id="unitrow" style="display: none">
								<td align="center"><b> Unit Comment </b></td>
								<td><input type="text" name="unitcomment" id="unitcomment"
									value="" /></td>
							</tr>
							<tr id="vehiclerow" style="display: none">
								<td align="center"><b>Vehicle Comment </b></td>
								<td><input type="text" name="vehiclecomment"
									id="vehiclecomment" value=""></input></td>
							</tr>
							<tr id="closingvehiclerow" style="display: none">
								<td align="center"><b>Vehicle Closing Comment </b></td>
								<td><input type="text" name="closingvehiclecomment"
									id="closingvehiclecomment" value=""></input></td>
							</tr>
							<tr>
								<td colspan="2" align="center"><input type="submit"
									name="submit" value="ADD" class="formElement"></input></td>
							</tr>
						</form>
					</table>
					</div>
					<div class="modal-footer">
						 <button type="button" class="close" data-dismiss="modal">Close</button>
					 <div>
				</div>
			</div>  <!-- 3 -->
		</div> <!-- 2 -->
	</div>  <!-- 1 -->
	
<%
conn.close();
%>
</body>
</html>