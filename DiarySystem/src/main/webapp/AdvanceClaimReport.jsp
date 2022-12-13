<%@ page language="java" import="java.sql.*" import="java.util.*" import=" java.text.*" import="moreservlets.listeners.*" errorPage="" %>
<link href="css/ERP.css" rel="stylesheet" type="text/css"></link>
 <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style type="text/css">@import url(jscalendar-1.0/calendar-blue.css);</style>
<%@ page import = "java.io.FileNotFoundException"%>
<%@ page import = "java.io.FileOutputStream"%>
<%@ page import = " java.io.IOException"%>
<%@ page import="javax.activation.*" %>
<html> 
<head>
<style>

</style>

<%@ include file="header.jsp"%>

<jsp:useBean id="erp" class="com.erp.beans.ERP" scope="page"> 
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css">
<script type="text/javascript"  src="https://code.jquery.com/jquery-1.12.4.js"></script> 
<script type="text/javascript"  src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script> 


  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 <!--  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- Export Options Links of DataTables -->

<link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.5.1/css/buttons.dataTables.min.css">
<script src=" https://cdn.datatables.net/buttons/1.5.1/js/dataTables.buttons.min.js"></script> 
<script src=" https://cdn.datatables.net/buttons/1.5.1/js/buttons.flash.min.js"></script> 
<script src=" https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script src=" https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js"></script>
<script src=" https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js"></script>
<script src=" https://cdn.datatables.net/buttons/1.5.1/js/buttons.html5.min.js"></script>
<script src=" https://cdn.datatables.net/buttons/1.5.1/js/buttons.print.min.js "></script>








 
<script type="text/javascript">
 $(document).ready(function() {
	    $('#example').DataTable( {
	    	"pagingType": "full_numbers",
	    	
	        dom: 'Blfrtip',
	        
	        buttons: [
	        	
	        	{
	        		extend: 'collection',
	        		
	        		text: 'Export',
	        		buttons: [
	        			{
	                        extend: 'excel',
	                        title: 'Advance Report '+$("#data").val()+'-'+$("#data1").val(), 
	                    },
	                    {
	                        extend: 'pdf',
	                        orientation: 'landscape',
	                        pageSize: 'LEGAL',
	                        title: 'Advance Report '+$("#data").val()+'-'+$("#data1").val(), 
	                    },
	                    {
	                        extend: 'csv',
	                        title: 'Advance Report '+$("#data").val()+'-'+$("#data1").val(),
	                    },
	                    {
	                        extend: 'print',
	                        title: 'Advance Report '+$("#data").val()+'-'+$("#data1").val(),
	                    },
	                    {
	                        extend: 'copy',
	                        title: 'Advance Report '+$("#data").val()+'-'+$("#data1").val(),
	                    },
	                    
	            				/* 'copy', 'csv', 'excel', 'pdf', 'print' */
	            			]
	        	}
	        ],
	        lengthMenu: [[-1, 10, 25, 50, 100], ["All", 10, 25, 50, 100 ]],
	        
	        columns:[
	        	{"width":"4%"},
	        	{"width":"4%"},
	        	{"width":"7%"},
	        	{"width":"7%"},
	        	{"width":"7%"},
	        	{"width":"7%"},
	        	{"width":"5%"},
	        	{"width":"5%"}, 	
	        	{"width":"4%"}, 	
	        	{"width":"7%"},
	        	{"width":"7%"},
	        	{"width":"7%"},
	       		null    	
	        ] , 
	    
	    
	    
	    	
	    } );
	} );

