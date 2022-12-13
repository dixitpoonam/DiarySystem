<%@page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import="java.text.*" import=" java.util.*" errorPage="" %>
<%@include file="header.jsp" %>


<%! 
Connection conn;
Statement st,st1,st2;
String sql,veh,veh1,veh2,veh3;

%>

<%
	System.out.println("In the AjaxValidateVehicle page "+veh);
	Class.forName(MM_dbConn_DRIVER);
	conn = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	st   = conn.createStatement();
	st1  = conn.createStatement();
	st2  = conn.createStatement();
	veh  = request.getParameter("vehregno");
	veh2 = veh.trim();
	veh3 = veh.replace("$","");
	veh3 = veh3.replace("#","");
	//veh1 = request.getParameter("vehregno");
	veh1 = veh.replaceAll(" ","");
	System.out.println("vehicle reg no is :- "+veh);
	
	
	sql = "select * from db_gps.t_vehicledetails where VehicleRegNumber like '%"+veh+"%' or VehicleRegNumber like '%"+veh1+"%' or VehicleRegNumber like '%"+veh2+"%' or VehicleRegNumber like '%"+veh3+"%' ";
    ResultSet rst = st.executeQuery(sql);
    if(rst.next())
    {
    	out.print("Yes");
    }
    else out.print("No");





%>