
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<html>
<head>	

<link rel="stylesheet" href="css/css.css" type="text/css"
	charset="utf-8" />
<script src="sorttable.js" type="text/javascript"></script>

<link rel="stylesheet" href="css/css.css" type="text/css"
	charset="utf-8" />
<script src="sorttable.js" type="text/javascript"></script>

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
	                        title: 'Pending Unit Report' 

							
	                    },
	                    {
	                        extend: 'pdf',
	                        orientation: 'landscape',
	                        pageSize: 'LEGAL',
	                        title: 'Pending Unit Report' 
	                        
	                       
	                     },
	                    {
	                        extend: 'csv',
	                        title: 'Pending Unit Report' 
	                       
	                    },
	                    {
	                        extend: 'print',
	                        title: 'Pending Unit Report' 
	                        
	                    },
	                    {
	                        extend: 'copy',
	                        title: 'Pending Unit Report' 
	                       
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
	            { "sType": "date-uk" },
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
 $(document).ready(function() {
	    $('#example1').DataTable( {
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
	                        title: 'Pending Unit Report' 

							
	                    },
	                    {
	                        extend: 'pdf',
	                        orientation: 'landscape',
	                        pageSize: 'LEGAL',
	                        title: 'Pending Unit Report' 
	                        
	                       
	                     },
	                    {
	                        extend: 'csv',
	                        title: 'Pending Unit Report' 
	                       
	                    },
	                    {
	                        extend: 'print',
	                        title: 'Pending Unit Report' 
	                        
	                    },
	                    {
	                        extend: 'copy',
	                        title: 'Pending Unit Report' 
	                       
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
	            { "sType": "date-uk" },
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








<script language="javascript">
function validate()
{ 
	var tech=document.transferunits.techlist.value;
	var cust=document.transferunits.custlist.value;
	var cmnt=document.transferunits.cmnt.value;
	//var tech1=document.transferunits.techlist1.value;

	
	if(tech=="Select" && cust=="Select")
	{
		alert("Please select Tech name or Cust Name from the List");
		return false;
	}

	if(tech!="Select" && cust!="Select")
	{
		alert("You can only select one at a time (Tech or Cust)");
		return false;
	} 	

	if(document.transferunits.unittype[0].checked==false && document.transferunits.unittype[1].checked==false)
	{
		alert("Please select Transfer as (New or Faulty)");
		return false;
	}

	if(cmnt.length < 2)
	{
		alert("Please enter Comment");
		return false;
	}
		
	return true;
}
</script>
</head>



<%!
Connection con1, con2;
String username;
String present=null;
String present1=null;
%>
<body>
<form name="transferunits" method="get"  action="transrunitsfrmtech1.jsp" onsubmit="return validate();">
<%
username=session.getAttribute("username").toString();
String userrole=session.getAttribute("userrole").toString();
try
{
	Class.forName(MM_dbConn_DRIVER);
	con1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	con2 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	Statement stmt1=con1.createStatement();
	Statement stmt2=con2.createStatement();
	Statement stmt3=con1.createStatement();
	Statement stmt4=con2.createStatement();
	Statement stmt5=con1.createStatement();
	Statement stmt6=con1.createStatement();
	Statement stmt7=con1.createStatement();
	Statement stmt88=con1.createStatement();
	Statement stmt99=con1.createStatement();
	Statement stmt10=con2.createStatement();
	Statement stmt111=con1.createStatement();
	Statement stmt12=con1.createStatement();
	Statement stmt13=con1.createStatement();
	ResultSet rs1=null,rs2=null,rs3=null,rs4=null,rs5=null;
	String sql1="",sql2="",sql3="",sql4="",sql5="",sql11="",sql22="",sql33="";
	String sql44="", sql55="",sql66="",sql77="",sql88="",sql99="",sql10="",sql111="",sql12="",sql13="";
	ResultSet rs11=null,rs22=null,rs33=null,rs44=null,rs55=null,rs66=null,rs77=null,rs88=null,rs99=null,rs10=null;
	ResultSet rs111=null,rs12=null,rs13=null;
	String transp=request.getParameter("holdername");
	String nounitselected=request.getParameter("nounitselected");
	if(nounitselected==null)
	{
	}
	else
	{
%>
		<table border="0" width="750px" bgcolor="" align="center">
		<tr>	
			<td align="center"> <font color="" > No check-box was selected.  </font> </td>
		</tr>
		</table>
<%	}
	String updated=	request.getParameter("updated");
	//System.out.println("Updated--->"+updated);

	if(updated==null)
	{
	}
	else
	{ 
%>
		<table border="0" width="750px" bgcolor="#E6E6E6" align="center">
		<tr>	
			<td align="center"> <font color="" >Successfully Updated. </font> </td>
		</tr>
		</table>
<%	}	
%>
	<table border="0" width="750px" align="center">
		<tr bgcolor="">
			<td  align="center" colspan="2">
				<font size="2" color="dark grey">
					Units with <%=transp%>
				</font>
			</td>
		</tr>
		<br>
		
		<tr>
			<td><font size="2" style="padding-left:225px">Pending Units From Replacement/Removed</font></td>	
		</tr>
	</table>
	
	

		
		<table id="example" class="display" style="width: 100%">
				<thead>
					<tr>
					    <td></td>
						<th>Sr.No</th>
						<th align="center">Unit Id</th>
						<th align="center">Status</th>
						<th align="center">Status Date</th>
						<th align="center">Veh. Reg No.</th>
						<th align="center">Location</th>
						<th align="center">Technician</th>
						<th align="center">Old Unit With</th>
					</tr>
				</thead>
				<tbody>
		
<%
	int i=1;	


		

		sql1="select * from t_unitreplacement where InstType In ('Rem','Rep','Del') and OldUnitWith In ('cust','customer','Customer','"+transp+"') and OwnerName In ('"+transp+"' , '"+transp+" del') order by EntDate Desc";
		rs1=stmt1.executeQuery(sql1);
		while(rs1.next())
		{
			
			String time=rs1.getString("InstTime");
			String z=new Integer(00).toString();
			if(time==null)
			{
				time=z;
				
			}
			else
			{
				
			}
			sql2="select * from t_unitreceived where UnitID='"+rs1.getString("OldUnitID").trim()+"' and Rdate > '"+rs1.getString("EntDate")+"' order by Rdate desc"; 
			rs2=stmt2.executeQuery(sql2);
			if(rs2.next())
			{}
			else
			{	
				sql2="select * from t_unitreceived where UnitID='"+rs1.getString("OldUnitID").trim()+"' and Rdate = '"+rs1.getString("EntDate")+"' and Rtime > '"+time+"' order by Rdate desc"; 
				ResultSet rstime=stmt2.executeQuery(sql2);
				if(rstime.next())
				{}
				else
				{
				sql3="select * from t_unitreplacement where (OldUnitID='"+rs1.getString("OldUnitID").trim()+"' or NewUnitID='"+rs1.getString("OldUnitID").trim()+"') and EntDate > '"+rs1.getString("EntDate")+"'";
				rs3=stmt3.executeQuery(sql3);
				if(rs3.next())
				{}
				else
				{	
					sql3="select * from t_unitreplacement where (OldUnitID='"+rs1.getString("OldUnitID").trim()+"' or NewUnitID='"+rs1.getString("OldUnitID").trim()+"') and EntDate = '"+rs1.getString("EntDate")+"' and InstTime > '"+time+"'";
					ResultSet rsreptime=stmt3.executeQuery(sql3);
					if(rsreptime.next())
					{}
					else
					{
					sql4="select * from t_unitmasterhistory where UnitID='"+rs1.getString("OldUnitID").trim()+"' and DispDate > '"+rs1.getString("EntDate")+"'";
					rs4=stmt5.executeQuery(sql4);
					if(rs4.next())
					{}
					else
					{
						sql4="select * from t_unitmasterhistory where UnitID='"+rs1.getString("OldUnitID").trim()+"' and DispDate = '"+rs1.getString("EntDate")+"' and EntTime > '"+time+"' ";
						ResultSet rsdtime=stmt5.executeQuery(sql4);
						if(rsdtime.next())
						{}
						else
						{
							sql5="Select * from allconnectedunits where UnitID='"+rs1.getString("OldUnitID").trim()+"' and TheDate >'"+rs1.getString("EntDate")+"' and  VehNo <> '-' order by TheDate Desc ";
							rs5=stmt6.executeQuery(sql5);
							if(rs5.next())
							{}
							else
							{
								String newunit=rs1.getString("OldUnitID").trim();
								if(newunit.equals(present))
								{						
								}
								else
								{
									present=rs1.getString("OldUnitID");
%>				
							<tr>
							<td> <input type="checkbox" name="disp<%=i%>" value="disp<%=i%>" /> </td>
							<td align="right"><%=i %></td>
							<td align="right"><%=rs1.getString("OldUnitID")%></td>
							<td align="left"><%=rs1.getString("InstType") %></td>
							<td align="center"><%=new SimpleDateFormat("dd/MM/yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rs1.getString("EntDate"))) %></td>
							<td align="center"><%=rs1.getString("VehRegNo") %></td> 
						
							<td align="left"><%=rs1.getString("InstPlace") %></td>
							<td align="left"><%=rs1.getString("InstBy") %></td>
							<td align="left"><%=rs1.getString("OldUnitWith") %>
							<input type="hidden" name="unitid<%=i%>" value="<%=rs1.getString("OldUnitID")%>" />
							</td>
							</tr>
							
							
		
<%	
							i++;
								}
							}
						}
					}
					}
					
					}
				}
				
			}
	
		}
	
		
	
	
	
	%>
	</tbody>
	<tfoot>
	<tr>
						<td></td>
						<th align="center">Sr.No</th>
						<th align="center">Unit Id</th>
						<th align="center">Status</th>
						<th align="center">Status Date</th>
						<th align="center">Veh. Reg No.</th>
						<th align="center">Location</th>
						<th align="center">Technician</th>
						<th align="center">Old Unit With</th>
					</tr>
	</tfoot>
	</table>
	
<!-- 	//--------------------------FOR DISPATCH----------------------------//	 -->
	<br></br>
	<table border="0" width="750px">
		<tr align="center" >
			<td><font size="2" style="padding-left:430px">
				
					Pending Units From Dispatches/Transform
				</font>
			</td>
		</tr>
	</table>
	<br>
		
		
		
		<table id="example1" class="display" style="width: 100%">
				<thead>
					<tr>
					    <td></td>
						<th>Sr.No</th>
						<th align="center">Unit Id</th>
						<th align="center">Status</th>
						<th align="center">Disp Date</th>
						<th align="center"> Unit Type</th>
						<th align="center">Dispatch Location</th>
						<th align="center">Mode Of Dispatch</th>
						<th align="center">Docket No.</th>
						
						<th align="center">Chalan No</th>
						<th align="center">Dispatch From</th>
					</tr>
				</thead>
				<tbody>
		
		
		
		
		
<%	
		sql66="select * from t_unitorder where (Tech ='"+transp+"' or Cust = '"+transp+"') and Status <> 'Open' order by ReqDate desc ";
    	rs66=stmt4.executeQuery(sql66);
		 while(rs66.next())
		 {
			 String orderno=rs66.getString("Reqno");
				sql77="select * from t_unitmasterhistory where OrderNo='"+orderno+"' ";
				rs77=stmt7.executeQuery(sql77);
				while(rs77.next())
				{
					String received=rs77.getString("RecByCust");
					String tme=rs77.getString("DispTime");
					String z=new Integer(00).toString();
					if(tme==null)
					{
						tme=z;
					}
					else
					{}
					sql88="select * from t_unitreplacement where NewUnitID='"+rs77.getString("UnitId")+"' and (InstDate > '"+rs77.getString("DispDate")+"' or EntDate > '"+rs77.getString("DispDate")+"') and InstBy In ('"+transp+"' , '"+transp+" del') order by EntDate Desc";
					rs88=stmt88.executeQuery(sql88);
					if(rs88.next())
					{}
					else
					{
						sql88="select * from t_unitreplacement where NewUnitID='"+rs77.getString("UnitId")+"' and (InstDate = '"+rs77.getString("DispDate")+"' or EntDate = '"+rs77.getString("DispDate")+"') and InstTime > '"+tme+"' and InstBy In ('"+transp+"' , '"+transp+" del') order by EntDate Desc";
						ResultSet reurep=stmt88.executeQuery(sql88);
						if(reurep.next())
						{}
						else
						{
							sql10="select * from t_unitreceived where UnitID='"+rs77.getString("UnitId").trim()+"' and Rdate > '"+rs77.getString("DispDate")+"' order by Rdate desc"; 
							rs10=stmt10.executeQuery(sql10);
							if(rs10.next())
							{}
							else
							{
								sql10="select * from t_unitreceived where UnitID='"+rs77.getString("UnitId").trim()+"' and Rdate = '"+rs77.getString("DispDate")+"' and Rtime > '"+tme+"' order by Rdate desc"; 
								ResultSet rsurcv=stmt10.executeQuery(sql10);
								if(rsurcv.next())
								{}
								else
								{	
								sql111="select * from t_unitreplacement where (OldUnitID='"+rs77.getString("UnitId").trim()+"' or NewUnitID='"+rs77.getString("UnitId").trim()+"') and EntDate > '"+rs77.getString("DispDate")+"'";
								rs111=stmt111.executeQuery(sql111);
								if(rs111.next())
								{}
								else
								{
									sql111="select * from t_unitreplacement where (OldUnitID='"+rs77.getString("UnitId").trim()+"' or NewUnitID='"+rs77.getString("UnitId").trim()+"') and EntDate = '"+rs77.getString("DispDate")+"' and InstTime > '"+tme+"' ";
									ResultSet rsurep=stmt111.executeQuery(sql111);
									if(rsurep.next())
									{}
									else
									{
									sql12="select * from t_unitmasterhistory where UnitID='"+rs77.getString("UnitId").trim()+"' and DispDate > '"+rs77.getString("DispDate")+"'";
									rs12=stmt5.executeQuery(sql12);
									if(rs12.next())
									{}
									else
									{
										sql12="select * from t_unitmasterhistory where UnitID='"+rs77.getString("UnitId").trim()+"' and DispDate = '"+rs77.getString("DispDate")+"' and DispTime > '"+tme+"'";
										ResultSet rsumh=stmt5.executeQuery(sql12);
										if(rsumh.next())
										{}
										else
										{
											String sql122="select * from t_unitmasterhistory where UnitID='"+rs77.getString("UnitId").trim()+"' and DispDate = '"+rs77.getString("DispDate")+"' and DispTime = '"+tme+"'";
											ResultSet rsumh1=stmt5.executeQuery(sql122);
											if(rsumh1.next())
											{
											sql13="Select * from allconnectedunits where UnitID='"+rs77.getString("UnitId").trim()+"' and TheDate >'"+rs77.getString("DispDate")+"' and VehNo <> '-'order by TheDate Desc ";
											rs13=stmt13.executeQuery(sql13);
											if(rs13.next())
											{}
											else
											{
												String newunit1=rs77.getString("UnitId").trim();
												if(newunit1.equals(present1))
												{}
												else
												{
													present1=rs77.getString("UnitId");
%>								
											<tr>
											<td> <input type="checkbox" name="disp<%=i%>" value="disp<%=i%>" /> </td>
											<td> <%=i%> </td>
											<td><%=rs77.getString("UnitId")%></td>
											<td><font>OK</font></td>
											<td> <%=new SimpleDateFormat("dd/MM/yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rs77.getString("DispDate")))%> </td>
											<td><%=rs77.getString("typeunit") %></td>
											<td> <%=rs77.getString("DisAdd") %></td>
											<td><%=rs77.getString("ModeofDispatch") %></td>
											<td><%=rs77.getString("DisName") %></td>
											<td> <%=rs77.getString("ChalanNo")%> </td>
											<td> <%=rs66.getString("Reqto")%> 
												<input type="hidden" name="unitid<%=i%>" value="<%=rs77.getString("UnitId")%>" />
											</td>
											</tr>
											
						
				<%	
											i++;
												}
											}
											}
										}
									}
									}
								}
								}
								}
							}
						}
					}
				}
				
			//-------------------------------------		
%></tbody>
<tfoot>
<tr>
                        <th></th>
						<th>Sr.No</th>
						<th align="center">Unit Id</th>
						<th align="center">Status</th>
						<th align="center">Disp Date</th>
						<th align="center"> Unit Type</th>
						<th align="center">Dispatch Location</th>
						<th align="center">Mode Of Dispatch</th>
						<th align="center">Docket No.</th>
						
						<th align="center">Chalan No</th>
						<th align="center">Dispatch From</th>
						</tr>
</tfoot>

		</table>
		<br><br>
<%
String typevalue=session.getAttribute("typevalue").toString();
if(typevalue.equals("transporter")){}else{
		String sqltech="select distinct(TechName) as tech from t_techlist where Available='Yes' order by TechName asc";
		ResultSet rstechname=stmt2.executeQuery(sqltech);
%>
<table border="0" width="800px" bgcolor="#E6E6E6" align="center">
	<tr>
		<td align="center" colspan="2"> 
				<font color="#2A0A12" > 
						<b>Transfer To</b> 
				</font>  		 	
		</td>
	</tr>
	<tr bgcolor="#BDBDBD">
		<td>
			<div align="center"> 
				<label for="Tech" class="formElement"> <B>
					<font size="2">Tech:</font>
				</B></label> 
				<select name="techlist" class="formElement"> 	
					<option value="Select">Select</option>	
<%
					while(rstechname.next())
					{ 
%>
					<option value="<%=rstechname.getString("tech")%>"><%=rstechname.getString("tech")%></option>
<%
					}
%>
			     </select> 
<%	
		if("manager".equalsIgnoreCase(userrole)||"SuperAdmin".equalsIgnoreCase(userrole))
		{
%>
			&nbsp;&nbsp;&nbsp; OR &nbsp; &nbsp;&nbsp;
<%
			String sqltrans="select distinct(OwnerName) as cust from t_vehicledetails where OwnerName not like '% del' order by OwnerName asc";
			ResultSet rstransname=stmt3.executeQuery(sqltrans);
%>						      
	  		 <label for="Cust" class="formElement"> 
	  		 	<B><font size="2">Cust:</font></B>
	  		 </label> 
	  		 <select name="custlist" class="formElement"> 	
				<option value="Select">Select</option>
<%
				while(rstransname.next())
				{ 
%>
				<option value="<%=rstransname.getString("cust")%>"><%=rstransname.getString("cust")%></option>
<%									
				}
%>
			</select>	
<%									
		}
%>
		</div>
	</td>
  </tr>   
  <tr  bgcolor="#BDBDBD">
     <td align="center">
			<label for="Transferas" class="formElement"> <B> 
				<font size="2">Transfer as:</font></B> 
			</label>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="radio" name="unittype" value="Okay"> Okay
			<input type="radio" name="unittype" value="Faulty">Faulty
	 </td>
  </tr>
  <tr  bgcolor="#BDBDBD">
	 <td align="center"> 
	 	<label for="Comment" class="formElement"> 
	 		<B> <font size="2">Comment: </font></B> 
	 	</label> 
	 	<textarea name="cmnt" class="formElement"> </textarea> 
	 </td>
   </tr>
    <tr>
		<td colspan="2" align="center">  
			<input type="submit" name="submit" value="Transfer" class="formElement" /> 
		</td>
	</tr>
</table>
<input type="hidden" name="cntr" value="<%=i%>" />	
<input type="hidden" name="techname" value="<%=transp%>" />	
<%}
} catch(Exception e) {out.println(e);}

finally
{
con1.close();
con2.close();
}
%>
</form>
</body>
</html>
<br></br>