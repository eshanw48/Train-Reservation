<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Schedule Add-page</title>
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
		
		String tid=request.getParameter("tid");
		String origin = request.getParameter("origin");
		String dest = request.getParameter("dest");
		String Date = request.getParameter("Date");
		String TravelTime = request.getParameter("TravelTime");
		
		
		//Make an insert statement for the Sells table:
		String insert = ("insert into testDB.Schedule(tid,Origin,Destination,Date,TravelTime)values('"+tid+"','"+origin+"','"+dest+"','"+Date+"','"+TravelTime+"')");
				
		//Create a Prepared SQL statement allowing you to introduce the parameters of the query
		PreparedStatement ps = con.prepareStatement(insert);

		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
		
		//ps.setString(2, question);
		//Run the query against the DB
		ps.executeUpdate();
		//Run the query against the DB
		
		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();
		out.print("A new schedule has been added");
		//out.println((String)answer);
		//out.println((String)QuestionId);
		

			
		
	} catch (Exception ex) {
		out.print("Can not be inserted");
	
	}
%>
</body>
</html>