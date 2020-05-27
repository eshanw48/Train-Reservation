<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Schedule Print-page</title>
</head>
<body>
	

<% 
		


		String stationName = request.getParameter("station");
%>

	
	
	<%
	
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();
	Statement st = con.createStatement();
	
    String[] titles = {"Available Number of Seats", "Trainsit Line", "Train Number", "Origin Station", "Destination Station", "Date of Travel", "Train Stop", "Arrival Time", "Departure Time", "Economy Class", "Business Class", "First Class"};
 	
    
    ResultSet rs = st.executeQuery("SELECT seatsAvail, transitLine_name, Schedule.tid, Origin, Destination, date, stationName, ArrivalTime, DepTime, fare_econ, fare_busi, fare_first FROM testDB.Schedule JOIN testDB.Stops on Schedule.tid=Stops.tid JOIN testDB.train on Stops.tid=train.tid JOIN testDB.Transit_line on train.transitLine_name=Transit_line.name WHERE stationName =" +"'" + stationName + "'");
    ResultSetMetaData rsmd = rs.getMetaData();
    
    %>
    
    <button onclick="location.href='customerRep.jsp';">Go Home</button><br>
    
    
    <%
    
    if (!rs.next() ) {
   
        out.println("No Train Schedules available based on the options you selected");
        return;
    } 
    
    %>
    
	
	<%
    
    int n = rsmd.getColumnCount();
    out.print("<table style=\"width:100%\">");
    
    out.print("<tr>");
    for (int i = 0; i < n; i++) {
    	 out.print("<th style='text-align:center'>" + titles[i] + "</th>");
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
    
    
    %>
    
 

</body>
</html>