<%-- 
    Document   : notactive
    Created on : Oct 9, 2008, 10:19:52 AM
    Author     : atul
    Discroption: this page show the vehicles having no data since installation
     last updated :  Aug 31, 2009
     Modified by: Azhar
--%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<%!
Connection conn,conn1;
Statement st, st1, st2, st3, st01;
String sql,sql1,sql2;
String transporter,today,Svehlist,username,warranty,olddate;
String Vehcode="",unitid="",group1="",instdate;
%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

	<title>Seven Day Diary System.</title>
	<link rel="stylesheet" href="style.css" type="text/css" charset="utf-8" />
	<link rel="stylesheet" href="css/css.css" type="text/css" charset="utf-8" />
	<script src="sorttable.js" type="text/javascript"></script>
<script type="text/javascript">

function toggleDetails(id, show)
{
	var popup = document.getElementById("popup"+id);
	if (show) {
		popup.style.visibility = "visible";
		popup.setfocus();
		
	} else {
		popup.style.visibility = "hidden";
	}
}

</script>
<script language="javascript">
function showtextarea(a,b,c)
{
	document.getElementById("div"+a).innerHTML="<form action='callinfo.jsp' method='get'><TEXTAREA name='callinfo' id='callinfo'   class='formElement'></TEXTAREA><br><input type='Submit' name='Submit' value='Submit' class='formElement'><input type='button' value='Cancel' onclick='canceldiv("+a+");' class='formElement'><br><input type='hidden' name='rname' value='"+b+"'><br><input type='hidden' name='transporter' value='"+c+"'><br><input type='hidden' name='pagename' value='notactive.jsp'></form>";
}
function canceldiv(A)
{
	document.getElementById("div"+A).innerHTML="<a href='javascript:showtextarea("+A+");'>Edit</a>";
}
function toggleDetails1(id, show)
{
	var popupx = document.getElementById("popupx"+id);
	if (show) {
		popupx.style.visibility = "visible";
		popupx.setfocus();
		
	} else {
		popupx.style.visibility = "hidden";
	}
}
</script>
<style>
.popup {
background-color: #98AFC7;
position: absolute;
visibility: hidden;
}
</style>
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
<%
transporter=request.getParameter("transporter");
java.util.Date defoultdate = new java.util.Date();
Format formatter = new SimpleDateFormat("yyyy-MM-dd");
today = formatter.format(defoultdate);
long miliseconds=defoultdate.getTime();
miliseconds=miliseconds-7000 * 60 * 60 *24;
defoultdate.setTime(miliseconds);
olddate=formatter.format(defoultdate);
Svehlist="(0";
try
{
	Class.forName(MM_dbConn_DRIVER);
	conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	st=conn.createStatement();
	st01=conn.createStatement();
	st1=conn1.createStatement();
	st2=conn1.createStatement();
}
catch(Exception e)
{
	out.print("Exception -->"+e);
}
%>
<table border="0" width="750px">
<tr><td align="center" colspan="2">
<center><font color="black" size="2">Vehicle List of <%=transporter %> Which are installed but not active.</font></center>
</td></tr>
<tr><td><a href="#" onClick="window.open ('last10callinfo1.jsp?trans=<%=transporter%>&limit=10','win1','width=900,height=550,location=0,menubar=0,scrollbars=1,status=0,toolbar=0,resizable=0')"><font color="Red" size="2"><b>Last 10 Outgoing Calls</font></a></td>
<td align="right"> <a href="#" onClick="window.open ('last3disp.jsp?trans=<%=transporter%>','win1','width=900,height=550,location=0,menubar=0,scrollbars=1,status=0,toolbar=0,resizable=0')"> <font color="Red" size="2"><b> Last 5 Dispatches </b> </font> </a> 

