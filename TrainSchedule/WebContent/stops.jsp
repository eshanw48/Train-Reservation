<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Train Stops</title>
</head>
<body>

 <button onclick="location.href='search.jsp';">Go Back</button><br>

<% 
	String stops = null;
	

	session.setAttribute("stops", request.getParameter("stops"));
	stops = request.getParameter("stops");



	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();
	Statement st = con.createStatement();
	
	ResultSet rs = st.executeQuery("SELECT DISTINCT stationName FROM testDB.Schedule JOIN testDB.Stops on Schedule.tid=Stops.tid JOIN testDB.train on Stops.tid=train.tid JOIN testDB.Transit_line on train.transitLine_name=Transit_line.name WHERE Schedule.tid = '" + stops + "' ");
    ResultSetMetaData rsmd = rs.getMetaData();
    
    int n = rsmd.getColumnCount();
    out.print("<table style=\"width:100%\">");
    
    out.print("<tr>");
    for (int i = 0; i < n; i++) {
    	
    	 out.print("<th style='text-align:center'>" + "Train stops for tid:" + stops + "</th>");
    }
    out.print("</tr>");
    
    

    while (rs.next()) {
    	out.print("<tr>");
		for (int i = 1; i <= n; i++) {
			
			 out.print("<td style='text-align:center'>" + rs.getString(i) + "</td>");
		}
		out.print("</tr>");
    }
    out.print("</table>");
    
    con.close();
%>

</body>
</html>