</script>









 <script type="text/javascript">
 function chk()
 {

 	
 	
 	var chkf="";
 	var chkt="";
 	var objFromDate = document.getElementById("data").value;
 	
 	
 	var fdate=objFromDate.split("-");
 	if(fdate[1]=="Jan")
 	{
 		chkf="01";
 	}
 	if(fdate[1]=="Feb")
 	{
 		chkf="02";
 	}
 	if(fdate[1]=="Mar")
 	{
 		chkf="03";
 	}
 	if(fdate[1]=="Apr")
 	{
 		chkf="04";
 	}
 	if(fdate[1]=="May")
 	{
 		chkf="05";
 	}
 	if(fdate[1]=="Jun")
 	{
 		chkf="06";
 	}
 	if(fdate[1]=="Jul")
 	{
 		chkf="07";
 	}
 	if(fdate[1]=="Aug")
 	{
 		chkf="08";
 	}
 	if(fdate[1]=="Sep")
 	{
 		chkf="09";
 	}
 	if(fdate[1]=="Oct")
 	{
 		chkf="10";
 	}
 	if(fdate[1]=="Nov")
 	{
 		chkf="11";
 	}
 	if(fdate[1]=="Dec")
 	{
 		chkf="12";
 	}
 	var objFromDate1=""+fdate[2]+"-"+chkf+"-"+fdate[0]+"";
     var objToDate = document.getElementById("data1").value;
     var tdate=objToDate.split("-");
     if(tdate[1]=="Jan")
 	{
     	chkt="01";
 	}
 	if(tdate[1]=="Feb")
 	{
 		chkt="02";
 	}
 	if(tdate[1]=="Mar")
 	{
 		chkt="03";
 	}
 	if(tdate[1]=="Apr")
 	{
 		chkt="04";
 	}
 	if(tdate[1]=="May")
 	{
 		chkt="05";
 	}
 	if(tdate[1]=="Jun")
 	{
 		chkt="06";
 	}
 	if(tdate[1]=="Jul")
 	{
 		chkt="07";
 	}
 	if(tdate[1]=="Aug")
 	{
 		chkt="08";
 	}
 	if(tdate[1]=="Sep")
 	{
 		chkt="09";
 	}
 	if(tdate[1]=="Oct")
 	{
 		chkt="10";
 	}
 	if(tdate[1]=="Nov")
 	{
 		chkt="11";
 	}
 	if(tdate[1]=="Dec")
 	{
 		chkt="12";
 	}
     var objToDate1=""+tdate[2]+"-"+chkt+"-"+tdate[0]+"";
    // alert("Entry from date > "+objFromDate1+" Todate > "+objToDate1);
      
     var date1 = new Date(objFromDate1);
     var date2 = new Date(objToDate1);
     
     //alert("from > "+date1+" Todate > "+date2);
     
     var date3 = new Date();
     var date4 = date3.getMonth() + "-" + date3.getDay() + "-" + date3.getYear();
     var currentDate = new Date(date4);
      
         if(date1 > date2)
         {
             alert("From Date Should be Less Than To Date");
             return false; 
         }
//          else if(date1 > currentDate)
//          {
//              alert("From Date should be less than current date");
//              return false; 
//          }
//          else if(date2 > currentDate) 
//          {
//              alert("To Date should be less than current date");
//              return false; 
//          }

         return true;
 	
 }
 
</script>





</head>


<%!
Connection con1;


%>
<%
Class.forName(DB_Driver);
con1 = DriverManager.getConnection(DB_NAME,DB_USERNAME,DB_PASSWORD);
Statement st1=con1.createStatement();
%>

<%
String selected=request.getParameter("status");

System.out.println("--------"+selected);

String datex1, datex2, data1, data2;
String ddx = request.getQueryString();

