<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<title>Schedule Edit-Page</title>
</head>
<body>
<form method = "post">

<table border = "2">
<tr>

<td>Transit line name</td>
<td>Train</td>
<td>Origin</td>
<td>Destination</td>
<td>Available Number of Seats</td>
<td>Stops</td>
<td>Date</td>
<td>Departure time</td>
<td>Arrival time</td>
<td>Travel time</td>
<td>Fare economy</td>
<td>Fare business</td>
<td>Fare first</td>
<td>EDIT</td>
<td>DELETE</td>
</tr>

<%

try{
	
	//Get the database connection
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();
	
	//Create a SQL statement
	Statement stmt1 = con.createStatement();	
	
	String str = "SELECT * FROM testDB.Schedule JOIN testDB.Stops on Schedule.tid=Stops.tid JOIN testDB.train on Stops.tid=train.tid JOIN testDB.Transit_line on train.transitLine_name=Transit_line.name";
	
	ResultSet result = stmt1.executeQuery(str);
	
	
	while(result.next()){
		
		%>
		
			<tr>
			<td><%=result.getString("transitLine_name") %></td>
			<td><%=result.getString("Schedule.tid") %></td>
			<td><%=result.getString("Origin") %></td>
			<td><%=result.getString("Destination") %></td>
			<td><%=result.getString("seatsAvail") %></td>
			<td><%=result.getString("stationName") %></td>
			<td><%=result.getString("Date") %></td>
			<td><%=result.getString("DepTime") %></td>
			<td><%=result.getString("ArrivalTime") %></td>
			<td><%=result.getString("TravelTime") %></td>
			<td><%=result.getString("fare_econ") %></td>
			<td><%=result.getString("fare_busi") %></td>
			<td><%=result.getString("fare_first") %></td>
			<td><a href="editSchedule.jsp?scheduleID=<%=result.getString("ScheduleID")%>">EDIT</a></td>
			<td><a href="deleteSchedule.jsp?scheduleID=<%=result.getString("ScheduleID")%>">DELETE</a></td>
			</tr>
			
			<%
			
	}
			%>
			
			</table>
			<%
			result.close();
			stmt1.close();
			con.close();
			
	
}
catch (Exception ex) {
	out.print("Error retrieving questions");
}

%>


</form>
</body>
</html>