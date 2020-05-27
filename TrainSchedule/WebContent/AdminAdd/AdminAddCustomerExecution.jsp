<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Customer</title>
</head>
<body>

	<%
		try {
		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();
		Statement stmt = con.createStatement();

		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String state = request.getParameter("state");
		String namefirst = request.getParameter("fname");
		String namelast = request.getParameter("lname");
		String city = request.getParameter("city");
		String phone = request.getParameter("phone");
		String zipcode = request.getParameter("zipcode");
		String email = request.getParameter("email");

		String str = "INSERT INTO Customer(username, state, password, FirstName, LastName, city, phone, zipcode, email)"
		+ " VALUES('" + username + "', '" + state + "', '" + password + "', '" + namefirst + "', '" + namelast
		+ "', '" + city + "', '" + phone + "', '" + zipcode + "', '" + email + "'" + ")";
		

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