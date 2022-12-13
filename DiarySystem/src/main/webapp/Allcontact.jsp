<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java"
	import="java.sql.*" import=" java.text.*" import=" java.util.*"
	errorPage=""%>
	
<%@page import="com.transworld.diary.framework.RecieverInformation"
		import="com.transworld.diary.framework.UnitDetailsDao"
%>

<%@ include file="header.jsp"%>

<html>
<head>
<jsp:useBean id="unitDetailsDao" 
			 type="com.transworld.diary.framework.UnitDetailsDao"
			 scope="application">
</jsp:useBean>

	<style type="text/css">
		@import url(jscalendar-1.0/calendar-win2k-1.css);
	</style>

<script type="text/javascript" src="jscalendar-1.0/calendar.js"></script>
<script type="text/javascript" src="jscalendar-1.0/lang/calendar-en.js"></script>
<script type="text/javascript" src="jscalendar-1.0/calendar-setup.js"></script>







<%-- <%!public int nullIntconv(String str) {
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
	}%> --%>



<!-- <style type=text/css>
 table.mytable {
	font: 13px arial, sans-serif;
	border-collapse: collapse;
	/* border: 1px solid #839E99; */
	background: #f8fcff;

</style> -->

<title>Seven Day Diary System</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="style.css" type="text/css" charset="utf-8" />
<link rel="stylesheet" href="css/css.css" type="text/css"
	charset="utf-8" />

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

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




<style></style>


<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$('#example')
								.DataTable(
										{
											//	"pagingType": "full_numbers",

											dom : 'Blfrtip',
											"bLengthChange" : false,
											buttons : [

													{
														extend : 'collection',

														text : 'Export',
														buttons : [
																{
																	extend : 'excel',
																	title : 'All Contact '
																			/* + $(
																					"#data")
																					.val()
																			+ '-'
																			+ $(
																					"#data1")
																					.val(), */
																},
																{
																	extend : 'pdf',
																	orientation : 'landscape',
																	pageSize : 'LEGAL',
																	title : 'All Contact '
																			
																},
																{
																	extend : 'csv',
																	title : 'All Contact '
																			
																},
																{
																	extend : 'print',
																	title : 'All Contact '
																			
																},
																{
																	extend : 'copy',
																	title : 'All Contact '
																			
																},

														/* 'copy', 'csv', 'excel', 'pdf', 'print' */

														]
													},

													'colvis', 'pageLength' ],

											"oLanguage" : {
												"sSearch" : "Search"
											},

											lengthMenu : [
													[ 10, 25, 50, -1 ],
													[ '10 Rows', '25 Rows',
															'50 Rows',
															'Show all' ],

											],

											"aoColumns" : [ null, null, null, null, null, null, null,
																null

											]
										});
					});
	jQuery.extend(jQuery.fn.dataTableExt.oSort, {
		"date-uk-pre" : function(a) {
			var ukDatea = a.split('/');
			return (ukDatea[2] + ukDatea[1] + ukDatea[0]) * 1;
		},

		"date-uk-asc" : function(a, b) {
			return ((a < b) ? -1 : ((a > b) ? 1 : 0));
		},

		"date-uk-desc" : function(a, b) {
			return ((a < b) ? 1 : ((a > b) ? -1 : 0));
		}
	});
</script>

<!-- <style>
		 #example {
			font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
			/* border-collapse: collapse; */
			width: 100%;
		}
		
		#example td, #example th {
			/* border: 1px solid #ddd; */
			padding: 16px;
		}
		
		#example tr:nth-child(even) {
			/* background-color: #f2f2f2; */
		}
		
		#example tr:hover {
			background-color: #ddd;
		}
		
		#example th {
			padding-top: 12px;
			padding-bottom: 12px;
			text-align: left;
			background-color: #4CAF50;
			color: white;
		} 
</style> -->

</head>

<%@ include file="MenuNew.jsp" %>
<br><br>

<body>
	<!-- <div id="wrapper"> -->
		<!-- <div id="logo">
			<h1>
				<img src="images/Transworld.gif">
			</h1>
			<p>We care about your Vehicles</p>
		</div> -->
		<P></p>
		<%-- <%@ include file="header1.jsp"%></div> --%>
		
<%
	final String username=session.getAttribute("username").toString();
	final String transpoter="";
	final String activeStatus="Yes";
	int details=0;
	List<RecieverInformation> recieverInformation=null;
	try
	{
		recieverInformation=unitDetailsDao.getRecieverInformation(transpoter,activeStatus);
		details = recieverInformation.size();
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
%>

<!-- <div class="form" style="width: 750px; color: black;"> -->
	<table id="example"  align="center" class="display" style="width: 100%">
		<thead>
			<tr>
											
				<th style="   padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: center;"  >Sr.no</th>  <!-- background-color: #e6e6e6; color: black;"-->
				
				<th style="   padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: center;  ">Transporter</th>  <!-- border: 1px solid #ddd; -->
				
				<th style="   padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: center;  ">Contact Name</th>
				
				<th style="   padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: center;  ">Phone</th>
				
				<th style="   padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: center;  ">Mobile</th>
				
				<th style="   padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: center;  ">Email</th>
				
				<th style="   padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: center;  ">Location</th>
				
				
				<th style="   padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: center;  ">Comment</th>
												
			</tr>
		</thead>



<%
	for (int counter = 0; counter < details; counter++) 
		{
			final RecieverInformation currentRecord = recieverInformation.get(counter);
			int i = counter+1;
%>

<tr>
        <td align="center"><font face=Arial><%=i%></font></td>
        <td align="center"><font face=Arial><%=currentRecord.getTransporter()%></font></td>
		
		  <td align="center"><font face=Arial>
		<a href="#" onclick="window.open ('last10callinfo.jsp?reciever=<%=currentRecord.getContactName()%>&trans=<%=currentRecord.getTransporter()%>&limit=10','win1','width=900,height=550,location=0,menubar=0,scrollbars=1,status=0,toolbar=0,resizable=0')"><%=currentRecord.getContactName()%></a>
	</font></td>
		 <td align="center"><font face=Arial><%=currentRecord.getPhoneNumber()%></font></td>
		 <td align="center"><font face=Arial><%=currentRecord.getMobileNumber()%></font></td>
		 <td align="center"><font face=Arial><a href="mailto:<%=currentRecord.getEmailId()%>?subject=Vehicle%20Complaints%20"><%=currentRecord.getEmailId()%></a></font></td>
	<td align="center"><font face=Arial><%=currentRecord.getPlaceName()%></font></td>
		<td align="center"><font face=Arial><a href="javascript: flase" onclick="window.open ('addcall.jsp?reciever=<%=currentRecord.getContactName()%>&trans=<%=currentRecord.getTransporter()%>', 'win1', 'width=400, height=250, location=0, menubar=0, scrollbars=0, status=0, toolbar=0, resizable=0')">
		Click</a></font></td>
</tr>

<%
	}
%>
</table>




<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	<!-- <table border="1" width="100%" align="center">
		<tr><td bgcolor="#98AFC7" class="copyright" width="100%">
			<center>Copyright &copy; 2008 by Transworld Compressor Technologies Ltd. All Rights Reserved.</center>
		</td></tr>
	</table> -->
	<%@ include file="footer.jsp"%>
</body>
</html>










