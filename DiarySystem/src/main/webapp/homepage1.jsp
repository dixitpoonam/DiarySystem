<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 4.01 Strict//EN""http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<%@ include file="header.jsp" %>		
	 

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

<title>Seven Day Diary System.</title>
<link rel="stylesheet" href="style.css" type="text/css" charset="utf-8" />
<link rel="stylesheet" href="css/css.css" type="text/css" charset="utf-8" />
<script src="sorttable.js" type="text/javascript"></script>
<style type="text/css">@import url(jscalendar-1.0/calendar-win2k-1.css);</style>
<script type="text/javascript" src="jscalendar-1.0/calendar.js"></script>
<script type="text/javascript" src="jscalendar-1.0/lang/calendar-en.js"></script>
<script type="text/javascript" src="jscalendar-1.0/calendar-setup.js"></script>

</head>

<body>

<div id="outer">
<div id="wrapper">
  <div id="body-bot">
    <div id="body-top">
      <div id="logo">
        <h1><img src="images/Transworld.gif"></h1>
        <p>We care about your Vehicles</p>
      </div>
      <p></p>
     <%@ include file="header1.jsp" %>
     </div> 
<div id="gbox1">
        <div id="gbox-top1"> </div>
        <div id="gbox-bg1">
          <div id="gbox-grd1">
<!--- code start here ------>
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
	System.out.println("in connection created");	
%>
<table border="0" width="750px" bgcolor="#E6E6E6" align="center">
	<tr bgcolor="#BDBDBD"><td align="center"><font color="#2A0A12" size="3"><b>ALL TRANSPORTERS LIST.</b></font></td></tr>
	<tr> 
		<td>
			<div align="left"><font color="red"><B><I>Note:</I></B>Click On Transporter To Go On It's FullFleet Page.</font></div>
		</td>
	</tr>	
	</table>
	
	<br></br>
			
			
			<table>
			<tr>
			<td> <a href="fullfleet.jsp?transporter=Vehall " >Export All Vehicles </a> </td>
			</tr>
			</table>
			<table border="1" width="100%" align="center" class="sortable">
			<tr bgcolor="#BDBDBD">
				<td><b>Sr.</b></td>
				<td><b>Transporter</b></td>
			</tr>
<%
	try
	{
		int i=1;
		transporterlist=transporterlist.substring(3,transporterlist.length()-1);
		transporterlist=transporterlist.replace(",","','");
		String sql="select Distinct(OwnerName) from db_gps.t_vehicledetails where  OwnerName in ('"+transporterlist+"') order by OwnerName";

		ResultSet rs=st.executeQuery(sql);
		while(rs.next()){
%>			
	<tr>					
	    	<td width="5%"><div align="right"><%=i%></div></td>
	    	<%
					String trans=rs.getString("OwnerName");
	    	String trans1=rs.getString("OwnerName");
					trans=trans.replace("&","...");
	    	
					%>
					
    	    <td width="20%">
    	    
    	    <div align="left">
    	    <a href="fullfleet.jsp?transporter=<%=trans%>"><%=trans1%></a></div>
    	    </td>
    	    
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
%>
	</table>
<%

try
{
	conn.close();
}catch(Exception e)
{}
	
	}	
%>
		
		
		



<!-- code end here --->

 		</div>
 						 </div>
 					<div id="gbox-bot1"> </div>
  					</div>
 				 </div>
 			 </div>
 		 </div>
  <table border="1" width="100%" align="center">
<tr><td bgcolor="#98AFC7" class="copyright" width="100%">
<center>Copyright &copy; 2017 by Transworld Technologies Ltd. All Rights Reserved.</center>
</td></tr>
</table>
</body>
</html>