&nbsp;&nbsp;&nbsp;
<a href="#" onClick="window.open ('last5recfrmcust.jsp?trans=<%=transporter%>','win1','width=900,height=550,location=0,menubar=0,scrollbars=1,status=0,toolbar=0,resizable=0')"> <font color="Red" size="2"><b> Last 5 Receivals </b> </font> </a> 
&nbsp;&nbsp;&nbsp;
<a href="#" onClick="window.open ('mydiary.jsp?trans=<%=transporter%>','win1','width=900,height=550,location=0,menubar=0,scrollbars=1,status=0,toolbar=0,resizable=0')"> <font color="Red" size="2"><b> Veh Avail </b> </font> </a>
&nbsp;&nbsp;&nbsp;
<a href="#" onClick="window.open ('unitswithcust.jsp?trans=<%=transporter%>','win1','width=900,height=550,location=0,menubar=0,scrollbars=1,status=0,toolbar=0,resizable=0')"> <font color="Red" size="2"><b> Unit/s Pending </b> </font> </a> 
</td>
</tr>
</table>
<p></p>
<hr width="750px"></hr>
<table border="1" width="750px" class="sortable">
<tr>
<th>Sr.</th>
<th>Contact Name</th>
<th>Phone</th>
<th>Mobile</th>
<th>Email</th>
<th>Location</th>
<th>Comment</th>
<%
String userrole=session.getAttribute("userrole").toString();
if(MANAGER.equalsIgnoreCase(userrole)||SUPERADMIN.equalsIgnoreCase(userrole))
{ %>
	<th> Edit</th>
<%	
}
%>
</tr>
<%
sql1="select * from t_recieverinfo where Transporter='"+transporter+"'";
ResultSet rst3=st.executeQuery(sql1);
int a=1;
while(rst3.next())
{
String rname=rst3.getString("RecieverName");
%>
<tr>
<td><%=a%></td>
<td>
<a href="#" onClick="window.open ('last10callinfo.jsp?reciever=<%=rst3.getString("RecieverName")%>&trans=<%=transporter%>&limit=10','win1','width=900,height=550,location=0,menubar=0,scrollbars=1,status=0,toolbar=0,resizable=0')"><%=rst3.getString("RecieverName")%></a>
</td>
<td><%=rst3.getString("Phone")%></td>
<td><%=rst3.getString("Mobile")%></td>
<td><a href="mailto:<%=rst3.getString("Email")%>?subject=Vehicle%20Complaints%20"><%=rst3.getString("Email")%></a></td>
<td><%=rst3.getString("PlaceName")%></td>
<td><a href="javascript: flase" onClick="window.open ('addcall.jsp?reciever=<%=rname%>&trans=<%=transporter%>','win1','width=400,height=250,location=0,menubar=0,scrollbars=0,status=0,toolbar=0,resizable=0')">Edit</a></td>
<%
if(MANAGER.equalsIgnoreCase(userrole)||SUPERADMIN.equalsIgnoreCase(userrole))
{ %>
	<td>  <a href="javascript: flase" onClick="window.open ('editcontdets.jsp?reciever=<%=rname%>&trans=<%=transporter%>&rid=<%=rst3.getString("Rid") %>', 'win1', 'width=470, height=300, location=0, menubar=0, scrollbars=0, status=0, toolbar=0, resizable=0')">Edit</a></td>
<%	
} %>
</tr>
<%
a++;
}
%>
</table>

<p></p>


<hr width="750px"> </hr>
<marquee> <font color="brown"><B><I>Note:</I></B>Move your mouse to Complaint Date to check more details</font> </marquee>

		<table border="1" width="750px" align="center" class="sortable">
<tr>
<th>Sr.</th>
<th>Vehicle No</th>
<th>Installed Date</th>
<th>Installed Place</th>
<th>UnitID</th>
<th>MobileNO</th>
<th>SimNo</th>
<th>GPName</th>
<th>Inst On</th>
<th>Complaint Date </th>
<th>Warranty</th>
</tr>

