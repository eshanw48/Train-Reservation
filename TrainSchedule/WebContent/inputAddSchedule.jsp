<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Schedule Add-page</title>
</head>
<body>

<form method = "post" action = "addSchedule.jsp">

Train: <input type="text" name="tid">
<br /> 
Origin: <input type="text" name="origin">
<br /> 
Destination: <input type="text" name="dest">
<br /> 
Date: <input type="text" name="Date">
<br /> 
Travel time: <input type="text" name="TravelTime">
<br /> 


<input type="submit" value="Insert">
</form>
</body>
</html>