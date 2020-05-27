<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Employee</title>
</head>
<body>
	<%
		try {
		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();
		Statement stmt = con.createStatement();

		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String ssn = request.getParameter("ssn");

		String str = "INSERT INTO Employee(LastName, FirstName, ssn)" + " VALUES('" + lname + "', '" + fname + "', "
		+ ssn + ")";

		stmt.executeUpdate(str);

		out.println("Update successful!");

	} catch (Exception e) {
		out.println(e);
		out.println("Update not successful!");
	}
	%>
	<form method=post action="../AdminHome.jsp">
		<input type="submit" value="Admin Home">
	</form>
</body>
</html>