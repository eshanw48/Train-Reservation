<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<title>Reservation Print-Page</title>
</head>
<body>
<form method = "post">

<table border = "2">
<tr>

<td>Username</td>
<td>Seat number</td>
<td>Transit-Line</td>
<td>Train</td>
<td>EDIT</td>
<td>DELETE</td>
</tr>

<%

try{
	
	//Get the database connection
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();
	
	String entity = request.getParameter("trainline");
	String entity1= request.getParameter("train");
	//Create a SQL statement
	Statement stmt = con.createStatement();	
	
	String str = "SELECT * FROM Reservation WHERE transitLine_name=" + "'"+entity+"'"+" AND train_tid="+ "'"+entity1+"'";
	
	ResultSet result = stmt.executeQuery(str);
	
	while(result.next()){
		
		%>
		
			<tr>
			<td><%=result.getString("Username") %></td>
			<td><%=result.getString("seat#") %></td>
			<td><%=result.getString("transitLine_name") %></td>
			<td><%=result.getString("train_tid") %></td>
			<td><a href="editReservation.jsp?reserve_num=<%=result.getString("reserve_num")%>">EDIT</a></td>
			<td><a href="deleteReservation.jsp?reserve_num=<%=result.getString("reserve_num")%>">DELETE</a></td>
			</tr>
			
			<%
			
	}
			%>
			
			</table>
			<%
			result.close();
			stmt.close();
			con.close();
			
	
}
catch (Exception ex) {
	out.print("Error retrieving questions");
}

%>


</form>
</body>
</html>