<%
try
{
	
	sql="select *  from t_onlinedata where Transporter='"+transporter+"'";
	ResultSet rst=st1.executeQuery(sql);
	while(rst.next())
	{
	Svehlist=Svehlist+","+rst.getString("VehicleCode");
	}
	Svehlist=Svehlist+")";
	sql="select * from t_vehicledetails where ownername='"+transporter+"' and status <>'Removed' and VehicleCode not in "+Svehlist;
	ResultSet rst1=st1.executeQuery(sql);
	int i=1;
	while(rst1.next())
	{
	unitid=rst1.getString("unitid");
	String simno="-",mobno="-";
	try{
		
			
			instdate=new SimpleDateFormat("dd-MMM-yyyy").format(rst1.getDate("InstalledDate"));
			
			sql="select TO_DAYS('"+today+"')-TO_DAYS('"+rst1.getDate("InstalledDate")+"') as days";
			ResultSet rstwar=st2.executeQuery(sql);
			if(rstwar.next())
			{
			if(rstwar.getInt("days") <= 365)
			{
				
				warranty="Yes";
			}
			else
			{
				warranty="No";
			}
			}
			}catch(Exception x)
			{
				//out.print("-");
				instdate="-";
				warranty="-";
			}
				sql="select * from t_group where VehCode='"+rst1.getString("VehicleCode")+"' ";
		ResultSet rs6=st2.executeQuery(sql);
		if(rs6.next())
		{
			group1=rs6.getString("GPName");
		}
	%>
	<tr>
	<td><%=i%></td>
	<td><a href="javascript:toggleDetails(<%=i%>,true);" title="Click Here"><%=rst1.getString("VehicleRegNumber")%>
	</a>
	<br/>	
	<div class="popup" id="popup<%=i%>">
	<table border="0" >
	<tr><td><a href="addcomplaint.jsp?vid=<%=rst1.getString("VehicleCode")%>" onclick="toggleDetails(<%=i%>,false);">Add Complaint</a></td></tr>
	<tr><td><a href="repunit.jsp?vid=<%=rst1.getString("VehicleCode")%>" onclick="toggleDetails(<%=i%>,false);">Unit Replace</a></td></tr>
	<tr><td><a href="javascript: toggleDetails(<%=i%>,false);" onClick="window.open ('rep_history.jsp?vid=<%=rst1.getString("VehicleCode")%>','win1','width=750,height=400,location=0,menubar=0,scrollbars=0,status=0,toolbar=0,resizable=0')" > View History</a></td></tr>
	<tr>
		<td> <a href="techspcomment.jsp?vehno=<%=rst1.getString("VehicleRegNumber")%>&comment=veh" onclick="toggleDetails(<%=i%>,false);">Special Comment </a> </td>
	</tr>
	<tr><td><a href="javascript:toggleDetails(<%=i%>,false);">Close</a></td></tr>
	</table>
	</div>
	</td>
	<td><%
		try{
		Format fmtx = new SimpleDateFormat("dd-MMM-yyyy");
		String sdtx = fmtx.format(rst1.getDate("InstalledDate"));
 		out.print(sdtx);
 		}catch(Exception e)
 		{
 			out.print("-");
 		}
 		
	%> </td>
	<td><%=rst1.getString("InstalledPlace")%></td>
	<td><%=unitid%></td>
	<%
		sql="select * from t_unitmaster where UnitID='"+unitid+"'";
		ResultSet rs5=st2.executeQuery(sql);
		if(rs5.next())
		{
			simno=rs5.getString("MobNo");
			mobno=rs5.getString("SimNo");
		}
	%>
	<td><%=simno%></td>
	<td><%=mobno%></td>
	<td><%=group1%></td>
	<td><%=instdate%></td>
	<%
		String compdate="", attloc="", availdate="", allocatedto="", desc="", contpers="", entby="";
		sql="select * from t_complaints1 where VehicleNo='"+rst1.getString("VehicleRegNumber")+"' and Status <> 'Solved' ";
		ResultSet rscomp=st.executeQuery(sql);
		if(rscomp.next())
		{
			compdate=rscomp.getString("TdyDate");
			attloc=rscomp.getString("VehAttLoc");
			availdate=rscomp.getString("VehAvailDate");
			allocatedto=rscomp.getString("Status");
			desc=rscomp.getString("Complaint");
			contpers=rscomp.getString("ContDets");
			entby=rscomp.getString("RegBy");
			
			if(allocatedto.equals("Allocated") || allocatedto.equals("Attended"))
			{
				sql="select * from t_callocation1 where Tno='"+rscomp.getString("Tno")+"' ";
				ResultSet rsallocto=st01.executeQuery(sql);
				if(rsallocto.next())
				{
					allocatedto=rsallocto.getString("Technicion");
				}
				else
				{
					allocatedto="Unallocated";
				}
					
			}  
		%>
				<td a href="" onmouseover="ajax_showTooltip(window.event,'showCompDetails.jsp?attloc=<%=attloc %>&availdate=<%=availdate %>&allocatedto=<%=allocatedto %>&desc=<%=desc %>&contpers=<%=contpers %>&entby=<%=entby %>',this);return false" onMouseOut="ajax_hideTooltip();"> <B> <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(compdate))%> </B>
				   
	<%		
		}
		else
		{ %>
			<td> No Complaint</td>		
	<%	}
	%>
	<td><%=warranty%></td>
	</tr>

        <%
	i++;
	}
}catch(Exception e)
{
	out.print("Exception --->"+e);
}
finally
{
	conn.close();
	conn1.close();

}

%>
	</table>
	
</table>
		<table border="0" width="750px" height="300px">
		<tr><td></td></tr>
		</table>
<!-- code end here --->

 		</div>
   		 </div>
 		 
		<div id="gbox-bot1"> </div></div>
      </div>
    </div>
  </div>
  
  <div id="copyright">
   Copyright ?? 2008 by Transworld Compressor Technologies Ltd. All Rights Reserved.
  </div>

</body>
</html>
