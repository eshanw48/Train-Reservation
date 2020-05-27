<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html>
<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>  Reservation</title>
	</head>

<body>

<p><b>Reservations</b><br>
<p>Your selected origin: <%=session.getAttribute("departureStation")%>
<p>Your selected destination:  <%=session.getAttribute("arrivalStation")%>
<p>Your selected arrival date: <%=session.getAttribute("date")%>

<br>
<br>

<p><b>Please select the following options for your trip.</b><br>

<form method="get" action="bookReservation2.jsp">
  <input type="checkbox" name="discount" value="discount"/>Qualify for Discount for Elderly, Children or Disabled
  <br>
  <input type="checkbox" name="yes_round_tripReserve" value="business"/> Round trip?
  <br>
  <input type="checkbox" name="class" value="first"/>First
  <br>
  <input type="checkbox" name="class" value="economy"/>Economy
  <br>
  <input type="checkbox" name="class" value="business"/>Business
  <br>
  
  <input type="hidden" name="originReserve" value="<%=session.getAttribute("departureStation")%>"/>
  <input type="hidden" name="destinationReserve" value="<%=session.getAttribute("arrivalStation")%>"/>
  <input type="hidden" name="dateReserve" value="<%=session.getAttribute("date")%>"/>
  
  <input type="hidden" name="usernameReserve" value="<%=session.getAttribute("username")%>"/>
  
  <input type="submit" value="Make a Reservation" />
</form>
<br>

<p><b>To cancel an existing reservation, enter your reservation ID below:</b><br>  

	<form method="post" action="cancelExistingReservation.jsp">
		<table>
			<tr>
				<td>Reservation ID</td><td><input type="text" name="reservationID"></td>
			</tr>
		</table>
		<input type="submit" value="Cancel">
	</form>
<br>

<p><b>To retrieve the travel itinerary for a given reservation, enter your reservation ID below:</b><br>  

	<form method="post" action="retrieveTravelItinerary.jsp">
		<table>
			<tr>
				<td>Reservation ID</td><td><input type="number" name="reservationID"></td>
			</tr>
		</table>
		<input type="submit" value="Retrieve">
	</form>
<br>

<p><b>Reservation Information</b><br>  
<form method="get" action="seeReservationInformation.jsp">
  <input type="radio" name="reservation_show" value="current"/>See Current Reservations
  <br>
  <input type="radio" name="reservation_show" value="all"/>See All Reservations
  <br>
  <input type="submit" value="See Information" />
</form>
<br>
<br>
	
<br>



<br>



</body>
</html>