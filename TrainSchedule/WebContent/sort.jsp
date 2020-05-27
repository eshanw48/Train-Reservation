<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<html>
<head>
<meta charset="UTF-8">
<title>Sort</title>
</head>
<body>


	<%
	
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();
		Statement stmt = con.createStatement();
		
		String sorttemp = request.getParameter("Sort");
			

		ResultSet rs = stmt.executeQuery("SELECT transitLine_name, Origin, Destination, date, DepTime, ArrivalTime, fare_econ, fare_busi, fare_first FROM testDB.Schedule JOIN testDB.Stops on Schedule.tid=Stops.tid JOIN testDB.train on Stops.tid=train.tid JOIN testDB.Transit_line on train.transitLine_name=Transit_line.name ORDER BY'" + sorttemp + "'");
		
		
		response.sendRedirect("search.jsp");
	
%>

</body>
</html>