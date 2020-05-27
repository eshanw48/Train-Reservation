<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Train Schedules</title>
</head>
<body>
	

<% 
	String departureStation, arrivalStation, date, arg = null;

	session.setAttribute("home", "true");

	
	try {
		departureStation = session.getAttribute("departureStation").toString();
	} catch (Exception e) {
		departureStation = request.getParameter("departureStation");
		session.setAttribute("departureStation", departureStation);
	}
	try {
		arrivalStation = session.getAttribute("arrivalStation").toString();
	} catch (Exception e) {
		arrivalStation = request.getParameter("arrivalStation");
		session.setAttribute("arrivalStation", arrivalStation);
	}
	try {
		date = session.getAttribute("date").toString();
	} catch (Exception e) {
		date = request.getParameter("date");
		session.setAttribute("date", date);
	}

	try {
		arg = request.getParameter("arg");
		if (arg != null) session.setAttribute("arg", arg);
		else arg = session.getAttribute("arg").toString();
	} catch (Exception e) {
		session.removeAttribute("arg");
	}
	
	%>
	
	
	<p><b>Below are the available Train Schedules based on the options you selected:</b></p>

	
	
	<%
	
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();
	Statement st = con.createStatement();
	
    String[] titles = {"Trainsit Line", "Train Number", "Origin Station", "Destination Station", "Date of Travel", "Train Stop", "Arrival Time", "Departure Time", "Economy Class", "Business Class", "First Class"};
 	
    
    ResultSet rs = st.executeQuery("SELECT transitLine_name, Schedule.tid, Origin, Destination, date, stationName, ArrivalTime, DepTime, fare_econ, fare_busi, fare_first FROM testDB.Schedule JOIN testDB.Stops on Schedule.tid=Stops.tid JOIN testDB.train on Stops.tid=train.tid JOIN testDB.Transit_line on train.transitLine_name=Transit_line.name WHERE Origin = '" + departureStation + "' AND Destination = '" + arrivalStation + "' AND Date = '" + date + "' ");
    ResultSetMetaData rsmd = rs.getMetaData();
    
    %>
    
    <button onclick="location.href='home.jsp?home=true';">Go Home</button><br>
    
    
    <%
    
    if (!rs.next() ) {
   
        out.println("No Train Schedules available based on the options you selected");
        return;
    } 
    
    %>
    
		
		<form action="sort.jsp" method="post">
			<br>Sort By:
			<select name="Sort">
				<option value="ArrivalTime">Arrival Time</option>
				<option value="DepTime">Departure Time</option>
				<option value="Origin">Origin Station</option>
				<option value="Destination">Destination Station</option>
				<option value="fare_econ">Economy Class Fare</option>
				<option value="fare_busi">Business Class Fare</option>
				<option value="fare_first">First Class Fare</option>
			
			</select>
			
			<button>Go</button>
		</form><br>
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
    
    <p><b>View stops a train will make:</b></p>
    <form action="stops.jsp" method="post"> 
    <select name="stops">
    
    <%
     rs = st.executeQuery("SELECT DISTINCT Schedule.tid FROM testDB.Schedule JOIN testDB.Stops on Schedule.tid=Stops.tid JOIN testDB.train on Stops.tid=train.tid JOIN testDB.Transit_line on train.transitLine_name=Transit_line.name");

    
    while(rs.next()) {
			out.print("<option>" + rs.getString("Schedule.tid") + "</option>");
		}
    
%>
</select><br><br>
<button>Search Stops</button>
		</form>
		
	
			<p><b>Make Reservation:</b></p>
			
			<form action="reservations2.jsp" method="post"> 
			Departure Station:
			<select name="originReserve">
			
			
		<% 
			
			  rs = st.executeQuery("SELECT DISTINCT Origin FROM testDB.Schedule JOIN testDB.Stops on Schedule.tid=Stops.tid JOIN testDB.train on Stops.tid=train.tid JOIN testDB.Transit_line on train.transitLine_name=Transit_line.name WHERE Origin = '" + departureStation + "' AND Destination = '" + arrivalStation + "' AND Date = '" + date + "' ");
		
			  while(rs.next())
					  {
				 	 out.print("<option>" + rs.getString("Origin") + "</option>");
					  }
			
			rs = st.executeQuery("SELECT DISTINCT Destination FROM testDB.Schedule JOIN testDB.Stops on Schedule.tid=Stops.tid JOIN testDB.train on Stops.tid=train.tid JOIN testDB.Transit_line on train.transitLine_name=Transit_line.name WHERE Origin = '" + departureStation + "' AND Destination = '" + arrivalStation + "' AND Date = '" + date + "' ");
			
		%>		
		
		</select><br>
		
		Arrival Station:
		<select name="destinationReserve">
		
		<% 
		
					while(rs.next())
					  {
				 	 out.print("<option>" + rs.getString("Destination") + "</option>");
					  }
		
		rs = st.executeQuery("SELECT DISTINCT date FROM testDB.Schedule JOIN testDB.Stops on Schedule.tid=Stops.tid JOIN testDB.train on Stops.tid=train.tid JOIN testDB.Transit_line on train.transitLine_name=Transit_line.name WHERE Origin = '" + departureStation + "' AND Destination = '" + arrivalStation + "' AND Date = '" + date + "' ");
		
		
		%>
		
		</select><br>
		
		Date of Travel:
		
		<select name="dateReserve">
		
		<% 
		
					while(rs.next())
					  {
				 	 out.print("<option>" + rs.getString("date") + "</option>");
					  }
		
		
		%>
		
		</select><br>

		<button>Make Reservation</button>
		</form>
</body>
</html>