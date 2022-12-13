<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java"
	import="java.sql.*" import=" java.text.*" import=" java.util.*"
	errorPage=""%>

<%@ include file="MenuNew.jsp"%>
<%@ include file="header.jsp"%>

<%@page import="org.omg.PortableServer.ForwardRequest"%><html
	xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
	
	
<head>

<title>Seven Day Diary System.</title>
<style>

.username.ng-valid {
	background-color: lightgreen;
}

.username.ng-dirty.ng-invalid-required {
	background-color: red;
}

.username.ng-dirty.ng-invalid-minlength {
	background-color: yellow;
}

.email.ng-valid {
	background-color: lightgreen;
}

.email.ng-dirty.ng-invalid-required {
	background-color: red;
}

.email.ng-dirty.ng-invalid-email {
	background-color: yellow;
}

</style>
    <link href="css/form.css" rel="stylesheet" type="text/css" />


<script src="sorttable.js" type="text/javascript"></script>
<style type="text/css">
@import url(jscalendar-1.0/calendar-win2k-1.css);
</style>
<script type="text/javascript" src="jscalendar-1.0/calendar.js"></script>
<script type="text/javascript" src="jscalendar-1.0/lang/calendar-en.js"></script>
<script type="text/javascript" src="jscalendar-1.0/calendar-setup.js"></script>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css"
	rel="stylesheet" type="text/css" />
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker.css"
	rel="stylesheet" type="text/css" />
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/js/bootstrap-datepicker.js"></script>

<script>
	$(document).ready(function() {

		$("#datepicker").datepicker({
			autoclose : true,
			todayHighlight : true
		}).datepicker('update', new Date());
	});
</script>



<script language="javascript">
	function formsubmit() {
		
		var aa = document.addgrpform.owner.value;
		if (!(aa == "Select")) {
			
			document.addgrpform.submit();
			document.addgrpform.vehcles[0].value = "Select";
			document.addgrpform.vehcles[0].selected = true;
			//alert(document.addgrpform.vehcles.value);
		}

	}

	function formsubmit2() {

		var bb = document.addgrpform.vehcles.value;

		if (!(bb == "Select")) {
			document.addgrpform.submit();
		}

	}

	function redirect() {
		var owner = document.getElementById("owner").value;
		//alert(owner);
		if (owner == "Select") {
			alert("please select OwnerName");
			return false;
		}
		var vehcles = document.getElementById("vehcles").value;
		//alert(vehcles);
		if (vehcles == "Select") {
			alert("please select vehicle registration page");
			return false;
		}
		var grp = document.getElementById("grp").value;
		//alert(grp);
		if (grp == "Select") {
			alert("please select group");
			return false;
		}

		document.addgrpform.action = "cnfrmgrp.jsp";
		document.addgrpform.submit();

	}

	function getVehicleByOwner(dropdown) {
		
		//alert("Helllllo");
		var vv1 = dropdown.selectedIndex;

		var lowerLimit = dropdown.options[vv1].value;
		//alert ("lowerLimit----->"  + lowerLimit);

		var ajaxRequest;

		try {
			// Opera 8.0+, Firefox, Safari
			ajaxRequest = new XMLHttpRequest();
		} catch (e) {
			// Internet Explorer Browsers
			try {
				ajaxRequest = new ActiveXObject("Msxml2.XMLHTTP");
			} catch (e) {
				try {
					ajaxRequest = new ActiveXObject("Microsoft.XMLHTTP");
				} catch (e) {
					// Something went wrong
					alert("Your browser broke!");
					return false;
				}
			}
		}

		ajaxRequest.onreadystatechange = function() {
			if (ajaxRequest.readyState == 4) {

				var reslt = ajaxRequest.responseText;
				//	alert ("reslt---->" +  reslt);
				reslt = ajaxRequest.responseText;
				document.getElementById("veh_group").innerHTML = reslt;

			}
		}

		var url = "GetVehicleNumber.jsp";
		url = url + "?TripID=" + lowerLimit;
		ajaxRequest.open("GET", url, true);
		ajaxRequest.send(null);

	}
</script>



</head>


