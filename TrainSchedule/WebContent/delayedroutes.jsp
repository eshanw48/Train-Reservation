<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>View Delayed Routes</title>
</head>
<body>


<form method = "post">

<h3>View Delayed Routes</h3>

<table border = "2">
<tr>

<td>Description</td>

</tr>

<%

try{
	
	//Get the database connection
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();
	
	
	//Create a SQL statement
	Statement stmt = con.createStatement();	
	
	String str = "SELECT * FROM Notifications";
	
	ResultSet result = stmt.executeQuery(str);
	
	while(result.next()){
		
		%>
		
			<tr>
			<td><%=result.getString("description") %></td>
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
	out.print("Error retrieving delayed routes");
}

%>


</form>


</body>
</html>