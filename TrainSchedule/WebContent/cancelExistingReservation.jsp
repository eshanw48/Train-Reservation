<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Delete Reservation</title>
</head>
<body>

	<%
	try{
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();
		Statement stmt = con.createStatement();
		
		String entity = request.getParameter("reservationID");
		Integer reserveID = Integer.valueOf(request.getParameter("reservationID"));
		String str = "SELECT * FROM Reservation WHERE reserve_num= "+"'"+ reserveID +"'";
		ResultSet result = stmt.executeQuery(str); //table with all reservation IDs  
		
		if(!result.next()){
			out.println("Reservation ID was not found. Return to the Reservations Page to try again.");
		}
		else{
			out.println("Your reservation was successfully deleted. Return to the Reservations Page.");
			String del = "DELETE FROM Reservation WHERE reserve_num= "+"'"+ reserveID +"'";
			PreparedStatement ps = con.prepareStatement(del);
			ps.execute();  
			con.close();
			//response.sendRedirect("home.jsp");
		}
		
	}
	catch (Exception e){}
%>

	<form method="get" action="reservations.jsp">
	<input type="submit" value="Return to Reservations" />
	</form>
	<br>

	<form method="post" action="index.jsp">
		<input type="submit" value="Logout">
	</form>
<br>

</body>
</html>