if (ddx == null) {
	
	System.out.println(" In First If  " );
	
	datex1 = datex2 = new SimpleDateFormat("dd-MMM-yyyy")
			.format(new java.util.Date());
	
		
	data1 = data2 = new SimpleDateFormat("yyyy-MM-dd")
			.format(new java.util.Date());

	Calendar c = Calendar.getInstance();   // this takes current date
    c.set(Calendar.DAY_OF_MONTH, 1);
    System.out.println(" current date "+new SimpleDateFormat("dd-MMM-yyyy").format(c.getTime())); 
    datex1=new SimpleDateFormat("dd-MMM-yyyy").format(c.getTime());


} else {
	
	System.out.println(" In First Else  " );
	
	data1 = new SimpleDateFormat("yyyy-MM-dd")
			.format(new SimpleDateFormat("dd-MMM-yyyy")
					.parse(request.getParameter("data")));
	data2 = new SimpleDateFormat("yyyy-MM-dd")
			.format(new SimpleDateFormat("dd-MMM-yyyy")
					.parse(request.getParameter("data1")));
	
	
	

	datex1 = request.getParameter("data");
	datex2 = request.getParameter("data1");
	
}

String Bt=request.getParameter("button");
System.out.println(" Button :- " +Bt);

if(Bt==null || Bt==" " || Bt=="")
{
	datex1 = datex2 = new SimpleDateFormat("dd-MMM-yyyy")
	.format(new java.util.Date());
data1 = data2 = new SimpleDateFormat("yyyy-MM-dd")
	.format(new java.util.Date());

Calendar c = Calendar.getInstance();   // this takes current date
c.set(Calendar.DAY_OF_MONTH, 1);
System.out.println(" current date "+new SimpleDateFormat("dd-MMM-yyyy").format(c.getTime())); 
datex1=new SimpleDateFormat("dd-MMM-yyyy").format(c.getTime());
	
}
else
{
	data1 = new SimpleDateFormat("yyyy-MM-dd")
	.format(new SimpleDateFormat("dd-MMM-yyyy")
			.parse(request.getParameter("data")));
data2 = new SimpleDateFormat("yyyy-MM-dd")
	.format(new SimpleDateFormat("dd-MMM-yyyy")
			.parse(request.getParameter("data1")));




datex1 = request.getParameter("data");
datex2 = request.getParameter("data1");
}

System.out.println(" datex1 "+datex1+" datex2 "+datex2);


String dt = new SimpleDateFormat("yyyy-MM-dd")
.format(new SimpleDateFormat("dd-MMM-yyyy")
.parse(datex1));

String dt1 = new SimpleDateFormat("yyyy-MM-dd")
.format(new SimpleDateFormat("dd-MMM-yyyy")
.parse(datex2));

System.out.println(" dt :-  "+dt+" dt1 :-  "+dt1);

%>





<script type="text/javascript">

function result1(v,s)
{
var txt="Do you want to"+v;
var id=s;


if(v=="Reject")
{
	var c=prompt("Enter Rejection Reason");

	if(c.length>0)
		{
		location.assign("AdvanceMoneyAction.jsp?id="+id+"&Action="+v+"&Reason="+c);
	
		}
	else
		{
	alert("Please Enter reason");
		}
}
}

function result(v) {
    var txt="Do yo want to "+v;
   	  
 
    
    if (confirm(txt)) {
    	
    	return true;
       
    }        
 else {
       
        return false;
    }
}
</script>








<body onload="resetAll();">
<form name="custreport" id="custreport" method="post">
<div class="form" align="center" style="font-size: 13px;">
<br></br><br>
<font face="san-serif" color="black" size="4"><b>Advance Report</b></font><br></br>
</div>

