<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Confirmation</title>
</head>
<body>

	<%
		try {
		//connect to the database
		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();
		Statement stmt = con.createStatement();

		String iUsername = request.getParameter("iUsername");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String namefirst = request.getParameter("fname");
		String namelast = request.getParameter("lname");
		String city = request.getParameter("city");
		String state = request.getParameter("state");
		String phone = request.getParameter("phone");
		String zipcode = request.getParameter("zipcode");
		String email = request.getParameter("email");

		String str = "UPDATE Customer SET username='" + username + "'" + ", " + "password='" + password + "'" + ", "
		+ "state='" + state + "'" + ", " + "FirstName='" + namefirst + "'" + ", " + "LastName='" + namelast + "'"
		+ ", " + "city='" + city + "'" + ", " + "phone='" + phone + "'" + ", " + "zipcode='" + zipcode + "'" + ", "
		+ "email='" + email + "'" + " " + "WHERE username='" + iUsername + "'";

		stmt.executeUpdate(str);

		out.println("Update Successful!");

	} catch (Exception e) {
		out.println(e);
	}
	%>

	<form method=post action="../AdminHome.jsp">
		<input type="submit" value="Admin Home">
	</form>

</body>
</html>