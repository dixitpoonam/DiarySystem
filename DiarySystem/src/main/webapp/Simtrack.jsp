   <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 4.01 Strict//EN""http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>

<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	

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
<script
	src=" https://cdn.datatables.net/buttons/1.5.1/js/buttons.flash.min.js "></script>
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
	                        title:'Multiple Search' + " " + $("#radio2").val(), 

							
	                    },
	                    {
	                        extend: 'pdf',
	                        orientation: 'landscape',
	                        pageSize: 'LEGAL',
	                        title:'Multiple Search' + " " + $("#radio2").val(),
	                        
	                       
	                     },
	                    {
	                        extend: 'csv',
	                        title:'Multiple Search' + " " + $("#radio2").val(),
	                       
	                    },
	                    {
	                        extend: 'print',
	                        title:'Multiple Search' + " " + $("#radio2").val(),
	                        
	                    },
	                    {
	                        extend: 'copy',
	                        title:'Multiple Search' + " " + $("#radio2").val(),
	                       
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




















<%@include file="header.jsp"%>

	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<title>Seven Day Diary System.</title>
	<link rel="stylesheet" href="style.css" type="text/css" charset="utf-8" />
	<link rel="stylesheet" href="css/css.css" type="text/css" charset="utf-8" />
	<script src="sorttable.js" type="text/javascript"></script>
	<script language="javascript">
		function validate()
		{
			
			var cmnt=document.multsrch.srchbx.value;
			if(cmnt.length <= 2)
			{
				alert("Please enter Unit Id ");
				return false;
			}
			var iChars = "!@#$%^&*()+=-[]\\\';./{}|\":<>?";
			for (var i = 0; i < cmnt.length; i++) 
			{
		  		if (iChars.indexOf(cmnt.charAt(i)) != -1) 
				{
				  	alert ("Special Characters are not allowed");
				  	return false;
		  		}		
		  	}

		}
		
		 function validate1()
		{
			//alert($("#radio2").val());
			// alert("in validate1");
			 document.getElementById("email1").style.display="none";
		var mob=document.getElementById("enteredValue").value.trim();
        if(mob==""){
        	//alert("hhhhh");
			document.getElementById("email1").style.display="";
		    return false;	
        }
			
			

		}
		
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
	<style>
		.popup {
		background-color: #98AFC7;
		position: absolute;
		visibility: hidden;
		}
	</style>
</head>



		<%@ include file="MenuNew.jsp"%>

	
<%!
Connection conn,conn1;
Statement st, st1, st2, st3;
String sql,sql1,sql2;
String today,res;
%>
<%try
{
	Class.forName(MM_dbConn_DRIVER);
	conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	st=conn.createStatement();
	st1=conn1.createStatement();
	st2=conn1.createStatement();
}
catch(Exception e)
{
	out.print("Exception-->"+e);
} %>
<%	
	final String MOBILE="mobile";
	final String SIM= "sim";
	final String DEACTIVATED="Deactivated";
	final String SUSPENDED="Suspended";
	String color="";
	String status="";
	String tdcolor="";
	String next="";
	 String enteredValueRequest=request.getParameter("enteredValue");
	 String enteredValue= (null == enteredValueRequest) ? "" :enteredValueRequest;
	 String dataFilterRequest=request.getParameter("dataFilter");
	 String dataFilter = (null == dataFilterRequest) ? MOBILE : dataFilterRequest;
	String mobileChecked = ""; 
	String simChecked = "";
	Class.forName(MM_dbConn_DRIVER);
	conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	st=conn.createStatement();
	
	System.out.println("enteredValueRequest!!!!!!!!!!!!!!!" + enteredValueRequest);
	System.out.println("dataFilterRequest!!!!!!!!!!!!!!!" + dataFilterRequest);
	enteredValueRequest= "." + enteredValueRequest;
	System.out.println("Revised---enteredValueRequest!!!!!!!!!!!!!!!" + enteredValueRequest);
	enteredValueRequest=	enteredValueRequest.trim();
	System.out.println("FINALLL--enteredValueRequest!!!!!!!!!!!!!!!" + enteredValueRequest);
	enteredValueRequest=	enteredValueRequest.substring(1);
	System.out.println("FINALLLY--enteredValueRequest!!!!!!!!!!!!!!!" + enteredValueRequest);
	String SIM_DETAILS_QUERY="";
	String remocespaces="";
	/* if(enteredValueRequest.equals(".") || enteredValueRequest==null || enteredValueRequest=="null" || enteredValueRequest.trim().equals(".") )
	{
		mobileChecked = "";
		simChecked = "";
		enteredValueRequest=enteredValueRequest.replace(',','|');//replaces all occurrences of 'a' to 'e' 
		System.out.println("enteredValueRequest  "+enteredValueRequest);

remocespaces=enteredValueRequest.replaceAll("\\s+","");
		System.out.println("remocespaces  "+remocespaces); 
 
		SIM_DETAILS_QUERY="";
		// SIM_DETAILS_QUERY ="SELECT Simno,mobno,Status,CASE WHEN DeactiveDate ='0000-00-00' THEN null ELSE DeactiveDate END as DeactiveDate,ActivationDate,AirtelMobno,AirtelIMSINO,Unitid,CASE WHEN DateOfPurchase ='0000-00-00' THEN null ELSE DateOfPurchase END as DateOfPurchase,Service_provider,CASE WHEN LastFTPDump ='0000-00-00' THEN null ELSE LastFTPDump END as LastFTPDump FROM db_gps.t_simmaster WHERE Mobno IS NULL ORDER BY DateOfPurchase DESC limit 1";

	}  */
	/* if(enteredValueRequest.equals("null") || enteredValueRequest==null || enteredValueRequest=="null" || enteredValueRequest.equals("") )
	{
		mobileChecked = "checked";
		simChecked = "";
		enteredValueRequest=enteredValueRequest.replace(',','|');//replaces all occurrences of 'a' to 'e' 
		System.out.println("enteredValueRequest  "+enteredValueRequest);

remocespaces=enteredValueRequest.replaceAll("\\s+","");
		System.out.println("remocespaces  "+remocespaces); 
 
		
		// SIM_DETAILS_QUERY ="SELECT Simno,mobno,Status,CASE WHEN DeactiveDate ='0000-00-00' THEN null ELSE DeactiveDate END as DeactiveDate,ActivationDate,AirtelMobno,AirtelIMSINO,Unitid,CASE WHEN DateOfPurchase ='0000-00-00' THEN null ELSE DateOfPurchase END as DateOfPurchase,Service_provider,CASE WHEN LastFTPDump ='0000-00-00' THEN null ELSE LastFTPDump END as LastFTPDump FROM db_gps.t_simmaster WHERE Mobno RLIKE ('"+remocespaces+"')ORDER BY DateOfPurchase DESC";

	}  */
	if(enteredValueRequest.equals(".") || enteredValueRequest==null || enteredValueRequest=="null" || enteredValueRequest.trim().equals(".") ||enteredValueRequest.equals(" ") ||enteredValueRequest=="")
	{
		
		SIM_DETAILS_QUERY="";
		// SIM_DETAILS_QUERY ="SELECT Simno,mobno,Status,CASE WHEN DeactiveDate ='0000-00-00' THEN null ELSE DeactiveDate END as DeactiveDate,ActivationDate,AirtelMobno,AirtelIMSINO,Unitid,CASE WHEN DateOfPurchase ='0000-00-00' THEN null ELSE DateOfPurchase END as DateOfPurchase,Service_provider,CASE WHEN LastFTPDump ='0000-00-00' THEN null ELSE LastFTPDump END as LastFTPDump FROM db_gps.t_simmaster WHERE Mobno IS NULL ORDER BY DateOfPurchase DESC limit 1";

	} 
		try
	{
			System.out.println("dataFilter issssss!!!!!!!!!!!!!!!" + dataFilter);
			
	if(MOBILE.equalsIgnoreCase(dataFilter)){
		
		mobileChecked = "checked";
		simChecked = "";
		%>
		<input type="hidden" name="radio2" id="radio2"  value="Mobile">  
		
		<% 
		if(!(enteredValueRequest.equals(""))){
		enteredValueRequest=enteredValueRequest.replace(',','|');//replaces all occurrences of 'a' to 'e'
		 if((enteredValueRequest.lastIndexOf("|"))==(enteredValueRequest.length()-1)){
			 enteredValueRequest=enteredValueRequest.substring(0,enteredValueRequest.length()-1);
		 };
		 System.out.println("multiple enteredValueRequest  "+enteredValueRequest);
		enteredValueRequest=enteredValueRequest.replaceAll("\\s+","");
		System.out.println("enteredValueRequest  "+enteredValueRequest);
		/* enteredValueRequest=enteredValueRequest.substring(0,enteredValueRequest.length()-1);
		System.out.println("enteredValueRequest  best "+enteredValueRequest);
 */
		remocespaces=enteredValueRequest.replaceAll("\\s+","");
		//remocespaces=remocespaces.substring(0,remocespaces.length()-1);
		
		System.out.println("remocespaces best "+remocespaces);

		}
		 SIM_DETAILS_QUERY ="SELECT Simno,mobno,Status,CASE WHEN DeactiveDate ='0000-00-00' THEN null ELSE DeactiveDate END as DeactiveDate,ActivationDate,AirtelMobno,AirtelIMSINO,Unitid,CASE WHEN DateOfPurchase ='0000-00-00' THEN null ELSE DateOfPurchase END as DateOfPurchase,Service_provider,CASE WHEN LastFTPDump ='0000-00-00' THEN null ELSE LastFTPDump END as LastFTPDump FROM db_gps.t_simmaster WHERE Mobno RLIKE ('"+remocespaces+"')ORDER BY DateOfPurchase DESC";

	} else if(SIM.equalsIgnoreCase(dataFilter)) {
		mobileChecked = "";
		simChecked = "checked";
		%>
		<input type="hidden" name="radio2" id="radio2"  value="Sim">  
		
		<% 
		enteredValueRequest=enteredValueRequest.replace(',','|');//replaces all occurrences of 'a' to 'e'
		if((enteredValueRequest.lastIndexOf("|"))==(enteredValueRequest.length()-1)){
			 enteredValueRequest=enteredValueRequest.substring(0,enteredValueRequest.length()-1);
		 };
		 System.out.println("multiple enteredValueRequest  "+enteredValueRequest);
		
		enteredValueRequest=enteredValueRequest.replaceAll("\\s+","");
		System.out.println("enteredValueRequest  "+enteredValueRequest);
		/* enteredValueRequest=enteredValueRequest.substring(0,enteredValueRequest.length()-1);
		System.out.println("enteredValueRequest  best "+enteredValueRequest);
 */
		remocespaces=enteredValueRequest.replaceAll("\\s+","");
		System.out.println("remocespaces  "+remocespaces);
		//remocespaces=remocespaces.substring(0,remocespaces.length()-1);
		//System.out.println("remocespaces best "+remocespaces);
		SIM_DETAILS_QUERY ="SELECT Simno,mobno,Status,CASE WHEN DeactiveDate ='0000-00-00' THEN null ELSE DeactiveDate END as DeactiveDate,ActivationDate,AirtelMobno,AirtelIMSINO,Unitid,CASE WHEN DateOfPurchase ='0000-00-00' THEN null ELSE DateOfPurchase END as DateOfPurchase,Service_provider,CASE WHEN LastFTPDump ='0000-00-00' THEN null ELSE LastFTPDump END as LastFTPDump FROM db_gps.t_simmaster WHERE ( Simno RLIKE '" +remocespaces+ "')ORDER BY DateOfPurchase DESC";

	}
	
	/* } */

	%>
	<br>
	<div style="padding-right: 100px;">
<font color="black"><B> Note:</B> Multiple entries has to be separated by comma only. </font><br></br>  
<font color="black"><B> Note:</B> Red Background indicates deactivated numbers </font>
</div>
<br>
<form name="multsrch" method="post" action="" onSubmit="return validate1();">
<table border="0" width="750px">
	<tr> 
 		<td align="center" style="padding-left: 400px;">
			<table border="0" width="400px" bgcolor="#E6E6E6" align="center">
				<tr><td align="center" colspan="2"> <font size="2" color="#2A0A12"> <B> Multiple Search</B> </font> </td></tr>	
				<tr bgcolor="#BDBDBD">
					<td> <font> Search </font> </td>
					<td>
						<input type="radio" name="dataFilter" id="dataFilter"  value="<%=MOBILE%>" <%=mobileChecked%>/><B>Mobile No.</B>
						<input type="radio" name="dataFilter" id="dataFilter"  value="<%=SIM%>" <%=simChecked%>/><B>Sim No.</B>	
					</td>
				</tr>
				<tr bgcolor="#BDBDBD">
					<td> <font> Enter</font> </td>
					<td><textarea  style="width:350px; "name="enteredValue" id="enteredValue" class="element textarea medium" onblur="return validate1();"  ><%=enteredValue%></textarea>
					<br>
					<label  id="email1" style="display: none;"><font face="Arial" size="2" color="red">Please Enter Mobile or Sim No.</font></label> 
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center"> <input type="submit" name="submit" value="Submit" class="formElement"  /> </td>
				</tr>
			</table>
		</td>
	</tr>
</table>
</form>
<br>
<br>
<%-- <table border="0" width="750px">
	<tr>
		<td align="right"> <a href="simtrackexcel.jsp?rad=<%=dataFilter%>&srchbx=<%=enteredValue%>"> <img src="images/excel.jpg" width="15px" height="15px" border="0"/> </a> </td>	
	</tr>
</table> --%>


<table id="example" class="display" style="width: 100%">
					<thead>
						<tr>
							<th>Sr.No</th>
							<th align="center">Sim</th>
							<th align="center">Mobile</th>
							<th align="center">Status </th>
							<th align="center">Deactive Date</th>
							<th align="center">Activation Date</th>
							<th align="center">AirtelIMSINO</th>
							<th align="center">Unit id</th>
							<th align="center">DateOfPurchase</th>
							<th align="center">Service_provider</th>
							<th align="center">LastFTPDump</th>
								</tr>
					</thead>

					<tbody>
					

	<%
	if(enteredValueRequest.equals(".") || enteredValueRequest==null || enteredValueRequest=="null" || enteredValueRequest.trim().equals(".") ||enteredValueRequest.equals(" ") ||enteredValueRequest=="")
	{
		
		SIM_DETAILS_QUERY="";
		// SIM_DETAILS_QUERY ="SELECT Simno,mobno,Status,CASE WHEN DeactiveDate ='0000-00-00' THEN null ELSE DeactiveDate END as DeactiveDate,ActivationDate,AirtelMobno,AirtelIMSINO,Unitid,CASE WHEN DateOfPurchase ='0000-00-00' THEN null ELSE DateOfPurchase END as DateOfPurchase,Service_provider,CASE WHEN LastFTPDump ='0000-00-00' THEN null ELSE LastFTPDump END as LastFTPDump FROM db_gps.t_simmaster WHERE Mobno IS NULL ORDER BY DateOfPurchase DESC limit 1";

	} 
	System.out.println("QQQQQ"+SIM_DETAILS_QUERY);
	int numberOfSim=0;int i=1;
	String sim="",mobno="",Status="",DeactiveDate="",ActivationDate="",AirtelMobno="",AirtelIMSINO="",Unitid="",DateOfPurchase="",Service_provider="",LastFTPDump="";
	ResultSet rslbl=st.executeQuery(SIM_DETAILS_QUERY);
	 while(rslbl.next())
	{
	 sim=rslbl.getString("Simno");
	System.out.println("sim  "+sim);
	
	mobno=rslbl.getString("mobno");
		System.out.println("mobno  "+mobno);
		
		Status=rslbl.getString("Status");
			System.out.println("Status  "+Status);
			
		DeactiveDate=rslbl.getString("DeactiveDate");
		
		if (rslbl.wasNull()) 
		{
			DeactiveDate = "-"; // set it to empty string as you desire.
		}	
				System.out.println("DeactiveDate  "+DeactiveDate);
				
				ActivationDate=rslbl.getString("ActivationDate");
					System.out.println("ActivationDate  "+ActivationDate);
					
					
					if (rslbl.wasNull())
					{
						ActivationDate = "-"; // set it to empty string as you desire.
					}
					
					AirtelMobno=rslbl.getString("AirtelMobno");
						System.out.println("AirtelMobno  "+AirtelMobno);
						
						AirtelIMSINO=rslbl.getString("AirtelIMSINO");
							System.out.println("AirtelIMSINO  "+AirtelIMSINO);
							
							
							Unitid=rslbl.getString("Unitid");
								System.out.println("sim  "+Unitid);
								
								
								DateOfPurchase=rslbl.getString("DateOfPurchase");
								if (rslbl.wasNull()) 
								{
									DateOfPurchase = "-"; // set it to empty string as you desire.
								}
									System.out.println("DateOfPurchase  "+DateOfPurchase);
	
									
									Service_provider=rslbl.getString("Service_provider");
									System.out.println("Service_provider  "+Service_provider);
	
									LastFTPDump=rslbl.getString("LastFTPDump");
									
									if (rslbl.wasNull())
									{
										LastFTPDump = "-"; // set it to empty string as you desire.
									}									
								
									
									System.out.println("LastFTPDump  "+LastFTPDump);
	
	 
	 
	
	
	 
    boolean show=false;
    String role="";
    role=session.getAttribute("Urole").toString();
    if(role.equals("admin"))
    {
    	show=true;
    }
    else
    {
    	show=false;
    }
    

		if(DEACTIVATED.equalsIgnoreCase(Status) || 	SUSPENDED.equalsIgnoreCase(Status))
		{
			color="red";
			status="Deactivated";
			tdcolor="red";
		} 
		else
		{
			color="black";
			status="Active";
			tdcolor="";
		} 
%>
	<tr >
			<td align="right"><%=i%></td>
			<td align="right"><%=sim%></td>
			
			<td align="right">
			<%if(role.equals("Manager"))
		    { %>
		   <a href="javascript:toggleDetails(<%=i%>,true);" title="Click Here"> <%=mobno%></a> 
			<%}else{ %>
			<%=mobno%> 
			<%} %>
			
			<%-- <a href="EditSimPlan.jsp?mobNo=<%=mobno%>" onclick="toggleDetails(<%=i%>,false);">Edit Sim Plan</a>
			<a href="javascript:toggleDetails(<%=i%>,true);">Close</a>
			 --%>								
				 	<%-- <div class="popup" id="popup<%=i%>"> 
						 <table border="0" >  
							<tr>
								<td>
									<a href="EditSimPlan.jsp?mobNo=<%=mobno%>" onclick="toggleDetails(<%=i%>,false);">Edit Sim Plan</a>
								</td>
							</tr>
							<tr>
								<td>
									<a href="javascript:toggleDetails(<%=i%>,false);">Close</a>
								</td>
							</tr>
							
							 </table>
							</div>   --%>
							</td>
							
				
			
			<td align="left"> <%=Status%></td>
						
			<!-- new SimpleDateFormat("dd/MM/yyyy").format(rst1.getDate("EntDate")) ActivationDate  DateOfPurchase-->
			
			<td align="center"><%=DeactiveDate%></td>
			<td align="center" > <%=ActivationDate%> </td>
			<td align="right"> <%=AirtelIMSINO%> </td>
			<td align="right"> <%=Unitid%></td>
		   <td align="center"> <%=DateOfPurchase%></td>
		   <td align="left"> <%=Service_provider%> </td>
		   <td align="left" ><%=LastFTPDump %></td>
 	</tr> 
 	
<%
i++; 


	}
	}

		catch(Exception e)
		{
			System.out.println("Exception ======>" + e);
		}
		finally
		{
			conn.close();
			conn1.close();

		}
		
%>
</tbody>

<tfoot>
<tr>

	                           <th>Sr.No</th>
							<th align="center">Sim</th>
							<th align="center">Mobile</th>
							<th align="center">Status </th>
							<th align="center">Deactive Date</th>
							<th align="center">Activation Date</th>
							<th align="center">AirtelIMSINO</th>
							<th align="center">Unit id</th>
							<th align="center">DateOfPurchase</th>
							<th align="center">Service_provider</th>
							<th align="center">LastFTPDump</th>

</tr>
</tfoot>


</table>
</div>
<!-- code end here --->

  <%@ include file="footer.jsp"%>


</body>
</html>