<div class="form" style="margin-left: 24%;">
	<table border="0" width=800 align="center">
		
	
	
		<tr align="left">
		
		
		<td align="left"><font face="Arial" color="black" size="2"><b>Status
		
		</b></font>&nbsp;&nbsp;
							<select class="element select medium"  id="Status" name="status"  style="width: 125px; font-size: 12px; color:black;Arial; height: 27px;" > 								
								<%
									if(selected==null)
									{
									%>
									<option value="All" >All</option>
									<%
					            	String query1 = "select distinct(Status) from db_GlobalERP."+session.getAttribute("CompanyMasterID").toString()+"AdvanceMoneyMaster order by Status";
									System.out.println("The query is :"+query1);
					             	ResultSet rs1 = st1.executeQuery(query1);
					             	while(rs1.next())
					              	{
									%>
									<option value="<%=rs1.getString("Status") %>" ><%=rs1.getString("Status")%></option>
									<%} 
									}else{
										%>
										<option value="All" >All</option><%
										String query1 = "select distinct(Status) from db_GlobalERP."+session.getAttribute("CompanyMasterID").toString()+"AdvanceMoneyMaster order by Status";
										System.out.println("The query is :"+query1);
						             	ResultSet rs1 = st1.executeQuery(query1);
						             	while(rs1.next())
						              	{
										
											if(rs1.getString("Status").equals(selected))
											{
												%><option value="<%=rs1.getString("Status") %>" selected><%=rs1.getString("Status")%></option><%
											}else{
												%><option value="<%=rs1.getString("Status") %>" ><%=rs1.getString("Status")%></option><%
											}
									    } 
									}
									%>
							</select>
					 &nbsp;&nbsp;
		</td>
		
			<td align="left"><font face="Arial" color="black" size="2"><b>From
			 </b></font>&nbsp;&nbsp;
			 <input type="text" id="data" height="10px" name="data" value="<%=datex1%>" size="13px" readonly  class="element text medium" style="width: 125px; font-size: 12px; height: 27px; color:black"  /> <script
				type="text/javascript">
			  Calendar.setup(
			    {
			      inputField  : "data",         // ID of the input field
			      ifFormat    : "%d-%b-%Y",     // the date format
			      button      : "data"       // ID of the button
			    }
			  );
			</script></td>
			<td></td>
			<td></td>
			<td></td>

			<td></td>
			<td></td>
			<td></td>
			
			<td></td>
			<td></td>
			<td></td>

			<td></td>
			<td></td>
			<td></td>
						
			<td align="left"><font face="Arial" color="black" size="2"><b>To
			 </b></font>&nbsp;&nbsp; <input type="text" id="data1" name="data1" value="<%=datex2%>" size="13px" readonly   class="element text medium" style="width: 125px;font-size: 12px; height: 27px; color:black"  /> 
			<script	type="text/javascript">
			  Calendar.setup(
			    {
			      inputField  : "data1",         // ID of the input field
			      ifFormat    : "%d-%b-%Y",    // the date format
			      button      : "data1"       // ID of the button
			    }
			  );
			</script></td>
			
			<td></td>
			<td></td>
			<td></td>

			<td></td>
			<td></td>
			<td></td>
			
			<td></td>
			<td></td>
			<td></td>

			<td></td>
			<td></td>
			<td></td>
			
						
			<td style="font-size: 11px; face:san-serif; color:black" >&nbsp;&nbsp;<input type="submit" name="button" value="Submit" onclick="return chk()"></td>
			
			
			
				
	
		<!-- </form> -->
	</table>
	</div>
	
	<div>
	<table width ="100%" border="0">
	
	
	     
	<tr>
	<td>
		<font size="2" face="Arial">
		<a href="AdvanceMoneyForm.jsp" style="font-weight: bold; color: blue; ">Add New</a>
			
			</font>
			</td>
		
		</tr>
		</table>
	</div>
	
<br></br>



<%


%>

<div class="t1" style="width:100%">
<!-- <table id="example"  class="display"  a style="width:100%"  cellspacing="0" border="1"> -->

<table id="example"  class="display"  a style="width:100%"  cellspacing="0" border="1">  

<thead>


<tr>

<th style="font-size:12px ; background: #1582AB;  color:white;    face:san-serif;">SrNo</th>
<th style="font-size:12px ; background: #1582AB;  color:white;    face:san-serif;">ClaimID</th>
<th style="font-size: 12px ;background: #1582AB;  color:white; face:san-serif;">User</th>

