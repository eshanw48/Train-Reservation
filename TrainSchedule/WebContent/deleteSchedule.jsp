<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Delete Schedule</title>
</head>
<body>

	<%	
	try{
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();
		Statement stmt = con.createStatement();
		
		//Primary key
		String ScheduleID = request.getParameter("ScheduleID");
	
		
		int i=stmt.executeUpdate("DELETE FROM testDB.Schedule WHERE ScheduleID="+ ScheduleID);
		out.println("Data Deleted Successfully!");
	
		
	}

	catch (Exception e){
		out.println("Data couldn't delete!");
	}
%>
</body>
</html>