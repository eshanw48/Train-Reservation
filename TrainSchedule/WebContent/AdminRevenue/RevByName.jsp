<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Revenue for <%=request.getParameter("fname")%> <%=request.getParameter("lname")%></title>
<script language="javascript">
	function reloadResults(firstname, lastname) {
		var f = document.form;
		f.method = "post";
		var username=document.getElementById("usernameList").value;
		f.action = "RevByName.jsp?fname="
				+ firstname + "&lname=" + lastname+"&username="+username;
		f.submit();
	}
	function undoFilter(firstname, lastname) {
		var f = document.form;
		f.method = "post";
		var username=document.getElementById("usernameList").value;
		f.action = "RevByName.jsp?fname="
				+ firstname + "&lname=" + lastname;
		f.submit();
	}

</script>
<style type="text/css">
h1 {
	text-align: center;
}
</style>
</head>
<body>
	<h1>Revenue by Name: <%=request.getParameter("fname") %> <%=request.getParameter("lname") %> </h1>
	<hr style="width:100%; text-align:left; margin-left:0">
	<%
		try {
		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();
		Statement stmt = con.createStatement();
		Statement stmt2 = con.createStatement();
		Statement stmt3 = con.createStatement();
		String fname=request.getParameter("fname");
		String lname=request.getParameter("lname");
		String username=null;
		
		try{
			username=request.getParameter("username");
		}
		catch(Exception e){
			
		}
		String str="";
		String str2="";
		if(username==null){
			
			//get the sum of the booking fees
			str = "SELECT SUM(bookingFee) FROM (SELECT r.bookingFee FROM Reservation r JOIN Customer c ON(r.Username=c.username)"
					+ " WHERE c.FirstName='" + fname + "' AND c.LastName='"
					+ lname + "') rev";
			//to get the reservation tuples for firstname lastname
			str2 = "SELECT * FROM Reservation r JOIN Customer c ON(r.Username=c.username)" + " WHERE c.FirstName='"
			+ fname + "' AND c.LastName='" + lname + "'";
			
		}
		else{
			%>Filtered by username: <%=username %>  <%
			str="SELECT SUM(bookingFee) FROM (SELECT r.bookingFee FROM Reservation r JOIN Customer c ON(r.Username=c.username)"
					+ " WHERE c.FirstName='" + fname + "' AND c.LastName='"
					+ lname + "' AND c.username='"+ username +"') rev";
			//to get the reservation tuples for firstname lastname
			str2 = "SELECT * FROM Reservation r JOIN Customer c ON(r.Username=c.username)" + " WHERE c.FirstName='"
			+ fname + "' AND c.LastName='" + lname + "' AND c.username='" + username + "'";
		}
		//to get the total amount for firstname lastname
		
		ResultSet totalTable = stmt.executeQuery(str);
		totalTable.next();
		String total = totalTable.getString(1);
		if(total==null){
			total="0";
		}
		String str3="SELECT DISTINCT c.username FROM Customer c  WHERE c.FirstName='"
				+ fname + "' AND c.LastName='" + lname + "'";
		ResultSet tableInfo = stmt2.executeQuery(str2);
		ResultSet usernameSet=stmt3.executeQuery(str3);
	%>
	<table>
		<tr>
			<td><h1>
					Total Revenue for
					<%=request.getParameter("fname")%>
					<%=request.getParameter("lname")%>
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
			while (tableInfo.next()) {
		%>
		<tr>
			<td><%=tableInfo.getString("reserve_num")%></td>
			<td><%=tableInfo.getString("total_fare")%></td>
			<td><%=tableInfo.getString("travel_time")%></td>
			<td><%=tableInfo.getString("one_way")%></td>
			<td><%=tableInfo.getDate("date")%></td>
			<td><%=tableInfo.getString("class")%></td>
			<td><%=tableInfo.getString("dest")%></td>
			<td><%=tableInfo.getString("origin")%></td>
			<td><%=tableInfo.getString("employee_ssn")%></td>
			<td><%=tableInfo.getString("Username")%></td>
			<td><%=tableInfo.getString("transitLine_name")%></td>
			<td><%=tableInfo.getString("seat#")%></td>
			<td><%=tableInfo.getString("bookingFee")%></td>
			<td><%=tableInfo.getString("train_tid")%></td>
		</tr>



		<%
			}
		%>
	</table>
	<br> Filter by Username
	<form method="post" name="form">
		<select id="usernameList">
			<option value="none" disabled="disabled" selected>username</option>
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

	}
	%>
	<br>
	<br>
	<form method="post" action="AdminRevenueSearch.jsp">
		<input type="submit" value="Back To Search"/>
	</form>
</body>
</html>