<th style="font-size:12px ; background: #1582AB;  color:white;    face:san-serif;">Department</th>
<th style="font-size: 12px ; background: #1582AB;  color:white; face:san-serif;">Category</th>
<th style="font-size: 12px ;background: #1582AB;  color:white; face:san-serif;">Requested Amount</th>
<th style="font-size: 12px ;background: #1582AB;  color:white; face:san-serif;">Approved Amount</th>
<th style="font-size: 12px ;background: #1582AB;  color:white; face:san-serif;">CustomerName</th>
<th style="font-size: 12px ;background: #1582AB;  color:white; face:san-serif;">Status</th>

<th style="font-size:12px ; background: #1582AB;  color:white;    face:san-serif;">EntryDate</th>
<th style="font-size: 12px ;background: #1582AB;  color:white; face:san-serif;">ApprovedBy</th>
 <!--  <th style="font-size: 12px ;background: #1582AB;  color:white; face:san-serif;">RejectedBy</th>-->
<th style="font-size: 12px ;background: #1582AB;  color:white; face:san-serif;">RejectedReason </th> 



<%
String role=session.getAttribute("role").toString();
//role="HOD";

if(role.equals("HOD"))
{
	%>
	<th style="font-size: 12px ;background: #1582AB;  color:white; face:san-serif;"> Action</th>
	
	<% 
}
else
{
	%>
	<th style="font-size: 12px ;background: #1582AB;  color:white; face:san-serif;"> Action</th>
	<% 
}

%>


</tr>
</thead>
<tbody>


<% 




ResultSet rs=null;
Statement stmt=null;
stmt=con1.createStatement();



dt=dt+" "+"00:00:00";
dt1=dt1+" "+"23:59:00";
System.out.println(dt);
System.out.println(dt1);

String name=session.getAttribute("EmpName").toString();//


//String dept=session.getAttribute("department").toString();
//System.out.println("---------->"+dept);


