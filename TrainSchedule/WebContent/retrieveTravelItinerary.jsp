<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Reservation Information</title>
</head>
<body>

<p><b>Travel Itinerary</b></p>
	<%
	    
		try {	
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();	
			Statement stmt = con.createStatement();
			
			String reservation_show = request.getParameter("reservationID");
			String reservation_username = request.getParameter("username");
			
			//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp
			String str = "SELECT reserve_num,date,class,origin,dest,transitLine_name,`seat#` FROM testDB.Reservation WHERE testDB.Reservation.reserve_num="+reservation_show;
			
			/* if((request.getParameter("reservation_show")).compareTo("current")==0){
				str = "SELECT reserve_num,date,class,origin,dest,transitLine_name,`seat#` FROM testDB.Reservation WHERE testDB.Reservation.reserve_num=1";
				}
			else{
				str = "SELECT reserve_num,date,class,origin,dest,transitLine_name,`seat#` FROM testDB.Reservation WHERE testDB.Reservation.reserve_num1=";
			}*/
			
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);
			
			//Make an HTML table to show the results in:
			out.print("<table>");
			//make a row
			out.print("<tr>");
			//make a column
			
			out.print("<td>");
			out.print("Reservation Number");
			out.print("</td>");
			out.print("<td>");
			out.print("Date");
			out.print("</td>");
			out.print("<td>");
			out.print("Class");
			out.print("</td>");
			out.print("<td>");
			out.print("Origin");
			out.print("</td>");
			out.print("<td>");
			out.print("Destination");
			out.print("</td>");
			out.print("<td>");
			out.print("Transit Line");
			out.print("</td>");
			out.print("<td>");
			out.print("Seat Number");
			out.print("</td>");
			
			out.print("</tr>");

			//parse out the results
			while (result.next()) {
				//make a row
				out.print("<tr>");
				//make a column
				out.print("<td>");
				//Print out current bar or beer name:
				out.print(result.getString(1));
				out.print("</td>");
				out.print("<td>");
				out.print(result.getString(2));
				out.print("</td>");
				out.print("<td>");
				out.print(result.getString(3));
				out.print("</td>");
				out.print("<td>");
				out.print(result.getString(4));
				out.print("</td>");
				out.print("<td>");
				out.print(result.getString(5));
				out.print("</td>");
				out.print("<td>");
				out.print(result.getString(6));
				out.print("</td>");
				out.print("<td>");
				out.print(result.getString(7));
				out.print("</td>");
				out.print("</tr>");

			}
			out.print("</table>");

			//close the connection.
			db.closeConnection(con);
		} catch (Exception e) {
			out.print(e);
		}
	%>
	
	<br>

<form method="get" action="reservations.jsp">
	<input type="submit" value="Return to Reservations" />
	</form>
	<br>

	<form method="post" action="index.jsp">
		<input type="submit" value="Logout">
	</form>
	
	
</body>
</html>