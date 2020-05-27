<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Revenue by City</title>
<style type="text/css">
h1 {
	text-align: center;
}
</style>
</head>
<body>
<h1>Revenue by City</h1>
<hr style="width:100%; text-align:left; margin-left:0">
<%! 
	public String numtoMonth(int a){
		switch(a){
		case 1:
			return "Jan";
		case 2:
			return "Feb";
		case 3:
			return "Mar";
		case 4:
			return "Apr";
		case 5:
			return "May";
		case 6:
			return "Jun";
		case 7:
			return "Jul";
		case 8:
			return "Aug";
		case 9:
			return "Sep";
		case 10:
			return "Oct";
		case 11:
			return "Nov";
		case 12:
			return "Dec";
		default:
			return null;
		}
	
}
%>
	<%
		try {
		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();
		Statement stmt = con.createStatement();
		Statement stmt2=con.createStatement();
		
		int month=Integer.parseInt(request.getParameter("month"));
		int year=Integer.parseInt(request.getParameter("year"));
		String str="SELECT SUM(bookingFee) FROM (SELECT * FROM Reservation r WHERE EXTRACT(MONTH FROM r.date)= '"
						+month+"' AND EXTRACT(YEAR FROM r.date)= '"+ year +"') rev";
		String str2="SELECT * FROM Reservation r WHERE EXTRACT(MONTH FROM r.date)= '"+
						month+"' AND EXTRACT(YEAR FROM r.date)= '"+ year +"'";
		
		ResultSet totalInfo=stmt.executeQuery(str);
		totalInfo.next();
		String total=totalInfo.getString("SUM(bookingFee)");
		if(total==null){
			total="0";
		}
	
		ResultSet tableInfo=stmt2.executeQuery(str2);
		
		%>
	<table>
		<tr>
			<td><h1>
					Total Revenue for Month
					<%=numtoMonth(Integer.parseInt(request.getParameter("month")))%> <%=year %>
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
	<%
		}
	catch (Exception e) {

	}
	%>
	<form method="post" action="../AdminHome.jsp">
		<input type="submit" value="Home"/>
	</form>
	
</body>
</html>