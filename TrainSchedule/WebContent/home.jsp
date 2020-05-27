<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<title>Home</title>
	</head>
	<body>
	
	<%
	if (session.getAttribute("home") != null) response.sendRedirect("logout.jsp?home=true");
	%>

		<p><b>Welcome <%=session.getAttribute("username")%>
		<a href='index.jsp'>Log out</a></b></p>
		<p><b>Check your reservations</b></p>
  		<button onclick="location.href='reservations.jsp';">Go</button>
  		
  		
  		
  		<p><b>Ask questions and see FAQs</b></p>
  		<button onclick="location.href='messages.jsp';">Go</button>
  		
  		
  		
  		<p><b>View Delayed Routes</b></p>
  		<button onclick="location.href='delayedroutes.jsp'">Go</button>
  		
		<p><b>Search Trains</b></p>
		<form action="search.jsp" method="post"> 
			Departure Station:
			<select name="departureStation">
				<%
					ApplicationDB db = new ApplicationDB();	
					Connection con = db.getConnection();
					Statement st = con.createStatement();
					ResultSet rs;
		      		rs = st.executeQuery("SELECT DISTINCT Origin FROM testDB.Schedule JOIN testDB.Stops on Schedule.tid=Stops.tid JOIN testDB.train on Stops.tid=train.tid JOIN testDB.Transit_line on train.transitLine_name=Transit_line.name");
		      		while(rs.next()) {
		      			
		      			out.print("<option>" + rs.getString("Origin") + "</option>");
		      			
		      		}
		      		rs = st.executeQuery("SELECT DISTINCT Destination FROM testDB.Schedule JOIN testDB.Stops on Schedule.tid=Stops.tid JOIN testDB.train on Stops.tid=train.tid JOIN testDB.Transit_line on train.transitLine_name=Transit_line.name");
	      		%>
			</select><br>
			Arrival Station:
			<select name="arrivalStation">
				<%
		      		while(rs.next()) {
		      			out.print("<option>" + rs.getString("Destination") + "</option>");
		      		}
				rs = st.executeQuery("SELECT DISTINCT Date FROM testDB.Schedule JOIN testDB.Stops on Schedule.tid=Stops.tid JOIN testDB.train on Stops.tid=train.tid JOIN testDB.Transit_line on train.transitLine_name=Transit_line.name");
		      		
	      		%>
			</select><br>
			Date of Travel:
			<select name="date">
			
				<%
		      		while(rs.next()) {
		      			out.print("<option>" + rs.getString("Date") + "</option>");
		      		}
		      		con.close();
	      		%>
				
			</select><br><br>
			<button>Search</button>
		</form>
	</body>
</html>