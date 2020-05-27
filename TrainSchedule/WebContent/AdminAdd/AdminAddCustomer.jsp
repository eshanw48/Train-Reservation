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
<style type="text/css">
h1 {
	text-align: center;
}
</style>
</head>
<body>
<h1>Add Customer</h1>
<hr style="width:100%; text-align:left; margin-left:0">
<form method="post" action="AdminAddCustomerExecution.jsp">
		<table>
			<tr>
				<td>Username</td>
				<td><input type="text" name="username"></td>
			</tr>
			<tr>
				<td>State</td>
				<td><input type="text" name="state"></td>
			</tr>
			<tr>
				<td>Password</td>
				<td><input type="text" name="password"></td>
			</tr>
			<tr>
				<td>First Name</td>
				<td><input type="text" name="fname"></td>
			</tr>
			<tr>
				<td>Last Name</td>
				<td><input type="text" name="lname"></td>
			</tr>
			<tr>
				<td>City</td>
				<td><input type="text" name="city"></td>
			</tr>
			<tr>
				<td>Phone</td>
				<td><input type="text" name="phone"></td>
			</tr>
			<tr>
				<td>Zipcode</td>
				<td><input type="text" name="zipcode"></td>
			</tr>
			<tr>
				<td>Email</td>
				<td><input type="text" name="email"></td>
			</tr>
		</table>
		<input type="submit" value="Add">
	</form>
	<form method="post" action="../AdminHome.jsp">
		<input type="submit" value="Cancel"/>
	</form>
</body>
</html>