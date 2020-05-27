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
<style type="text/css">
h1 {
	text-align: center;
}
</style>
</head>
<body>
	<h1>Add Employee</h1>
	<hr style="width:100%; text-align:left; margin-left:0">
	<form method="post" action="AdminAddEmployeeExecution.jsp">
		<table>
			<tr>
				<td>First Name</td>
				<td><input type="text" name="fname"></td>
			</tr>
			<tr>
				<td>Last Name</td>
				<td><input type="text" name="lname"></td>
			</tr>
			<tr>
				<td>SSN</td>
				<td><input type="text" name="ssn"></td>
			</tr>

		</table>
		<input type="submit" value="Add">
	</form>
	<form method="post" action="../AdminHome.jsp">
		<input type="submit" value="Cancel"/>
	</form>
</body>
</html>