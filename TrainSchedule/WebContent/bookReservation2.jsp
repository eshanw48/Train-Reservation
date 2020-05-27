<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>




<!DOCTYPE html>
<html>
<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>  Reservation</title>
	</head>

<body>

<p><b>Reservations</b><br><br>

<%
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();
		Statement stmt = con.createStatement();
		
		String discount = request.getParameter("discount");
		String classType = request.getParameter("class");
		String origin = request.getParameter("originReserve");
		String destination = request.getParameter("destinationReserve");
		String date = request.getParameter("dateReserve");
		String roundtrip = request.getParameter("yes_round_tripReserve");
		String username = request.getParameter("usernameReserve");
		String ssn = (String)session.getAttribute("ssn");
		String bookingFee = (String)session.getAttribute("bookingFee");
		
		//ResultSet origin = stmt.executeQuery("SELECT DISTINCT Origin FROM Schedule"); 
%>

		Reservation Details for <%out.print(session.getAttribute("username"));%>:
		<br>
<%
		
		out.println("Origin: "+origin);

		%><br><% 
		out.println("Destination: "+destination);
		%><br><% 
		out.println("Date: "+date);
		%><br><% 
		out.println("Class: "+classType);
		%><br><% 
		if(roundtrip!=null){
			roundtrip="1";
			out.println("Roundtrip: yes");
		}
		else{
			roundtrip="0";
			out.println("Roundtrip: no");
		}
		%><br><% 
		if(discount!=null){
			discount="0.9";
			out.println("Discount: yes");
		}
		else{
			discount="1.0";
			out.println("Discount: no");
		}
		
		
		
		try{
	
		String insert = "INSERT INTO Reservation(reserve_num,total_fare,travel_time,one_way,date,class,dest,origin,employee_ssn,Username,transitLine_name,`seat#`,bookingFee,train_tid)"
				+ "VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		
		//Create a Prepared SQL statement allowing you to introduce the parameters of the query
		PreparedStatement ps = con.prepareStatement(insert);

		ps.setInt(4, Integer.parseInt(roundtrip));
		ps.setDate(5, Date.valueOf(date));
		ps.setString(6,classType);
		ps.setString(7,destination);
		ps.setString(8,origin);
		ps.setString(9,ssn);
		ps.setString(10,username);
		ps.setInt(13, 10);
		
		String transitLineSearch = "SELECT DISTINCT transitLine_name FROM testDB.Schedule "+
				"JOIN testDB.train ON (Schedule.tid=train.tid) "+"WHERE Origin='"+origin+"' AND Destination='"+destination+"'";
		
		//out.print(transitLineSearch);
		ResultSet transitLine_result = stmt.executeQuery(transitLineSearch);
		transitLine_result.next();
		String transitLineName = (transitLine_result).getString(1);
		//out.print(transitLineName);

		ps.setString(11,transitLineName);
		
				ResultSet fare_undiscounted = null;
				
				if(classType.compareTo("first")==0){
					fare_undiscounted=stmt.executeQuery("SELECT fare_first FROM testDB.Transit_line WHERE name='"+transitLineName+"';");
				}else if(classType.compareTo("economy")==0){
					fare_undiscounted=stmt.executeQuery("SELECT fare_econ FROM testDB.Transit_line WHERE name='"+transitLineName+"';");
				}
				else{
					fare_undiscounted=stmt.executeQuery("SELECT fare_busi FROM testDB.Transit_line WHERE name='"+transitLineName+"';");
				}
				
				fare_undiscounted.next();
				Float totalFare=((fare_undiscounted.getFloat(1)))*(Float.parseFloat(discount));
		
		ps.setString(2,Float.toString(totalFare));
		
		ResultSet max_reservation_number=stmt.executeQuery("SELECT MAX(reserve_num) FROM Reservation");
		max_reservation_number.next();
		int reservationNumber = max_reservation_number.getInt(1)+1;
		
		ps.setInt(1,reservationNumber);
		
		ResultSet travelTime_result = stmt.executeQuery("SELECT DISTINCT TravelTime FROM testDB.Schedule"+
				" WHERE Origin='"+origin+"' AND Destination='"+destination+"';");
		
		travelTime_result.next();
		ps.setString(3,travelTime_result.getString(1));
		
		ResultSet seatNumber_result = stmt.executeQuery("SELECT MAX(`seat#`) FROM testDB.Reservation"+
				" WHERE transitLine_name='"+transitLineName+"';");
		
		seatNumber_result.next();
		ps.setInt(12,seatNumber_result.getInt(1)+1);
		
		//ps.setFloat(13,0); //Booking Fee should be 0 because no customer rep is making this booking 
		
		
		
		ResultSet trainID_result = stmt.executeQuery("SELECT tid FROM testDB.Schedule"+
				" WHERE Origin='"+origin+"' AND Destination='"+destination+"';");
		
		trainID_result.next();
		int trainID = trainID_result.getInt(1);
		
		ps.setInt(14,trainID);
		
		ps.executeUpdate();
		
		%><br><% 
		out.println("Thank you. Your booking has been made. Your Reservation ID is "+reservationNumber+". Enter this number on the Reservations Page to see your booking details");
		}
		
		catch (Exception ex) {
		out.print(ex);
		%><br><% 
		out.print("We were unable to make your Reservation. Please try again.");
		}
		
		%>
				

<br>


<form method="get" action="reservations2.jsp">
	<input type="submit" value="Return to Reservations" />
	</form>
	<br>

	<form method="post" action="index.jsp">
		<input type="submit" value="Logout">
	</form>
	
	

</body>
</html>