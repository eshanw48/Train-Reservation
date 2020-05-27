<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Reservation</title>
</head>
<body>



<%				
	try {

		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();

		//Create a SQL statement
		Statement stmt = con.createStatement();

		//Get parameters from the HTML form at the index.jsp
		
		String reserve_num = request.getParameter("reserve_num");
		
		String seatnum=request.getParameter("seat#");
		String date = request.getParameter("date");
		
		String one_way = request.getParameter("one_way");
		String class1 = request.getParameter("class");
		String origin = request.getParameter("origin");
		String dest = request.getParameter("dest");
		String transitLine_name = request.getParameter("transitLine_name");
		String train_tid = request.getParameter("train_tid");
		
		
		//Make an insert statement for the Sells table:
		String insert = "UPDATE Reservation SET date = ?, one_way= ?, class= ?, origin= ?, dest= ?, transitLine_name= ?, train_tid= ?, `seat#`= ? WHERE reserve_num =" + reserve_num; 
				
		//Create a Prepared SQL statement allowing you to introduce the parameters of the query
		PreparedStatement ps = con.prepareStatement(insert);

		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
		ps.setString(1, date);
		ps.setString(2, one_way);
		ps.setString(3, class1);
		ps.setString(4, origin);
		ps.setString(5, dest);
		ps.setString(6, transitLine_name);
		ps.setString(7, train_tid);
		ps.setString(8,seatnum);
		
		//ps.setString(2, question);
		//Run the query against the DB
		ps.executeUpdate();
		//Run the query against the DB
		
		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();
		out.print("Reservation has been updated");
		//out.println((String)answer);
		//out.println((String)QuestionId);
		

			
		
	} catch (Exception ex) {
		out.print("Can not be updated");
	
	}
%>




</body>
</html>