<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 4.01 Strict//EN""http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="header.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ page contentType="text/html; charset=iso-8859-1" language="java"
	import="java.sql.*" import=" java.text.*" import=" java.util.*"
	errorPage=""%>
	
<title>Seven Day Diary System.</title>


<jsp:useBean id="date" class="java.util.Date" />

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
	                        title: 'ASC Detail Report'

							
	                    },
	                    {
	                        extend: 'pdf',
	                        orientation: 'landscape',
	                        pageSize: 'LEGAL',
	                        title: 'ASC Detail Report'
	                        
	                       
	                     },
	                    {
	                        extend: 'csv',
	                        title: 'ASC Detail Report'
	                       
	                    },
	                    {
	                        extend: 'print',
	                        title: 'ASC Detail Report'
	                        
	                    },
	                    {
	                        extend: 'copy',
	                        title: 'ASC Detail Report'
	                       
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
	            { "sType": "date-uk" },
	            { "sType": "date-uk" },
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


</head>




<%@ include file="MenuNew.jsp"%>
			<%!
Connection conn;


%>
			<%
System.out.println("in homepage");	
final String userName=session.getAttribute("username").toString();
System.out.println("in connection created");	
	final String userRole=session.getAttribute("userrole").toString();
	System.out.println("in connection created");	
	String transporterlist=session.getAttribute("TransporterList").toString();

	//final String us1=userName.toUpperCase();
	System.out.println("in connection created");	
	Class.forName(MM_dbConn_DRIVER);
	conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	Statement st=conn.createStatement();
	Statement st1=conn.createStatement();
	Statement st2=conn.createStatement();
	Statement stwar1=conn.createStatement();
	Statement stwar2=conn.createStatement();
	Statement stwar3=conn.createStatement();
	Statement stwar4=conn.createStatement();
	Statement stamc1=conn.createStatement();
	String sql4="",sqlamc1="";
	
	//String selectedvalue="";
	
	String Status=request.getParameter("status");
	
	System.out.println("in connection created");	
%>
<br>
			<table border="0" width="750px" bgcolor="" align="center">
				<tr>
					<td align="center"><font size="3">Annual Service
							Contract Report</font></td>
				</tr>

			</table>


			<br></br>

			<table id="example" class="display" style="width: 100%">
				<thead>
					<tr>
						<th>Sr.No</th>
						<th align="center">Vehicle</th>
						<th align="center">UnitId</th>
						<th align="center">Owner Name</th>
						<th align="center">Installed Date</th>
						<th align="center">Warranty Till</th>
						<th align="center">Warranty Status</th>

					</tr>
				</thead>

				<tbody>

					<%
	try
	{
		int i=1;
		//String Status=request.getParameter("status");
		/* transporterlist=transporterlist.substring(3,transporterlist.length()-1);
		transporterlist=transporterlist.replace(",","','");
		String sql="select Distinct(OwnerName) from db_gps.t_vehicledetails where Status='-' and OwnerName in ('"+transporterlist+"') order by OwnerName";

		ResultSet rs=st.executeQuery(sql);
		while(rs.next()){ */
		/* String sql2="select distinct(TypeValue) from db_gps.t_transporter where OperationalStatus = 'Active' order by typevalue"; */
		System.out.println("selected value >>>>>>>>"+Status);
		String sql2="select * from db_gps.t_vehicledetails where Status = '-' order by OwnerName,VehicleRegNumber";
		
		ResultSet rs2=st2.executeQuery(sql2);
		while(rs2.next())
		{

%>
											<%
	    			String VehicleCode=rs2.getString("VehicleCode");
					String VehicleRegNumber=rs2.getString("VehicleRegNumber");
					
					
					String unitid=rs2.getString("unitid");
					
					if(VehicleRegNumber==null || VehicleRegNumber.equals(null) || VehicleRegNumber == " " || VehicleRegNumber.equals(" ") ){
						VehicleRegNumber="-";
					}
					
					System.out.println("VehicleRegNumber " + VehicleRegNumber);
					
					String InstalledDate=rs2.getString("InstalledDate");
							 
					String OwnerName=rs2.getString("OwnerName"); 
					
					
					
					String sqlamc="select max(WarrantyTill) as WarrantyTill from db_gps.t_amchistory where VehCode = '"+VehicleCode+"' order by WarrantyTill desc limit 1";
					ResultSet rsamcc=stwar2.executeQuery(sqlamc);
					String Warranty="",warranty="";
					if(rsamcc.next())
					{
						
						
						Warranty=rsamcc.getString("WarrantyTill");
						
						if(!(null==rsamcc.getDate("WarrantyTill")))
						{
						try{	
							sqlamc1="select TO_DAYS('"+rsamcc.getDate("WarrantyTill")+"')-TO_DAYS(NOW()) as days";
							ResultSet rsamcc1=stamc1.executeQuery(sqlamc1);
							if(rsamcc1.next())
							{
								if(rsamcc1.getInt("days") > 0)
								{
									warranty="Yes";
								}
								else
								{
									warranty="No";
								}
							}
							}
							catch(Exception X)
							{
								warranty="-";
							}
						}
						else
						{
							sql4="select TO_DAYS(NOW())-TO_DAYS('"+rs2.getString("InstalledDate")+"') as days";
							ResultSet rst222=stwar3.executeQuery(sql4);
							if(rst222.next())
							{
								if(rst222.getInt("days") > 365)
									{
										warranty="NO";
									}
								else
								{
									warranty="YES";
								}
							}
						}
					}
					else
					{
					//out.println("Hiiiiiiiiiiiiiiii");
						//insdt1=rs4.getString("InstDate");
						sql4="select TO_DAYS(NOW())-TO_DAYS('"+rs2.getString("InstalledDate")+"') as days";
						ResultSet rst222=stwar4.executeQuery(sql4);
						if(rst222.next())
						{
							if(rst222.getInt("days") > 365)
							{
								warranty="NO";
							}
							else
							{
								warranty="YES";
							}
						}
					}     
					
					if(InstalledDate==null) {
						
						InstalledDate="-";
						
						}
					else if(Warranty==null){
						Warranty="-";
						DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
						date = df.parse(InstalledDate);
			    	    DateFormat df1 = new SimpleDateFormat("dd-MMM-yyyy");
			    	    InstalledDate = df1.format(date);
					}
						 
					else{
						 
						  DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
					    	
				    	    date = df.parse(InstalledDate);
				    	    DateFormat df1 = new SimpleDateFormat("dd-MMM-yyyy");
				    	    InstalledDate = df1.format(date);
				    	    
				    	    date = df.parse(Warranty);
				      	    df1 = new SimpleDateFormat("dd/MM/yyyy");
				      	  Warranty = df1.format(date);
				      	  
					} 
				    
		
					      	    
					%>
					<tr>
					
						<td width="5%"><div align="right"><%=i%></div></td>
						<td align="center"><%=VehicleRegNumber %></td>
						<td align="right"><%=unitid %></td>
						<td align="left"><%=OwnerName %></td>

						<% 
    	      System.out.println("fffff"+(rs2.getDate("InstalledDate")));
    	      %>

						<td align="center"><%=new SimpleDateFormat("dd/MM/yyyy").format(rs2.getDate("InstalledDate"))%></td>
						<td align="center"><%=Warranty%></td>

						<td align="left"><%=warranty %></td>

					</tr>

					<%
		i++;}
	}catch (Exception e) {
			out.println("<tr><td colspan=2>");
			out.println("Exception :" + e.getMessage());
			out.println("Cause : " + e.getCause());
			out.println("</td></tr>");
			e.printStackTrace();
	}finally{
%>
				</tbody>
				<tfoot>
					<tr>
						<th>Sr.No</th>
						<th align="center">Vehicle</th>
						<th align="center">UnitId</th>
						<th align="center">Owner Name</th>
						<th align="center">Installed Date</th>
						<th align="center">Warranty Till</th>
						<th align="center">Warranty Status</th>

					</tr>
				</tfoot>
			</table>
			<%

try
{
	conn.close();
}catch(Exception e)
{}
	
	}	
%>






			<!-- code end here --->

		</div>
	</div>
	<div id="gbox-bot1"></div>
	</div>
	</div>
	</div>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>