System.out.println("Welcome :"+name);
String query="";
if(selected!=null)
{
	if(selected.equals("All"))
	{
 		query="select * from db_GlobalERP."+session.getAttribute("CompanyMasterID").toString()+"AdvanceMoneyMaster where EntryDate >='"+dt+"' And EntryDate<='"+dt1+"' and EntryBy in (select distinct(EmpName) from db_GlobalERP.UserMaster where companymasterid="+session.getAttribute("CompanyMasterID").toString()+" and ActiveStatus='Yes' and (HODReport='"+name+"' or EmpName='"+name+"') )";// or behalfof in (select distinct(EmpName) from db_GlobalERP.UserMaster where companymasterid="+session.getAttribute("CompanyMasterID").toString()+" and ActiveStatus='Yes' and (HODReport='"+name+"' or EmpName='"+name+"'))";
	}
	else
	{
		query="select * from db_GlobalERP."+session.getAttribute("CompanyMasterID").toString()+"AdvanceMoneyMaster where EntryDate >='"+dt+"' And EntryDate<='"+dt1+"' and Status='"+selected+"' And EntryBy in (select distinct(EmpName) from db_GlobalERP.UserMaster where companymasterid="+session.getAttribute("CompanyMasterID").toString()+" and ActiveStatus='Yes' and (HODReport='"+name+"' or EmpName='"+name+"') )";// or behalfof in (select distinct(EmpName) from db_GlobalERP.UserMaster where companymasterid="+session.getAttribute("CompanyMasterID").toString()+" and ActiveStatus='Yes' and (HODReport='"+name+"' or EmpName='"+name+"')) and Status='"+selected+"'";
	}
}
else
{
	 query="select * from db_GlobalERP."+session.getAttribute("CompanyMasterID").toString()+"AdvanceMoneyMaster where EntryDate >='"+dt+"' And EntryDate<='"+dt1+"' and EntryBy in (select distinct(EmpName) from db_GlobalERP.UserMaster where companymasterid="+session.getAttribute("CompanyMasterID").toString()+" and ActiveStatus='Yes' and (HODReport='"+name+"' or EmpName='"+name+"') )";// or behalfof in (select distinct(EmpName) from db_GlobalERP.UserMaster where companymasterid="+session.getAttribute("CompanyMasterID").toString()+" and ActiveStatus='Yes' and (HODReport='"+name+"' or EmpName='"+name+"'))";
}
System.out.println("Query :- "+query);
rs=stmt.executeQuery(query);
/* if((selected!=null)&&(role.equals("HOD")))
{
	System.out.println("TRUE---------in first If");
	
	if(selected.equals("All"))
	{
		String query="Select * from db_GlobalERP."+session.getAttribute("CompanyMasterID").toString()+"AdvanceClaimMaster Where EntryDate >='"+dt+"' And EntryDate<='"+dt1+"'  ";// And Dept='"+dept+"'";// And EntryBy='"+name+"'";
		 rs=stmt.executeQuery(query);
	}
	else
	{
	String query="Select * from db_GlobalERP."+session.getAttribute("CompanyMasterID").toString()+"AdvanceClaimMaster Where EntryDate >='"+dt+"' And EntryDate<='"+dt1+"' AND Status='"+selected+"'";// And Dept='"+dept+"'";//And EntryBy='"+name+"'";
    rs=stmt.executeQuery(query);
	}
}

else if((!role.equals("HOD") && (selected!=null)))
{
	if(selected.equals("All"))
	{
		String query="Select * from db_GlobalERP."+session.getAttribute("CompanyMasterID").toString()+"AdvanceClaimMaster Where EntryDate >='"+dt+"' And EntryDate<='"+dt1+"' And EntryBy='"+name+"'";
		
		//String query1="select * from db_GlobalERP.100000AdvanceClaimMaster where EntryBy in (select distinct(EmpName) from db_GlobalERP.UserMaster where companymasterid=100000 and ActiveStatus='Yes' and (HODReport='"+name+"' or EmpName='"+name+"')) or behalfof in (select distinct(EmpName) from db_GlobalERP.UserMaster where companymasterid=100000 and ActiveStatus='Yes' and (HODReport='"+name+"' or EmpName='"+name+"'))";
		
		
		rs=stmt.executeQuery(query);
	}
	else
	{
	String query="Select * from db_GlobalERP."+session.getAttribute("CompanyMasterID").toString()+"AdvanceClaimMaster Where EntryDate >='"+dt+"' And EntryDate<='"+dt1+"' AND Status='"+selected+"' And EntryBy='"+name+"'";
	 rs=stmt.executeQuery(query);
	}

}


else 
{
	if(role.equals("HOD"))
	{	
	System.out.println("TRUE------------------");
	String query="Select * from db_GlobalERP."+session.getAttribute("CompanyMasterID").toString()+"AdvanceClaimMaster Where EntryDate >='"+dt+"' And EntryDate<='"+dt1+"'";// And Dept='"+dept+"'";//And EntryBy='"+name+"'";
	rs=stmt.executeQuery(query);
	}
	else
	{
		String query="Select * from db_GlobalERP."+session.getAttribute("CompanyMasterID").toString()+"AdvanceClaimMaster Where EntryDate >='"+dt+"' And EntryDate<='"+dt1+"' And EntryBy='"+name+"'";
		rs=stmt.executeQuery(query);
	}

}
 */

 

