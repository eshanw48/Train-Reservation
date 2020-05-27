<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<title>Schedule Edit-Page</title>
</head>
<body>

<%
String ScheduleID=request.getParameter("scheduleID");
%>


<form method = "post" action = "updateSchedule.jsp">

<input type="hidden" name="ScheduleID" value="<%=ScheduleID%>">


Transit line name: <input type="text" name="transitLineName">
<br /> 
Train: <input type="text" name="tid">
<br /> 
Origin: <input type="text" name="origin">
<br /> 
Destination: <input type="text" name="dest">
<br /> 
Available Number of Seats: <input type="text" name="seatsAvail">
<br /> 
Stops at: <input type="text" name="stationName">
<br /> 
Date: <input type="text" name="Date">
<br /> 
Departure time: <input type="text" name="Deptime">
<br /> 
Arrival time: <input type="text" name="ArrivalTime">
<br /> 
Travel time: <input type="text" name="TravelTime">
<br /> 
Fare economy: <input type="text" name="fare_econ">
<br /> 
Fare business: <input type="text" name="fare_busi">
<br /> 
Fare first: <input type="text" name="fare_first">
<br /> 


<input type="submit" value="change">
</form>

</body>
</html>