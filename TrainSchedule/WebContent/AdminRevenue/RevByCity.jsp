<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Revenue for <%=request.getParameter("destCity")%></title>
<style type="text/css">
h1 {
	text-align: center;
}
</style>
</head>
<body>
<h1>Revenue by City</h1>
<hr style="width:100%; text-align:left; margin-left:0">
	<%
		try {
		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();
		Statement stmt = con.createStatement();
		Statement stmt2 = con.createStatement();

		//String str2 = "SELECT dest, (SUM(total_fare)) tfare FROM Reservation GROUP BY dest";
		String str3 = "SELECT (SUM(bookingFee)) final FROM(SELECT * FROM Reservation WHERE dest='"
		+ request.getParameter("destCity") + "') gRes";
		ResultSet totalRevenueSet = stmt.executeQuery(str3);
		totalRevenueSet.next();
		String total = totalRevenueSet.getString("final");
		if(total==null){
			total="0";
		}

		String str = "SELECT r.* FROM Reservation r JOIN Stops s ON (r.dest=s.stationName) WHERE s.stationName='" + request.getParameter("destCity") + "'";
		ResultSet tableInfoSet = stmt2.executeQuery(str);

		//create the revenue total at the top
	%>

	<table>
		<tr>
			<td><h1>
					Total Revenue for
					<%=request.getParameter("destCity")%>
					: $
				</h1></td>
			<td><h1><%=total%></h1></td>
		</tr>

	</table>

	<br>
	<table border="1">
		<tr>
			<td>Reservation #</td>
			<td>Fare</td>
			<td>Travel Time</td>
			<td>One Way</td>
			<td>Date</td>
			<td>Class</td>
			<td>Trip Destination</td>
			<td>Trip Origin</td>
			<td>Employee SSN</td>
			<td>Customer Username</td>
			<td>Transit Line Name</td>
			<td>Seat Number</td>
			<td>Booking Fee</td>
			<td>Train ID</td>
		</tr>

		<%
			//create the table of all reservations
		while (tableInfoSet.next()) {
		%>
		<tr>
			<td><%=tableInfoSet.getString("reserve_num")%></td>
			<td><%=tableInfoSet.getString("total_fare")%></td>
			<td><%=tableInfoSet.getString("travel_time")%></td>
			<td><%=tableInfoSet.getString("one_way")%></td>
			<td><%=tableInfoSet.getDate("date")%></td>
			<td><%=tableInfoSet.getString("class")%></td>
			<td><%=tableInfoSet.getString("dest")%></td>
			<td><%=tableInfoSet.getString("origin")%></td>
			<td><%=tableInfoSet.getString("employee_ssn")%></td>
			<td><%=tableInfoSet.getString("Username")%></td>
			<td><%=tableInfoSet.getString("transitLine_name")%></td>
			<td><%=tableInfoSet.getString("seat#")%></td>
			<td><%=tableInfoSet.getString("bookingFee")%></td>
			<td><%=tableInfoSet.getString("train_tid")%></td>
		</tr>
		<%
			}
		%>
	</table>
	<%
		} catch (Exception e) {
		out.println(e);

	}
	%>
	<br>
	<br>
	<form method="post" action="AdminRevenueSearch.jsp">
		<input type="submit" value="Back To Search"/>
	</form>
</body>
</html>