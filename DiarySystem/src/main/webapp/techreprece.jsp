<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<%! 
Connection con1,con2;
%>

<%
try{
	Class.forName(MM_dbConn_DRIVER);
	con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	Statement stmt1=con1.createStatement();
	con2 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	Statement stmtinsert=con2.createStatement();
	String sql1="";
	int chkdcntr=0;
	String flag="true";
	String user=session.getAttribute("DisplayName").toString();

	String tech=request.getParameter("tech");
	String fromdate=request.getParameter("fromdate");
	String todate=request.getParameter("todate");

	java.util.Date tdydate = new java.util.Date();
	Format formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	String s=formatter.format(tdydate);

	int cntr=Integer.parseInt(request.getParameter("cntr"));

	String[] chkbox=new String[cntr];
	String[] id = new String[cntr];
	

	for(int i=0;i<cntr;i++)
	{
		 chkbox[i] = request.getParameter("cb"+i );
		 if(chkbox[i]==null)
   		{
       		}
   		else
   		{
			chkdcntr++;
			flag="false";
   		} 	
	}

	if(flag.equals("true"))
	{
   		response.sendRedirect("techattendreport.jsp?reptype=Specific Tech&tech="+tech+"&calender="+fromdate+"&calender1="+todate+"&nocbselected=true");
	        return;
	}
	else
	{
		String[] x = new String[cntr];
		
		for(int k=0;k<cntr;k++)
		{
			x[k] = request.getParameter("cb"+k );
				
			if(x[k]==null)
       			{
    	
     		        }
       			else
       			{
				id[k] = request.getParameter("id"+k ); 
					
				sql1="update t_techattendance set RepReceived='Yes', ReportRecBy='"+user+"', RepRecDateTime='"+s+"' where SrNo='"+id[k]+"'";
				//Query for t_sqlquery
	   			String abcd=sql1.replace("'","#");	
	   			abcd=abcd.replace(",","$");								
	   			stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_CustomerComplaints','"+abcd+"')");

				stmt1.executeUpdate(sql1);
			}
		}
		response.sendRedirect("techattendreport.jsp?reptype=Specific Tech&tech="+tech+"&calender="+fromdate+"&calender1="+todate+"&inserted=yes");
	        return;
	}	

}catch(Exception e)
{
	out.print("Exception -->"+e);

}
finally
{
	con1.close();
	con2.close();
}
%>

