<%@ page 
	contentType="text/html; charset=iso-8859-1" 
	language="java" 
	import="java.sql.*" 
	import=" java.text.*" 
	import=" java.util.*" 
	errorPage="" %>
<!DOCTYPE html>
<html class=" js no-touch" lang="en">
<head>
<link href="css/newmenu.css" rel="stylesheet">


<script type="text/javascript">
  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-19595446-3']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

  function newwindow(webadd)
  { 
	window.open(webadd,'jav','width=780,height=200,resizable=yes');
  } 

  function openpopup(PageName)
  {
  	 try{
  		 //alert(e);
  	 testwindow=window.open("RegisterComplaint_diary.jsp?PageName="+PageName,"Register Complaint","width=700,height=400,scrollbars=yes");
  	 testwindow.moveTo(200,200);
  	 }catch(e)
  	 {
  		 alert(e);
  	 }
  }
  function openpopup1(PageName)
  {
  	 try{
  		 //alert(e);
  	 testwindow=window.open("RegisterComplaint_Customer.jsp?PageName="+PageName,"Register Complaint","width=900,height=500,scrollbars=yes");
  //	window.location="RegisterComplaint_Customer.jsp?PageName="+PageName,"Register Complaint","width=700,height=400,scrollbars=yes";
  	 testwindow.moveTo(200,200);
  	 }catch(e)
  	 {
  		 alert(e);
  	 }
  }


  
</script>




<script>
function transporter(){
	
	document.getElementById("admin").style.display = "none";
    document.getElementById("superadmin").style.display = "none";
    document.getElementById("other").style.display = "none";
     document.getElementById("mydiary").style.display = "none";
     document.getElementById("addition").style.display = "none";
     document.getElementById("report1").style.display = "none";
      document.getElementById("report2").style.display = "none";
      document.getElementById("special").style.display = "none";
      
      document.getElementById("main").style.display = "none";
      
      document.getElementById("out").style.display = "none";
      document.getElementById("removed").style.display = "none";
      
      document.getElementById("groupwise").style.display = "none";
      document.getElementById("changepassword").style.display = "none";
      
      document.getElementById("sim").style.display = "none";
      
      document.getElementById("7days").style.display = "none";
      
      
	
}

function superuser(){
	
    document.getElementById("admin").style.display = "none";	
	document.getElementById("superadmin").style.display = "none";
    document.getElementById("other").style.display = "none";
    
    document.getElementById("main").style.display = "none";
    
    document.getElementById("out").style.display = "none";
    document.getElementById("removed").style.display = "none";
    
    document.getElementById("groupwise").style.display = "none";
    document.getElementById("changepassword").style.display = "none";
    
    document.getElementById("sim").style.display = "none";
    
}

function manager(){
	document.getElementById("superadmin").style.display = "none";
    document.getElementById("other").style.display = "none";
    document.getElementById("special").style.display = "none";
    document.getElementById("main").style.display = "none";
    
    document.getElementById("out").style.display = "none";
    document.getElementById("removed").style.display = "none";
    
    document.getElementById("groupwise").style.display = "none";
    document.getElementById("changepassword").style.display = "none";
    
    document.getElementById("sim").style.display = "none";



}

function superadmin(){
	
    document.getElementById("other").style.display = "none";
    document.getElementById("special").style.display = "none";
    document.getElementById("main").style.display = "none";
    
    document.getElementById("out").style.display = "none";
    document.getElementById("removed").style.display = "none";
    
    document.getElementById("groupwise").style.display = "none";
    document.getElementById("changepassword").style.display = "none";
    
    document.getElementById("sim").style.display = "none";



	
}

function middelware(){
	
    document.getElementById("admin").style.display = "none";
    document.getElementById("superadmin").style.display = "none";
    document.getElementById("special").style.display = "none";
    document.getElementById("main").style.display = "none";
    
    document.getElementById("out").style.display = "none";
    document.getElementById("removed").style.display = "none";
    
    document.getElementById("groupwise").style.display = "none";
    document.getElementById("changepassword").style.display = "none";
    
    document.getElementById("sim").style.display = "none";



}

function group(){
	
	  document.getElementById("admin").style.display = "none";
      document.getElementById("superadmin").style.display = "none";
      document.getElementById("other").style.display = "none";
       document.getElementById("mydiary").style.display = "none";

       document.getElementById("dataentery").style.display = "none";
      document.getElementById("addition").style.display = "none";
      document.getElementById("report1").style.display = "none";
       document.getElementById("report2").style.display = "none";
       document.getElementById("special").style.display = "none";
       
       document.getElementById("out").style.display = "none";
       document.getElementById("removed").style.display = "none";
       
       document.getElementById("groupwise").style.display = "none";
       document.getElementById("changepassword").style.display = "none";
       
       document.getElementById("sim").style.display = "none";
       document.getElementById("7days").style.display = "none";


	
}

