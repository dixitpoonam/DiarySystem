<%@ page language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" import="java.sql.*" import="java.util.*" import=" java.text.*" errorPage="" %>
<%@ include file="headerpopdiary.jsp"%>
<%!
	Connection con;
	
	%>

<head>


<title>Complaints Settings</title>
<script src="sorttable.js" type="text/javascript"></script>
<meta name="keywords" content="" />
<meta name="description" content=""/>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="css/view.css" media="all" />
<style type="text/css">@import url(jscalendar-1.0/calendar-win2k-1.css);</style>
<script type="text/javascript" src="css/chrome.js"></script>


	<script type="text/javascript" src="jscalendar-1.0/calendar.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/lang/calendar-en.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/calendar-setup.js"></script>
	<script type="text/javascript" src="js/ajax-dynamic-content.js"></script>
	<script type="text/javascript" src="js/ajax.js"></script>
	<script type="text/javascript" src="js/ajax-tooltip.js"></script>	
	<script src="js/sorttable.js" type="text/javascript"></script>
<script type="text/javascript">

function popupclose()
{
	var dept= document.getElementById("dept").options[document.getElementById("dept").selectedIndex].value;
	if(dept=="select") {
			
			alert("Please select a Dept!");
		return false;
		}
} 

</script>
</head>

<body>


<%
String valid = request.getParameter("valid");
String Msg = request.getParameter("Msg");

if(Msg!=null)
{
  if(valid.equalsIgnoreCase("yes"))	
 {%>
	
	<script>
		opener.Reload();

alert("New limit is been added successfully");
		
		window.close();
		</script>
	
	
  <%}else{
	%>  
	  
	<script>
		

alert("Enter limit in format as limit1 < limit 2 < limit 3 ");
		
		
		</script>  
	  
<%  }
	
}





String dept=request.getParameter("dept");
String category=request.getParameter("category");
//System.out.println("complaintsettingedit.jsp");
%>
<%
String srno="";
String limit_1 = request.getParameter("limit_1");
String limit_2 = request.getParameter("limit_2");
String limit_3 = request.getParameter("limit_3");
String email_1 = request.getParameter("email_1");
String email_2 = request.getParameter("email_2");	
String email_3 = request.getParameter("email_3");

if(limit_1!=null) 
{	
	
	
}else {
	
	limit_1="-";
	limit_2="-";
	limit_3="-";
	email_3="-";
	email_2="-";
	email_1="-";
	
}
Statement st = null;
Statement st1 = null;

