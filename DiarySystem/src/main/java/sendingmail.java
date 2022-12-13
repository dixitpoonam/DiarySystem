import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

import javax.mail.*;
import javax.mail.internet.*;
import java.util.*;
import javax.activation.*;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Authenticator;
    
import java.util.*; 
import java.net.*;
import java.sql.*;
import java.text.*;

public class sendingmail extends HttpServlet
{
    public void service(HttpServletRequest request, HttpServletResponse response) throws IOException
    {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
         
       // String email="kiran.khairnar@bharti.in";
	//String email1="Amol.Soman@airtel.in";
	//String email2="Tejaswini.Chogtu@airtel.in";
   //     String email3="a_laddha@myfleetview.com";
      
        String email="a_ansari@transworld-compressor.com";
    	String email1="p_khedkar@transworld-compressor.com";
    	String email2="g_garg@transworld-compressor.com";
        String email3="a_mahajan@transworld-compressor.com";

	HttpSession sess=request.getSession(true);
	String sender=sess.getAttribute("DisplayName").toString();
	String senderemail=sess.getAttribute("email").toString();	

	Connection conn = null;
        String url = "jdbc:mysql://103.241.181.36/";
	
        String dbName = "db_CustomerComplaints";
        String driver = "org.gjt.mm.mysql.Driver"; 
        String userName = "fleetview"; 
        String password = "1@flv";
        String msgbdy="";
    
        try
        { 
            Class.forName(driver).newInstance();
            conn = DriverManager.getConnection(url+dbName,userName,password);
            Statement stmt1=conn.createStatement();
            ResultSet rs1=null; 
            String sql1="";
		
		int i=0, j=0;	
		String ss="";
		String[] mobs=new String[100];
		String[] units=new String[100];	
		
		String mobnos=request.getParameter("mobsend");	
		String ids=request.getParameter("id");
		String unitids=request.getParameter("units");

		StringTokenizer st1 = new StringTokenizer(mobnos, ",");
	     	while (st1.hasMoreTokens()) 
		{
        		mobs[i]=st1.nextToken();
			i++;
		}
		
		StringTokenizer st2 = new StringTokenizer(unitids, ",");
	     	while (st2.hasMoreTokens()) 
		{
        		units[j]=st2.nextToken();
			j++;
		}

		StringTokenizer st = new StringTokenizer(ids, ",");
	     	while (st.hasMoreTokens()) 
		{
        		ss=st.nextToken();
			sql1="update t_reprovisionnos set MailSent='Yes' where SrNo='"+ss+"' ";
			//out.print(sql1);
			stmt1.executeUpdate(sql1);
		}
		
		
		out.println("<table border='10' width='350px' align='center'>");
		out.print("<tr> <td colspan='2' align='center'> <B> Numbers Sent for Re-Provision</B> </td></tr>");
		for(int k=0; k<i; k++)
		{ 
			out.print("<tr> <td align='center'>"); 
			out.print(units[k]+"--"+mobs[k]);
			msgbdy=msgbdy+units[k]+"--"+mobs[k]+"\n";
			out.print("</td> </tr>");
		} 

		out.println("</table>");
	} 
        catch (Exception e)
        {
            out.println("Exception--->"+e);
        }

	try
        {
              Properties props = new Properties();
          
 
               String host="smtp.transworld-compressor.com";
               String protocol="smtp";
 
              	String user="support@transworld-compressor.com";
		String pass="transworld";

	
              props.put("mail.smtp.starttls.enable","true");
              props.put("mail.smtp.auth", "true");
              props.put("mail.smtp.user", "user");
              props.put("mail.smtp.password", "pass");  
    
              props.put("mail.store.protocol", protocol);
              props.put("mail.smtps.host", host);
              java.security.Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());

              Session session = Session.getDefaultInstance(props, null);

               // Construct the message
               Message msg = new MimeMessage(session);

               msg.setSubject("AR & GPRS Need To Be Checked");

               Address add1=new InternetAddress(email,"");
               Address ccAddress1=new InternetAddress(email1,"");
 	       Address ccAddress2=new InternetAddress(email2,"");
 	       Address ccAddress3=new InternetAddress(email3,"");
	       Address ccAddress4=new InternetAddress(senderemail,"");

               msg.addRecipient(Message.RecipientType.TO,add1);
	       msg.addRecipient(Message.RecipientType.CC, ccAddress1);
	       msg.addRecipient(Message.RecipientType.CC, ccAddress2);
	       msg.addRecipient(Message.RecipientType.CC, ccAddress3);
	       msg.addRecipient(Message.RecipientType.CC, ccAddress4);

		String signature="Regards, \n"+sender+"\n Transworld Compressor Technology Ltd.\n C 3/8 Rakshalekha, Koregaon Park, \n PUNE 411 001  INDIA \n Ph : +91 20 26131676, +91 20 41303035   Fax +91 20 26139599";

               Address fromAddress=new InternetAddress("support@transworld-compressor.com","Transworld"); // in second "", it is short name
               msg.setFrom(fromAddress);

  		msg.setContent("Hi.\n Please Reprovision & Activate AR below no.\n"+msgbdy+"\n Confirm once done. \n \n"+signature , "text/plain"); 
         
               // Send the message
               Transport t = session.getTransport("smtps");
               try
               {
	            t.connect(host, user, pass);
                    t.sendMessage(msg, msg.getAllRecipients());
                    //out.print("Your message has been sent");
               } 
               catch(Exception e)
               {
                   System.out.print("Exception----->"+e);
               } 
               finally 
               {
                   conn.close();
	           t.close();
               } 
          
               Transport.send(msg);
               
       }
        catch(Exception e)
        {
             out.println("<table border='0' width='350px' align='center'>");
	 	out.print("<tr> <td> Mail has been sent. Click <a href='reprovisionrep.jsp'>Here </a> to go back");
		out.print("</td> </tr> </table>");	
              //response.sendRedirect("mainpage.jsp?inserted=yes&ordrrno="+ordrrno);
              // return; 
 
        }	

    }  
}

