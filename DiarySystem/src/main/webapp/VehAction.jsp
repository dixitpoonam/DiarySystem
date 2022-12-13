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

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script>
function Redirect()
{
   alert("successful...");

  try{

      window.opener.location.reload("NicerGlobeVehList.jsp");
      window.close();

      }
      catch(e)
      {
          alert(e);
      }

} 
</script>

 <script>
function validate(){
	
	var UnitIds = document.getElementById("units").value;
	
	if(UnitIds.trim()==""||UnitIds.trim()==null)
	   {
	   		alert("please enter unit id to be added..");
	   		return false;
	   		
	   }
	return true
	
  }
 </script>
</head>

<body style="background-color: #FFFFFF;">
<%@ include file="MenuNew.jsp"%>

<%

System.out.println("In Page...Vehicle Action for NicerGlobe");
String userName=session.getAttribute("username").toString();

System.out.println("UserName :"+userName);
try{
     Class.forName(MM_dbConn_DRIVER);
}catch(ClassNotFoundException cex){
	cex.printStackTrace();
}

Connection conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
Statement st=conn.createStatement();
Statement st1=conn.createStatement();
Statement st2=conn.createStatement();
Statement st3=conn.createStatement();

%>
<form action="" method="get">

<table border="0"  bgcolor="" align="center">

<tr><td></td>
<td><b>ADD UNIT ID TO NICER GLOBE</b></td></tr>
<tr>
<td></td>
<td>
<div align="center"><font color="red"><B><I>Note:</I></B>Enter Unit IDs to be added separated by comma(,)</font></div>
</td>
</tr>
<tr><td><font size="3"><b>Unit IDs</b></font></td><td><textarea rows="3" cols="15" id="units" name="units"></textarea></td></tr>
<tr><td></td>
<td><input type="submit" value="Submit" onclick="return validate()"></td></tr> 
</table>
</form>
<%
String unitID="",unitid="";

//String unitIDList="(";
String vehiclecode="";
String vehstatus="",lastupdate="";

if(request.getQueryString()!=null){    //to avoid null pointer exception on-load of window

String unitids=request.getParameter("units");
System.out.println("UnitIds before:"+unitids);

unitids = unitids.trim();
unitids = unitids.replaceAll(" ","");
System.out.println("UnitIds after:"+unitids);

/* StringTokenizer strtok=new StringTokenizer(unitids,",");
while(strtok.hasMoreTokens()){
	unitID=strtok.nextToken();
	unitIDList = unitIDList+",'"+unitID+"'";
}

unitIDList += ")";
System.out.println("Final UnitID List:"+unitIDList);
*/

try{
String vehcodes="select distinct(vehiclecode),UnitID from db_gps.t_vehicledetails where UnitID in ("+unitids+")";
System.out.println("Vehicle Codes query:-->"+vehcodes);
ResultSet rsvehcodes=st.executeQuery(vehcodes);
while(rsvehcodes.next()){
	vehiclecode = rsvehcodes.getString("vehiclecode");
	unitid = rsvehcodes.getString("UnitID");
	System.out.println("Unit ID:"+unitid+"::::Vehicle Code:"+vehiclecode);
	
	
	String onlinedata="Select * from db_gps.t_onlinedata where vehiclecode='"+vehiclecode+"' order by thedate desc,thetime desc limit 1";
	System.out.println("Online data Query:------>"+onlinedata);
	ResultSet rsonlinedata=st1.executeQuery(onlinedata);
	if(rsonlinedata.next())
	{
		lastupdate=rsonlinedata.getString("thedate")+" "+rsonlinedata.getString("thetime");	
	}
	
	System.out.println("Last Updated :"+lastupdate);
	
	String vehcheck="select * from db_gps.t_NicerGlobeVehiclelist where vehiclecode='"+vehiclecode+"'";
	System.out.println("Vehicle Check Query:------>"+vehcheck);
	ResultSet rscheck = st2.executeQuery(vehcheck);
	if(rscheck.next())    //vehicle was present before 
	{
		
		vehstatus=rscheck.getString("status");
		System.out.println("Vehicle Status:"+vehstatus);
		
		
		if(vehstatus.equalsIgnoreCase("InActive"))   //check if vehicle was made inactive on previous removal
		{  
			System.out.println("Vehicle present but inactive...");
			String updat="update db_gps.t_NicerGlobeVehiclelist set status='Active' where vehiclecode='"+vehiclecode+"' ";  //If vehicle is inactive make it active
			// st3.executeUpdate(updat);
			
			String update="update db_gps.t_nicerupdateddata set updateddatetime='"+lastupdate+"' where vehicles='"+vehiclecode+"' "; //update the nicerupdateddata with new vehiclecode and last updated datetime
			// st4.executeUpdate(update);
			
			System.out.println("Vehicle Added Successfully....");
			System.out.println("--------------------------------------------------------------------------");
		}
	}
	 else{    //vehicle was not present previously
		 System.out.println("Vehicle not present in NicerGlobe...");
	String addveh="Insert into db_gps.t_NicerGlobeVehiclelist (vehiclecode,EntryBy) values ('"+vehiclecode+"','"+userName+"')"; //update vehiclecode and last updateddatetime in VehicleDetails and nicerupdateddata
	//st3.executeUpdate(addveh);
	
	String vehupdate="Insert into db_gps.t_nicerupdateddata (Vehicles,updateddatetime) values ('"+vehiclecode+"','"+lastupdate+"')";
	//st4.executeUpdate(vehupdate);
	
	System.out.println("Vehicle Added Successfully....");

	System.out.println("--------------------------------------------------------------------------");
	}
	
	
	out.println("<script>Redirect();</script>"); 
	

}  //end of while

}catch(SQLException sqlex){
	%><script>alert("Wrong Data Entered.....");</script>
<%}
}
%>