try {
	con = DriverManager.getConnection(MM_dbConn_STRING1,
			MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
	st = con.createStatement();
	st1 = con.createStatement();

} catch (Exception e2) {
	System.out.println("The exception is :"+e2);
}
%>
<%
try{
	
String sql ="select * from db_gps.t_ComplaintSettings where Category='"+category+"' AND dept='"+dept+"'";
ResultSet rs=st.executeQuery(sql);
System.out.println("The query is :"+sql);
while(rs.next()) {
	srno=rs.getString("SrNo");
	limit_1=rs.getString("Limit1");
	limit_2=rs.getString("Limit2");
	limit_3=rs.getString("Limit3");
	email_1=rs.getString("EmailID1");
	email_2=rs.getString("EmailID2");
	email_3=rs.getString("EmailID3");
}
}catch(Exception e1) {
	System.out.println("The exception is :"+e1);
}
System.out.println("The srno is :"+srno);
System.out.println("The limit_1 is :"+limit_1);
System.out.println("The limit_2 is :"+limit_2);
System.out.println("The limit_3 is :"+limit_3);
System.out.println("The email_1 is :"+email_1);
System.out.println("The email_2 is :"+email_2);
System.out.println("The email_3 is :"+email_3);

%>
<div id="form_container" style="width:70%; ">
	
		<h1 align="center">
		<table width="100%" >
		<tr>
		<td>
		<a href="http://www.mobile-eye.in" target="_blank"><img src="images/mobile.jpg" style="height: 80px; width: 100px;" title="Mobile-eye" id="logo" alt="Logo" /></a>
		</td><td style="vertical-align: bottom;text-align: center;margin-left: 2em;"><div style="text-align: center;"><a>Add New</a></div></td>
		<td style="vertical-align: bottom;text-align: right;"><font style="font-size: 0.5em;"><a href="http://www.mobile-eye.in" target="_blank">www.mobile-eye.in</a></font></td></tr>
		</table></h1>
		<br />
<form id="comsett"  name="comsett" action="ComplaintFVSettingsAddnew.jsp" onsubmit="return popupclose();" method="get">
								
  <table border="0" style="width: 300;" align="center" CELLPADDING=5 >
		<tr>
<!--			<td ><font  color="#990000" size="2">*</font></td>-->
			<td valign="top" style="text-align: left;"><font size="2"><font  color="#990000" size="2">*&nbsp; </font>Department :</font></td>
			<td align="left"><font size="2">
				<div>
			<select class="element select medium" id="dept" name="dept" style="width: 100px; height: 25px;" > 
			<option value="select" >select</option>
			<%
            String query5 = "select distinct(DeptName) from db_leaveapplication.t_department order by RId";
             ResultSet rs5 = st1.executeQuery(query5);
             while(rs5.next())
              {
%>
			<option value="<%=rs5.getString("DeptName")%>"><%=rs5.getString("DeptName")%></option>
			<%} %>
		</select>
		</div> 		
			</font></td>
		</tr>
		
		<tr><td style="text-align: left;"><font size="2">Category :</font></td>
		<td ><font size="2">
		<select name="cat" id="cat" onchange="" style="width: 100px; " >						
                        	<option value="Pending" >Pending</option>
                        	<option value="Responded">Responded</option>
                        	<option value="Attended">Attended</option>
                        	<option value="Queued">Queued</option>
                        	
                        	<option value="Escalated">Escalated</option>
						    <option value="Solved">Solved</option>                       	 
                        	  </select>
		</font></td></tr>
		
		<tr><td style="text-align: left;"><font size="2">Limit1 :</font></td><td ><font size="2"><input type="text" id="limit_1" name="limit_1" value="<%=limit_1 %>" style="width: 99%;background: white;"></input></font></td></tr>
		<tr><td style="text-align: left;"><font size="2">Limit2 :</font></td><td ><font size="2"><input type="text" id="limit_2" name="limit_2" value="<%=limit_2 %>" style="width: 99%;background: white;"></input></font></td></tr>
		<tr><td style="text-align: left;"><font size="2">Limit3 :</font></td><td ><font size="2"><input type="text" id="limit_3" name="limit_3" value="<%=limit_3 %>" style="width: 99%;background: white;"></input></font></td></tr>
		<tr><td style="text-align: left;"><font size="2">Email ID for Limit 1 :</font></td><td ><font size="2"><input type="text" id="email_1" name="email_1" value="<%=email_1 %>" style="width: 99%;background: white;"></font></td></tr>
		<tr><td style="text-align: left;"><font size="2">Email ID for Limit 2 :</font></td><td ><font size="2"><input type="text" id="email_2" name="email_2" value="<%=email_2 %>" style="width: 99%;background: white;"></font></td></tr>
		<tr><td style="text-align: left;"><font size="2">Email ID for Limit 3 :</font></td><td><font size="2"><input type="text" id="email_3" name="email_3" value="<%=email_3 %>" style="width: 99%;background: white;"></font></td></tr>
	
	<tr><td></td><td align="left"><input type="submit" name="sett" id ="sett" value="Submit"></input></td></tr>
</table>






</form>


		<br />
<%



%>

	





</ul>
</div>
</body>
<table border="1" width="100%" align="center">
<tr><td bgcolor="#98AFC7" class="copyright" width="100%">
<center>Copyright &copy; 2008 by Transworld Compressor Technologies Ltd. All Rights Reserved.</center>
</td></tr>
</table>



</html>