function sales(){
	
    document.getElementById("admin").style.display = "none";
    document.getElementById("superadmin").style.display = "none";
    document.getElementById("other").style.display = "none";
     document.getElementById("mydiary").style.display = "none";

  document.getElementById("dataentery").style.display = "none";
    document.getElementById("addition").style.display = "none";
    document.getElementById("special").style.display = "none";
    document.getElementById("main").style.display = "none";
    
    document.getElementById("sim").style.display = "none";

   
	
}

function dispatch(){
    
	document.getElementById("admin").style.display = "none";
    document.getElementById("superadmin").style.display = "none";
    document.getElementById("other").style.display = "none";
    document.getElementById("mydiary").style.display = "none";

    document.getElementById("dataentery").style.display = "none";
    document.getElementById("addition").style.display = "none";
    document.getElementById("report1").style.display = "none";
    document.getElementById("report2").style.display = "none";
     
     document.getElementById("special").style.display = "none";
     document.getElementById("main").style.display = "none";
     
     document.getElementById("out").style.display = "none";
     document.getElementById("removed").style.display = "none";
     
     document.getElementById("groupwise").style.display = "none";
     document.getElementById("changepassword").style.display = "none";
     document.getElementById("7days").style.display = "none";
     
     
     


	
}



	
	function service() {
       
        document.getElementById("admin").style.display = "none";
        document.getElementById("superadmin").style.display = "none";
        document.getElementById("other").style.display = "none";
        
        document.getElementById("special").style.display = "none";
        document.getElementById("main").style.display = "none";
        
        document.getElementById("sim").style.display = "none";
        
        document.getElementById("out").style.display = "none";
        document.getElementById("removed").style.display = "none";
        
        document.getElementById("groupwise").style.display = "none";
        document.getElementById("changepassword").style.display = "none";
        




		
	}
	
	
	
	
</script>