String eName=session.getAttribute("EmpName").toString();
int i=1;

 while(rs.next())
 {
	 
	 String cname="";
	 
	 Date date1=rs.getDate("EntryDate");
	 Date date2=rs.getDate("UpdatedDate");
	
	 
	 double d=rs.getDouble("Amount");
	 double d1=rs.getDouble("ApprovedAmount");
			 
			 
	 
	String amount=new DecimalFormat("0.00").format(d);
	 
	String amount1=new DecimalFormat("0.00").format(d1);
	
	if(rs.getString("CustomerName").equals("-"))
	{
		cname="-";	
	}
	else
	{
		 cname=rs.getString("CustomerName");
		 
		 cname=cname.replace(",","<br>");
	}
	
	 
	
	%>
	<tr>
	
	<td style="font-size: 11px; face:san-serif; color:black" align="right"><%=i%></td>
	<td style="font-size: 12px; face:san-serif; color:black" align="right"><%=rs.getString("AdvanceID") %></td>
	
	<td style="font-size: 12px; face:san-serif; color:black" align="left"><%=rs.getString("EntryBy")%></td>
	
	
	
	
	<td style="font-size: 12px; face:san-serif; color:black" align="left"><%=rs.getString("Department")%></td>
	
	
	<% 
	
	if(rs.getString("Category").equals("Travel"))
	{
		%>
		
		<td style="font-size: 12px; face:san-serif; color:black" align="left">
		<a href="AdvanceTravelDetail.jsp?id=<%=rs.getInt("AdvanceId")%>"><%=rs.getString("Category") %></a>
		</td>
		
		<% 
	}
	else
	{
	%>
	<td style="font-size: 12px; face:san-serif; color:black" align="left"><%=rs.getString("Category")%></td>
	<% 
	}
	%>
	
	
	<td style="font-size: 12px; face:san-serif; color:black" align="right"><%=amount %></td>
	<td style="font-size: 12px; face:san-serif; color:black" align="right"><%=amount1 %></td>
	<td style="font-size: 12px; face:san-serif; color:black" align="left"><%=cname %></td>
	<td style="font-size: 12px; face:san-serif; color:black" align="left"><%=rs.getString("Status") %></td>
	<td style="font-size: 12px; face:san-serif; color:black" align="right"><%=new SimpleDateFormat("dd-MMM-yyyy").format(date1) %></td>
	
	<td style="font-size: 12px; face:san-serif; color:black" align="left"><%=rs.getString("ApprovedBy") %></td>
	<td style="font-size: 12px; face:san-serif; color:black" align="left"><%=rs.getString("RejectedReason") %></td>
<!--  	<td style="font-size: 12px; face:san-serif; color:black" align="left"><%=rs.getString("RejectedReason") %></td> -->
	
		
<%

String entry=rs.getString("EntryBy");
String Status1=rs.getString("Status");
if(role.equals("HOD"))
{
	
	
	
	if(Status1.equals("Pending") && (!eName.equalsIgnoreCase(entry)))
	{
		
		
	%>
	<td style="font-size: 11px; face:san-serif; color:black" align="right">
	
	<a data-toggle="modal" href="#myModal" onclick="return srk(<%=rs.getDouble("Amount")%>,<%=rs.getInt("AdvanceID")%>);" style="color:green;" >Approve</a>
	<%-- <a href="AdvanceApproveAction.jsp?id=<%=rs.getInt("AdvanceId")%>&Action=Approve"  onclick="return result('Approve')" target="_self" style="color:green">Approve</a> --%><br></br>
	<a href="#" onclick="result1('Reject',<%=rs.getInt("AdvanceID")%>)" style="color:red" >Reject</a><br>
	<% 
	
	
	%>
	
</td>
	<%
	}
	else if(Status1.equals("Pending")&&(eName.equalsIgnoreCase(entry)))
	{
		%><td style="font-size: 12px; face:san-serif; color:black" align="right">
		<a href="AdvanceMoneyAction.jsp?id=<%=rs.getInt("AdvanceID")%>&Action=Cancel">Cancel</a>
		</td>
		<% 
	}
	
	
	
	else 
	{
		%>
		<td></td>
		<%
	}
	
	
	
}
	else if(Status1.equals("Pending"))
	{
	%><td style="font-size: 12px; face:san-serif; color:black" align="right">
	<a href="AdvanceMoneyAction.jsp?id=<%=rs.getInt("AdvanceID")%>&Action=Cancel">Cancel</a>
	</td>
	<% 
	}
	else
		{
		%>
		<td></td>
		<% 
		}
%>

</tr>	
	
<% 	
	  i++;
}%>
</tbody>
</table>
</div>
</form>
<script type="text/javascript">

