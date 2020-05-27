<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<title>Customer-Representative Page</title>
</head>
<body>
<p>
<b>Welcome <%=session.getAttribute("firstname")%> <%=session.getAttribute("lastname")%> to the Customer Representative page.
<a href='index.jsp'>Log out</a></b></p>

<p><u>Answer Customers' Questions</u></p>
<button onclick="location.href='ViewCustomerQuestions.jsp'">Answer</button>

<p><u>Train Schedule Information</u></p>
<button onclick="location.href='checkSchedule.jsp'">Go</button>

<p><u>Edit information on Train Schedule</u></p>
<button onclick="location.href='ScheduleEditing.jsp'">Add</button>

<p><u>Add information on Train Schedule</u></p>
<button onclick="location.href='inputAddSchedule.jsp'">Add</button>

<p><u>Reservations</u></p>
<button onclick="location.href='checkReservartions.jsp'">Go</button>

<p><u>Add Reservations</u></p>
<p>Search Trains</p>
		<form action="enterUsername.jsp" method="post"> 
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
				
			</select>
			
			<br />
			Add reservation for user
			<input type="text" name="username"> 
			
			<br><br>
			<button>Search</button>
		</form>
</body>
</html>