<%@ page language="java" %>
<%@ page import="java.io.File" %>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@page import ="javax.imageio.*" %>
<%@page import =" javax.imageio.ImageIO"%>
<%@page import="java.awt.Image"%>
<%@ page import=" javax.swing.JFrame"%>
<%@ page import="javax.swing.ImageIcon"%>
<%@page import="javax.swing.JLabel"%>
<%@ page import ="java.net.URLEncoder" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
</head>
<body>
<%
String s1=request.getParameter("ftpFile");
//System.out.println("********s1=====  "+s1);
 String s2="",s5="";
 int s3;
 s3=s1.indexOf(',');
 //System.out.println("********s3=====  "+s3);
 s2=s1.substring(s1.lastIndexOf(",")+1,s1.length());
 s5=s1.substring(0,s1.lastIndexOf(","));
 //System.out.println("********s2=====  "+s2);
 //System.out.println("********s5=====  "+s5);
 String s4="";
//s5=s5.replace(" ","\\ ");
 if(s2=="FleetView"|| s2.equalsIgnoreCase("FleetView") || s2.contains("FleetView") )
 {
	 
	 System.out.println("********FleetView >>>>>>>>  s5:- "+s5);
	 
	 //s5 = URLEncoder.encode(s5, "UTF-8");
	 
	 System.out.println("After encoding s5:- "+s5);
	 
	 s4="fleetviewcomplaints"+"/"+s5;
	 
	 //s5 = URLEncoder.encode(s5, "UTF-8");
	 
	 
 }
if(s2=="ERP" || s2.equalsIgnoreCase("ERP") || s2.contains("ERP"))
{
	 
	 s4="erpcomplaints"+"/"+s5;
	 
 }
if(s2=="Diary" || s2.equalsIgnoreCase("Diary") || s2.contains("Diary"))
{
	 
	 s4="diarycomplaints"+"/"+s5;
	 
}
if(s2=="Transworld" || s2.equalsIgnoreCase("Transworld") || s2.contains("Transworld"))
{
	 
	 s4="inwardcomplaints"+"/"+s5;
	
	
}
//System.out.println("********new s4>>>>>>>>"+s4);
////System.out.println(s1+"%% "+s1.replace("%"," ")); 
//s1=s1.replace(" ","\\ ");
////System.out.println("********  "+s1);
 File savedFile;
 
                     //  String FileUploadPath =getServletContext().getInitParameter("configuredUploadDir"); 
					  // //System.out.println("IIIIIII  "+FileUploadPath);
						//File uploadDir = new File(FileUploadPath);
						//System.out.println("IIIIIII  "+uploadDir.toString());
						//savedFile = new File("/TransworldDocs/complaints/"+s4+"/");//<-----this is statement running currently on main server  
						
						//config.getServletContext().getRealPath("/")+"Complaints/
						
						//savedFile = new File(config.getServletContext().getRealPath("/")+"/complaints/"+s5);
						
						savedFile = new File("/TransworldDocs/complaints/"+s4);
						//savedFile=new File(config.getServletContext().getRealPath("/")+"/complaints/"+s5);
						
						String url = "";
						System.out.println("******8   "+savedFile);
						//savedFile = new File("/images1/images1/Screenshot.png");
						System.out.println("*****((((  "+savedFile);
						
					if(savedFile.exists())
					{
						//out.println("********   Exist   ");
					}
					else
					{
						//out.println("******** Not Exist   ");
					}
					
		System.out.println("*******   "+savedFile);
		
		if(s4.contains("fleetviewcomplaints") || s4.contains("erpcomplaints"))
		{	
			
			
			
			String link = "http://myfleetview.com:8080/TransworldDocs/complaints/"+s4;
			System.out.println("in the fleetview complaints and the link is :- "+link);
%>
<!-- <a href="<%=link%>">click here</a>-->
			<img  src="<%=link%>" width="700" height="600" style="vertical-align: middle;margin-left: 10em;margin-top: 1em;">

<%
		}
		else
		{
			System.out.println("in the else block of the show ftp.jsp page ");
			
			System.out.println("saved file is :- "+savedFile.toString());
			
			%>
			<img  src="<%=savedFile %>" width="700" height="600" style="vertical-align: middle;margin-left: 10em;margin-top: 1em;">
			
			
			<% 
		}
System.out.println("*********8^^^^^^");
%>
</body>
</html>


