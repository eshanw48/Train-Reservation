<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reservation By Customer</title>
</head>
<script language="javascript">
	function reloadResults(firstname, lastname) {
		var f = document.form;
		f.method = "post";
		var username=document.getElementById("usernameList").value;
		f.action = "ResByCust.jsp?fname="
				+ firstname + "&lname=" + lastname+"&username="+username;
		f.submit();
	}
	function undoFilter(firstname, lastname) {
		var f = document.form;
		f.method = "post";
		var username=document.getElementById("usernameList").value;
		f.action = "ResByCust.jsp?fname="
				+ firstname + "&lname=" + lastname;
		f.submit();
	}

</script>
<style type="text/css">
h1 {
	text-align: center;
}
</style>
<body>
	<h1>
		Reservation by Customer:
		<%=request.getParameter("fname")%>
		<%=request.getParameter("lname")%></h1>
	<hr style="width: 100%; text-align: left; margin-left: 0">

	<%
		String fname = request.getParameter("fname");
	String lname = request.getParameter("lname");
	String username = null;
	try {
		username = request.getParameter("username");
	} catch (Exception e) {

	}

	try {
		//connect to the database
		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();
		Statement stmt = con.createStatement();
		Statement stmt2 = con.createStatement();
		String str = "";
		if (username == null) {
			str = "SELECT * FROM Reservation r JOIN Customer c ON (r.Username=c.username)" + " WHERE c.FirstName='" + fname
			+ "' AND c.LastName='" + lname + "'";
		} else {
			str = "SELECT * FROM Reservation r JOIN Customer c ON (r.Username=c.username)" + " WHERE c.username='"
			+ username + "'";
			%>
			<b>Filtered by Username: <%= username %></b>
			<% 
		}
		ResultSet set = stmt.executeQuery(str);

		String str2 = "SELECT DISTINCT r.Username FROM Reservation r JOIN Customer c ON (r.Username=c.username)"
		+ " WHERE c.FirstName='" + fname + "' AND c.LastName='" + lname + "'";
		ResultSet usernameSet = stmt2.executeQuery(str2);
	%>
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
			<td>Train Number</td>

		</tr>

		<%
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

	<br> Filter by Username
	<form method="post" name="form">
		<select id="usernameList">
			<%
				while (usernameSet.next()) {
			%>
			<option value="<%=usernameSet.getString("username")%>"><%=usernameSet.getString("username")%></option>
			<%
				}
			%>
		</select>

		<button name="filterButton"
			onclick="reloadResults(&quot;<%=fname%>&quot;,&quot;<%=lname%>&quot;)">Filter
			By User</button>

		<br>
		<button name="undoFilterButton"
			onclick="undoFilter(&quot;<%=fname%>&quot;,&quot;<%=lname%>&quot;)">
			Revert Filter</button>
	</form>

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