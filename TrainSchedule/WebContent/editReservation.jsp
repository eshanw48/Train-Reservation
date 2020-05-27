<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<title>Reservation Edit-Page</title>
</head>
<body>

<%String reserve_num = request.getParameter("reserve_num"); 
	session.setAttribute("home", "true");%>


<form method = "post" action = "updateReservation.jsp">

<input type="hidden" name="reserve_num" value="<%=reserve_num%>">

Seat Number: <input type="text" name="seat#">
<br /> 
Date: <input type="text" name="date">
<br /> 
One Way: 
<select name="one_way">
<option value="1">Yes</option>
<option value="0">No</option>
</select>
<br /> 
class: <input type="text" name="class">
<br /> 
Origin: <input type="text" name="origin">
<br /> 
Destination: <input type="text" name="dest">
<br /> 
Transit Line: <input type="text" name="transitLine_name">
<br /> 
Train: <input type="text" name="train_tid">
<br /> 



<input type="submit" value="change">
</form>

</body>
</html>