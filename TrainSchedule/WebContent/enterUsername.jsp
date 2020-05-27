<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<title>Enter Username</title>
</head>
<body>

<form method="post" action="search2.jsp">
		<%
		
		String departureStation, arrivalStation, date, arg = null;
		
		departureStation = request.getParameter("departureStation");
		session.setAttribute("departureStation", departureStation);
		
		arrivalStation = request.getParameter("arrivalStation");
        session.setAttribute("arrivalStation", arrivalStation);
        
		date = request.getParameter("date");
        session.setAttribute("date", date);
        
        String username = request.getParameter("username");
		session.setAttribute("username", username);
		
		response.sendRedirect("search.jsp");

        
		
		
		%>
	</form>

</body>
</html>