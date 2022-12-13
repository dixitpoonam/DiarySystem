<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="org.apache.commons.beanutils.converters.IntegerArrayConverter"%>
<%@ page contentType="text/html; charset=iso-8859-1" language="java"
	import="java.sql.*" import=" java.text.*" import=" java.util.*"
	errorPage=""%>
<%@ page import="java.util.Date"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ include file="header.jsp"%>

<%@page import="java.sql.ResultSet"%>

 <jsp:useBean id="date" class="java.util.Date" />
<html>
<head>

<title>Seven Day Diary System</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript"
	src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>


<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- Export Options Links of DataTables -->

<link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.5.1/css/buttons.dataTables.min.css ">
<script type="text/javascript" src="datatablejs/bootstrap.js"></script>
<script src=" https://cdn.datatables.net/buttons/1.5.1/js/buttons.flash.min.js "></script>
<script src=" https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js "></script>
<script src=" https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js "></script>
<script src=" https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js "></script>
<script src=" https://cdn.datatables.net/buttons/1.5.1/js/buttons.html5.min.js "></script>
<script src=" https://cdn.datatables.net/buttons/1.5.1/js/buttons.print.min.js "></script>
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
	                        title: 'Technician Report for '+ ' '+$("#month").val()+' '+$("#year").val(),
	                    },
	                    {
	                        extend: 'pdf',
	                        orientation: 'landscape',
	                        pageSize: 'LEGAL',
	                        title: 'Technician Report for '+ ' '+$("#month").val()+' '+$("#year").val(),
	                        
	                       
	                     },
	                    {
	                        extend: 'csv',
	                        title: 'Technician Report for '+ ' '+$("#month").val()+' '+$("#year").val(),
	                        
	                    },
	                    {
	                        extend: 'print',
	                        title: 'Technician Report for '+ ' '+$("#month").val()+' '+$("#year").val(),
	                       
	                    },
	                    {
	                        extend: 'copy',
	                        title: 'Technician Report for '+ ' '+$("#month").val()+' '+$("#year").val(),
	                        
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
<script type="text/javascript">
function fun()
{
	var m=document.getElementById("month").value.trim();
	//alert(m);
	var s=document.getElementById("year").value.trim();
	//alert(s);
	
	if(m=="Select" || m==null || m==""  || m=="null")
	{
	alert("please select month!");
	return false;
	}
	
	 if(s=="Select" || s==null || s==""  || s=="null")
	{
	alert("please select year!");
	return false;
	}
	
}
</script>
<script type="text/javascript">
function chkbx(element,i){
	//var chklength=document.getElementsByName("chkbx"+i);
	if(element.checked)
	{
		document.getElementById("chkbx2"+i).value='true';
	}
	else
	{
		document.getElementById("chkbx2"+i).value='false';
	}
}
</script>
<script type="text/javascript">
function getcheckedone(i){

	if(i>0)

	{
	//alert("i is-->>" + i);
	var chkSelect = false;
	for(var j=1;j<=i;j++)
	{
	if(document.getElementById("chkbx2"+j).value == "true")
	{
	chkSelect = true;
	}
	}
	if(chkSelect == false)
	{
	alert("Please select at least one record!!!");
	return false;
	}
	for(var j=1;j<=i;j++)
	{
	if(document.getElementById("chkbx2"+j).value == "true"){

	var e = document.getElementById("pin" + j).value.trim();

	// var VehicleRegNo = e.options[e.selectedIndex].text;
	// alert("PI Index-->>"+ e);

	 var Driver= document.getElementById("kra" + j).value.trim();
	 //  alert("KRA is:->>"+Driver);

	   var Comments= document.getElementById("comments" + j).value.trim();
	  // alert("Comment is:->>"+Comments);

	       //var regEx=/^[0-9]+$/;
	   //var regEx = /[-+]?(\\d+)|(\\d*\\.\\d+)/;
	  // [-+]?(\\d+)|(\\d*\\.\\d+)
			  var regEx=/(?:\d+(?:\.\d*)?|\.\d+)/;
	       bValid = e.match(regEx);
	       bValid1= Driver.match(regEx);
	       if(!bValid){
	         alert('Please enter Integer Value for PI Index! ex 9.89, 9.00, 9');
	         return false;        
	       }
	       
	       else  if(!bValid1){
	         alert('Please enter Integer Value for KRA ! ex 9.89, 9.00, 9');
	         return false;        
	       }
	       

	       else if(e==""||e=="-"){
	alert("Please enter PI Index!!");

	return false;
	}
	   
	     
	   else if(Driver==""||Driver=="-"){
	alert("Please enter KRA!!");
	return false;
	}
	   else if(Comments==""||Comments=="-"){
	alert("Please enter Comments!!");
	return false;
	}
	   

	}

	}

	}
	}


</script>


</head>


<body style="background-color: #FFFFFF;">
	<div id="wrapper" style="width: 100%">
		<div id="logo" style ="padding-left: 250px; width: min-content;">
			<h1> 
				<img src="images/Transworld.gif">
			</h1>
			<p>We care about your Vehicles</p>
		</div>
	
		<%@ include file="header1.jsp"%></div>

	<div id="gbox1" style="width: 100%; margin-top: 20px; margin-left: 0;">
		<div id="gbox-top1"></div>
		<div id="gbox-bg1">
  
   <div id="gbox-grd1"></div>

		</div>
		
		
		<%!
Connection conn;
ResultSet rs,rs1;
Statement st1,st2,st3,st4,st5;
String query1,query2,query3,query4,query5;

%>


<%


System.out.println("Creating Connection");
Class.forName(MM_dbConn_DRIVER);
conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
st1=conn.createStatement();
st2=conn.createStatement();
st3=conn.createStatement();
st4=conn.createStatement();
st5=conn.createStatement();


String selectedtechnician="";
//String entryby=session.getAttribute("username");
String entryby=session.getAttribute("username").toString();
System.out.println("entryby is:->"+ entryby);
selectedtechnician = request.getParameter("selectedtechnician");
String Date1 = request.getParameter("calender");
String Date2 = request.getParameter("calender1");
String month=request.getParameter("month");
System.out.println("month is:->"+ month);
String year=request.getParameter("year");
System.out.println("year is:->"+ year);
System.out.println("Technician Name : "+selectedtechnician);
System.out.println("Date1 : "+Date1);
System.out.println("Date2 : "+Date2);

if(Date1==null && Date2==null){
	Date1=Date2=new SimpleDateFormat("dd-MMM-yyyy").format(new java.util.Date());
}



String dt1 = new SimpleDateFormat("yyyy-MM-dd")
		.format(new SimpleDateFormat("dd-MMM-yyyy")
				.parse(Date1));
String dt2 = new SimpleDateFormat("yyyy-MM-dd")
		.format(new SimpleDateFormat("dd-MMM-yyyy")
				.parse(Date2));

System.out.println("Date1 : "+dt1);
System.out.println("Date2 : "+dt2);


%>

<form name="techattendrep" method="post"  style="padding-left:235px; width:750px;" >
	<table border="0" width="800px">
		<%--  <tr>
			<td> 
				<input type="radio" name="dataFilter" value="Monthly report" 
				<%=monthlyReportRadioChecked%> onClick="ShowHide(2);"> <font color="maroon"> Monthly Report (All Tech's)</font>			
			</td>
		</tr> --%>
		<tr id="sptechopts"  bgcolor=""> 
			<td>			
				
				
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					
					<font face="Arial" color="grey" size="2"><b>Month  </b></font>

		
		 <select class="element select medium" id="month" name="month" style="width: 70px; height: 29px; font-size: 12px;color: black; ">
         <option value="Select">Select</option>
<option value="01">JAN</option>
<option value="02">FEB</option>
<option value="03">MAR</option>
<option value="04">APR</option>
<option value="05">MAY</option>
<option value="06">JUN</option>
<option value="07">JLY</option>
<option value="08">AUG</option>
<option value="09">SEP</option>
<option value="10">OCT</option>
<option value="11">NOV</option>
<option value="12">DEC</option>





<%
 if(request.getParameter("month") != null){
	String mon=request.getParameter("month");
	System.out.println("Month :-"+mon);
	if(mon.equals("01"))
	{
		mon="JAN";
	}else if(mon.equals("02"))
	{
		mon="FEB";
	}else if(mon.equals("03"))
	{
		mon="MAR";
	}
	else if(mon.equals("04"))
	{
		mon="APR";
	}
	else if(mon.equals("05"))
	{
		mon="MAY";
	}
	else if(mon.equals("06"))
	{
		mon="JUN";
	}
	else if(mon.equals("07"))
	{
		mon="JUL";
	}
	else if(mon.equals("08"))
	{
		mon="AUG";
	}
	else if(mon.equals("09"))
	{
		mon="SEP";
	}
	else if(mon.equals("10"))
	{
		mon="OCT";
	}
	else if(mon.equals("11"))
	{
		mon="NOV";
	}
	
	
	else if(mon.equals("12"))
	{
		mon="DEC";
	}
	 
		
		if(request.getParameter("month")!=null)
		{

			%> <option value=<%=request.getParameter("month")%> selected><%=mon %></option><%
		
		}
}%>
</select>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;		      
		

<font face="Arial" color="grey" size="2"><b>Year  </b></font>

		 <select class="element select medium" id="year" name="year" style="width: 70px; height: 29px; font-size: 12px;color: black; ">
		 <option value="Select">Select</option>
         <%for(int k=2019;k<=2050;k++)
{
%>
<option value="<%=k %>"><%=k %></option>
<%} %>
<%
if(request.getParameter("year") != null){
		
		 %><option value=<%=request.getParameter("year")%> selected><%=request.getParameter("year") %></option><%
}
%>
           </select>
		     
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="submit" name="submit" id="submit" value="Submit" onclick="return fun()" style="background: #E6E6E6;  width:70px; height:26px;"/>				
						</td>
		</tr>

	</table>
</form>

<form name="custreportone" id="custreportone" method="post" action="TechIndexInsertAction.jsp">	
 
<%
int i=0;
month=request.getParameter("month");
year=request.getParameter("year");
if(request.getParameter("month")==null){
	System.out.println("Month is : "+ request.getParameter("month"));
	
}


else 
{
	 month=request.getParameter("month");
 year=request.getParameter("year");
	System.out.println("Month2 is :---->> "+ request.getParameter("month"));
	
	//String sqlAll="SELECT DISTINCT(TechName) ,ContractorId ,Location FROM db_CustomerComplaints.t_techlist where Available='Yes'";
String sqlAll="select a.ContractorId as ContractorID,b.ContractorName as ContractorName from db_GlobalERP.100000ContractorProfileMaster a,db_GlobalERP.100000ContractMasterNew b where a.ContractorId=b.ContractorId and a.Designation='Technician' and Status='Active'";

	  System.out.println("Query is : "+sqlAll);
	 
%>
		
		
		
		<table border="0" width="100%" bgcolor="" align="center">
			<tr>
				<td>
					<table border="0" width="100%">
						<tr>
							<td align="center"><font color="black" size="3">Technician  
									Index Report</font></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<br>
		
		 <table id="example" class="display" style="width: 100%">
				<thead>
					<tr>
					    <th align="center">Check</th>
						<th align="center">Sr No</th>
						<th align="center">Tech Name</th>
						<th align="center">Contractor id</th>
						<th align="center">Location</th>
						<th align="center">PI</th>
						<th align="center">KRA</th>
						<th align="center">Comments</th>
						
						</tr>
						</thead>
						
								
<%

rs = st1.executeQuery(sqlAll);

String Location="";
while(rs.next()){
	 String TechName=rs.getString("ContractorName");
	 System.out.println("Technician Name is :-"+ TechName);
	 String ContractorId=rs.getString("ContractorId");
	 System.out.println("ContractorId is :-"+ ContractorId);
	// String Present=rs.getString("Present");
	 //String Location=rs.getString("Location");
	 String PIIndex=" ";
			String KRAIndex=" ";
			String Comment=" ";
			i++; 

			String dateformated2=new SimpleDateFormat("MMM").format(new SimpleDateFormat("MM").parse(month));

			System.out.println("dateformated2 : "+dateformated2);
			
	 String sql_total="select * from db_CustomerComplaints.t_technicianindex where Month='"+dateformated2+"' and Year='"+year+"' and ContractorId='"+ContractorId+"' ";
		ResultSet rs2 = st2.executeQuery(sql_total);
		System.out.println("The query is ==>>"+sql_total);
		if(rs2.next()){
		PIIndex=rs2.getString("PIIndex");
			System.out.println("PIIndex is ==>>"+ PIIndex);
			KRAIndex=rs2.getString("KRAIndex");
			System.out.println("KRAIndex ==>>"+KRAIndex);
			Comment=rs2.getString("Comment");
			System.out.println("Comment is ==>>"+Comment);
			
			
		}
		else
		{
			PIIndex="-";
			System.out.println("PIIndex is ==>>"+ PIIndex);
		KRAIndex="-";
			System.out.println("KRAIndex ==>>"+KRAIndex);
	Comment="-";
			System.out.println("Comment is ==>>"+Comment);
			
			
		
		}
	 
	 String sqlAll1="SELECT Location,ContractorId from db_CustomerComplaints.t_techlist where ContractorId like '"+ContractorId+"' and Available='Yes'";


	  System.out.println("Query2 is : "+sqlAll1);
	  rs1 = st2.executeQuery(sqlAll1);
	  
	  
	  if(rs1.next()){
		  String ContractorId1=rs1.getString("ContractorId");
		  System.out.println("ContractorId1111 is : "+ ContractorId1);
			
		  if(Location==null||ContractorId1==null){
			  Location="-";
		  }
		  else{
		  Location=rs1.getString("Location");
		  System.out.println("Location is :-"+ Location);
		  
		  }
		  	  }
	  
	  else{
		  Location="-";
	  }
%>	
			<tr>
			
			<td width="5%" height="5%" style="width:1px; align:center; font-size: 12px;face:san-serif; color:black" >
			<input type="checkbox"  name="chkbx<%=i %>"   id="chkbx<%=i %>" onchange="chkbx(this,<%=i %>)"/>
 			<input type="hidden"  name="chkbx2<%=i %>"   id="chkbx2<%=i %>" value="false"/></td> 
 				
				<td style="text-align:right;">  <%=i%> </td>
				<td style="text-align:left; "><input type="hidden" name="tname<%=i %>" id="tname<%=i %>" value="<%=TechName%>"><%=TechName%> </td>
				<td style="text-align:right; "><input type="hidden" name="contid<%=i %>" id="contid<%=i %>" value="<%=ContractorId%>"><%=ContractorId%></td>
				<td style="text-align:left; "><input type="hidden" name="loc<%=i %>" id="loc<%=i %>" value="<%=Location%>"><%=Location%></td>
				<td style="text-align:right;"> 
	            <input type="text" id="pin<%=i %>" name="pin<%=i %>"  style="width:80px;  text-align:right; height:30px" value="<%=PIIndex %>">
       </td>
				<td style="text-align:right;">
				<input type="text" id="kra<%=i %>" name="kra<%=i %>"  style="width:80px;  text-align:right; height:30px" value="<%=KRAIndex %>">
       
				</td>
				<td style="text-align:right;">
				<input type="text"  id="comments<%=i %>" name="comments<%=i %>"  class="element textarea medium" style="width:80px;  text-align:left; height:30px" value="<%=Comment %>">
       
				</td>
								
			</tr>
			
<%
}  
 
		
%>
</tbody>
<tfoot>
<tr>
                        <th align="center">Check</th>
						<th align="center">Sr.No</th>
						<th align="center">Tech Name</th>
						<th align="center">Contractor id</th>
						<th align="center">Location</th>
						<th align="center">PI</th>
						<th align="center">KRA</th>
						<th align="center">Comments</th>
</tr>
</tfoot>

	</table>
 </div> 
<%


/* if( month.equals("Select")){  */
%>
<input type="hidden" style="width:160px;" name="entryby" id="entryby" value="<%=session.getAttribute("username") %>" readonly="readonly"/>
  <input type="hidden" name="count" value="<%=Integer.toString(i) %>"/>
  <input type="hidden" name="month1" id="month1" value="<%=month%>"/>
  <input type="hidden" name="year1" id="year1" value="<%=year %>"/>
  
<div align="center">

<button type="submit" id="planbtn" class="button button-block"  style="background: #E6E6E6; width:70px; height:26px" onclick="return getcheckedone(<%=Integer.toString(i)%>)"> Save </button>
         
         <!--   <button type="submit" id="planbtn" class="button button-block" onclick="return getchecked()">Create Schedule</button>
         -->   
             </div>  
             
             <%--  <%}else{ %>
             
 
             <%} %>  --%>
             <%} %>
</form>
</body>
<!-- code end here --->


  
  						
 					<div id="gbox-bot1"> </div>
  					</div>
 			
 <!--  <table border="1" width="100%" align="center">
<tr>< <td bgcolor="#98AFC7" class="copyright" width="100%">
<center>Copyright &copy; 2008 by Transworld Compressor Technologies Ltd. All Rights Reserved.</center>
</td></tr>
</table> -->
</body>
</html>