<%-- <%
String vehiclecode = request.getParameter("VehicleCode");
String action = request.getParameter("action");

System.out.println("In page....VehAction.jsp for NicerGlobe");
System.out.println("Vehicle Code:"+vehiclecode);
System.out.println("Action:"+action);

String userName=session.getAttribute("username").toString();

System.out.println("UserName :"+userName);

Class.forName(MM_dbConn_DRIVER);
Connection conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
Statement st=conn.createStatement();
Statement st1=conn.createStatement();
Statement st2=conn.createStatement();
Statement st3=conn.createStatement();

String lastupdate="";
String onlindata="Select * from db_gps.t_onlinedata where vehiclecode='"+vehiclecode+"' order by thedate desc,thetime desc limit 1";
ResultSet rsonlinedata=st.executeQuery(onlindata);
if(rsonlinedata.next())
{
	lastupdate=rsonlinedata.getString("thedate")+" "+rsonlinedata.getString("thetime");	
}


if(action.equalsIgnoreCase("add"))
{
	String vehstatus="";
	String check="select * from db_gps.t_NicerGlobeVehiclelist where vehiclecode='"+vehiclecode+"'";
	ResultSet rscheck=st1.executeQuery(check);
	if(rscheck.next())
	{
		vehstatus=rscheck.getString("status");
		System.out.println("Vehicle Status:"+vehstatus);
		
		if(vehstatus.equalsIgnoreCase("InActive"))  //vehicle was present before and then made inactive on removal 
		{
			String updat="update db_gps.t_NicerGlobeVehiclelist set status='Active' where vehiclecode='"+vehiclecode+"' ";  //If vehicle is inactive make it active
			// st2.executeUpdate(updat);
			
			String update="update db_gps.t_nicerupdateddata set updateddatetime='"+lastupdate+"' where vehicles='"+vehiclecode+"' "; //update the nicerupdateddata with new vehiclecode and last updated datetime
			// st3.executeUpdate(update);
			
		}
	    }else{    //vehicle was not present previously
	String addveh="Insert into db_gps.t_NicerGlobeVehiclelist (vehiclecode,EntryBy) values ('"+vehiclecode+"','"+userName+"')"; //update vehiclecode and last updateddatetime in VehicleDetails and nicerupdateddata
	//st2.executeUpdate(addveh);
	
	String vehupdate="Insert into db_gps.t_nicerupdateddata (Vehicles,updateddatetime) values ('"+vehiclecode+"','"+lastupdate+"')";
	//st3.executeUpdate(vehupdate);
	
	}
	
	out.println("Vehicle Added Successfully....");
	out.println("<script>  Redirect();</script>");
	
	
}
else{   //make vehicle inactive when it is to be removed
	
	String updat="update db_gps.t_NicerGlobeVehiclelist set status='InActive' where vehiclecode='"+vehiclecode+"' ";
	// st2.executeUpdate(updat);
		
	}

out.println("Vehicle Removed Successfully....");
out.println("<script>  Redirect();</script>");
%> --%>

</body>
</html>