function srk(amount,id)
{
/* 	alert(amount);
	alert(id); */
	var amt12=amount;
	
	
	
	
	document.getElementById("aid").value = id;
	//document.getElementById("Ramount").value = amount;
	
	document.getElementById("Ramount").value = parseFloat(Math.round(amt12 * 100) / 100).toFixed(2);;
	
	
	return true;
}

</script>

<script>
function approve()
{

	var id=document.getElementById("aid").value;
	var Ramount=document.getElementById("Ramount").value;
	var Aamount=document.getElementById("Aamount").value;
	
	var com=document.getElementById("mycomments").value;

/* 	 alert(com);
	
	alert(id);
	alert(Ramount); */
	
	//alert("Approced :- "+Aamount);
	
	//alert("Requested :- "+Ramount);
	
	var invalid=/^\d+(\.\d+)?$/;
	if(Aamount=="0")
		{
		alert("Please Enter valid Amount");
		return false;
		}
	if(!invalid.test(Aamount))
		{
		alert("Please enter valid amount");
		return false;
		}
	
	
	if(Aamount > Ramount)
		{
		alert("Please Enter Approve Amount less the requested Amount");
		return false;
		
		} else{
			var action="Approve";	
			location.assign("AdvanceMoneyAction.jsp?id="+id+"&Action="+action+"&ApproveAmount="+Aamount+"&ApproveComments="+com);
		}
	
	
	
	
}


</script>


<script>
function valid()
{
	
	var Aamount=document.getElementById("Aamount").value;
	
	var invalid=/^\d+(\.\d+)?$/;
	if(Aamount=="0")
		{
		alert("Please Enter valid Amount");
	
		}
	if(!invalid.test(Aamount))
		{
		alert("Please enter valid amount");
		
		}
	
	
}

</script>



<div class="container">

  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Approve Action</h4>
        </div>
        <div class="modal-body">
        <div align="center">
        
        <div id="show" class="headerlay" style="background-color: #ffffff; margin-left: 4px;">
        
     
        
<div class="container-fluid">
 

 
 
   <div class="row">
   
   <div class="col-sm-6">
      AdvanceId:
    </div>
    
     <div class="col-sm-4">
      <input type="text" id="aid" name="aid" readonly="readonly" style="border: none;"></input><br></br>
    </div>
    
    <div class="col-sm-2">
    </div>
    <div class="col-sm-4">
    </div>
    
  </div>
  
  <br>
   <div class="row">
   
   <div class="col-sm-6">
     Requested Amount:
    </div>
    
     <div class="col-sm-4">
     <input type="text" id="Ramount" name="Ramount"  readonly="readonly" style="border: none;"></input>
    </div>
    
    <div class="col-sm-2">
    </div>
    <div class="col-sm-4">
    </div>
    
  </div>
  <br>
  
     <div class="row">
   
   <div class="col-sm-6">
      Approved Amount:
    </div>
    
     <div class="col-sm-4">
      <input type="text" id="Aamount" name="Aamount" onblur="valid();" required="required" ></input><br></br> 
    </div>
    
    <div class="col-sm-2">
    </div>
    <div class="col-sm-4">
    </div>
    
  </div>
  
  <br>
   <div class="row">
   
   <div class="col-sm-6">
        Comments:
    </div>
    
     <div class="col-sm-4">
     	<textarea id="mycomments" name="mycomments" rows="6" cols="20" required="required"></textarea><br></br>
    </div>
    
    <div class="col-sm-2">
    </div>
    <div class="col-sm-4">
    </div>
    
  </div>
  
  
 
 
 </div>
 </div>
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
     
   
         
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
          <button type="button" class="btn btn-default" data-dismiss="modal" onclick="return approve();">Submit</button>
          
        </div>
      </div>
      
    </div>
  </div>
  </div>
  
</div>














</jsp:useBean>
<%@ include file="footer_new.jsp"%>

</body>
</html>

