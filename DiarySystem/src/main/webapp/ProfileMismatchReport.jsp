<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="org.apache.poi.util.SystemOutLogger"%>

<%@ page contentType="text/html; charset=iso-8859-1" language="java"
	import="java.sql.*" import=" java.text.*" import=" java.util.*"
	errorPage=""%>
	
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ include file="header.jsp"%>
<%@page import="java.sql.ResultSet"%>

<%!Connection conn;
	Statement st1, st2, st3, st4, st5;
	String query1, query2, query3, query4, query5;%>

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
<title>Profile Mismatch Report</title>

<script type="text/javascript">
$(document).ready(function(){
    // Initialize select2	
    $("#operator").select2();
});
</script>

<style type="text/css">
@import url(jscalendar-1.0/calendar-win2k-1.css);
</style>

<script type="text/javascript" src="jscalendar-1.0/calendar.js"></script>
<script type="text/javascript" src="jscalendar-1.0/lang/calendar-en.js"></script>
<script type="text/javascript" src="jscalendar-1.0/calendar-setup.js"></script>

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
	                        title: 'Profile Mismatch Report' 

							
	                    },
	                    {
	                        extend: 'pdf',
	                        orientation: 'landscape',
	                        pageSize: 'LEGAL',
	                        title: 'Profile Mismatch Report' 
	                        
	                       
	                     },
	                    {
	                        extend: 'csv',
	                        title: 'Profile Mismatch Report'
	                       
	                    },
	                    {
	                        extend: 'print',
	                        title: 'Profile Mismatch Report'
	                        
	                    },
	                    {
	                        extend: 'copy',
	                        title: 'Profile Mismatch Report' 
	                       
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

function confirmSubmit()
{
	
	var operator= document.getElementById("operator").options[document.getElementById("operator").selectedIndex].value;
	//var status= document.getElementById("status").options[document.getElementById("status").selectedIndex].value;
	
	if(operator=="select") 
		{			
			alert("Please select Owner!");
		return false;
		}
	
	
	
return true;	
}
</script>
<script type="text/javascript">
function goToFullExcel(operator,calender,calender1) 
{
	alert(">>>>"+operator+">>>>>>>>"+status+">>>>>>");
	
		window.location.href="SimmasterReportFullExcelReport.jsp?date1="+date1+"&date2="+date2+"Operator="+owner;	
}

function gotoExcel(elemId,frmFldId)  
{  
	   alert(">>>>");   
          var obj = document.getElementById(elemId);
          var oFld = document.getElementById(frmFldId);
          oFld.value = obj.innerHTML;
          document.SimmasterReport.action ="excel.jsp";
          document.forms["SimmasterReport"].submit();
}
</script>
<script type="text/javascript">
function fun()
{

	//alert("Hi");
	
	var chkf="";
	var chkt="";
	var objFromDate = document.getElementById("calender").value;
	//alert(objFromDate);
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
    var objToDate = document.getElementById("calender1").value;
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
//         else if(date1 > currentDate)
//         {
//             alert("From Date should be less than current date");
//             return false; 
//         }
//         else if(date2 > currentDate) 
//         {
//             alert("To Date should be less than current date");
//             return false; 
//         }


	return true;
}
</script>
</head>


		<%@ include file="MenuNew.jsp"%>




			<!--- code start here ------>

			<%
				java.util.Date td = new java.util.Date();
				Format fmt = new SimpleDateFormat("dd-MM-yyyy");
				Format fmt1 = new SimpleDateFormat("dd-MMM-yyyy HH:mm");
				Format fmt2 = new SimpleDateFormat("yyyy-MM-dd");
				String sdt = fmt.format(td);

				////System.out.println("----------------------------------------------------------------------???<_>"+inputtype);

				java.util.Date dte = new java.util.Date();
				Format formatter = new SimpleDateFormat("dd-MM-yyyy");
				String today = formatter.format(dte);

				java.util.Date dte1 = new java.util.Date();
				Format formatter1 = new SimpleDateFormat("yyyy-MM-dd");
				String today1 = formatter.format(dte);

				String datenew1 = "";
				String datenew2 = "";
				String datenew3 = "";
				String dataDate11 = "";

				//datenew1=datenew2=new SimpleDateFormat("dd-MMM-yyyy").format(new java.util.Date());
				/* String dt = new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(datenew1));
				dt=dt;
				
				String dt1 = new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(datenew2));
				
				dt1=dt1; */

				String fromdate = request.getParameter("calender");

				String todate = request.getParameter("calender1");

				if (request.getParameter("calender") != null) {
					datenew1 = request.getParameter("calender");
					datenew2 = request.getParameter("calender1");
				} else
					datenew1 = datenew2 = new SimpleDateFormat("dd-MMM-yyyy").format(new java.util.Date());

				try {
					System.out.println("Creating Connection");
					Class.forName(MM_dbConn_DRIVER);
					conn = DriverManager.getConnection(MM_dbConn_STRING, MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
					st1 = conn.createStatement();
					st2 = conn.createStatement();
					st3 = conn.createStatement();
					st4 = conn.createStatement();
					st5 = conn.createStatement();

				} catch (Exception E) {
					System.out.println("" + E);
				}
				
				ResultSet rsPagination = null;
				ResultSet rsRowCnt = null;

				PreparedStatement psPagination = null;
				PreparedStatement psRowCnt = null;

				int iShowRows = 10; // Number of records show on per page
				int iTotalSearchRecords = 10; // Number of pages index shown

				int iTotalRows = nullIntconv(request.getParameter("iTotalRows"));
				int iTotalPages = nullIntconv(request.getParameter("iTotalPages"));
				int iPageNo = nullIntconv(request.getParameter("iPageNo"));
				int cPageNo = nullIntconv(request.getParameter("cPageNo"));

				int iStartResultNo = 0;
				int iEndResultNo = 0;

				if (iPageNo == 0) {
					iPageNo = 0;
				} else {
					iPageNo = Math.abs((iPageNo - 1) * iShowRows);
				}

				System.out.println("Connection Created");
			%>
			<br>
			<br>

			<table border="0" width="750px" bgcolor="" align="center">
				<tr>
					<td>
						<table border="0" width="100%">
							<tr>
								 <td align="center"><font color="" size="3">Profile
											Mismatch Report
											</font></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>

			<%
			
				System.out.println("The Date 1 is  :" + fromdate);
				System.out.println("The Date 2 is :" + todate);
				DateFormat df123 = new SimpleDateFormat("dd-MMM-yyyy");
				DateFormat df1234 = new SimpleDateFormat("yyyy-MM-dd");
				String dataDate1 = df1234.format(df123.parse(datenew1));
				String dataDate2 = df1234.format(df123.parse(datenew2));

				String dt = new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(datenew1));
				dt = dt;

				String dt1 = new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(datenew2));
				dt1 = dt1;

				System.out.println("Date1 After Format : " + dt);
				System.out.println("Date2 After Format : " + dt1);
			%>



			<%
				String Bt = request.getParameter("sub");
			%>




			<table id="example" class="display" style="width: 100%">
				<thead>
					<tr>
						<th>Sr.No</th>
						<th align="center">Vehicle Code</th>
						<th align="center">UnitId</th>
						<th align="center">Owner Name</th>
						<th align="center">Mobile No</th>
						<th align="center">Sim No</th>
						<th align="center">Expected Mobile No</th>
						<th align="center">Expected Sim No</th>
						<th align="center">Status</th>
						<th align="center">OS</th>
						<th align="center">OS1</th>
						<th align="center">OS2</th>
						<th align="center">St Interval</th>
						<th align="center">Tx Interval</th>
						<th align="center">CodeVersion</th>
						<th align="center">Peripherals</th>
						<th align="center">Expected OS</th>
						<th align="center">Expected OS1</th>
						<th align="center">Expected OS2</th>
						<th align="center">Date</th>
					</tr>
				</thead>

				<tbody>

					<%
						try {

							String sqlData = "select  a.vehiclecode,a.unitid,a.ownername,a.status,b.os,b.os1,b.os2,b.stinterval,b.txinterval,b.codeversion,c.peripherals,65 as expectedos,200 as expectedos1,200 as expectedos2,g.thedate from  db_gps.t_vehicledetails a left outer join db_gps.t_ftplastdump b on  a.unitid=b.unitid left outer join  db_gps.t_unitmaster c on  a.unitid=c.unitid left join db_gps.t_onlinedata g on  a.vehiclecode=g.vehiclecode where a.vehiclecode in( select vehcode from  db_gps.t_group where gpname='castrol' and sepreport='yes' and  active='yes') and c.peripherals = 'plain' and (b.os <65 or b.os >66) and  g.thedate='"
									+ dt
									+ "' union select  a.vehiclecode,a.unitid,a.ownername,a.status,b.os,b.os1,b.os2,b.stinterval,b.txinterval,b.codeversion,  c.peripherals,65 as expectedos,30 as expectedos1,40 as  expectedos2,g.thedate from db_gps.t_vehicledetails a left outer join  db_gps.t_ftplastdump b on a.unitid=b.unitid left outer join  db_gps.t_unitmaster c on  a.unitid=c.unitid left join  db_gps.t_onlinedata g on a.vehiclecode=g.vehiclecode where a.vehiclecode  in( select vehcode from db_gps.t_group where gpname='castrol' and  sepreport='yes' and active='yes') and c.peripherals like '%jrm%' and  (b.os1<>30 or b.os2<>40 or b.os<>65) and g.thedate='"
									+ dt
									+ "' union   select  a.vehiclecode,a.unitid,a.ownername,a.status,b.os,b.os1,b.os2,b.stinterval,b.txinterval,b.codeversion,c.peripherals,d.os  as expectedos,200 as expectedos1,200 as expectedos2,g.thedate from  db_gps.t_vehicledetails a left outer join db_gps.t_ftplastdump b on  a.unitid=b.unitid left outer join  db_gps.t_unitmaster c on  a.unitid=c.unitid  left outer join db_gps.t_parametermismatchcust d on  a.ownername=d.customer left join db_gps.t_onlinedata g on  a.vehiclecode=g.vehiclecode where a.status='-' and  g.thedate='"
									+ dt
									+ "' and a.ownername in(select customer from  db_gps.t_parametermismatchcust) and (d.os<>b.os)";

							System.out.println("SqlData " + sqlData);
							
							
							/* 				String sqlData="select "
													+"a.vehiclecode,a.unitid,a.ownername,a.status,b.os,b.os1,b.os2,b.stinterval,b.txinterval,b.codeversion,c.peripherals,65 "
													+"as expectedos,200 as expectedos1,200 as expectedos2,g.thedate from "
													+"db_gps.t_vehicledetails a left outer join db_gps.t_ftplastdump b on " 
													+"a.unitid=b.unitid left outer join  db_gps.t_unitmaster c on "
													+"a.unitid=c.unitid left join db_gps.t_onlinedata g on "
													+"a.vehiclecode=g.vehiclecode where a.vehiclecode in( select vehcode from" 
													+"db_gps.t_group where gpname='castrol' and sepreport='yes' and "
													+"active='yes') and c.peripherals = 'plain' and (b.os <65 or b.os >66) and "
													+"g.thedate='2018-08-20' union select "
													+"a.vehiclecode,a.unitid,a.ownername,a.status,b.os,b.os1,b.os2,b.stinterval,b.txinterval,b.codeversion," 
													+"c.peripherals,65 as expectedos,30 as expectedos1,40 as "
													+"expectedos2,g.thedate from db_gps.t_vehicledetails a left outer join" 
													+"db_gps.t_ftplastdump b on a.unitid=b.unitid left outer join "
													+"db_gps.t_unitmaster c on  a.unitid=c.unitid left join "
													+"db_gps.t_onlinedata g on a.vehiclecode=g.vehiclecode where a.vehiclecode" 
													+"in( select vehcode from db_gps.t_group where gpname='castrol' and "
													+"sepreport='yes' and active='yes') and c.peripherals like '%jrm%' and "
													+"(b.os1<>30 or b.os2<>40 or b.os<>65) and g.thedate='2018-08-20' union " 
													+"select "
													+"a.vehiclecode,a.unitid,a.ownername,a.status,b.os,b.os1,b.os2,b.stinterval,b.txinterval,b.codeversion,c.peripherals,d.os "
													+" as expectedos,200 as expectedos1,200 as expectedos2,g.thedate from "
													+" db_gps.t_vehicledetails a left outer join db_gps.t_ftplastdump b on "
													+"a.unitid=b.unitid left outer join  db_gps.t_unitmaster c on "
													+"a.unitid=c.unitid  left outer join db_gps.t_parametermismatchcust d on "
													+"a.ownername=d.customer left join db_gps.t_onlinedata g on "
													+"a.vehiclecode=g.vehiclecode where a.status='-' and "
													+"g.thedate='2018-08-20' and a.ownername in(select customer from " 
													+"db_gps.t_parametermismatchcust) and (d.os<>b.os)";
							 */
							System.out.println("Query is : " + sqlData);
							ResultSet rs4 = st1.executeQuery(sqlData);
							System.out.println("Query is : " + sqlData);
					%>



					<%
						int i = 1;
							while (rs4.next()) {
								String vehiclecode = rs4.getString("vehiclecode");
								String unitid = rs4.getString("unitid");
								String ownername = rs4.getString("ownername");
								String status = rs4.getString("status");
								String os = rs4.getString("os");
								String os1 = rs4.getString("os1");
								String os2 = rs4.getString("os2");
								String stinterval = rs4.getString("stinterval");
								String txinterval = rs4.getString("txinterval");
								//String CodeVersion= rs4.getString("CodeVersion");
								String codeversion = rs4.getString("codeversion");
								String peripherals = rs4.getString("peripherals");
								String expectedos = rs4.getString("expectedos");
								String expectedos1 = rs4.getString("expectedos1");
								String expectedos2 = rs4.getString("expectedos2");
								String thedate = rs4.getString("thedate");

								thedate = new SimpleDateFormat("dd/MM/yyyy").format(rs4.getDate("thedate"));							
								


								String sql1 = "select MobNo,SimNo from db_gps.t_unitmaster where UnitID= '" + unitid + "' ";
								System.out.println("sql1=====>> " + sql1);
								String mob = "";
								Statement st = conn.createStatement();
								ResultSet rt = st.executeQuery(sql1);

								if (rt.next()) {
									mob = rt.getString("MobNo");
								} else {
									mob = "-";
								}

								String mobile = "";
								String sim = "";

								String sql2 = " select MobNo,SimNo,unitid from db_gps.t_simmaster where mobno= '" + mob + "' ";

								Statement st1 = conn.createStatement();
								ResultSet rt1 = st1.executeQuery(sql2);
								if (rt1.next()) {
									mobile = rt1.getString("MobNo");
									sim = rt1.getString("SimNo");

								} else {
									mobile = "-";
									sim = "-";
								}

								System.out.println("sql2 " + sql2);

								String ExpMobile = "";
								String ExpSim = "";
								String sql3 = "select SimNo,Callno1 from db_gps.t_ftplastdump where unitid =  '" + unitid
										+ "' group by UnitID order by  StoredDateTime";
								Statement st2 = conn.createStatement();
								ResultSet rr = st2.executeQuery(sql3);
								if (rr.next()) {
									ExpMobile = rr.getString("Callno1");
									ExpSim = rr.getString("SimNo");
								} else {
									ExpMobile ="-";
									ExpSim = "-";
								}
								
								if (ExpMobile == "" || ExpMobile.equals("") || ExpMobile == " ") {
									ExpMobile="-";
								}

								
					%>
					<tr>
						<td align="right"><%=i%></td>
						<td align="right"><%=vehiclecode%></td>
						<td align="right"><%=unitid%></td>
						<td align="left"><%=ownername%></td>
						<td align="right"><%=mobile%></td>
						<td align="right"><%=sim%></td>

						<td align="right"><%=ExpMobile%></td>
						<td align="right"><%=ExpSim%></td>

						<td align="left"><%=status%></td>
						<td align="right"><%=os%></td>
						<td align="right"><%=os1%></td>
						<td align="right"><%=os2%></td>
						<td align="right"><%=stinterval%></td>
						<td align="right"><%=txinterval%></td>
						<td align="left"><%=codeversion%></td>
						<td align="left"><%=peripherals%></td>
						<td align="right"><%=expectedos%></td>
						<td align="right"><%=expectedos1%></td>
						<td align="right"><%=expectedos2%></td>
						<td align="right"><%=thedate%></td>
					</tr>


					<%
						i++;
							}

						} catch (Exception e) {
							System.out.println("====>error in connection");
							e.printStackTrace();
						}
					%>


				</tbody>
				<tfoot>
					<tr>
						<th>Sr.No</th>
						<th align="center">Vehicle Code</th>
						<th align="center">UnitId</th>
						<th align="center">Owner Name</th>
						<th align="center">Mobile No</th>
						<th align="center">Sim No</th>
						<th align="center">Expected Mobile No</th>
						<th align="center">Expected Sim No</th>
						<th align="center">Status</th>
						<th align="center">OS</th>
						<th align="center">OS1</th>
						<th align="center">OS2</th>
						<th align="center">St Interval</th>
						<th align="center">Tx Interval</th>
						<th align="center">CodeVersion</th>
						<th align="center">Peripherals</th>
						<th align="center">Expected OS</th>
						<th align="center">Expected OS1</th>
						<th align="center">Expected OS2</th>
						<th align="center">Date</th>
					</tr>
				</tfoot>
			</table>
		






	<%@ include file="footer.jsp"%>

			
</body>
</html>
<%
	try {
		if (psPagination != null) {
			psPagination.close();
		}
		if (rsPagination != null) {
			rsPagination.close();
		}

		if (psRowCnt != null) {
			psRowCnt.close();
		}
		if (rsRowCnt != null) {
			rsRowCnt.close();
		}

		if (conn != null) {
			conn.close();
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
%>