<body>
	<%!Connection con1, con2;%>

	<%
		try {//1 gps 
				//System.out.println(">>>>>addvehtogrp.....>>>>");
			Class.forName(MM_dbConn_DRIVER);
			con1 = DriverManager.getConnection(MM_dbConn_STRING, MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
			con2 = DriverManager.getConnection(MM_dbConn_STRING1, MM_dbConn_USERNAME, MM_dbConn_PASSWORD);

			Statement stmt = con1.createStatement(), stmt1 = con1.createStatement(), stmt2 = con2.createStatement(),
					stmt3 = con2.createStatement(), stmt4 = con2.createStatement();
			ResultSet rs1 = null, rs2 = null, rs3 = null, rs4 = null, rs5 = null;
			String sql = "", sql1 = "", sql2 = "", sql3 = "", sql4 = "", sql5 = "";
			String tm = "";

			java.util.Date td = new java.util.Date();
			Format fmt = new SimpleDateFormat("yyyy-MM-dd");
			String sdt = fmt.format(td);

			tm = td.getHours() + ":" + td.getMinutes() + ":" + td.getSeconds();

			String OwnerName = request.getParameter("owner");
			////System.out.println("OwnerName--->" + OwnerName);
			String RegNo = request.getParameter("vehcles");
			String insert = request.getParameter("inserted");
			//System.out.println(">>>>insert value>>>.>"+insert);

			if (insert == null) {

			} else {
	%>

	<script type="text/javascript">
		alert("Inserted Sucessfully");
		window.location = "addvehtogrp.jsp";
	</script>
	

	<%
		}
	%>


	<div style="margin-left: 275px; margin-top: 60px;"
		class="generic-container">
		<div class="panel panel-default">
			<div class="panel-heading">
				<span class="lead">Add Vehicle To Group</span>
			</div>
			<div class="formcontainer">
				<form name="addgrpform" class="form-horizontal" method="post">
					<input type="hidden" />
					<div class="row">
						<div class="form-group col-md-12">

							<label class="col-md-2 control-lable" for="file">Owner
								Name:</label>
							<div class="col-md-7">
								<select name="owner" id="owner" onchange="formsubmit();" class="form-control input-sm">
									<option value="Select">Select</option>
									<%
										if (!(null == OwnerName)) {
									%>

									<option value="<%=OwnerName%>" selected="selected"><%=OwnerName%></option>
									<%
										}
									%>
									<%
										sql = "select Distinct(OwnerName) as Transporter from t_vehicledetails where OwnerName not like '%del' order by OwnerName";
											rs1 = stmt2.executeQuery(sql);
											while (rs1.next()) {
									%>
									<option value="<%=rs1.getString("Transporter")%> ">
										<%=rs1.getString("Transporter")%>
									</option>
									<%
										}
									%>
								</select>
							</div>
						</div>
					</div>


					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-2 control-lable" for="file">Vehicles
								:</label>
							<div class="col-md-7">

								<select name="vehcles" id="vehcles"
									onchange="getVehicleByOwner(this);" class="form-control input-sm">
									
									
									<option value="Select">Select</option>

									<%
										sql = "select Distinct(VehicleRegNumber) from t_vehicledetails where OwnerName='" + OwnerName
													+ "' and Status='-' order by VehicleRegNumber ";
											rs2 = stmt2.executeQuery(sql);
											while (rs2.next()) {
									%>
									
									<option value="<%=rs2.getString("VehicleRegNumber")%> ">
										
										<%=rs2.getString("VehicleRegNumber")%>
									</option>
									<%
										}
									%>



								</select>
							</div>

						</div>
					</div>
						<div class="row">
					<div class="form-group col-md-12">
						<label class="col-md-5 control-lable" for="file">Selected Vehicle
									Available in Group/s :</label>
						<div class="col-md-7" id="veh_group">
							

							
						</div>
					</div>
				</div>
					
				

				<div class="row">
					<div class="form-group col-md-12">
						<label class="col-md-2 control-lable" for="file">Groups :</label>
						<div class="col-md-7">
							<select name="grp" id="grp" class="form-control input-sm">
								<option value="Select">Select</option>
								<%
									

										// String OwnerName=request.getParameter("owner");
										////System.out.println(OwnerName);
										sql = "select Distinct(GPName) as grp from t_group where GPName not like '%del' order by GPName";
										////System.out.println("sql----->" +  sql);
										String str = "select Distinct(GPName) as grp from t_group where GPName not like '%del' where GPName Not In (select Distinct(GPName) from t_group where transporter='"
												+ RegNo + "') order by GPName";
										////System.out.println("str--->" +str);
										rs2 = stmt2.executeQuery(sql);
										while (rs2.next()) {
								%>
								<option value="<%=rs2.getString("grp")%> ">
									<%=rs2.getString("grp")%>
								</option>
								<%
									}
								%>

							</select>
						</div>
					</div>
				</div>



				<div class="row">
					<div class="text-center">

						<input type="button" name="Submit" value="Submit"
							class="formElement" class="btn btn-primary btn-sm"
							onclick="redirect();">

					</div>
				</div>

			</div>
			</form>
		</div>
		<%
			} catch (Exception e) {
				System.out.println("Exception e " + e);
			}
		%>
		
		</div>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		</body>
       </html>



		<%@ include file="footer.jsp"%>	
			
		
	


