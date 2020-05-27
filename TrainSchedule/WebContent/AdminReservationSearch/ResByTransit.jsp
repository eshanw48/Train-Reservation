<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reservation By Transit and Train</title>
<style type="text/css">
h1 {
	text-align: center;
}
</style>
</head>
<body>
<h1>Reservation by Transit</h1>
<hr style="width:100%; text-align:left; margin-left:0">
Reservations for <%=request.getParameter("transitLine")%> #<%=request.getParameter("trainNumber") %>
	<table border="1">
		<tr>
			<td>Reserve No.</td>
			<td>Total Fare</td>
			<td>Travel Time</td>
			<td>One Way</td>
			<td>Date</td>
			<td>Class</td>
			<td>Trip Destination</td>
			<td>Trip Origin</td>
			<td>Employee SSN</td>
			<td>Customer Username</td>
			<td>Transit Line</td>
			<td>Seat Number</td>
			<td>Booking Fee</td>
			<td>Train ID</td>

		</tr>
		<%
			String transitLine = request.getParameter("transitLine");
		int trainNumber = Integer.parseInt(request.getParameter("trainNumber"));

		try {
			//connect to the database
			ApplicationDB db = new ApplicationDB();
			Connection con = db.getConnection();
			Statement stmt = con.createStatement();

			String str = "SELECT * FROM Reservation WHERE transitLine_name= '" + transitLine + "'" + " AND train_tid="
			+ trainNumber;

			ResultSet set = stmt.executeQuery(str);

			//make a table of employees
			while (set.next()) {
		%>

		<tr>
			<td><%=set.getString("reserve_num")%></td>
			<td><%=set.getString("total_fare")%></td>
			<td><%=set.getString("travel_time")%></td>
			<td><%=set.getString("one_way")%></td>
			<td><%=set.getDate("date")%></td>
			<td><%=set.getString("class")%></td>
			<td><%=set.getString("dest")%></td>
			<td><%=set.getString("origin")%></td>
			<td><%=set.getString("employee_ssn")%></td>
			<td><%=set.getString("Username")%></td>
			<td><%=set.getString("transitLine_name")%></td>
			<td><%=set.getString("seat#")%></td>
			<td><%=set.getString("bookingFee")%></td>
			<td><%=set.getString("train_tid")%></td>
		</tr>
		<%
			}
		%>
	</table>
	<%
		} catch (Exception e) {
		out.println("Search Failed");
	}
	%>

	<br>
	<form method="post" action="../AdminHome.jsp">
		<input type="submit" value="Return Home">
	</form>
	<br>

</body>
</html>