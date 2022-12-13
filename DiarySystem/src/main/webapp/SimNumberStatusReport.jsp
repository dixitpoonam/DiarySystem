<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="org.apache.poi.util.SystemOutLogger"%>
<%@ page contentType="text/html; charset=iso-8859-1" language="java"
	import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage=""%>
    <%@ page import="java.sql.PreparedStatement"  %>
    <%@ page import="java.sql.Connection" %>
    <%@ page import="java.sql.DriverManager" %>
	<%@ include file="header.jsp"%>
	
<%@page import="java.sql.ResultSet"%>

<%!
public int nullIntconv(String str)
{   
    int conv=0;
    if(str==null)
    {
        str="0";
    }
    else if((str.trim()).equals("null"))
    {
        str="0";
    }
    else if(str.equals(""))
    {
        str="0";
    }
    try{
        conv=Integer.parseInt(str);
    }
    catch(Exception e)
    {
    }
    return conv;
}
%>
<html>
<head><style type=text/css>table.mytable{font:13px arial,sans-serif;border-collapse: collapse; border: 1px solid #839E99;background: #f8fcff;}</style>
<title>Simmaster Report</title>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="style.css" type="text/css" charset="utf-8" />
	<link rel="stylesheet" href="css/css.css" type="text/css" charset="utf-8" />
	<script src="sorttable.js" type="text/javascript"></script>
	<style type="text/css">@import url(jscalendar-1.0/calendar-win2k-1.css);</style>
	<script type="text/javascript" src="jscalendar-1.0/calendar.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/lang/calendar-en.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/calendar-setup.js"></script>
</script>
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css">
<link rel="stylesheet"
	href="https://cdn.datatables.net/responsive/2.2.1/css/responsive.dataTables.min.css">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript"
	src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
 -->
<link rel="stylesheet" href="css/styleMakePlan.css">
<!-- Export Options Links of DataTables -->

<link rel="stylesheet"
	href="https://cdn.datatables.net/buttons/1.5.1/css/buttons.dataTables.min.css">
<script
	src=" https://cdn.datatables.net/buttons/1.5.1/js/dataTables.buttons.min.js"></script>
<script
	src=" https://cdn.datatables.net/buttons/1.5.1/js/buttons.flash.min.js"></script>
<script
	src=" https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script
	src=" https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js"></script>
<script
	src=" https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js"></script>
<script
	src=" https://cdn.datatables.net/buttons/1.5.1/js/buttons.html5.min.js"></script>
<script
	src=" https://cdn.datatables.net/buttons/1.5.1/js/buttons.print.min.js "></script>
<script type="text/javascript"
	src="//cdn.datatables.net/plug-ins/1.10.19/sorting/date-dd-MMM-yyyy.js"></script>
<script type="text/javascript"
	src="//cdnjs.cloudflare.com/ajax/libs/moment.js/2.8.4/moment.min.js"></script>
<script type="text/javascript"
	src="//cdn.datatables.net/plug-ins/1.10.19/sorting/datetime-moment.js"></script>


<script type="text/javascript">
	$(document).ready(
			function() {

				$('#example').DataTable(
						{
							"pagingType" : "full_numbers",

							dom : 'Blfrtip',
							responsive : true,
							scrollY : "500px",
							scrollX : true,
							scrollCollapse : true,
							buttons : [

							{
								extend : 'collection',

								text : 'Export',
								buttons : [ {
									extend : 'excel',
									title : 'Sim Master Report', 

								}, {
									extend : 'pdf',
									title : 'Sim Master Report',
									pageSize : 'A0',
								}, {
									extend : 'csv',
									title : 'Sim Master Report',
								}, {
									extend : 'print',
									title : 'Sim Master Report',
								}, {
									extend : 'copy',
									title : 'Sim Master Report',
								},

								/* 'copy', 'csv', 'excel', 'pdf', 'print' */
								]
							} ],
							lengthMenu : [ [ -1, 10, 25, 50, 100 ],
									[ "All", 10, 25, 50, 100 ] ],

						});
			});
</script>
<style type=text/css>
table.mytable {
	font: 13px arial, sans-serif;
	border-collapse: collapse;
	border: 1px solid #839E99;
	background: #f8fcff;
}
#example {
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	border-collapse: collapse;
	width: 100%;
}

#example td, #example th {
	border: 1px solid #ddd;
	padding: 16px;
}

#example tr:nth-child(even) {
	background-color: #f2f2f2;
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

</style>

</head>

<body>
<div id="wrapper">
<div id="logo">
<h1><img src="images/Transworld.gif"></h1>
<p>We care about your Vehicles</p>
</div>
<P></p>
<%@ include file="header1.jsp"%></div>
<div id="gbox1"><!-- <div id="gbox-top1"> </div> -->
<div id="gbox-bg1">
<div id="gbox-grd1"><!--- code start here ------> 
<%!
Connection conn;
Statement st1,st2,st3,st4,st5;
String query1,query2,query3,query4,query5;
%>


<%
String operator = request.getParameter("operator");
String status = request.getParameter("status");


