<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<title>Schedule Check-Page</title>
</head>
<body>

		<b>Search by Origin/Destination</b>
<br>
	<form method="post" action="printScheduleWithOrigin.jsp">
		<table>
			<tr>    
				<td>Origin:</td><td><input type="text" name="origin"></td>
			</tr>
			<tr>
				<td>Destination:</td><td><input type="text" name="dest"></td>
			</tr>
		</table>
		<input type="submit" value="search">
	</form>
	
	<br />
	
	<b>Search by Station</b>
<br>
	<form method="post" action="printScheduleWithStation.jsp">
		<table>
			<tr>    
				<td>Station:</td><td><input type="text" name="station"></td>
			</tr>
		</table>
		<input type="submit" value="search">
	</form>
<br>
</body>
</html>