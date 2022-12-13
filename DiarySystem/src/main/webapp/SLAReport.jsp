<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java"
	import="java.sql.*" import=" java.text.*" import=" java.util.*"
	errorPage=""%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>

<style type="text/css">
@import url(jscalendar-1.0/calendar-win2k-1.css);
</style>




<%@ page contentType="text/html; charset=iso-8859-1" language="java"
	import="java.sql.*" import=" java.text.*" import=" java.util.*"
	errorPage=""%>

<%@include file="header.jsp"%>
<%@page import="java.sql.ResultSet"%>


<%!public int nullIntconv(String str) {
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
	}%>
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

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- Export Options Links of DataTables -->

<link rel="stylesheet"
	href="https://cdn.datatables.net/buttons/1.5.1/css/buttons.dataTables.min.css ">
<script type="text/javascript" src="datatablejs/bootstrap.js"></script>
<!--  <script
	src=" https://cdn.datatables.net/buttons/1.5.1/js/buttons.flash.min.js "></script> -->
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
	                        title: 'SLA Report', 

							
	                    },
	                    {
	                        extend: 'pdf',
	                        orientation: 'landscape',
	                        pageSize: 'LEGAL',
	                        title: 'SLA Report', 	                        
	                       
	                     },
	                    {
	                        extend: 'csv',
	                        title: 'SLA Report', 	                       
	                    },
	                    {
	                        extend: 'print',
	                        title: 'SLA Report', 	                        
	                    },
	                    {
	                        extend: 'copy',
	                        title: 'SLA Report', 	                       
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
	       
	            null,
	            null,
	            null,
	            null,
	            null,
	            null,
	            null,
	            null,
	            null,
	            null,
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



<style>
.popup {
	background-color: #98AFC7;
	position: absolute;
	visibility: hidden;
}
</style>

<link rel="stylesheet" href="css/css.css" type="text/css" charset="utf-8" />
	<script src="sorttable.js" type="text/javascript"></script>
	<style type="text/css">@import url(jscalendar-1.0/calendar-win2k-1.css);</style>
	<script type="text/javascript" src="jscalendar-1.0/calendar.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/lang/calendar-en.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/calendar-setup.js"></script>
	<script language="javascript">
	function fun1()
	{
		document.sla.submit();
	}	
	
	function toggleDetails(id, show)
	{
		var popup = document.getElementById("popup"+id);
		if (show) 
		{
			popup.style.visibility = "visible";
			popup.setfocus();
		}
		else
		{
			popup.style.visibility = "hidden";
		}
	}
	function validate()
	{
		var date1=document.getElementById("calender").value;
		var date2=document.getElementById("calender1").value;
		var dm1,dd1,dy1,dm2,dd2,dy2;
		dy1=date1.substring(0,4);
		dy2=date2.substring(0,4);
		dm1=date1.substring(5,7);
		dm2=date2.substring(5,7);
		dd1=date1.substring(8,10);
		dd2=date2.substring(8,10);
		var date=new Date();
		var month=date.getMonth()+1;
		var day=date.getDate();
		var year=date.getFullYear();
		if(dy1>year || dy2>year)
		{
			alert("Selected date should not be greater than Todays date (Year)");
			//document.getElementById("calender").value="";
			//document.getElementById("calender1").value="";
			//document.getElementById("calender").focus;
			return false;
		}
		else if(year==dy1 && year==dy2) 
		{
			if(dm1>month || dm2>month)
			{
				alert("Selected date should not be greater than Todays date (Month)");
				//document.getElementById("calender").value="";
				//document.getElementById("calender1").value="";
				//document.getElementById("calender").focus;
				return false;
			}
		}
		if(dm1==month)
		{
			if(dd1>day || dd2>day)
			{
				alert("Selected date should not be greater than Todays date (Day)");
				//document.getElementById("calender").value="";
				//document.getElementById("calender1").value="";
				//document.getElementById("calender").focus;
				return false;
			}
		}
		if(dy1>dy2)
		{
			alert("From date year should not be greater than To date year");
			//document.getElementById("data").value="";
			//document.getElementById("data1").value="";
			//document.getElementById("data").focus;
			return false;
		}
		else if(year==dy1 && year==dy2) 
		{
			if(dm1>dm2)
			{
				alert("From date month should not be greater than To date month");
				//document.getElementById("data").value="";
				//document.getElementById("data1").value="";
				//document.getElementById("data").focus;
				return false;
			}
		}
		if(dm1==dm2)
		{
			if(dd1 > dd2)
			{
				alert("From date should not be greater than To date");
				//document.getElementById("data").value="";
				//document.getElementById("data1").value="";
				//document.getElementById("data").focus;
				return false;
			}
		}
		return true;	
	}

	</script>
	<style>
.popup {
background-color: #98AFC7;
position: absolute;
visibility: hidden;

</style>





</head>

<body style="background-color: #FFFFFF;">

	<!-- <div id="wrapper" style="width: 100%">
		<div id="logo" style="padding-left: 250px; width: min-content;">
			<h1>
				<img src="images/Transworld.gif">
			</h1>
			<p>We care about your Vehicles</p>
		</div> -->
		<%-- <%@ include file="header1.jsp"%> --%>
		
		<%@ include file="MenuNew.jsp"%>
		<br>
		<br>

		<%! 
Connection con1;
Connection con2;
String refno=null;

%>
<%

String data=request.getParameter("data1");
String data1=request.getParameter("data2");
String mntname="";

if(data==null || data1==null)
{
	
	
}else{
	if(data.equals("01"))
	{
		mntname="JAN";
	}else if(data.equals("02"))
	{
		mntname="FEB";
	}else if(data.equals("03"))
	{
		mntname="MAR";
	}else if(data.equals("04"))
	{
		mntname="APR";
	}else if(data.equals("05"))
	{
		mntname="MAY";
	}else if(data.equals("06"))
	{
		mntname="JUNE";
	}else if(data.equals("07"))
	{
		mntname="JULY";
	}else if(data.equals("08"))
	{
		mntname="AUG";
	}else if(data.equals("09"))
	{
		mntname="SEPT";
	}else if(data.equals("10"))
	{
		mntname="OCT";
	}else if(data.equals("11"))
	{
		mntname="NOV";
	}else if(data.equals("12"))
	{
		mntname="DEC";
	}
	
}

%>



		
		<form name="sla" method="post" action="" onSubmit="return validate();">

<table width="100%" border="0" bgcolor="">
<tr><td align="center" colspan="5" ><font size="2" color=""><b>Please Select Date Range To View SLA Report</td></tr>
<tr>
<td align="right">
<%
String bt=request.getParameter("data1"); 
%>
<select name="data1" selected="selected" style="">
<%if(bt==null){
	%>
<%}else{ %>

<option value=<%=data %>  ><%=mntname %></option>
<%} %>
	<option value="01"  >JAN</option>
	<option value="02" >FEB</option>
	<option value="03" >MAR</option>
	<option value="04" >APR</option>
	<option value="05" >MAY</option>
	<option value="06" >JUNE</option>
	<option value="07" >JULY</option>
	<option value="08" >AUG</option>
	<option value="09" >SEPT</option>
	<option value="10" >OCT</option>
	<option value="11" >NOV</option>
	<option value="12" >DEC</option>
</select>
</td>

<td align="center">
<select name="data2" style="">

<%if(bt==null){
	%>
<%}else{ %>

<option value=<%=data1 %>  ><%=data1 %></option>
<%} %>
	<!-- <option value="2006" selected="selected" >2006</option>
	<option value="2007" >2007</option>
	<option value="2008" >2008</option>
	<option value="2009" >2009</option>
	<option value="2010" >2010</option>
	<option value="2011" >2011</option>
	<option value="2012" >2012</option>
	<option value="2013" >2013</option>
	<option value="2014" >2014</option>
	<option value="2015" >2015</option>
	<option value="2016" >2016</option>
	<option value="2017" >2017</option>
	<option value="2018" >2018</option>
	<option value="2019" >2019</option>
	<option value="2020" >2020</option> -->
	
	<%for(int k=2016;k<=2050;k++)
{
%>
<option value="<%=k %>"><%=k %></option>
<%} %>
	
</select>




<!-- <input type="text" id="data2" name="data2" value="< %=datenew2%>" size="15" readonly/></td><td align="left">
  <input type="button" name="To Date" value="To Date" id="trigger1">
<script type="text/javascript">
  Calendar.setup(
    {
      inputField  : "data2",         // ID of the input field
      ifFormat    : "%d-%b-%Y",    // the date format
      button      : "trigger1"       // ID of the button
    }
  );
</script>-->
</td>
<!--  <td>
<input type="text" id="calender" name="calender" size="10" class="formElement" readonly/></td><td>
<input type="image" src="images/FromDate.bmp" id="trigger">
<script type="text/javascript">
  Calendar.setup(
    {
      inputField  : "calender",         // ID of the input field
      ifFormat    : "%d-%b-%Y",     // the date format
      button      : "trigger"       // ID of the button
    }
  );
</script>
</td><td>
<input type="text" id="calender1" name="calender1" size="10" class="formElement"  readonly/>
</td><td>
<input type="image" src="images/todate.bmp" id="trigger1">
<script type="text/javascript">
  Calendar.setup(
    {
      inputField  : "calender1",         // ID of the input field
      ifFormat    : "%d-%b-%Y",    // the date format
      button      : "trigger1"       // ID of the 
    }
  );
</script></td>
-->
<td><input type="submit" name="submit"  value="submit"></td></tr>
</table>
</form>
<br>
<br>
		<%
/*	String calender="",calender1="";

	String data=request.getParameter("calender");
	String data1=request.getParameter("calender1");*/
//	String d1="01-jul-2010";
	String data4=request.getParameter("data1");
	String data3=request.getParameter("data2");
	//int data2=Integer.parseInt(data1);
	String cust="",sql2="",customer="",sql11="";
	double Amtperveh=0.0,AmtPerDay=0.0,SLAdiff=0.0,ExpTotalAmt=0.0;	
	double AmtSLADiff=0.0,NetBillAmt=0;
	int totalexpected=0;
	double totalNetBill=0.0;	
	int totalvehcounter=0;    
	//int totdiff=0;
	String Nettotamt="";
	float  monthdays=0.0f;
	float  monthdays1=0.0f;
	String finaldate="";
	String finaldate1="";
	////System.out.println("data---->"+data);
//	 String s = new Integer(str).toString();
//int result = data.compareTo(d1);
if(data4==null)
{

}

else
{	
	
	String Customer1,CustomerCode,SLAAttained,Rate,BillType,ChargeperDay,SLAPer,GroupName,NotCaptured,Maintenance,VehcileAdded,VehcileRemoved,TotalDays,NoofVehicles;
	String CapturedDays,DisconnectedDays,TotalBilledDays;
	float BilledAmt1=0.0f;
	String today=new SimpleDateFormat("dd").format(new java.util.Date());
	int today1=Integer.parseInt(today);
	//out.print(today);
	/*java.util.Date showDate6 = new SimpleDateFormat("dd-MMM-yyyy").parse(data1);
    Format formatter6 = new SimpleDateFormat("yyyy-MM-dd");
    String showdate6=formatter6.format(showDate6);
	String Month=showdate6.substring(5,7);
	String Year=showdate6.substring(0,4);
	calender=new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(data));
	calender1=new SimpleDateFormat("yyyy-MM-dd ").format(new SimpleDateFormat("dd-MMM-yyyy").parse(data1));
	String mont=calender.substring(5,7);
	String mont1=calender.substring(5,7);
	String day=calender.substring(8,10);
	String day1=calender1.substring(8,10);
	int year=Integer.parseInt(calender.substring(0,4));
	int year1=Integer.parseInt(calender1.substring(0,4));
	if(mont.equals("01")||mont.equals("03")||mont.equals("05")||mont.equals("07")||mont.equals("08")||mont.equals("10")||mont.equals("12"))
	{
		monthdays=31;
		finaldate=year+"-"+mont+"-"+monthdays;
	}
	else if(mont.equals("04")||mont.equals("06")||mont.equals("09")||mont.equals("11"))
	{
		monthdays=30;
		finaldate=year+"-"+mont+"-"+monthdays;
	}
	else
	{
		if(year%4==0)
		{
			monthdays=29;
			finaldate=year+"-"+mont+"-"+monthdays;
		}
		else
		{
			monthdays=28;
			finaldate=year+"-"+mont+"-"+monthdays;
		}
	}
	if(mont1.equals("01")||mont1.equals("03")||mont1.equals("05")||mont1.equals("07")||mont1.equals("08")||mont1.equals("10")||mont1.equals("12"))
	{
		monthdays1=31;
		finaldate1=year+"-"+mont+"-"+monthdays;
	}
	else if(mont1.equals("04")||mont1.equals("06")||mont1.equals("09")||mont1.equals("11"))
	{
		monthdays1=30;
		finaldate1=year+"-"+mont+"-"+monthdays;
	}
	else
	{
		if(year1%4==0)
		{
			monthdays1=29;
			finaldate1=year+"-"+mont+"-"+monthdays;
		}
		else
		{
			monthdays1=28;
			finaldate1=year+"-"+mont+"-"+monthdays;
		}
	}
	*/
	%>
	<table width="100%" border="0" align="center" bgcolor="">
	<tr>
	<th><font size="2" color="">SLA Summary Report for Month-<%=mntname%> and Year-<%=data1%> </font> </th>
	</tr>	
	</table>
		
			<table id="example" class="display" style="width: 100%">
					<thead>
						<tr>
							<th>Sr.No</th>
							<th align="center">Customer</th>
							<th align="center">Group Name</th>
							<th align="center">SLA Per</th>
							<th align="center">No of Vehicles</th>
							<th align="center">Vehicle Added</th>
							<th align="center">Vehicle Removed</th>
							<th align="center">Captured Days</th>
							
							<th align="center">% of Captured Days</th>
							<th align="center">Disconnected  Days</th>
							<th align="center">Maintenance Days</th>
							
							<th align="center">Not Captured</th>
							
							<th align="center">Total days</th>
							<th align="center">% of Billed Days</th>
							<th align="center">Total Billed Days </th>
							<th align="center">Bill Type</th>
							<th align="center">SLA Attained</th>
							
							</tr>
					</thead>

					<tbody>
					
					<%
	try
	{

		Connection con;
		Statement st=null,st1=null,st2=null,st4=null,st5=null,st6=null,st7=null; 
	
		Class.forName("org.gjt.mm.mysql.Driver");
	      
	     // conn1 = DriverManager.getConnection("jdbc:mysql://103.241.181.36/db_gps", "fleetview", "1@flv");
	     con= DriverManager.getConnection("jdbc:mysql://173.234.153.82/db_gps","fleetview","1@flv");
		
		//Class.forName(MM_dbConn_DRIVER);
		//con = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	    st=con.createStatement();
	    st1=con.createStatement();
	    st2=con.createStatement();
	    st4=con.createStatement();
	    st5=con.createStatement();
	    st6=con.createStatement();
	    st7=con.createStatement();
	    
	    NumberFormat nf = NumberFormat.getNumberInstance();
	    NumberFormat nf1 = NumberFormat.getNumberInstance();
		nf.setMaximumFractionDigits(2) ;
		nf1.setMaximumFractionDigits(2) ;
		  nf.setGroupingUsed(false); 
			
		  
		  String fromdate=data1+"-"+data+"-01";
		  String data2="20"+data1;
		  int year=Integer.parseInt(data2);
		  System.out.println("fromdate"+fromdate);
		  if(data.equalsIgnoreCase("01")||data.equalsIgnoreCase("03")||data.equalsIgnoreCase("05")||data.equalsIgnoreCase("07")||data.equalsIgnoreCase("08")||data.equalsIgnoreCase("10")||data.equalsIgnoreCase("12"))
		  {
		  monthdays=31;
		  }
		  else if(data.equalsIgnoreCase("04")||data.equalsIgnoreCase("06")||data.equalsIgnoreCase("09")||data.equalsIgnoreCase("11"))
		  {
		  	monthdays=30;
		  }
		  else
		  {
			  if(year%4==0)
				{
					monthdays=29;
				
				}
				else
				{
					monthdays=28;
					
				}
		  }
		//  //System.out.println("monthdays----->"+monthdays);
		
		String code="select distinct(ERPCode),TypeValue as transporter from db_gps.t_transporter where OperationalStatus='Active' order by TypeValue ";
		ResultSet rst1=st4.executeQuery(code);
		System.out.println("Code  -->"+code);
		
		int j=1;
		while(rst1.next())
		{
				
		System.out.println("In While 1");
		//String code1=rst1.getString("ERPtransportercode");
		String transporter=rst1.getString("transporter");
		//System.out.println("ERPTransporterCode  -->"+code1);
		
		//String sql="select db_gps.t_billingdetails.Transporter as Customer,ERPCode as CustomerCode,SLAPer,Rate,Rate/'"+monthdays+"' as ChargeperDay, (select count(*) as NoofVehicles from db_gps.t_billingdetails where month1='"+fromdate+"' and ERPTransporterCode='"+code1+"') as NoofVehicles ,(select sum(VehAddedThisMonth) from db_gps.t_billingdetails where month1='"+fromdate+"' and ERPTransporterCode='"+code1+"') as VehcileAdded,(select sum(vehRemovedThisMonth)  from db_gps.t_billingdetails where month1='"+fromdate+"' and ERPTransporterCode='"+code1+"') as  VehcileRemoved,(select sum(TotalYes) from db_gps.t_billingdetails where month1='"+fromdate+"' and ERPTransporterCode='"+code1+"') as CapturedDays,(select Sum(TotalYesStar) from db_gps.t_billingdetails where month1='"+fromdate+"' and ERPTransporterCode='"+code1+"') as DisconnectedDays,(select sum(TotalNo) from db_gps.t_billingdetails where month1='"+fromdate+"' and ERPTransporterCode='"+code1+"') as NotCaptured,(select sum(TotalDays) from db_gps.t_billingdetails where month1='"+fromdate+"' and ERPTransporterCode='"+code1+"') as TotalDays,(select Sum(TotalYesStar)+sum(TotalYes) from db_gps.t_billingdetails where month1='"+fromdate+"' and ERPTransporterCode='"+code1+"') as TotalBilledDays,db_gps.t_billingdetails.Transporter as GroupName,BillType,db_gps.t_billingdetails.Transporter as transporter from db_gps.t_fv_erp_relation,db_gps.t_billingdetails where month1='"+fromdate+"' and db_gps.t_billingdetails.ERPtransporterCode='"+code1+"'  limit 1";
		
		//String sql="select db_gps.t_billingdetails.Transporter as Customer,ERPCode as CustomerCode,SLAPer,Rate,Rate/'"+monthdays+"' as ChargeperDay, (select count(*) as NoofVehicles from db_gps.t_vehicledetails where ownername='"+transporter+"' and status='-' ) as NoofVehicles ,(select sum(VehAddedThisMonth) from db_gps.t_billingdetails where month1='"+fromdate+"' and ERPTransporterCode='"+code1+"') as VehcileAdded,(select sum(vehRemovedThisMonth)  from db_gps.t_billingdetails where month1='"+fromdate+"' and ERPTransporterCode='"+code1+"') as  VehcileRemoved,(select sum(TotalYes) from db_gps.t_billingdetails where month1='"+fromdate+"' and ERPTransporterCode='"+code1+"') as CapturedDays,(select Sum(TotalYesStar) from db_gps.t_billingdetails where month1='"+fromdate+"' and ERPTransporterCode='"+code1+"') as DisconnectedDays,(select sum(TotalNo) from db_gps.t_billingdetails where month1='"+fromdate+"' and ERPTransporterCode='"+code1+"') as NotCaptured,(select sum(TotalDays) from db_gps.t_billingdetails where month1='"+fromdate+"' and ERPTransporterCode='"+code1+"') as TotalDays,(select Sum(TotalYesStar)+sum(TotalYes) from db_gps.t_billingdetails where month1='"+fromdate+"' and ERPTransporterCode='"+code1+"') as TotalBilledDays,db_gps.t_billingdetails.Transporter as GroupName,BillType,db_gps.t_billingdetails.Transporter as transporter from db_gps.t_fv_erp_relation,db_gps.t_billingdetails where month1='"+fromdate+"' and db_gps.t_billingdetails.ERPtransporterCode='"+code1+"'  limit 1";
		
		//String sql="select db_gps.t_billingdetails.Transporter as Customer,ERPCode as CustomerCode,SLAPer,Rate,Rate/'"+monthdays+"' as ChargeperDay, (select count(*) as NoofVehicles from db_gps.t_vehicledetails where ownername='"+transporter+"' and status='-' ) as NoofVehicles ,(select sum(VehAddedThisMonth) from db_gps.t_billingdetails where month1='"+fromdate+"' and transporter='"+transporter+"') as VehcileAdded,(select sum(vehRemovedThisMonth)  from db_gps.t_billingdetails where month1='"+fromdate+"' and transporter='"+transporter+"') as  VehcileRemoved,(select sum(TotalYes) from db_gps.t_billingdetails where month1='"+fromdate+"' and transporter='"+transporter+"') as CapturedDays,(select Sum(TotalYesStar) from db_gps.t_billingdetails where month1='"+fromdate+"' and transporter='"+transporter+"') as DisconnectedDays,(select sum(TotalNo) from db_gps.t_billingdetails where month1='"+fromdate+"' and transporter='"+transporter+"') as NotCaptured,(select sum(TotalDays) from db_gps.t_billingdetails where month1='"+fromdate+"' and transporter='"+transporter+"') as TotalDays,(select Sum(TotalYesStar)+sum(TotalYes) from db_gps.t_billingdetails where month1='"+fromdate+"' and transporter='"+transporter+"') as TotalBilledDays,db_gps.t_billingdetails.Transporter as GroupName,BillType,db_gps.t_billingdetails.Transporter as transporter from db_gps.t_fv_erp_relation,db_gps.t_billingdetails where month1='"+fromdate+"' and db_gps.t_billingdetails.transporter='"+transporter+"'  limit 1";
		
		String sql="select db_gps.t_billingdetails.Transporter as Customer,ERPCode as CustomerCode,SLAPer,Rate,Rate/'"+monthdays+"' as ChargeperDay, (select count(*) as NoofVehicles from db_gps.t_vehicledetails where ownername='"+transporter+"' and status='-' ) as NoofVehicles ,(select sum(VehAddedThisMonth) from db_gps.t_billingdetails where month1='"+fromdate+"' and transporter='"+transporter+"') as VehcileAdded,(select count(vehRemovedThisMonth)  from db_gps.t_billingdetails where month1='"+fromdate+"' and transporter='"+transporter+"' and vehRemovedThisMonth !='No' and vehid not in (select vehiclecode from db_gps.t_vehicledetails where ownername='"+transporter+"' and status='-' )) as  VehcileRemoved,(select sum(TotalYes) from db_gps.t_billingdetails where month1='"+fromdate+"' and transporter='"+transporter+"') as CapturedDays,(select Sum(TotalYesStar) from db_gps.t_billingdetails where month1='"+fromdate+"' and transporter='"+transporter+"') as DisconnectedDays,(select sum(TotalYesStarStar) from db_gps.t_billingdetails where month1='"+fromdate+"' and transporter='"+transporter+"') as Maintenance,(select sum(TotalNo) from db_gps.t_billingdetails where month1='"+fromdate+"' and transporter='"+transporter+"') as NotCaptured,(select sum(TotalDays) from db_gps.t_billingdetails where month1='"+fromdate+"' and transporter='"+transporter+"') as TotalDays,(select Sum(TotalYesStar)+sum(TotalYes)+sum(TotalYesStarStar) from db_gps.t_billingdetails where month1='"+fromdate+"' and transporter='"+transporter+"') as TotalBilledDays,db_gps.t_billingdetails.Transporter as GroupName,BillType,db_gps.t_billingdetails.Transporter as transporter from db_gps.t_fv_erp_relation,db_gps.t_billingdetails where month1='"+fromdate+"' and db_gps.t_billingdetails.transporter='"+transporter+"'  limit 1";

		
		ResultSet rst=st2.executeQuery(sql);
		
	    //String sql="select ERPCustName as Customer,ERPCode as CustomerCode,SLAPer,Rate,Rate/'"+monthdays+"' as ChargeperDay,count(t_billingdetails.vehid) as NoofVehicles,sum(VehAddedThisMonth) as VehcileAdded,sum(vehRemovedThisMonth) as VehcileRemoved,sum(TotalYes) as CapturedDays,Sum(TotalYesStar) as DisconnectedDays,sum(TotalNo) as NotCaptured,sum(TotalDays) as TotalDays,Sum(TotalYesStar)+sum(TotalYes) as TotalBilledDays,GroupName,BillType,t_billingdetails.Transporter as transporter from t_fv_erp_relation,t_billingdetails where month1='"+fromdate+"' and t_billingdetails.vehid = t_fv_erp_relation.vehid group by   ERPCustName,groupcode";
	    
	   
	   // String sql="Select ERPCustName as Customer,ERPCode as CusromerCode,SLAPer,Rate,count(t_billingdetails.vehid) as NoofVehicles,sum(VehAddedThisMonth) as VehcileAdded,sum(vehRemovedThisMonth) as VehcileRemoved,sum(TotalYes) as CapturedDays,Sum(TotalYesStar) as DisconnectedDays,sum(TotalNo) as NotCaptured,sum(TotalDays) as TotalDays,Sum(TotalYesStar)+sum(TotalYes) as TotalBilledDays ,GroupName,BillType from t_fv_erp_relation ,t_billingdetails where month1='" & Year(DTP_fromDate.Value) & "-" & Format(Month(DTP_fromDate.Value), "00") & "-01" & "'" & mCustWhereCondition & " and t_billingdetails.vehid    = t_fv_erp_relation.vehid  and t_fv_erp_relation.BillTransporter='Yes' group by   ERPCustName,groupcode";
	   //System.out.println(sql);	
	   
	  
	   
	   System.out.println("Code 1 -->"+sql);
	   
	   while(rst.next())
	   	{
		   System.out.println("In While 2");   
		   
		   System.out.println("int i value  -->"+j);
	   		String noOfVehicleAdded="";
		   
		   Customer1=rst.getString("Customer");
		  // System.out.println("customer--->"+Customer1);
		  
	   		transporter=rst.getString("transporter");
	   		//System.out.println("Transporter --->"+transporter);
	   		CustomerCode=rst.getString("CustomerCode");
	   		SLAPer=rst.getString("SLAPer");
	   		Rate=rst.getString("Rate");
	   		ChargeperDay=rst.getString("ChargeperDay");
	   		NoofVehicles=rst.getString("NoofVehicles");
	   		System.out.println("NoofVehicles --->"+NoofVehicles);
	   		VehcileAdded=rst.getString("VehcileAdded");
	   		VehcileRemoved=rst.getString("VehcileRemoved");
	   		System.out.println("Removed --->"+VehcileRemoved);
	   		CapturedDays=rst.getString("CapturedDays");
	   		DisconnectedDays=rst.getString("DisconnectedDays");
	   		NotCaptured=rst.getString("NotCaptured");
	   		Maintenance=rst.getString("Maintenance");
	   		TotalDays=rst.getString("TotalDays");
	   		TotalBilledDays=rst.getString("TotalBilledDays");
	   		GroupName=rst.getString("GroupName");
	   		BillType=rst.getString("BillType");
	   		float	CapturedDays1 = Float.parseFloat(CapturedDays);
	   		float	TotalDays1 = Float.parseFloat(TotalDays);
			float	SLAPer1 = Float.parseFloat(SLAPer);
			float	TotalBilledDays1 = Integer.parseInt(TotalBilledDays);
			 float ChargeperDay2 =Float.parseFloat(ChargeperDay);
			 float	NoofVehicles1 = Float.parseFloat(NoofVehicles);
			 float	Rate1 = Float.parseFloat(Rate);
			String SLAAttained1="";
			float PerOfBILL=(TotalBilledDays1*100)/TotalDays1;
	   		float PerOfCapturedDays=(CapturedDays1*100)/TotalDays1;
		//	//System.out.println("PerOfCapturedDays--->"+PerOfCapturedDays);
	//   		int i=1;
	   		int TotalNo=0,TotalYesStar=0;
	   		String Yes="Yes";
	   	//	String s=rst.getString("D"+i);
	   	//	//System.out.println("string s"+s);
	   		//	int	day11 = Integer.parseInt(day);
	   	//		int	day12 = Integer.parseInt(day1);
	   		//	//System.out.println("day"+day11);
		   	//	//System.out.println("day1"+day12);
	   			//int	Yes22 = Integer.parseInt(Yes);
	   			//double	Yes23 = Double.parseDouble("Yes");
	   			//int i=01;
	   		/*    String[] D = new String[31];
	   		 CapturedDays=0;
	   		 DisconnectedDays=0;
	   		for(i=day11;i<=day12;i++)
	   		{
	   			
	   			
	   			//System.out.println("(D[i]---->"+i);
	   			String str="D"+i;
	   			if(s.equals("Yes"))
	   			{
	   				CapturedDays= CapturedDays +1;
	   				//System.out.println("CapturedDays-->"+CapturedDays);
	   			}else
	   			{
	   				CapturedDays=0;
	   			}
	   			 if(s.equals("Yes*"))
	   			{
	   				DisconnectedDays= DisconnectedDays+1;
	   				//System.out.println("DisconnectedDays"+DisconnectedDays);
	   			}else
	   			{
	   				DisconnectedDays=0;
	   			}
	   			 if(s.equals("Yes*"))
	   			{
	   				TotalNo=TotalNo+1;
	   				//System.out.println("TotalNo"+TotalNo);
	   			}else
	   			{
	   				
	   			}
	  
	   		}
	   	int TotalBilledDays=CapturedDays+DisconnectedDays;*/
	   		float SLADays=0.0f,SLADayPerveh=0.0f;
	   	
	   		Customer1=rst.getString("Customer");
	   		if(BillType.equals("Combined"))
	   		{	
	   			if(SLAPer.compareTo("0")==0)	
	   			{
	   				SLAAttained1="NO SLA";
	   				BilledAmt1=(Rate1 * NoofVehicles1);
	   			}
	   			else
	   			{
	   				SLADays = (TotalDays1 / 100) * SLAPer1;
   			//	//System.out.println("SLADays"+SLADays);
		   			if(TotalBilledDays1 >= SLADays)
		   			{
		   				SLAAttained1 = "Yes";
		   			    BilledAmt1 = TotalDays1 * ChargeperDay2;
		   				
		   			}
		   			else
		   			{
		   	      		SLAAttained1 = "No";
		   	        	BilledAmt1 =((TotalDays1 - (SLADays - TotalBilledDays1)) * ChargeperDay2);
		   			}
	   			}
	   		}
	   		else
	   		{
	   			
	   			////System.out.println("Sla per from else"+SLAPer1);
	   			////System.out.println("monthdays from else"+monthdays);
	   			SLADayPerveh = ((monthdays / 100) * SLAPer1);
	   		//	//System.out.println("now in SLADayPerveh from else --->"+SLADayPerveh);
	   			String sql4="Select count(t_billingdetails.vehid) as NoofVehicles2  from  t_fv_erp_relation ,t_billingdetails where month1='"+fromdate+"'  and t_billingdetails.vehid= t_fv_erp_relation.vehid  and ERPCode='"+CustomerCode+"' and groupname='"+GroupName+"' and TotalYesStar+TotalYes >='"+SLADayPerveh+"'";
	   	//	System.out.println("sql4---->"+sql4);
	   			ResultSet rst2=st7.executeQuery(sql4);
	   			if(rst2.next())
	   			{
	   				String NoofVehicles2=rst2.getString("NoofVehicles2");
	   				int NoofVehicles3=Integer.parseInt(NoofVehicles2);
	   				SLAAttained1 = NoofVehicles2+ "veh billed";
	   				BilledAmt1 = NoofVehicles3*Rate1;
	   			//	//System.out.println("BilledAmt1 from else --->"+BilledAmt1);
	   			}
	   		}
	   	
			   String sum="select count(*) as noOfVehicleAdded from db_gps.t_billingdetails where month1='"+fromdate+"' and Transporter='"+transporter+"' and VehAddedThisMonth NOT LIKE ('No')";
		  // 		System.out.println("Sum --> "+sum);
			   ResultSet rssum=st6.executeQuery(sum);
		   		if(rssum.next()){
		   			noOfVehicleAdded=rssum.getString("noOfVehicleAdded");
		   			//System.out.println("noOfVehicleAdded--->"+noOfVehicleAdded);
		   		}
		   	String noOfVehicleRemoved="";
		   	 String removed="select count(*) as noOfVehicleRemoved from db_gps.t_billingdetails where month1='"+fromdate+"' and Transporter='"+transporter+"' and vehRemovedThisMonth NOT LIKE ('No')";
		   	//	System.out.println("Removed -- >"+removed);
			   ResultSet rsremoved=st5.executeQuery(removed);
		   		if(rsremoved.next()){
		   			noOfVehicleRemoved=rsremoved.getString("noOfVehicleRemoved");
		   			//System.out.println("noOfVehicleRemoved--->"+noOfVehicleRemoved);
		   		}
	   		%>
<tr>
					<td align="right"><%=j%></td>
					<%
					transporter=transporter.replace("&","..."); 
					%>
					<td align="left">
					<a href="SLAForTransporter.jsp?transporter=<%=transporter%>&date=<%=fromdate%>&SLAPer=<%=SLAPer%>&BillType=<%=BillType%>&monthdays=<%=monthdays%>&CustomerCode=<%=CustomerCode%>&GroupName=<%=GroupName %>"><%=Customer1%>
					</a></td>
			    	<td align="left"><%=GroupName%></td>
					<td align="right"><%=SLAPer%></td>
			    	<td align="right"><%=NoofVehicles%></td>
					<td align="right"><%=noOfVehicleAdded%></td>
					<td align="right"><%=VehcileRemoved%></td>
					<td align="right"><%=CapturedDays%></td>
					<td align="right"><%=nf.format(PerOfCapturedDays)%></td>
					<td align="right"><%=DisconnectedDays%></td>
					<td align="right"><%=Maintenance%></td>
					<td align="right"><%=NotCaptured%></td>
					<td align="right"><%=TotalDays%></td>
					<td align="right"><%=nf1.format(PerOfBILL)%></td>
					<td align="right"><%=TotalBilledDays%></td>
					
					<td align="left"><%=BillType%></td>
					<td align="left"><%=SLAAttained1%></td>
					
			</tr>
			
   		
	   		<%
	   		
	   		j++;			 	
	   	}

	   
	  
		}
		
		 %>
		   <tfoot>


	<tr>
								<th>Sr.No</th>
								<th align="center">Customer</th>
								<th align="center">Group Name</th>
								<th align="center">SLA Per</th>
								<th align="center">No of Vehicles</th>
								<th align="center">Vehicle Added</th>
								<th align="center">Vehicle Removed</th>
								<th align="center">Captured Days</th>
								
								<th align="center">% of Captured Days</th>
								<th align="center">Disconnected  Days</th>
								<th align="center">Maintenance Days</th>
								
								<th align="center">Not Captured</th>
								
								<th align="center">Total days</th>
								<th align="center">% of Billed Days</th>
								<th align="center">Total Billed Days </th>
								<th align="center">Bill Type</th>
								<th align="center">SLA Attained</th>
								
								</tr>

	</tfoot>
	</tbody>				   		
		</table>
		   <% 	
	   	}
catch(Exception e)
{
	//System.out.println(""+e);
	e.printStackTrace();
}

}
%>

			
 
</body>
</html>
					



