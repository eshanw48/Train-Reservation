<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Find Account</title>
</head>
<body>



	<%
	try{
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();
		Statement stmt = con.createStatement();
		
		String entity = request.getParameter("username");
		String entity2 = request.getParameter("password");
		String str = "SELECT * FROM Customer WHERE username="+"'"+ entity +"'"+"AND password=" + "'"+ entity2+"'";
		ResultSet result = stmt.executeQuery(str); //table with all usernames 
		
		if(entity.equals("admin") && entity2.equals("admin")){
			response.sendRedirect("AdminHome.jsp");
		}
		
		if(!result.next()){
			out.print("No username found or password does not match given username");
		}
		else{
			session.setAttribute("username", request.getParameter("username"));
			response.sendRedirect("home.jsp");
		}
		
	}
	catch (Exception e){}
%>

<br>
	<form method="post" action="index.jsp">
		<input type="submit" value="Logout">
	</form>
<br>

</body>
</html>