<script language="javascript">
	function toggleDetails(id, show) {
		var popup = document.getElementById("popup" + id);
		if (show) {
			popup.style.visibility = "visible";
			popup.setfocus();

		} else {
			popup.style.visibility = "hidden";
		}
	}
	function toggleDetails1(id, show) {
		var popupx = document.getElementById("popupx" + id);
		if (show) {
			popupx.style.visibility = "visible";
			popupx.setfocus();

		} else {
			popupx.style.visibility = "hidden";
		}
	}
	function showtextarea(a, b, c) {
		document.getElementById("div" + a).innerHTML = "<form action='callinfo.jsp' method='get'><TEXTAREA name='callinfo' id='callinfo'class='formElement'></TEXTAREA><br><input type='Submit' name='Submit' value='Submit' class='formElement'><input type='button' value='Cancel' onclick='canceldiv("
				+ a
				+ ");' class='formElement'><br><input type='hidden' name='rname' value='"+b+"'><br><input type='hidden' name='transporter' value='"+c+"'><br><input type='hidden' name='pagename' value='currentdata.jsp'></form>";
	}
	function canceldiv(A) {
		document.getElementById("div" + A).innerHTML = "<a href='javascript:showtextarea("
				+ A + ");'>Edit</a>";
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



<%!final String SUPER_USER = "Superuser";
	final String MANAGER = "Manager";
	final String MIDDLE_WARE = "MiddleWare";
	final String SERVICE = "service";
	final String GROUP = "Group";
	final String SALES = "sales";
	final String DISPATCH = "dispatch";
	final String SUPERADMIN = "SuperAdmin";%>
<%
     // String MM_dbConn_STRING1 = "jdbc:mysql://164.68.105.216/db_gps";
	String MM_dbConn_STRING1 = "jdbc:mysql://164.68.105.216/db_gps";
	//MM_dbConn_STRING1="jdbc:mysql://192.168.2.55/db_gps";
	String MM_dbConn_DRIVER = "org.gjt.mm.mysql.Driver";

	String MM_dbConn_USERNAME = "diary";
	String MM_dbConn_PASSWORD = "d@1ry";

	//
%>

<%
	try {

		//System.out.println("inside try.of header.....");
		String reportno = "", PageName = "";
		PageName = this.getClass().getName();

		PageName = PageName.substring(PageName.lastIndexOf(".") + 1, PageName.length());
		//System.out.println("<><><>>......."+PageName);
		PageName = PageName.replace("_", ".");
		PageName = PageName.replace(".005f", "_");
		//System.out.println(">>>>>>>>PageName>>"+PageName);

		Class.forName(MM_dbConn_DRIVER);
		//System.out.println("00000000......");
		Connection conn;
		//System.out.println("<<><><><>1......");
		conn = DriverManager.getConnection(MM_dbConn_STRING1, MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
		//System.out.println("<><><><>222......");
		//sessionst = sessionconn.createStatement();
		//sessionst1 = sessionconn.createStatement();
		//Statement stqueryy=sessionconn.createStatement();
		Statement strno = conn.createStatement();
		Statement cnt1 = conn.createStatement();
		Statement cnt2 = conn.createStatement();
		Statement cnt3 = conn.createStatement();
		Statement cnt4 = conn.createStatement();
		Statement cnt5 = conn.createStatement();
		Statement cnt6 = conn.createStatement();
		Statement cnt7 = conn.createStatement();
		Statement cnt8 = conn.createStatement();
		Statement cnt9 = conn.createStatement();

		//System.out.println("<><><><>33333......");
		//String useType11=session.getAttribute("TypeofUser").toString();
		//String targetvalue=session.getAttribute("usertypevaluemain").toString();
		//String userid=session.getAttribute("user").toString();
		//System.out.println("1111111111111111...");

		////System.out.println(userid);
		String sql = "select ReportNo from db_gps.t_reportnumberdiary where PageName = '" + PageName + "'";
		//System.out.println("222222222...");
		ResultSet rs = strno.executeQuery(sql);
		//System.out.println("33333333...");
		//System.out.println(sql);
		//System.out.println("4444444...");
		if (rs.next()) {
			reportno = rs.getString("ReportNo");
			//System.out.println("reportno>>..."+reportno);
		}

		int pndng = 0, respnd = 0, escltd = 0, slvd = 0, attnd = 0, ovrdue = 0, clsd = 0;
		//String a="Pending",b="Responded",c="Attended",d="Solved",e="Escalated",g="overdue",l="Closed";

		String a = "Pending", b = "Responded", c = "Attended", d = "Solved", e = "Escalated", g = "overdue",
				l = "Closed", nwl1 = "NewCmpL1", nwl2 = "NewCmpL2", nwl3 = "NewCmpL3", rspndl1 = "RspndL1",
				rspndl2 = "RspndL2", rspndl3 = "RspndL3", esltdl1 = "EscL1", esltdl2 = "EscL2",
				esltdl3 = "EscL3", attnl1 = "AttndL1", attnl2 = "AttndL2", attnl3 = "AttndL3",
				quedl1 = "QuedL1", quedl2 = "QuedL2", quedl3 = "QuedL3", svdl1 = "solvL1", svdl2 = "solvL2",
				svdl3 = "solvL3", cldl1 = "ClsdL1", cldl2 = "ClsdL2", cldl3 = "ClsdL3";

		String sqlcnt = "SELECT count( * ) as cnt  FROM db_gps.t_ComplaintDetail    WHERE TIMESTAMPDIFF( MINUTE ,ComplaintDateTime, now() ) > ( 	SELECT TimeDiffL1 FROM db_gps.t_ComplaintSettings WHERE Category = 'pending' and dept='software' ) and TIMESTAMPDIFF( MINUTE ,ComplaintDateTime, now() ) < ( 	SELECT TimeDiffL2 FROM db_gps.t_ComplaintSettings WHERE Category = 'pending' and dept='software' )  and status = 'pending'";

		ResultSet rs111 = cnt1.executeQuery(sqlcnt);

		//System.out.println(">>>>>>sqlcnt@@@@@@@@ >>>>>111>>>>>"+sqlcnt);

		if (rs111.next()) {

			pndng = rs111.getInt("cnt");

		}

		String sqlcnt1 = "SELECT count( * ) as cnt  FROM db_gps.t_ComplaintDetail    WHERE TIMESTAMPDIFF( MINUTE ,UpdatedDateTime, now() ) > ( 	SELECT TimeDiffL1 FROM db_gps.t_ComplaintSettings WHERE Category = 'Responded' )  and TIMESTAMPDIFF( MINUTE ,UpdatedDateTime, now() ) < ( 	SELECT TimeDiffL2 FROM db_gps.t_ComplaintSettings WHERE Category = 'Responded' ) and status = 'Responded' ";

		ResultSet rs111_rst = cnt2.executeQuery(sqlcnt1);

		//System.out.println(">>>>>>sqlcnt@@@@@@@@ >>>>>>22222>>>>"+sqlcnt);
		if (rs111_rst.next()) {

			respnd = rs111_rst.getInt("cnt");

		}

		String sqlcnt2 = "SELECT count( * ) as cnt  FROM db_gps.t_ComplaintDetail    WHERE TIMESTAMPDIFF( MINUTE ,UpdatedDateTime, now() ) > ( 	SELECT TimeDiffL1 FROM db_gps.t_ComplaintSettings WHERE Category = 'Attended' ) and TIMESTAMPDIFF( MINUTE ,UpdatedDateTime, now() ) < ( 	SELECT TimeDiffL2 FROM db_gps.t_ComplaintSettings WHERE Category = 'Attended' ) and status = 'Attended' ";

		ResultSet rs111_rst1 = cnt3.executeQuery(sqlcnt2);

		//System.out.println(">>>>>>sqlcnt@@@@@@@@ >>>>>33333>>>>>"+sqlcnt);
		if (rs111_rst1.next()) {

			attnd = rs111_rst1.getInt("cnt");

		}

		String sqlcnt33 = " SELECT count( * ) as cnt  FROM db_gps.t_ComplaintDetail    WHERE TIMESTAMPDIFF( MINUTE ,ComplaintResolutionTime, now() ) > ( 	SELECT TimeDiffL1 FROM db_gps.t_ComplaintSettings WHERE Category = 'Solved' ) and TIMESTAMPDIFF( MINUTE ,ComplaintResolutionTime, now() ) < ( 	SELECT TimeDiffL2 FROM db_gps.t_ComplaintSettings WHERE Category = 'Solved' )  and status = 'Solved'  ";

		ResultSet rs111_rst_33 = cnt4.executeQuery(sqlcnt33);

		//System.out.println(">>>>>>sqlcnt@@@@@@@@ >>>>>>>4444>>>"+sqlcnt);
		if (rs111_rst_33.next()) {

			slvd = rs111_rst_33.getInt("cnt");

		}

		String sqlcnt_54 = " SELECT count( * ) as cnt  FROM db_gps.t_ComplaintDetail    WHERE TIMESTAMPDIFF( MINUTE ,UpdatedDateTime, now() ) > ( 	SELECT TimeDiffL1 FROM db_gps.t_ComplaintSettings WHERE Category = 'Escalated' and dept='software' ) and TIMESTAMPDIFF( MINUTE ,UpdatedDateTime, now() ) < ( 	SELECT TimeDiffL2 FROM db_gps.t_ComplaintSettings WHERE Category = 'Escalated' and dept='software' ) and status = 'Escalated' ";

		ResultSet rs111_27 = cnt7.executeQuery(sqlcnt_54);

		//System.out.println(">>>>>>sqlcnt@@@@@@@@ >>>>>121212>>>>>"+sqlcnt_54);

		if (rs111_27.next()) {

			escltd = rs111_27.getInt("cnt");

		}

		String sqlcnt_58 = " SELECT count( * ) as cnt  FROM db_gps.t_ComplaintDetail    WHERE TIMESTAMPDIFF( MINUTE ,ComplaintResolutionTime, now() ) > ( 	SELECT TimeDiffL1 FROM db_gps.t_ComplaintSettings WHERE Category = 'Queued' )  and TIMESTAMPDIFF( MINUTE ,ComplaintResolutionTime, now() ) < ( 	SELECT TimeDiffL2 FROM db_gps.t_ComplaintSettings WHERE Category = 'Queued' )  and status = 'Queued'  ";

		//System.out.println(">>>>>>sqlcnt_58@@@@@@@@ >>>>>before>>>>>"+sqlcnt_58);
		ResultSet rstnew1 = cnt8.executeQuery(sqlcnt_58);
		//System.out.println(">>>>>>sqlcnt_58@@@@@@@@ >>>>>>>>>>"+sqlcnt_58);

		if (rstnew1.next()) {

			ovrdue = rstnew1.getInt("cnt");

		}

		String sqlcnt_541 = "select count(*) as cnt  from db_gps.t_ComplaintDetail  where  TIMESTAMPDIFF( MINUTE ,UpdatedDateTime, now() )    > ( 	SELECT TimeDiffL1 FROM db_gps.t_ComplaintSettings WHERE Category = 'closed' )  and TIMESTAMPDIFF( MINUTE ,UpdatedDateTime, now() ) < ( 	SELECT TimeDiffL2 FROM db_gps.t_ComplaintSettings WHERE Category = 'closed' ) and status = 'closed' ";

		ResultSet rs111_271 = cnt9.executeQuery(sqlcnt_541);

		//System.out.println(">>>>>>sqlcnt_541@@@@@@@@ >>>>>>>>>>"+sqlcnt_541);

		if (rs111_271.next()) {

			clsd = rs111_271.getInt("cnt");

		}

		final Format dateFormatter = new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss");
		final String currentDate = dateFormatter.format(new java.util.Date());
		final String userRole = session.getAttribute("userrole").toString();
		final String typevalue = session.getAttribute("typevalue").toString();
%>

<body>
	<div class="">

		<div class="top"
			style="background: #FFFFF; font-size: 12px; text-align: left; line-height: 0px; color: black; font-weight:; padding-left: 150px;">


			<img src="images/Transworld.gif">
			<p>
				&nbsp; &nbsp; &nbsp; &nbsp; We care about your Vehicles <br>
		</div>

		<ul style="padding-left:20px" class="navigation">

			<li><a href="javascript:history.go(-1);" id="back">Back</a></li>

			<li><a href="homepage.jsp" id="home">Home</a></li>
			<li id="7days"><a href="weeklyreport.jsp">7 Days Report </a></li>

			<li><a href="mydiary.jsp" id="mydiary">My Diary</a>
				<ul>

					<li><a href="viewfoultyvehicles.jsp">Data Delay </a></li>
					<li><a href="mydiary.jsp">Vehicle Available </a></li>
					<li><a href="complaintsoverdue.jsp">Complaints Over-Due </a></li>
					<li><a href="outgoingcall.jsp">Outgoing Call </a></li>
					<li><a href="incomingcalls.jsp">Incoming Call </a></li>
					<li><a href="multiplesearch.jsp">Multiple Search </a></li>
					<li><a href="reprovisionrep.jsp">Re-Provision Nos </a></li>
					<li><a href="confirmreprovnos.jsp">Confirm Re-Provision
							Nos </a></li>
					<li><a href="Allcontact.jsp">All Contact </a></li>
					<li><a href="Simtrack.jsp">Sim Search </a></li>
					<li><a href="ftplastdump.jsp">FTPLastDump </a></li>
					<li><a href="transitunit.jsp">In-Transit Unit </a></li>
					<li><a href="transferreport.jsp">Transfer Unit Report</a></li>
					<li><a href="OfflineUnitData.jsp">Offline Unit Data</a></li>
					<li><a href="dragondroid.jsp">DragonDroid Report</a></li>

				</ul></li>

			<li><a href="dataentry.jsp" id="dataentery">Data Entry Form</a>
				<ul>
					<li><a href="addvehtogrp.jsp">Add Vehicle To Group</a></li>
					<li><a href="NewaddUnit.jsp">Add Unit</a></li>
					<li><a href="techdailyreport.jsp">Technician Daily Report
							Form</a></li>
					<li><a href="incommingcalls.jsp">Call Capture Form</a></li>
					<li><a href="changepassword.jsp">Change Password</a></li>
					<li><a href="techattend.jsp">Tech Attendance</a></li>
					<li><a href="techspcomment.jsp?comment=techunit">Special
							Comment</a></li>
					<li><a href="pendingunitsreport.jsp">Unit Pending</a></li>
					<li><a href="vehiclegroupentry.jsp">Add/Delete Group</a></li>
					<li><a href="castrolroutes.jsp">Route Master Entry</a></li>
					<li><a href="unitTransferToTechnician.jsp">Pending Unit
							Transfer </a></li>
							
							<li><a href="CreatedsId.jsp">Create Diary ID  </a></li>
							
							<li><a href="CreateNewIdDS.jsp">  Create FleetView ID
							</a></li>
							
							
							
							
							
							

				</ul></li>

			<li><a href="#" id="addition">Additional Reports </a>
				<ul>

					<li><a href="AVL_LITE.jsp">AVL Lite </a></li>
					<li><a href="AVL_LITE_dragonfly_rpt.jsp">Dragon Fly Report
					</a></li>
					<li><a href="JRMVehicles.jsp">JRM </a></li>
					<li><a href="CastrolJRM.jsp">Castrol Group JRM</a></li>
					<li><a href="batterbckp.jsp">Battery Backup </a></li>
					<li><a href="liveticket.jsp">Ticket</a></li>
					<li><a href="FleetViewComplaintReport1.jsp">Complaints
							Report </a></li>
					<li><a href="DistinctTripEntry.jsp"> Check For Vehicle
							With Faulty Trip</a></li>
							
							<li><a href="ActiveFleetviewUserDs.jsp"> Active FleetView Users </a></li>

							
							
							<li><a href="OnlineUserDS.jsp"> Online Users</a></li>
							
							<li><a href="UserValidateDs.jsp"> User Validate </a></li>
							
							
					<li class="dropdown"><a href="#">Overdue L1</a>
						<ul style="margin-left:228px; top:315px">
							<li style="width:150px";><a
								href="FleetViewComplaintDetails.jsp?Status=<%=nwl1%>&opened=<%=pndng%>">New
									: <%=pndng%></a></li>
							<li style="width:150px";><a
								href="FleetViewComplaintDetails.jsp?Status=<%=rspndl1%>&closedtot=<%=respnd%>">Responded
									: <%=respnd%></a></li>
							<li style="width:150px";><a
								href="FleetViewComplaintDetails.jsp?Status=<%=esltdl1%>&closedtot=<%=escltd%>">Escalated
									: <%=escltd%></a></li>
							<li style="width:150px";><a
								href="FleetViewComplaintDetails.jsp?Status=<%=attnl1%>&closedtot=<%=attnd%>">Attended
									: <%=attnd%></a></li>
							<li style="width:150px";><a
								href="FleetViewComplaintDetails.jsp?Status=<%=quedl1%>&closedtot=<%=g%>">Queued:
									<%=ovrdue%></a></li>
							<li style="width:150px";><a
								href="FleetViewComplaintDetails.jsp?Status=<%=svdl1%>&closedtot=<%=slvd%>">Solved
									: <%=slvd%></a></li>
							<li style="width:150px";><a
								href="FleetViewComplaintDetails.jsp?Status=<%=cldl1%>&closedtot=<%=l%>">Closed
									: <%=clsd%></a></li>


						</ul></li>
						</ul></li>
			


			<li><a href="#" id="report1">Reports</a>
				<ul>
					<li><a href="mainpage1.jsp">Main Page </a></li>
					<li><a href="CSDReport.jsp">CSD Report </a></li>
					<li><a href="dailyreport1.jsp">Daily Report </a></li>
					<li><a href="DailReportnew.jsp">Status Report </a></li>
					<li><a href="summary.jsp">Allocation Report </a></li>
					<li><a href="techattendreport.jsp">Tech Attend Report </a></li>
					<li><a href="complaintcharges.jsp">Comp Charges </a></li>
					<li><a href="closetechspcomment.jsp">Special Comment
							(Report) </a></li>
					<li><a href="showmissingunits.jsp">Unit Missing</a></li>
					<li><a href="SLAReport.jsp">SLA Report </a></li>
					<li><a href="replacementrpt.jsp">Replacement Report(for
							no warranty vehicles) </a></li>
					<li><a href="Allreplacement.jsp">Replacement Report(For
							All Vehicles) </a></li>
					<li><a href="compnotallocated.jsp">Comp Not Allocated Veh
					</a></li>
					<li><a href="MISunithistory.jsp">MIS Unit Report </a></li>
					<li><a href="unconfigueredUnits.jsp">UnConfigured Unit </a></li>
					<li><a href="CodeVersionReport.jsp">CodeVersion Report </a></li>
					<li><a href="DeviceOverviewReport.jsp">Device OverView
							Report </a></li>
					<li><a href="FleetViewDashBoard.jsp">Fleetview Dashboard </a></li>
					<li><a href="DetailsIncident.jsp">Incident Details Report</a></li>
					<li><a href="IncidentReport.jsp">Incident Report </a></li>
					<li><a href="SimNumberStatusReport.jsp">Sim Master Report</a></li>
					<li><a href="SimNumberBillableReport.jsp">Sim Master
							Billable Report </a></li>
					<li><a href="AnnualServiceContractReport.jsp">Annual
							Service Contract Report </a></li>
					<li><a href="addinstn.jsp">Add Instruction </a></li>
					<li><a href="ProfileMismatchReport.jsp">Profile Mismatch
							Report </a></li>
					<li><a href="ASCServiceDetails.jsp">ASC Service Details </a></li>
					<li><a href="TechnicianIndexReport.jsp">Technician Index
							Report </a></li>
					<li><a href="SummaryTAT.jsp">TAT Report</a></li>
					<li><a href="OfflineToOnline.jsp">TAT Report(Offline To Online)</a></li>

				</ul></li>

			<li><a href="#" id="report2">Reports</a>
				<ul>

					<li><a href="remdelvehs.jsp">REM/DEL Vehicles</a></li>
					<li><a href="Reallocatedveh.jsp">Vehicles Report</a></li>
					<li><a href="groupmainpage.jsp">Group Page</a></li>
					<li><a href="unitlifereport.jsp">Unit Report</a></li>
					<li><a href="SMSReport.jsp">SMS Alert Report</a></li>
					<li><a href="mobiledeactive_report.jsp">Mobile
							De-Activation Report</a></li>
					<li><a href="transporterdetail_history.jsp">Transporter
							Details Report</a></li>
					<li><a href="QuickTestReport.jsp">QuickTest Report</a></li>
					<li><a href="QTwithReplacement.jsp">QuickTest With
							Replacement Report</a></li>
					<li><a href="SendmailReport.jsp">Send mail Report</a></li>
					<li><a href="FleetViewComplaintReport1.jsp">Complaint
							Report</a></li>
					<li><a href="ServiceProviderMonthlyReport.jsp" target="_blank">Service
							Provider Bill Report</a></li>
					<li><a href="omplaintSettings.jsp" target="_blank">Complaint
							Setting</a></li>
					<li><a href="complaintCatSettings.jsp" target="_blank">Complaint
							Category Setting</a></li>
					<li><a href="ComplaintMailAdder.jsp" target="_blank">Registration
							of Mail Complaint</a></li>
					<li><a href="ExceptionSummary.jsp" target="_blank">Exception
							Summary Report</a></li>
					<li><a href="ExceptionDailySummaryReport.jsp" target="_blank">Daily
							Exception Report</a></li>
					<li><a href="SimmasterReport.jsp" target="_blank">Sim
							Master Report</a></li>
					<li><a href="SimmasterUpload.jsp" target="_blank">Sim
							Upload</a></li>
					<li><a href="PeripheralDevice.jsp" target="_blank">Peripheral
							Report</a></li>
					<li><a href="simchangereport.jsp">Sim Change Report</a></li>
					<li><a href="SearchTrip.jsp">Search Trip</a></li>
					<li><a href="ServiceProviderBillingUpload.jsp">Sim Bill
							Upload</a></li>
				</ul></li>


			<li><a href="#" id="admin">Admin Options </a>
				<ul>

					<li><a href="assigntrans.jsp">Assign Transporter</a></li>
					<li><a href="reconcillationunits.jsp"> Reconcillation</a></li>
					<li><a href="showmissingunits.jsp">Unit Missing Report</a></li>
					<li><a href="unitholding.jsp">Unit Holding</a></li>
					<li><a href="ReportSpecialreport.jsp">Special Report</a></li>
					<li><a href="reportt.jsp">All Report</a></li>
					<li><a href="pendingunitsreportexcel2.jsp">Pending Units
							(Tech)</a></li>
					<li><a href="pendingunitsreportexcel1.jsp">Pending Units
							(Cust)</a></li>
					<li><a href="editrecordreport.jsp">Edit Report</a></li>
					<li><a href="transportermaster.jsp">Transporter Master</a></li>
					<li><a href="transporterdetails.jsp">Add/Edit Transporter
							Details</a></li>
					<li><a href="specialcmmtentryform.jsp">Add Special
							Comments</a></li>
					<li><a href="AddDropDown.jsp">Add/Edit DropDown List</a></li>
					<li><a href="template.jsp">Create Template</a></li>
					<li><a href="singleunittransfer.jsp">Units Transfer By
							Courier</a></li>
					<li><a href="SmsSendToParameter.jsp">SMS Parameter</a></li>
					<li><a href="addinstn1.jsp">Add Instruction</a></li>
					<li><a href="addvehtyp.jsp">Add Vehicle Type</a></li>
					<li><a href="reprovisionreport.jsp">Reprovision Report</a></li>
				</ul></li>

			<li><a href="#" id="superadmin">Super Admin</a>
				<ul>
					<li><a href="Serv_provider_mail.jsp">Service Provider
							MailId</a></li>
					<li><a href="mobiledeactive_multiple.jsp">Multiple Mobile
							De-Activation Form</a></li>
					<li><a href="employee.jsp">Employee Details</a></li>
					<li><a href="DetailsIncident.jsp">Incident Details Report</a></li>
					<li><a href="IncidentReport.jsp">Incident Report</a></li>


				</ul></li>


			<li id="other"><a href="#">Other Options </a>
				<ul>
					<li><a href="remuittemp.jsp">Temp Removal</a></li>
					<li><a href="removeunit.jsp">Perm Removal</a></li>
					<li><a href="unitholding.jsp">Unit Removal</a></li>
					<li><a href="ReportSpecialreport.jsp">Special Report</a></li>
					<li><a href="pendingunitsreport.jsp">Unit Pending</a></li>

				</ul></li>


			
					
			<li id="special"><a href="manufdispdets.jsp">UNIT TRANSACTION</a></li>

			<li id="main"><a href="homepage.jsp" title="MAIN PAGE"> MAIN
					PAGE</a></li>

			<li id="out"><a href="outofwarrant.jsp"
				title="Out Of Warranty Vehicles (Excel format)"> All OutOf
					Warranty Vehs(Excel)</a></li>

			<li id="removed"><a href="remdelvehs.jsp"
				title="Removed / Deleted Vehs">Removed/Deleted Vehs</a></li>
				
			<li id="groupwise"><a href="groupmainpage.jsp"
				title="Group Vehs">GroupWise Vehs</a></li>

			<li id="changepassword"><a href="changepassword.jsp"
				title="changepass">Change Password</a></li>

			<li id="sim"><a href="Simtrack.jsp"
				title="Out Of Warranty Vehicles (Excel format)"> Sim Search</a></li>



			<li><a href="#" id="welcome">Welcome : <%=session.getAttribute("DisplayName").toString()%></a></li>

			<li><a href="logout.jsp" id="logout">Logout</a></li>


			<div class="clear"></div>
		</ul>








		<%
			if ("transporter".equalsIgnoreCase(typevalue)) {
					out.println("<script>transport();</script>");
				}

				if (SUPER_USER.equalsIgnoreCase(userRole)) {
					out.println("<script>superuser();</script>");
				}

				if (MANAGER.equalsIgnoreCase(userRole)) {
					out.println("<script>manager();</script>");
				}

				if (SUPERADMIN.equalsIgnoreCase(userRole)) {
					out.println("<script>superadmin();</script>");
				}

				if (MIDDLE_WARE.equalsIgnoreCase(userRole)) {
					out.println("<script>middleware();</script>");
				}

				if (SERVICE.equalsIgnoreCase(userRole)) {
					out.println("<script>service();</script>");
				}

				if (GROUP.equalsIgnoreCase(userRole)) {
					out.println("<script>group();</script>");
				}

				if (SALES.equalsIgnoreCase(userRole)) {
					out.println("<script>sales();</script>");
				}

				if (DISPATCH.equalsIgnoreCase(userRole)) {
					out.println("<script>dispatch();</script>");
				}
		%>
		
		<%           
	if(SERVICE.equalsIgnoreCase(userRole) || 
		MIDDLE_WARE.equalsIgnoreCase(userRole) || 
		MANAGER.equalsIgnoreCase(userRole) || 
		SUPERADMIN.equalsIgnoreCase(userRole) || 
		SUPER_USER.equalsIgnoreCase(userRole))
	{
%>
		
		

		<div
			style="font-size: 13px; color: black; padding-left: 150px; margin-top: 10px;">
			<table>
			<tr>

				<td style="align: left;"><font color="black">&nbsp;&nbsp;Report
						No.: <%
					try {
				%><%=reportno%> <%
 	} catch (Exception e11) {
 			e11.printStackTrace();
 		}
 %>
				</font> &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; <a href="#"
					onclick="openpopup('<%=PageName%>')" title="Register Complaint"
					style="color: black">Register Complaint</a> &nbsp;&nbsp; <a
					href="#" onclick="openpopup1('<%=PageName%>')"
					title="Register Complaint" style="color: black">Register
						Customer Complaint</a> &nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					
					
					
						
			<%
			} 
			%>		
			
			<td align="right">
			  <form name="srch" method="get" action="latestdata.jsp">
			 
			<font color="black"> Enter
						Unit Id to search for its last data</font> <input type="radio"
					name="VehUnit" value="Vehicle" checked />Vehicle <input
					type="radio" name="VehUnit" value="Unit" />Unit Id &nbsp;&nbsp; <input
					type="text" name="srchbx" style="width: 120px;" class="formElement" />
					
					
				<input type="submit" style="" name="submit" value="Look Up!" class="formElement"/><br>
			</form>
			</td>		
				
				
				</tr>		
				</table>	
		</div>
		
		
</body>
</html>

<%
	} catch (IllegalStateException e) {
		// TODO Auto-generated catch block
		response.sendRedirect("index.jsp");
		return;

	} catch (NullPointerException e) {

		out.print("Exception in header===>" + e);
		//System.out.println("bar.couldReturnNull() returned null");
	}
%>