try{
	System.out.println("Creating Connection");
	Class.forName(MM_dbConn_DRIVER);
    conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
    st1=conn.createStatement();
    st2=conn.createStatement();
    st3=conn.createStatement();
    st4=conn.createStatement();
    st5=conn.createStatement();
    	
		
	ResultSet rsPagination = null;
    ResultSet rsRowCnt = null;
    
    PreparedStatement psPagination=null;
    PreparedStatement psRowCnt=null;
    
    int iShowRows=10;  // Number of records show on per page
    int iTotalSearchRecords=10;  // Number of pages index shown
    
    int iTotalRows=nullIntconv(request.getParameter("iTotalRows"));
    int iTotalPages=nullIntconv(request.getParameter("iTotalPages"));
    int iPageNo=nullIntconv(request.getParameter("iPageNo"));
    int cPageNo=nullIntconv(request.getParameter("cPageNo"));
    
    int iStartResultNo=0;
    int iEndResultNo=0;

    if(iPageNo==0)
    {                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
        iPageNo=0;
    }
    else{
        iPageNo=Math.abs((iPageNo-1)*iShowRows);
    }
    
    System.out.println("Connection Created");
    
%>

<table border="0" width="750px" bgcolor="#E6E6E6" align="center">
	<tr>
		<td>
			<table border="0" width="100%">
				<tr><td align="center"><font  color="black" size="3"><b>Sim Master Report</font></td></tr>
			</table>
		</td>
	</tr>
</table>
<br/>
<form name="unit" id ="unit" method="post" onsubmit="return confirmSubmit();" >
      <table border="0" width="750px" bgcolor="#E6E6E6" align="center">          	
			<tr  bgcolor="#BDBDBD"> 
			 	<td align="center"><font size="2"><b>Operator</b></font>
			 	</td>
			     <td align ="center">
			     	<div>
							<select class="element select medium" id="operator" name="operator" style="width: 125px; height: 25px;" > 								
								<%
									if(operator==null)
									{
									%><option value="select" >select</option>
									<option value="All" >All</option>
									<%
					            	query1 = "select DISTiNCT(Service_provider) as operator  from db_gps.t_simmaster where Service_provider <> '-' AND Service_provider <> '' order by Service_provider asc";
									System.out.println("The query is :"+query1);
					             	ResultSet rs1 = st1.executeQuery(query1);
					             	while(rs1.next())
					              	{
									%>
									<option value="<%=rs1.getString("operator") %>" ><%=rs1.getString("operator")%></option>
									<%} 
									}else{
										%><option value="select" >select</option>
										<option value="All" >All</option><%
										query1 = "select DISTiNCT(Service_provider) as operator  from db_gps.t_simmaster where Service_provider <> '-'  AND Service_provider <> ''";
										System.out.println("The query is :"+query1);
						             	ResultSet rs1 = st1.executeQuery(query1);
						             	while(rs1.next())
						              	{
										
											if(rs1.getString("operator").equals(operator))
											{
												%><option value="<%=rs1.getString("operator") %>" selected><%=rs1.getString("operator")%></option><%
											}else{
												%><option value="<%=rs1.getString("operator") %>" ><%=rs1.getString("operator")%></option><%
											}
									    } 
									}
									%>
							</select>
					</div> 
				</td>
				<td align="center"><font size="2"><b>Status</b></font>
				</td>
				<td align ="center">
					<div>
							<select class="element select medium" id="status" name="status" style="width: 125px; height: 25px;" > 							
								
								<%
									if(status==null)
									{
									%><option value="select" >select</option>
									<option value="All">All</option>
									<%
					            	query2 = "select DISTiNCT(Status) as Status  from db_gps.t_simmaster where Status <> '-' AND Status <> ''";
									System.out.println("The query is :"+query2);
					             	ResultSet rs2 = st2.executeQuery(query2);
					             	while(rs2.next())
					              	{
								%>
								
									<option value="<%=rs2.getString("Status") %>" ><%=rs2.getString("Status")%></option>
								<%} 
					             	
									}else{
										%><option value="select" >select</option>
										<option value="All" >All</option>
										<%
										query1 = "select DISTiNCT(Status) as Status  from db_gps.t_simmaster where Status <> '-'  AND Status <> ''";
										System.out.println("The query is :"+query1);
						             	ResultSet rs1 = st1.executeQuery(query1);
						             	while(rs1.next())
						              	{
										System.out.println("Using Result statsus"+rs1.getString("status"));
											if(rs1.getString("status").equals(status))
											{
												%><option value="<%=rs1.getString("status") %>" selected><%=rs1.getString("status")%></option><%
											}else{
												%><option value="<%=rs1.getString("status") %>" ><%=rs1.getString("status")%></option><%
											}
									    }
									}
								%>
								
							</select>
					</div>
				</td>
				
	        <td align ="center">	
	         <input type="hidden" id="action" name="action" value="Sim Master Report">   	             
	        	<input type="submit" name="	" id="sub" value="submit" style="background: #E6E6E6;"/>
	        </td>
		</tr>
	</table>
</form>
<br/>	
<% 

    System.out.println("The operator is  :"+operator);
	System.out.println("The status is :"+status);
	
%>
 

	<table border="0" width="750px" bgcolor="#E6E6E6" align="center">
	<tr>
		<td>
			<table border="0" width="100%">
				<tr><td align="center"><font  color="black" size="3"><b>Sim Master Report of <%=operator %></font></td></tr>
			</table>
		</td>
	</tr>
</table>

<div class="form" style="width: 750px; color: black;">
									<table id="example" width="750px" border="0" align="center">


										<thead>
											<tr>
												<th
													style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: left; background-color: #e6e6e6; color: black;">SrNo.</th>

												<th
													style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: left; background-color: #e6e6e6; color: black;">MobNo</th>


												<th
													style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: left; background-color: #e6e6e6; color: black;">DateOfPurchase
												</th>

												<th
													style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: left; background-color: #e6e6e6; color: black;">Status
													</th>

												<th
													style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: left; background-color: #e6e6e6; color: black;">DeactivationDate</th>

												<th
													style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: left; background-color: #e6e6e6; color: black;">ActivationDate
													</th>
													
													
												<th
													style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: left; background-color: #e6e6e6; color: black;">ServiceProvider
													</th>
													
												<th
													style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: left; background-color: #e6e6e6; color: black;">Plan
													</th>
													
													<th
													style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: left; background-color: #e6e6e6; color: black;">Category
												</th>
</tr>
</thead>
<tbody>
<!-- = '" + status  + "' -->
<% 
int i=1;

if(operator.equals("All")&&status.equals("All")){
	query3	="select SrNo,Simno,Mobno, DATE_FORMAT(DateOfPurchase, '%d-%b-%Y') as DateOfPurchase ,Status,DATE_FORMAT(DeactiveDate, '%d-%b-%Y') as DeactivationDate,Unitid,AccountNo,PurchaseNo, DATE_FORMAT(ActivationDate, '%d-%b-%Y') as ActivationDate ,Service_provider,LastFTPDump,Plan,category from db_gps.t_simmaster"; 
	
}									

else if(operator.equals("All")&&status.equals(status)){
	query3	="select SrNo,Simno,Mobno, DATE_FORMAT(DateOfPurchase, '%d-%b-%Y') as DateOfPurchase ,Status,DATE_FORMAT(DeactiveDate, '%d-%b-%Y') as DeactivationDate,Unitid,AccountNo,PurchaseNo, DATE_FORMAT(ActivationDate, '%d-%b-%Y') as ActivationDate ,Service_provider,LastFTPDump,Plan,category from db_gps.t_simmaster where Status  = '" + status  + "'"; 
	
}
else if(operator.equals(operator)&&status.equals("All")){
	query3	="select SrNo,Simno,Mobno, DATE_FORMAT(DateOfPurchase, '%d-%b-%Y') as DateOfPurchase ,Status,DATE_FORMAT(DeactiveDate, '%d-%b-%Y') as DeactivationDate,Unitid,AccountNo,PurchaseNo, DATE_FORMAT(ActivationDate, '%d-%b-%Y') as ActivationDate ,Service_provider,LastFTPDump,Plan,category from db_gps.t_simmaster where operator  = '" + operator  + "'"; 
	
}
else if(operator.equals(operator)&&status.equals(status)){
query3="select SrNo,Simno,Mobno, DATE_FORMAT(DateOfPurchase, '%d-%b-%Y') as DateOfPurchase ,Status,DATE_FORMAT(DeactiveDate, '%d-%b-%Y') as DeactivationDate,Unitid,AccountNo,PurchaseNo, DATE_FORMAT(ActivationDate, '%d-%b-%Y') as ActivationDate ,Service_provider,LastFTPDump,Plan,category from db_gps.t_simmaster where Status  = '" + status  + "'  and Service_provider ='" + operator  + "'  "; 
}


ResultSet rs3 = st3.executeQuery(query3);

System.out.println("queryyyy " + query3);
while(rs3.next())
{

	String MOBNO=rs3.getString("Mobno");
	String Dop=rs3.getString("DateOfPurchase");
	String stus=rs3.getString("Status");
	String Deactivedate=rs3.getString("DeactivationDate");
	String Activedate=rs3.getString("ActivationDate");
	String servicepro=rs3.getString("Service_provider");
	String plan=rs3.getString("Plan");
	String category=rs3.getString("category");
	


%>
<%
if(Activedate == null || Activedate.equals(null)){
	Activedate="-";
}
if(Deactivedate == null || Deactivedate.equals(null)){
	Deactivedate="-";
}

%>


<tr>

<td><%=i%></td>
<td><%=MOBNO%></td>
<td><%=Dop%></td>
<td><%=stus%></td>
<td><%=Deactivedate%></td>
<td><%=Activedate%></td>
<td><%=servicepro%></td>
<td><%=plan%></td>
<td><%=category%></td>

</tr>
<% 
i++;
}

}catch(Exception e){
	System.out.println(" Exception E " + e);
}
%>
</tbody>

</body>
</html>


