<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<%! 
Connection conn,conn1;
Statement st,st1,st2,stmtinsert;
String sql,sql1,username,userrole,today,olddate,thedate,technician,tno;
String discription,prvsact,result,resultval,action,hidcomment,cust,vehno;
int cntrforAtt=0;
%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

	<title>Seven Day Diary System.</title>
	<link rel="stylesheet" href="style.css" type="text/css" charset="utf-8" />
	<link rel="stylesheet" href="css/css.css" type="text/css" charset="utf-8" />
	<script src="sorttable.js" type="text/javascript"></script>
	<style type="text/css">@import url(jscalendar-1.0/calendar-win2k-1.css);</style>
	<script type="text/javascript" src="jscalendar-1.0/calendar.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/lang/calendar-en.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/calendar-setup.js"></script>
	</head>

<body>

  <div id="outer">
    <div id="wrapper">
      <div id="body-bot">
        <div id="body-top">
          <div id="logo">
            <h1><img src="images/Transworld.gif"></h1>
            <p>We care about your Vehicles</p>
          </div>
          <div id="nav">
            <ul>
		<li><a href="mainpage.jsp">MAIN PAGE</a></li>
              <li><a href="addcontact.jsp">ADD CONTACT</a></li>
		<li><a href="addunit.jsp">ADD UNIT</a></li>
              <li><a href="techdailyreport.jsp">TECHNICIAN'S DAILY REPORT</a></li>
		<li><a href="#">WELCOME </a><font color="red"><%=session.getAttribute("username").toString()%></font></li>
		<li><a href="logout.jsp">LOGOUT</a></li>
		<li>
		<%
			
			java.util.Date d = new java.util.Date();
			Format formatter1 = new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss");
			String s=formatter1.format(d);
			out.print(s);
		%></li>
            </ul>
            <div class="clear"> </div>

          </div>
	<div id="gbox1">
            <div id="gbox-top1"> </div>
            <div id="gbox-bg1">
              <div id="gbox-grd1">
