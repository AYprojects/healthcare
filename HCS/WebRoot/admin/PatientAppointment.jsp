
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.Session"%>
<%@page import="beans.Patient"%>
<%@page import="beans.Diseases"%>
<%@page import="org.hibernate.Query"%>
<%@page import="java.util.Iterator"%>
<%@page import="beans.Doctors"%><!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"><html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Health care website</title>
<meta name="description" content="Health care website">
<meta name="keywords" content="health, care, healthcare">
<link href="../css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<div id="conteiner"><div id="header"><div class="menu">
  <ul>
    <li><a href="index.jsp">Home</a></li>

    <li><a href="../Logout.jsp">Logout</a></li>
  </ul>
  </div><div id="logo"><table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="80"><img src="../images/logo.gif" alt="" width="80" height="76"></td>
    <td>Health Care System</td>
  </tr>
</table>
</div><div id="h_block">


</div>
</div><div class="body_txt">
  <h1>Patient Appointment</h1>
    <form action="./AppointmentController.jsp" method="post">
    <table width="400" height="200" align="center">
  <tr>
    <td>PatientName</td>
    <%
    SessionFactory sf=(SessionFactory)getServletContext().getAttribute("sf");
    Session s=sf.openSession();
    long pid=Long.parseLong(request.getParameter("pid"));
    Patient pa=(Patient)s.get(Patient.class,new Long(pid));
   Diseases dis=pa.getDiseases();
     %>
     <input type="hidden" name="pid" value="<%= pa.getPid() %>" />
    <td><%= pa.getPname() %></td>
  </tr>
  <tr>
    <td>Disease</td>
    <td><input type="text" name="dname" value="<%= dis.getDname() %>" disabled="disabled"/></td>
  </tr>
  <tr>
 <td>Doctor</td>
    <td>
    <select name="docid">
    <%
  Query q= s.createQuery("From Doctors where diseases=:dis ");
  q.setParameter("dis",dis);
  Iterator it=q.iterate();
  Doctors doc=null;
  while(it.hasNext()){
  doc=(Doctors)it.next();

     %>
    <option value="<%= doc.getDocid() %>"><%= doc.getUsername() %></option>
    <%} %>

    </select>
    </td>
  </tr>
  <tr>
    <td>Time</td>
    <td><input type="text" name="time"/></td>
  </tr>
  <tr>
    <td>Date</td>
    <td><input type="text" name="date" id="date"/><font color="red">[YYYY-MM-DD]</font></td>
  </tr>
  <tr>
    <td colspan="2" align="center"><input name="" type="submit" value="Proceed"></td>

  </tr>
</table>

    </form>


  <p>&nbsp;</p>
  </div>
<div><img src="../images/b1.gif" alt=""></div>
<div id="footer"><a href="#">Home Page</a>  |  <a href="#">About Us</a>  |  <a href="#">Our Clients</a>  |  <a href="#">Testimonials</a>  |  <a href="#">Price List</a>  |  <a href="#">Contact Details
  </a>
  <div class="bottom_addr">Aakanksh Yalamarthy. All Rights Reserved<br>
</div><div style=" margin-bottom:15px;"><img src="../images/b2.gif" alt=""></div>
</div>

</body>
</html>
