<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Train Reservation Login</title>
	</head>
<body>

Login
<br>
	<form method="post" action="findAccount.jsp">
		<table>
			<tr>    
				<td>Username</td><td><input type="text" name="username"></td>
			</tr>
			<tr>
				<td>Password</td><td><input type="text" name="password"></td>
			</tr>
		</table>
		<input type="submit" value="Login">
	</form>
<br>

<%


%>
Are you an employee?
<br>
	<form method="post" action="findRep.jsp">
		<table>
			<tr>    
				<td>SSN</td><td><input type="text" name="ssn"></td>
			</tr>
			<tr>    
				<td>First name</td><td><input type="text" name="firstname"></td>
			</tr>
			<tr>    
				<td>Last name</td><td><input type="text" name="lastname"></td>
			</tr>
		</table>
		<input type="submit" value="Login">
	</form>
<br>


Create a new account:
<br>
	<form method="post" action="newAccount.jsp">
		<table>
			<tr>    
				<td>Username</td><td><input type="text" name="usernameNew"></td>
			</tr>
			<tr>
				<td>Password</td><td><input type="text" name="passwordNew"></td>
			</tr>
		</table>
		<input type="submit" value="Create">
	</form>
<br>



</body>
</html>