<!--- code start here ------>
<%
java.util.Date defoultdate = new java.util.Date();
Format formatter = new SimpleDateFormat("yyyy-MM-dd");
today = formatter.format(defoultdate);
long miliseconds=defoultdate.getTime();
miliseconds=miliseconds-7000 * 60 * 60 *24;
defoultdate.setTime(miliseconds);
olddate=formatter.format(defoultdate);
username=session.getAttribute("username").toString();
userrole=session.getAttribute("userrole").toString();
tno=request.getParameter("tno");
String rep=request.getParameter("rep");
discription=request.getParameter("desccomp");
prvsact=request.getParameter("presaction");
action=request.getParameter("act");
hidcomment=request.getParameter("hidcmnt");
result=request.getParameter("res");
resultval=request.getParameter("actsol");
thedate=request.getParameter("alocdate");
String thedate=request.getParameter("thedate");
String thedate1=request.getParameter("thedate1");
//out.print(today+" "+tno+" "+technician+" "+discription+" "+prvsact+" "+action+" "+hidcomment+" "+result+" "+resultval+" "+thedate);
try{
	Class.forName(MM_dbConn_DRIVER);
	conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	st=conn.createStatement();
	st1=conn.createStatement();
	st2=conn1.createStatement();
	stmtinsert=conn1.createStatement();

	
	String allocplace=request.getParameter("vehattadd");
	String technician=request.getParameter("technician");	

	sql="select Action,cntrforAtt from t_complaints1 where Tno='"+tno+"' ";
	ResultSet rst=st.executeQuery(sql);
	if(rst.next())
		{
			prvsact=action+" "+rst.getString("Action");
			cntrforAtt=rst.getInt("cntrforAtt")+1;
		}

		sql="select * from t_complaints1 a, t_callocation1 b where a.Tno='"+tno+"' and a.Tno=b.Tno ";
   		ResultSet rst1=st.executeQuery(sql);
   		if(rst1.next())
   			{
   				cust=rst1.getString("a.Customer");
     				vehno=rst1.getString("a.VehicleNo");
   			}

		sql="update t_complaints1 set Action='"+prvsact+"', Status='Attended', cntrforAtt = '"+cntrforAtt+"' where Tno='"+tno+"' ";
		//Query for t_sqlquery
		String abcd=sql.replace("'","#");	
		abcd=abcd.replace(",","$");								
		stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_CustomerComplaints','"+abcd+"')");
		out.print(sql+"<br>");		
		st.executeUpdate(sql); 
	if(result.equals("Solved"))
		{
			sql="update t_complaints1 set Status='Solved', Result='Solved', PSolBy='"+technician+"', PSolDate='"+today+"' where Tno='"+tno+"' ";
			//Query for t_sqlquery
			String abcd1=sql.replace("'","#");	
			abcd1=abcd1.replace(",","$");								
			stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_CustomerComplaints','"+abcd1+"')");
			
  			st.executeUpdate(sql);
  			out.print(sql+"<br>");
  			sql="update t_callocation1 set Status='Solved' where Tno='"+tno+"' ";
  		//Query for t_sqlquery
  			String abcd2=sql.replace("'","#");	
  			abcd2=abcd2.replace(",","$");								
  			stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_CustomerComplaints','"+abcd2+"')");
  			
  			st.executeUpdate(sql);
  			out.print(sql+"<br>");
  			sql="update t_callocation1 set ActualProb ='"+resultval+"' where Tno = '"+tno+"' " ;
  		//Query for t_sqlquery
  			String abcd3=sql.replace("'","#");	
  			abcd3=abcd3.replace(",","$");								
  			stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_CustomerComplaints','"+abcd3+"')");
  			
       	st1.executeUpdate(sql);
       	out.print(sql+"<br>");
       	
   			sql="insert into t_solvedcomps (Tno, Customer, VehNo, DofComp, DofAlloc, SolDate, SolBy) values ('"+tno+"', '"+cust+"','"+vehno+"','"+thedate+"','"+thedate+"','"+today+"','"+technician+"') ";
   			//Query for t_sqlquery
   			String abcd4=sql.replace("'","#");	
   			abcd4=abcd4.replace(",","$");								
   			stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_CustomerComplaints','"+abcd4+"')");
   			
   			st.executeUpdate(sql);
       		out.print(sql+"<br>");
       		if(thedate=="")
					{
					}
				else
					{ 
						sql="update t_callocation1 set VehAvaildate ='"+thedate+"' where Tno = '"+tno+"' " ;
						//Query for t_sqlquery
						String abcd5=sql.replace("'","#");	
						abcd5=abcd5.replace(",","$");								
						stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_CustomerComplaints','"+abcd5+"')");
						
 						st.executeUpdate(sql);
 						out.print(sql+"<br>");
					}
					sql="select Tno,HiddenComment from t_callocation1 where Tno= '"+tno+"' ";
					ResultSet rst2=st.executeQuery(sql);
  					while(rst2.next())
  						{
    						hidcomment=hidcomment+rst2.getString("HiddenComment"); 
    						 
  						}
  						sql="update t_callocation1 set HiddenComment ='"+hidcomment+"' where Tno = '"+tno+"' " ;
  					//Query for t_sqlquery
  						String abcd6=sql.replace("'","#");	
  						abcd6=abcd6.replace(",","$");								
  						stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_CustomerComplaints','"+abcd6+"')");
  						
      				st.executeUpdate(sql);  
      				out.print(sql+"<br>");
  						
		}

		String sprep=request.getParameter("sprep");
		if(sprep.equals("Yes"))	
		{ 
			response.sendRedirect("specialreport1.jsp?trans="+cust+"&vehno="+vehno+"&tickno="+tno+"&allocplace="+allocplace+"&technician="+technician);
   			return;
		}
		else
		{
			response.sendRedirect("mydiary2.jsp?inserted=yes&repname="+rep+"&thedate="+thedate+"&thedate1="+thedate1);
			return;
		}

}catch(Exception e)
{
	out.print("Exception -->"+e);

}
finally
{
	conn.close();
	conn1.close();

}
%>
		
<table border="0" width="750px" height="350px">
<tr><td></td></tr>
</table>
<!-- code end here --->

 		</div>
   		 </div>
 		 
		<div id="gbox-bot1"> </div></div>
      </div>
    </div>
  </div>
  
  <div id="copyright">
   Copyright ?? 2008 by Transworld Compressor Technologies Ltd. All Rights Reserved.
  </div>

</body>
</html>
